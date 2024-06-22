#include <stdio.h>

#define DATA_LENGTH 50

int sisd(volatile int a, volatile int b, volatile int op);

int main() {

    int DATA_A[DATA_LENGTH];
	int DATA_B[DATA_LENGTH];

	int DATA_RESULT[DATA_LENGTH];

	int ALU_OPERATION[DATA_LENGTH];

    // Put data into variables
    for (int i = 0; i < DATA_LENGTH; i++)
    {
    	DATA_A[i] = 2*i;
    	DATA_B[i] = i;
    	ALU_OPERATION[i] = i/13;
    	DATA_RESULT[i] = 0;
	}


    for (int i = 0; i < DATA_LENGTH; i++)
    	{
        	printf("A = %d B = %d RES = %d, OP = %d \n", DATA_A[i], DATA_B[i], DATA_RESULT[i], ALU_OPERATION[i]);
        }

    printf("\n\n");
    printf("\n\n");
    printf("\n\n");
    printf("\n\n");

    for (int i = 0; i < DATA_LENGTH; i++)
        {
    	DATA_RESULT[i]=sisd(DATA_A[i], DATA_B[i], ALU_OPERATION[i]);
    	}

    //print results
    for (int i = 0; i < DATA_LENGTH; i++)
	{
    	printf("A = %d B = %d RES = %d, OP = %d \n", DATA_A[i], DATA_B[i], DATA_RESULT[i], ALU_OPERATION[i]);
    }

    // ----------------------------------------- //


    return 0;
}
