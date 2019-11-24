#!/bin/bash
echo "--- Generate tree ---"
clang -Weverything $1
./a.out < in.txt > tree.dot
dot -T svg tree.dot > tree.svg
echo "Done !"
