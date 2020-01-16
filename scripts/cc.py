# I'm an idiot btw, what I wanted to achieve with this script
# `make` is the right tool for it.
# I should just spend some time with bash, this is getting embarrasing.

import subprocess, shlex
import sys, os

options = {}

flags = "-Weverything -g"
options['c'] = f'clang {flags}'
options['cpp'] = f'clang++ {flags}'

args = sys.argv

lang = args[1]
cmd = f'{options[lang]} {os.path.abspath(os.curdir)}/{args[2]}'

print(cmd)
print('Compiling...', end="")
status = subprocess.run(shlex.split(cmd))

if status.returncode != 0:
    print("Something unusual happened, Abort.")
    exit()

print('Done!')

print("\n-------- OUTPUT --------\n")

cmd = f'./a.out < in.txt'
subprocess.run(shlex.split(cmd))
print()

