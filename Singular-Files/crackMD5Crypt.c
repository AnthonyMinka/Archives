#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <crypt.h>
#include <unistd.h>

int main(int argc, char **argv)
{
    FILE * HashFile;
    FILE * WordList;
    FILE * Output;
    char * hash = NULL;
    char * word = NULL;
    struct crypt_data data;
    data.initialized = 0;
    char salt[8];
    size_t lenH = 0;
    size_t lenW = 0;
    ssize_t readH;
    ssize_t readW;
    
    int counterC = 0;
    int counter = 0;
    
    /*
     * 
     * 2 approaches:
     * 
     * 
     * while hashes
     * 		while wordlist
     * 
     * OR
     * 
     * while wordlist
     * 		while hashes
     * 
     * ??
     * 
     * Maybe add a first run in the hashes to find any duplicates!
     * 
     */
    
	
	if (argc != 4){
		printf("Usage: %s [hash filename] [wordlist filename] [output filename]\n-10-74;\n", argv[0]);
		goto end;
	}else{
		printf("\n");
		WordList = fopen(argv[2], "r");
		if (WordList == NULL){
			goto end;
		}
		Output = fopen(argv[3], "w");
		if (Output == NULL){
			goto end;
		}
		
		while ((readW = getline(&word, &lenW, WordList)) != -1) {
			counterC++;
			if (word[readW-1]=='\n')
				word[readW-1]='\0';
			
			HashFile = fopen(argv[1], "r");
			if (HashFile == NULL)
				goto end;
			while ((readH = getline(&hash, &lenH, HashFile)) != -1) {
				if (readH >= 8){
					if (hash[readH-1]=='\n')
						hash[readH-1]='\0';
					
					strncpy(salt, hash, 8);
					salt[8] = '\0';
					hash[30]='\0';
					if (readW>1 && readH>1 && strcmp(hash, crypt_r(word, salt, &data))==0){
						fprintf(Output, "%s:%s\n", hash, word);
						printf("%s:%s\n", hash, word);
						fflush(Output);
						counter++;
						//break; // If you break you leave at the first match.
					}
				}
			}
			fclose(HashFile);
			if (counterC > 100){ // Trick to know when its a 100 or 200 or 1800??
				printf("*");
				fflush(stdout);
				counterC=0;
				sleep(60);
			}
		}
		end:
		if (argc == 4){
			fprintf(Output, "Total Cracked Hashes: %d\n", counter);
			fflush(Output);
			fclose(Output);
			fclose(WordList);
			printf("\n");
		}
		if (word)
			free(word);
		if (hash)
			free(hash);
		exit(EXIT_SUCCESS);
	}
}
