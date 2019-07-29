#!/bin/bash

# compile and run c program
if [ $1 == 'f' ]
then
	echo "Compiling file only. To run, use argument r"
	gcc -o $2 "$2.c"
	echo "Done!"
	echo ""
	echo ""

elif [ $1 == 'r' ]
then
	./$2 "${@:3}"
else
	gcc -o $1 "$1.c"
	echo "Done!"
	echo ""
	echo ""
	./$1
	rm -f $1
fi
