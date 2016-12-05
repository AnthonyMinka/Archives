#!/usr/bin/env python
# -*- coding: utf-8 -*-
#	Python

def main(args):
	global sendersFile
	global receiversFile
	showReceivers = True
	mode = 2 # mode 1 = auth, mode 2 = direct spoof
	sendersFile = "senders"
	receiversFile = "receivers"
	mailServer = "smtp.gmail.com"
	logfiles = "./logs/massfisher.log"
	maxtime = 1#In hours
	sf = open(sendersFile, "r")
	rf = open(receiversFile, "r")
	sendersList = {}
	sendersAuth = {}
	receiversList = {}
	with rf as fin:
		for line in fin:
			receiversList[len(receiversList)+1] = str(line)[0:len(str(line))-1]
			if showReceivers is True:
				print receiversList[len(receiversList)]
	with sf as fin:
		for line in fin:
			if mode is 1:
				sendersList[len(sendersList)+1] = str(line)[0:len(str(line))-1].split(":")[0]
				sendersAuth[len(sendersAuth)+1] = str(line)[0:len(str(line))-1].split(":")[1]
			elif mode is 2:
				sendersList[len(sendersList)+1] = str(line)[0:len(str(line))-1]
	maxsleep = (maxtime * 60 * 60) / len(receiversList)
	minsleep = int((75 * maxtime) / 100)
	messages = os.listdir("Templates")
	for i in receiversList:
		tmp = messages[random.randint(0, len(messages)-1)]
		while not os.path.isfile("./Templates/"+tmp):
			tmp = messages[random.randint(0, len(messages)-1)]
		rc = random.sample(list(sendersList),1)
		time.sleep(random.randint(minsleep, maxsleep))
		if mode is 1:
			os.system(str("sendEmail -f "+sendersList[rc[0]]+" -xu \""+sendersList[rc[0]]+"\" -xp \""+sendersAuth[rc[0]]+"\" -t "+receiversList[i]+" -s "+mailServer+" -l "+logfiles+"."+str(i)+" -v -o message-content-type=html -o message-file=" + "\"./Templates/"+ tmp + "\" -u \"" + tmp + "\""))
		elif mode is 2:
			os.system(str("sendEmail -f "+sendersList[rc[0]]+" -t "+receiversList[i]+" -s "+mailServer+" -l "+logfiles+"."+str(i)+" -v -o message-content-type=html -o message-file=" + "\"./Templates/"+ tmp + "\" -u \"" + tmp + "\""))
	print "Time to go home and eat those fishes!"

if __name__ == '__main__':
    import sys
    import random
    import time
    import os
    sys.exit(main(sys.argv))
