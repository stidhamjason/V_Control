#include "cma.h"
#include "stdlib.h"

int main(int argc, char * argv[]) {
	int i=1;
	int n = 0; //to hold last good value for i
	int *pi=&i;
	int size = atoi(argv[10]);
	
	class_memory(malloc(size),size); // give it to memory allocator

	//pi=class_malloc(i);

	
	while (i != NULL)
	{
		//printf("i=%d\n",i);  //used to test while loop
		n = -(i/2);
		
		i *= 2;
		
	}
	

printf("here is the value of the largest block allocated %d\n",n);
	
	
}
