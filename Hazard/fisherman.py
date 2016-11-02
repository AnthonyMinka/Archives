#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#	Python3

def main(args):
	global sendersFile
	global receiversFile
	sendersFile = "senders"
	receiversFile = "receivers"
	mailServer = "mail.company.com"
	logfiles = "./logs/massfisher.log"
	maxtime = 3#In hours
	sf = open(sendersFile, "r")
	rf = open(receiversFile, "r")
	sendersList = {}
	receiversList = {}
	with rf as fin:
		for line in fin:
			receiversList[len(receiversList)+1] = str(line)[0:len(str(line))-1]
	with sf as fin:
		for line in fin:
			sendersList[len(sendersList)+1] = str(line)[0:len(str(line))-1]
	maxsleep = (maxtime * 60 * 60) / len(receiversList)
	minsleep = int((75 * maxtime) / 100)
	maxsleep = maxtime
	messages = os.listdir("Templates")
	for i in receiversList:
		tmp = messages[random.randint(0, len(messages)-1)]
		while not os.path.isfile("./Templates/"+tmp):
			tmp = messages[random.randint(0, len(messages)-1)]
		rc = random.sample(list(sendersList),1)
		time.sleep(random.randint(minsleep, maxsleep))
		os.system(str("sendemail -f "+sendersList[rc[0]]+" -t "+receiversList[i]+" -s "+mailServer+" -l "+logfiles+"."+str(i)+" -v -o message-content-type=html -o message-file=" + "\"./Templates/"+ tmp + "\" -u \"" + tmp + "\""))
	print("Time to go home and eat those fishes!")

if __name__ == '__main__':
    import sys
    import random
    import time
    import os
    sys.exit(main(sys.argv))
