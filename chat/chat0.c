/*
 * chat0.c
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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#define KNRM  "\x1B[0m"
#define KRED  "\x1B[31m"
#define KGRN  "\x1B[32m"
#define KYEL  "\x1B[33m"
#define KBLU  "\x1B[34m"
#define KMAG  "\x1B[35m"
#define KCYN  "\x1B[36m"
#define KWHT  "\x1B[37m"

void *reader(void *username){
	FILE *chat = fopen("chat", "r");
	char *name = malloc(sizeof(username)+1);
	sprintf(name, "%s", (char*)username);
	char message[BUFSIZ];
	
	if (chat == NULL){
}

int main(int argc, char **argv)
{
	int i=0;
	char name[BUFSIZ];
	char message[BUFSIZ];
	printf("\nUserName: ");
	fgets(name, BUFSIZ, stdin);
	for (i = 0; i < BUFSIZ; i++)
	{
		if (name[i]=='\n'){
			name[i]='\0';
		}
	}
	//system("tail -F chat");
	while(1==1){
		fgets(message, BUFSIZ, stdin);
		for (i = 0; i < BUFSIZ; i++)
		{
			if (name[i]=='\n')
				name[i]='\0';
		}
		FILE *f = fopen("chat", "a");
		
		if (f != NULL){
			fprintf(f, "%s%s> %s%s", KCYN, name, KNRM, message);
			fclose(f);
		}
		memset(message, 0, BUFSIZ*sizeof(char));
	}
	return 0;
}
