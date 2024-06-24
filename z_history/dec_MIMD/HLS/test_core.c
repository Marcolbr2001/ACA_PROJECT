#include <stdio.h>

#define DATA_LENGTH 50

void dec_MIMD(volatile int* a, volatile int* b, volatile int* c, volatile int* op, volatile int selec);

int main() {


    int DATA_A[DATA_LENGTH];
	int DATA_B[DATA_LENGTH];
	int DATA_RESULT[DATA_LENGTH];
	int ALU_OPERATION[DATA_LENGTH];
	int SELEC;

    printf("\n\n");




////////CASE SELEC=2: DATA AND OPERATIONS////////////////////////////////////////////

    // Put data into variables
    for (int i = 0; i < DATA_LENGTH; i++)
    {
    	DATA_A[i] = 1;
    	DATA_B[i] = 1;
	}

    // selecting operations
    for (int i = 0; i < DATA_LENGTH; i++)
	{
		ALU_OPERATION[i] = 1;
	}

	// selecting inputs

	SELEC=10;
	dec_MIMD(DATA_A, DATA_B, DATA_RESULT, ALU_OPERATION,SELEC);

    //print results
    for (int i = 0; i < DATA_LENGTH; i++)
	{
    	printf("A = %d B = %d RES = %d, OP = %d, SELEC = %d \n", DATA_A[i], DATA_B[i], DATA_RESULT[i], ALU_OPERATION[i], SELEC);
    }
    printf("\n\n");
    // ----------------------------------------- //



        ////////NEW DATA_and_OPERATION////////////////////////////////////////////

        		SELEC=2;
            	dec_MIMD(DATA_A, DATA_B, DATA_RESULT, ALU_OPERATION,SELEC);
            	SELEC=3;
            	dec_MIMD(DATA_A, DATA_B, DATA_RESULT, ALU_OPERATION,SELEC);
            	SELEC=4;
            	dec_MIMD(DATA_A, DATA_B, DATA_RESULT, ALU_OPERATION,SELEC);


                for (int i = 0; i < DATA_LENGTH; i++)
            	{
                	printf("A = %d B = %d RES = %d, OP = %d, SELEC = %d \n", DATA_A[i], DATA_B[i], DATA_RESULT[i], ALU_OPERATION[i], SELEC);
                }
                printf("\n\n");

          ////////NEW DATA_old_OPERATION////////////////////////////////////////////

                // Put data into variables
                    for (int i = 0; i < DATA_LENGTH; i++)
                    {
                    	DATA_A[i] = 2;
                    	DATA_B[i] = 2;
                	}

                    // selecting operations
                    for (int i = 0; i < DATA_LENGTH; i++)
                    	{
                    		ALU_OPERATION[i] = 10;
                    	}

				SELEC=0;
				dec_MIMD(DATA_A, DATA_B, DATA_RESULT, ALU_OPERATION,SELEC);
				SELEC=3;
				dec_MIMD(DATA_A, DATA_B, DATA_RESULT, ALU_OPERATION,SELEC);
				SELEC=4;
				dec_MIMD(DATA_A, DATA_B, DATA_RESULT, ALU_OPERATION,SELEC);


				for (int i = 0; i < DATA_LENGTH; i++)
				{
					printf("A = %d B = %d RES = %d, OP = %d, SELEC = %d \n", DATA_A[i], DATA_B[i], DATA_RESULT[i], ALU_OPERATION[i], SELEC);
				}
				printf("\n\n");

				////////old_DATA_NEW_OPERATION////////////////////////////////////////////

				// Put data into variables
					for (int i = 0; i < DATA_LENGTH; i++)
					{
						DATA_A[i] = 45;
						DATA_B[i] = 45;
					}

					// selecting operations
					for (int i = 0; i < DATA_LENGTH; i++)
						{
							ALU_OPERATION[i] = 9;
						}

				SELEC=1;
				dec_MIMD(DATA_A, DATA_B, DATA_RESULT, ALU_OPERATION,SELEC);
				SELEC=3;
				dec_MIMD(DATA_A, DATA_B, DATA_RESULT, ALU_OPERATION,SELEC);
				SELEC=4;
				dec_MIMD(DATA_A, DATA_B, DATA_RESULT, ALU_OPERATION,SELEC);


				for (int i = 0; i < DATA_LENGTH; i++)
				{
					printf("A = %d B = %d RES = %d, OP = %d, SELEC = %d \n", DATA_A[i], DATA_B[i], DATA_RESULT[i], ALU_OPERATION[i], SELEC);
				}
				printf("\n\n");

    return 0;
}