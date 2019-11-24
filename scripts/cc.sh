#!/bin/bash

# compile and run c program
if [ $1 == 'f' ]
then
	echo "Compiling file only. To run, use argument r"
	clang -o $2 "$2.c" -Weverything
	echo "Done!"
	echo ""
	echo ""

elif [ $1 == 'r' ]
then
	./$2 "${@:3}"
else
	clang -o $1 "$1.c" -Weverything
	echo "Done!"
	echo ""
	echo "----------- Output -----------"
	./$1
	rm -f $1
fi
