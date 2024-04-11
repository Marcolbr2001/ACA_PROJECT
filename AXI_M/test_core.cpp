#include <stdio.h>

#define DATA_LENGTH 50

void setMem(volatile int* a, volatile int* b, volatile int* c, int op);

int main() {
    int i;

    int DATA_A[DATA_LENGTH];
	int DATA_B[DATA_LENGTH];
	int DATA_RESULT[DATA_LENGTH];
	int ALU_OPERATION;

    printf("\n\n");

    // Put data into variables
    for (int i = 0; i < DATA_LENGTH; i++)
    {
    	DATA_A[i] = 2*i;
    	DATA_B[i] = i;
    	DATA_RESULT[i] = 0;
	}

    // ------------------ Sum ------------------- //

    ALU_OPERATION = 1;

    // Call the hardware functions
    setMem(DATA_A, DATA_B, DATA_RESULT, ALU_OPERATION);
    
    for (int i = 0; i < DATA_LENGTH; i++)
	{

	  if(ALU_OPERATION == 1)
		   printf("A = %d B = %d RES = %d, OP = %d sum\n", DATA_A[i], DATA_B[i], DATA_RESULT[i], ALU_OPERATION);
	  else
		   printf("A = %d B = %d, RES = %d, OP = %d difference\n", DATA_A[i], DATA_B[i], DATA_RESULT[i], ALU_OPERATION);
   }

    printf("\n\n");
    // ----------------------------------------- //




    // ------------- Difference ---------------- //

    ALU_OPERATION = 0;

    setMem(DATA_A, DATA_B, DATA_RESULT, ALU_OPERATION);

    for (int i=0; i < DATA_LENGTH; i++)
	{

	   if(ALU_OPERATION == 1)
			printf("A = %d B = %d RES = %d, OP = %d sum\n", DATA_A[i], DATA_B[i], DATA_RESULT[i], ALU_OPERATION);
	   else
			printf("A = %d B = %d, RES = %d, OP = %d difference\n", DATA_A[i], DATA_B[i], DATA_RESULT[i], ALU_OPERATION);
	}

    printf("\n\n");
    // ----------------------------------------- //


    return 0;
}
