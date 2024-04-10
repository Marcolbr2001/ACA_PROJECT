#include <stdio.h>

#define DATA_LENGTH 50

void setMem(volatile int* a, volatile int* b, volatile int* c, int op);

int main() {
    int i;

    int A[DATA_LENGTH];
	int B[DATA_LENGTH];
	int C[DATA_LENGTH];
	int OP;

    printf("\n\n");

    // Put data into variables
    for (int i = 0; i < DATA_LENGTH; i++)
    {
        A[i] = 2*i;
		B[i] = i;
		C[i] = 0;
	}

    // ------------------ Sum ------------------- //

    OP = 1;

    // Call the hardware functions
    setMem(A, B, C, OP);
    
    for (int i=0; i<DATA_LENGTH; i++)
	{

	  if(OP == 1)
		   printf("A = %d B = %d C = %d, OP = %d sum\n", A[i], B[i], C[i], OP);
	  else
		   printf("A = %d B = %d, C = %d, OP = %d difference\n", A[i], B[i], C[i], OP);
   }

    printf("\n\n");
    // ----------------------------------------- //




    // ------------- Difference ---------------- //

    OP = 0;

    setMem(A, B, C, OP);

    for (int i=0; i < DATA_LENGTH; i++)
	{

	   if(OP == 1)
			printf("A = %d B = %d C = %d, OP = %d sum\n", A[i], B[i], C[i], OP);
	   else
			printf("A = %d B = %d, C = %d, OP = %d difference\n", A[i], B[i], C[i], OP);
	}

    printf("\n\n");
    // ----------------------------------------- //


    return 0;
}
