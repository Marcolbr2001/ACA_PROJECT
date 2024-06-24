#include <stdio.h>

#define DATA_LENGTH 50

void setMem(volatile int* a, volatile int* b, volatile int* c, volatile int* op);

int main() {
    int i;

    int DATA_A[DATA_LENGTH];
	int DATA_B[DATA_LENGTH];
	int DATA_RESULT[DATA_LENGTH];
	int ALU_OPERATION[DATA_LENGTH];

    printf("\n\n");

    // Put data into variables
    for (int i = 0; i < DATA_LENGTH; i++)
    {
    	DATA_A[i] = 2*i;
    	DATA_B[i] = i;
    	DATA_RESULT[i] = 0;
	}

    // selecting operations
    int j = 0;

	for (int i = 0; i < DATA_LENGTH; i++)
	{
		if(j == 10)
			j = 0;

		ALU_OPERATION[i] = j;
		j++;
	}


    // ------------------ Go ------------------- //

    // Call the hardware functions
    setMem(DATA_A, DATA_B, DATA_RESULT, ALU_OPERATION);
    
    //print results
    for (int i = 0; i < DATA_LENGTH; i++)
	{
    	printf("A = %d B = %d RES = %d, OP = %d \n", DATA_A[i], DATA_B[i], DATA_RESULT[i], ALU_OPERATION[i]);
    }

    printf("\n\n");
    // ----------------------------------------- //


    return 0;
}
