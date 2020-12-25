#!/bin/bash
# dual-screen
if [[ "$1" == "s" ]]
then
	echo "Single Monitor."
	bash $HOME/.screenlayout/single-monitor.sh
elif [[ "$1" == "d" ]]
then
	echo "Dual Monitor."
	bash $HOME/.screenlayout/multi-monitor.sh	
else
	echo "Usage: ds <s|d>"
	printf '$ ds d\n\t Dual Monitor\n'
	printf '$ ds s\n\t Single Monitor\n'
fi
