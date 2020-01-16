# helper code for using youtube-dl
# not complete yet, need to add a output format option, save to directory option
# almost complete, just testing is remaining. Should be useful by now.
from argparse import ArgumentParser
from pprint import pprint
import shlex
import os
import subprocess

# constants
choices = ['240p', '360p', '480p', '720p', '1080p', '1440p']
current_dir = os.path.abspath(os.curdir)
DEFAULT_CHOICE = 1
output_format = 'mkv'

parser = ArgumentParser(description="Helper Script for youtube-dl.")
parser.add_argument('-c', dest="link",
                    help="Get video link from clipboard.", action="store_true")
parser.add_argument('-p', dest="playlist",
                    help="Treat the link as if it is a playlist.", action="store_true")
parser.add_argument('-q', dest="quality",
                    help=f"Default is {choices[DEFAULT_CHOICE]}", choices=choices)
parser.add_argument('-a', dest='audio_only', action='store_true',
                    help='Download best quality audio only.')
parser.add_argument('-o', dest="output_dir",
                    help=f"Default is current directory.")
parser.add_argument('-r', dest="print_only", action="store_true",
                    help="Do not download, just output the generated command only.")
parser.add_argument('-i', dest="list_formats", help="Print list of available formats to download.", action="store_true")
args = parser.parse_args()


def get_link_url(link):
    link_url = "link will be taken from clipborad"
    video_quality = None
    if link:
        clipboard_cmd = "xclip -o -selection clipboard"
        p = subprocess.Popen(shlex.split(clipboard_cmd),
                             stdout=subprocess.PIPE)
        link_url = p.stdout.read().decode('utf-8')
        video_quality = 'not_necessary'
    else:
        link_url = input("Enter Video URL : ")
        video_quality = input(f'Enter Video Quality[{choices}]')
    return link_url, video_quality


def Main():
    link_flag, playlist_flag, video_quality, output_dir, audio_only, print_only, list_formats = (
        args.link, args.playlist, args.quality, args.output_dir, args.audio_only, args.print_only, args.list_formats)
    # pprint(args)
    link_url, video_quality_2 = get_link_url(link_flag)
    # pprint(link_url)
    output_dir = output_dir or current_dir
    video_quality = video_quality or choices[DEFAULT_CHOICE]
    if video_quality_2 in choices:
        video_quality = video_quality_2
    elif video_quality_2 == 'not_necessary':
        pass
    else:
        print("You're an idiot.\nAbort")
        exit()
    video_quality = f'bestvideo[height<={video_quality[:-1]}]+bestaudio/best[height<={video_quality[:-1]}]'
    video_title = f'%(playlist_index)s_%(title)s.%(ext)s'
    if audio_only:
        video_quality = f'bestaudio'
    cmd = f'youtube-dl -f {video_quality} -o {output_dir}/{video_title} --merge-output-format {output_format} {link_url} '
    if playlist_flag:
        cmd = f'{cmd} --yes-playlist'
    if not playlist_flag:
        cmd = f'{cmd} --no-playlist --playlist-start 1 --playlist-end 1'
    if list_formats:
        cmd=f'youtube-dl -F {link_url} --no-playlist'
    print(str(cmd))
    if not print_only:
        p = subprocess.run(shlex.split(cmd))

# run main
Main()
