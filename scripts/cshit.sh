#!/bin/bash

#open a vscode in cshit dir with language name specified.
directory=$1
if [ -z $directory ]
then
    echo "choose one and pass as argument idiot."
    ls /home/toxicdesire/pro/cshit 
else
    code /home/toxicdesire/pro/cshit/$directory
    cd /home/toxicdesire/pro/cshit/$directory
fi