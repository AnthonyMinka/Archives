#define _GNU_SOURCE
#include <stdio.h>
#include <string.h>
#include <crypt.h>

int main(int argc, char **argv)
{
    char salt[BUFSIZ];
    struct crypt_data data;
    data.initialized = 0;
	if (argc != 4){
		printf("Usage: %s [8 char salt] [crypt number] [input]\n-10-74;\n", argv[0]);
	}else{
		sprintf(salt, "$%s$%s$", argv[2], argv[1]);
		printf("%s\n",crypt_r(argv[3], salt, &data));
	}
}
