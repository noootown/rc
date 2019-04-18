import getopt
import sys
import os
import json
import datetime as dt

def cal_date_from_now(date, strp = '%Y%m%d'):
  return (dt.datetime.strptime(date, strp).date() - dt.datetime.now().date()).days

def get_len(text):
  return sum(1 + (u'\u4e00' <= ch <= u'\u9fff') for ch in text)

try:
  opts, args = getopt.getopt(
    sys.argv[1:],
    'c:f:',
    ['config=', 'file=']
  )
except getopt.GetoptError:
  print('python3 showCalendar.py -h')
  sys.exit(2)

file = None
config = None

for opt, arg in opts:
  if opt in ('-c', '--config'):
      config = arg
  elif opt in ('-f', '--file'):
      file = arg

if os.path.isfile(config):
    with open(config, 'r') as f:
        data = json.load(f)
        marginHorizontal = data['marginHorizontal']
        marginVertical = data['marginVertical']
        paddingHorizontal = data['paddingHorizontal']
        paddingVertical = data['paddingVertical']
else:
     sys.exit()

if os.path.isfile(file):
    with open(file, 'r') as file:
      things = [thing.split(', ') for thing in file.read().strip().split('\n')]
    things = [(
        todo,
        dt.datetime.strptime(date, '%Y%m%d').date().strftime('%Y/%m/%d'),
        cal_date_from_now(date),
    ) for todo, date in things]

    things = sorted(things, key=lambda x: x[2])

    todo_maxlen = max(get_len(todo) for todo, _, _ in things)
    date_num_maxlen = max(len(str(date_num)) + 7 if date_num > 0 else 6 for _, _, date_num in things)

    border = '/' + '*' * (todo_maxlen + 21 + date_num_maxlen + paddingHorizontal * 2) + '/'
    outputs = [border]
    outputs += ['/*' + ' ' * (len(border) - 4) + '*/'] * paddingVertical
    outputs += [
        '/*%s%s ---- %s %s%s*/' %
        (
            ' ' * (paddingHorizontal + 1),
            ' ' * (todo_maxlen - get_len(todo)) + todo,
            date,
            '(' + str(date_num) + ' days)' + ' ' * (date_num_maxlen - 7 - len(str(date_num)))
            if date_num > 0 else '(Done)' + ' ' * (date_num_maxlen - 6),
            ' ' * (paddingHorizontal + 1),
        ) for todo, date, date_num in things]
    outputs += ['/*' + ' ' * (len(border) - 4) + '*/'] * paddingVertical
    outputs += [border]

    # print
    for i in range(marginVertical):
        print()
    print('\n'.join([' ' * marginHorizontal + o for o in outputs]))
    for i in range(marginVertical):
        print()

else:
  print('Calendar Not Found!')
