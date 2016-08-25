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
    int badLogic = 0;
    int badLogicAgain = 0;
    
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
		HashFile = fopen(argv[1], "r");
		if (HashFile == NULL){
			goto end;
		}
		Output = fopen(argv[3], "w");
		if (Output == NULL){
			goto end;
		}
		
		while ((readH = getline(&hash, &lenH, HashFile)) != -1) {
			
			if (badLogic==0){
				badLogic = 'b';
			}
			if (hash[readH-1]=='\n')
				hash[readH-1]='\0';
			
			WordList = fopen(argv[2], "r");
			if (WordList == NULL)
				goto end;
			while ((readW = getline(&word, &lenW, WordList)) != -1) {
				if (readW >= 8){
					if (badLogicAgain==0){
						badLogicAgain = 'l';
					}
					if (word[readW-1]=='\n')
						word[readW-1]='\0';
					
					strncpy(salt, hash, 8);
					salt[8] = '\0';
					hash[30]='\0';
					if (readW>1 && readH>1 && strcmp(hash, crypt_r(word, salt, &data))==0){
						fprintf(Output, "%s:%s\n", hash, word);
						fflush(Output);
						counter++;
						break;
					}
				}
			}
			fclose(WordList);
			sleep(60);
		}
		end:
		
		fprintf(Output, "Total Cracked Hashes: %d\n", counter);
		if (word)
			free(word);
		fflush(Output);
		fclose(Output);
		fclose(HashFile);
		if (hash)
			free(hash);
		exit(EXIT_SUCCESS);
	}
}
