#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	printf("Starting goto loops!\n");
	
	jump5:
	
	int tmp=rand() % (5);
	int a=5;
	int b=5;
	int c=5;
	int d=5;
	
	jump1:
	a=b+c;
	
	jump2:
	b=a+d;
	
	jump3:
	c=d+a;
	
	jump4:
	d=b+c;
	
	printf("a=%d b=%d c=%d d=%d\n",a,b,c,d);
	srand(time(NULL));
	tmp=rand() % (4);
	if(tmp>0 && tmp<=1) goto jump1;
	else if (tmp>1 && tmp<=2) goto jump2;
	else if (tmp>2 && tmp<=3) goto jump3;
	else if (tmp>3 && tmp<=4) goto jump4;
	else goto *a;
	
	return 0;
}
