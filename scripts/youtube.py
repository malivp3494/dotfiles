# helper code for using youtube-dl
# not complete yet, need to add a output format option, save to directory option and output name format
from argparse import ArgumentParser
from pprint import pprint
import shlex
import subprocess

choices = ['240p', '360p', '480p', '720p', '1080p', '1440p']
DEFAULT_CHOICE = 1
parser = ArgumentParser(description="Helper Script for youtube-dl.")
parser.add_argument('-c', dest="link",
                    help="Get video link from clipboard.", action="store_true")
parser.add_argument('-p', dest="playlist",
                    help="Treat the link as if it is a playlist.", action="store_true")
parser.add_argument('-q', dest="quality",
                    help=f"Default is {choices[DEFAULT_CHOICE]}", choices=choices)
args = parser.parse_args()


def get_link_url(link):
    link_url = "link will be taken from clipborad"
    if link:
        clipboard_cmd = "xclip -o -selection clipboard"
        p = subprocess.Popen(shlex.split(clipboard_cmd),
                             stdout=subprocess.PIPE)
        link_url = p.stdout.read().decode('utf-8')
    else:
        link_url = input("Enter Video URL : ")
    return link_url


def Main():
    link_flag, playlist_flag, video_quality = (
        args.link, args.playlist, args.quality)
    pprint(args)
    link_url = get_link_url(link_flag)
    pprint(link_url)
    video_quality = video_quality or choices[DEFAULT_CHOICE]
    video_quality = f'bestvideo[height<={video_quality}]+bestaudio/best[height<={video_quality}]'
    cmd = f'youtube-dl -f {video_quality} {link_url}'
    if playlist_flag:
        cmd = f'{cmd} --yes-playlist'
    if not playlist_flag:
        cmd = f'{cmd} --no-playlist --playlist-start 1 --playlist-end 1'
    p = subprocess.run(shlex.split(cmd))


# run main
Main()
