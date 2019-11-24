import sys
import subprocess
import shlex

choices = ['go', 'so', 'm', 'cs', 'w']
desc = {}
desc['go'] = "gateoverflow.in"
desc['so'] = "stackoverflow.com"
desc['m'] = "math.stackexchange.com"
desc['cs'] = "cs.stackexchange.com"
desc['w'] = "wikipedia.org"

if '-h' in sys.argv or '--help' in sys.argv:
    print("Helper script for googler.")
    print("Usage : Use the following keys for the shortcuts.")
    for command, info in desc.items():
        print(f'{command} - {info}')
    exit()

args = sys.argv[1:]
if args[0] in desc:
    temp = desc[args[0]].split('.')[:-1]
    if(len(temp) >= 1):
        args[0] = ''.join(temp)


cmd = f'googler  {args} -n 5'
# webbrowser.open_new_tab(search_term)
# p = subprocess.run(shlex.split(cmd), stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
print(f'Search term is {args}')
p = subprocess.run(shlex.split(cmd))
exit()
