#!/usr/bin/python
import subprocess;
import json
import os
from pathlib import Path
workdir = os.path.dirname(os.path.realpath(__file__))
configFile = open(str(Path.home()) + "/.config/ssr-helper-nodejs/default.json", "r");
config = json.load(configFile);
ip = str(config['server']);
p = subprocess.run("ping "+ip+" -c 3 -W 2|grep rtt", shell=True, capture_output=True)
q = p.stdout.decode()
count = 0
delay = str()
for ch in q:
	if (ch == '/'):count+=1
	if (count == 4 and ch != '/'):delay += ch	
'''
if (len(delay) > 0):
	delay = float(delay)
else:
	print("%{F#ff0000}%{F-}");
	exit()
'''
content = str()
if (len(delay) > 0):
	delay = float(delay)
	if (delay < 150):
		color = '#00FF00'
	elif (delay < 300):
		color = '#FFFF00'
	else:
		color = '#FF0000'
		subprocess.run("notify-send ShadowsocksR " + str(delay) + "ms", shell=True);
	content = str(delay)+'ms'
else:
	color = '#FF0000'
	content = 'Timeout'
	subprocess.run("notify-send ShadowsocksR Timeout", shell=True);
#content = "<span color = " + color + ">" + content + "</span>"
output = open(workdir+'/ssr-status-notify.txt', 'w')
output.write(content)
output.close()
#print('%{F'+color+'}'+' '+ str(round(delay, 1)) + 'ms%{F-}', end='')
if (color == '#00FF00'):
	print('', end='')
else:
	print('%{u'+color+'}'+'%{u-}', end='')
'''
else:
	print('%{u'+color+'}'+'%{u-}', end='')
'''
