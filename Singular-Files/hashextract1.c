#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>

char* load_file(char* name);

int main(int argc, char **argv)
{
	int j =0;
	//printf("%s", load_file("users.txt"));
	char* file = load_file(argv[1]);
	char* user = strstr(file, "\\N");;
	while(strchr(file, '$')!=NULL){
		free(file);
		free(user);
		user = strstr(file, "\\N");
		user+=3;
		for (user = user; *user != *strchr(user, '|'); user++)
		{
			printf("%c", *user);
		}
		printf(":");
		file = strchr(file, '$');
		for (j = j; *file != *strchr(file, '|'); file++) // strlen - strlen next |
		{
			printf("%c", *file);
		}
		j++;
		printf("\n");
		//free(file);
		//free(user);
		//file+=30;
	}
	printf("Total hashes extracted: %d\n", j);
	//free(file);
	//free(user);
	return 0;
}
//$1$QOka$mheODzfJqR2sAKeYSu5xw.
//$1$0TUX$Zo2UIm6Wub5dG5rvO14b20
char* load_file(char* name) {
  struct stat info_file;
  stat(name, &info_file);
  char *content = malloc((info_file.st_size + 1) * sizeof (char));
  FILE *file = fopen(name, "r");
  char *cursor = content;
  int c;
  while ((c = fgetc(file)) != EOF) {
    char new = (char) c;
    *cursor = new;
    cursor++;
  }
  *cursor = '\0';
  fclose(file);
  return content;
}
