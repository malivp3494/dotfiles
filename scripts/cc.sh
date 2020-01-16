#!/bin/bash

# compile and run c program
if [ $1 == 'f' ]
then
	echo "Compiling file only. To run, use argument r"
	$command "$2" -Weverything
	echo "Done!"
	echo ""
	echo ""

elif [ $1 == 'r' ]
then
	./a.out "${@:3}" < in.txt
else
	clang++ "$2" -Weverything
	echo "Done!"
	echo ""
	echo "----------- Output -----------"
	./a.out < in.txt
	rm -f $1
fi
