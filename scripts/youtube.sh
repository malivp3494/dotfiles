#!/bin/bash

# -z is to check if no argument was supplied
set -e
if [ -z "$1" ]
then
    read -p "Video URL:" url
elif [ $1 == "-c" ]
then
    url=$(xclip -o -selection clipboard)
else
    url=$1
fi


echo "the URL is : $url"
youtube-dl -F $url --no-playlist
read -p "Enter video-code:" video
read -p "Enter audio-code:" audio
filename='"~/Videos/%(title)s.%(ext)s"'
if [ -z $audio ] || [ -z $video ]
then
    echo "Downloading best quality Audio"
    com="youtube-dl -f bestaudio $url --merge-output-format mkv -o $filename"
    eval $com
    echo "Successfully downloaded to $HOME/Videos"
else
    echo "Downloading Video"
    com="youtube-dl -f $video+$audio $url --merge-output-format mkv -o $filename"
    eval $com
    echo "Successfully downloaded to $HOME/Videos"    
fi
