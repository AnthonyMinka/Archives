/*
 * ex.c
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

// Alows you to search for a term in a local outlook offline file(dating of 2016 summer).

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char **argv)
{
  wchar_t *buffer = malloc(BUFSIZ);
  wchar_t *pattern = malloc(BUFSIZ);
  size_t length;
  length = mbstowcs(pattern, argv[2], BUFSIZ);
  int tmp = 0;
  FILE *fh = fopen(argv[1], "rb");
  if ( fh != NULL )
  {
    fseek(fh, 132, SEEK_SET);
    long s = ftell(fh);
    rewind(fh);
    buffer = malloc(s);
    while (buffer != NULL)
    {
      fread(buffer, s, 1, fh);
      if (tmp > 300000){
		sleep(1);
		tmp = 0;
	}
	if (wcsstr(buffer, pattern)!=NULL){
		printf("true\n");
		fflush(stdout);
		fclose(fh);
		free(buffer);
		free(pattern);
		return 0;
	}
	tmp++;
    }
    if (fh != NULL) fclose(fh);
  }
  printf("false\n");
  free(pattern);
  free(buffer);
  fflush(stdout);
  return 0;
}
