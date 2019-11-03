import sys
import subprocess
from os import path, listdir
from time import localtime, strftime


def blank_line(x): return f'\n-------{x}-------\n'


def date(): return strftime('%d-%m-%Y %H:%M', localtime())


d = '/home/toxicdesire/fate-local/tests/'


if 'read' in sys.argv:
    dirs = [str(a)[:-4] for a in listdir(d) if a.find('.txt') >= 0]
    i = 0
    if(len(dirs) == 1):
        print(f'1. {dirs[0]}')
    else:
        while(i < len(dirs)-1):
            j = i+1
            print(f"{j}:{dirs[i]:<20} {j+1}:{dirs[i+1]:<20}")
            i += 2
    try:
        which = int(input('which one to read(id)> '))
        if(which < 1 or which > len(dirs)):
            raise Exception('Somethings wrong')
        subprocess.run(['less', f'{d + dirs[which-1]}.txt'])
    except:
        print("idiot, you know what to do.")

else:
    file_name = input('Question Paper Title: ')
    f = open(path.join(d, file_name+'.txt'), 'a+')
    attempt, total = [int(a) for a in str(
        input('Total Attempt(attempt/total_questions):')).split('/')]
    correct = int(input('Correctly Attempted: '))
    incorrect = attempt-correct
    data = f'Attempt - {attempt}/{total}({attempt*100/total:.2f}%) \nCorrect - {correct}\t\tIncorrect - {incorrect}\nAccuracy - {correct}/{attempt} ({correct*100/attempt:.2f}%)'
    print(data)
    line = input('What went wrong? ($ to submit) :\n')
    what_went_wrong = ''
    while(line.find('$') < 0):
        what_went_wrong += line + '\n'
        line = input()

    f.write(blank_line(f'START [{date()}]'))
    f.write(data)
    f.write('\n\n [*] What went wrong? \n\n')
    f.flush()
    f.write(what_went_wrong)
    line = input('Improvements Needed ($ to submit) :\n')
    what_went_wrong = ''
    while(line.find('$') < 0):
        what_went_wrong += line + '\n'
        line = input()
    f.write('\n\n [*] Improvements Needed: \n\n')
    f.write(what_went_wrong)
    f.flush()
    f.write(blank_line(f'END[{date()} ]'))
    f.close()
