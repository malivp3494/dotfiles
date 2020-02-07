from datetime import date
import sys

# special occasion lol
start_date = date(2019, 6, 3)

def get_since(start):
    return (date.today() - start).days

def leaf_years_since(start):
    today = date.today()
    start = start.year
    res=0
    while(start <= today.year):
        if start %4 == 0:
            res+=1
        start+=1
    return res

if not len(sys.argv) >=2:
    print(f'#day{get_since(start_date)} after the block.')
    exit(0)

print("--- How old am I ---")
bd = input('Birth date[dd-mm-yyyy]: ')
bd = bd.split("-")
bd = [int(a) for a in bd]
try:
    start_date = date(bd[2],bd[1],bd[0])
    days = get_since(start_date)
    year = days//365
    days = days%365 - leaf_years_since(start_date)
    months = days//12
    days = days%12
    print(f"\nYou are {year} years, {months} months, {days} days old.\n")
except e:
    print("you know what to do.")
    print('Abort.')
    exit(0)
