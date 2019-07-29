#!/bin/bash

if [ $1 == 'client' ]
then
	echo "Starting work environment for client..."
	echo "Open vscode with [work editor]..."
	# konsole -e "code /home/toxicdesire/pro/web/awards"
	# echo "Opening Android screen mirror..."
	# konsole --new-tab -e "scrcpy"
elif [ $1 == 'server' ]
then 
	echo "Starting work environment for server..."
	echo "Open vscode with [work editor]"
	echo "Opening a new tab in working directory..."
	# konsole --new-tab --workdir "/home/toxicdesire/pro/web/awards-server/awards-server" 
	echo "Starting MongoDB service"
	mongod --dbpath "/home/toxicdesire/pro/web/awards-server/mongodb" &
	echo "Starting Robo 3T..."
	/opt/robo3t/bin/robo3t &
	echo "Opening graphql-playground..."
	echo "No need to open graphql-playground, because it will be available at graphql endpoint."
elif [ $1 == 'editor' ]
then
	echo "Opening vscode"
	konsole -e "code /home/toxicdesire/pro/web/"
elif [ $1 == 'kill' ]
then
	echo "killing port $2"
	fuser -k $2/tcp
	echo "done"
elif [ $1 == 'adb' ]
then
	echo "port-forwarding for react-native"
	echo "adb reverse tcp:8081 tcp:8081"
	adb reverse tcp:8081 tcp:8081
	adb reverse tcp:9090 tcp:9090
elif [ $1 == 'c' ]
then
	echo "compiling $2.c"
	gcc -o $2 "$2.c"
	echo "done, running"
	./$2
else
	echo "nah else"
fi
