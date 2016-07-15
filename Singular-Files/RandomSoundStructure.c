#include <stdio.h>
#include <time.h>
#include <stdlib.h>

// Table of data. (Non squarish)
int ressources[5][4] = {
	{1,17,18,6} // C Diminished
	,{1,3,19,20} // C Augmented
	,{1,2,5,0} // C Sus2
	,{16,3,5,0} // C# Diminished
	,{16,4,6,0}}; // C# Augmented

/*
 * Rules translation
 * Rows: cmpInstructions, operation, leftArg, rightArg, ruleOperation, ... 
 * Operations: 0:=, 1:<, 2:>, 3:=<, 4:=>, 5:=!, 6:<!, 7:>!, 8:=<!, 9:=>!, 10:||, 11:&&, 12:||!, 13:&&!
 * Arg: type, // Must allow to use functions
 */
/*struct argument{
	int type;
	int first;
	
};
int long rules[4][3]={
	{}
	,{}
	,{}
	,{}
	};
*/
int main(int argc, char *argv[])
{
	if ((1==2)||!(3==4))
		printf("awd\n");
	char* space = " ";
	char* character = "*";
    if (argc <= 3) {
        printf("Usage: %s [Highest Value-1] [Lenght] [Generations]\n", argv[0]);
        return 1;
    }
    else{
		printf("Generating Structure...\n");
		srand(time(NULL));
		int i=0;
		int i2=0;
		int unsigned patern[atoi(argv[3])][atoi(argv[2])];
		// Initial generation
		for (i = 0; i < atoi(argv[2]); i++)
		{
			patern[0][i]=rand()%(atoi(argv[1]));
			printf("%2u ", patern[0][i]);
		}
		printf("\n");
		// Futur generations
		for (i2 = 1; i2 < atoi(argv[3]); i2++)
		{
			for (i = 0; i < atoi(argv[2]); i++)
			{
				// Do not forget the environnement
				// Define simple rules & if rules are all followed change accordingly to it
				if (patern[i2-1][i]<atoi(argv[1])/2){
					if (patern[i2][i-1]<atoi(argv[1])/2){
						patern[i2][i]=rand()%(atoi(argv[1]));
						//printf("%5u ", patern[i2][i]);
						printf("%2s ", character);
					}else{
						patern[i2][i]=0;
						printf("%2s", space);
					}
				}else{
					patern[i2][i]=0;
					printf("%2s ", space);
				}
			}
			printf("\n");
		}
		printf("Successfully Generated.\n");
	}
	return 0;
}

