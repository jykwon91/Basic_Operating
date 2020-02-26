#include <stdio.h>
#include <pthread.h>

void myFunc1 ( void *ptr );
void myfunc2 ( void *ptr );

int main(int argc, char *argv[])
{
	pthread_t thread1;
	pthread_t thread2;
	pthread_t thread3;
	pthread_t thread4;
	pthread_t thread5;
	pthread_t thread6;
	pthread_t thread7;

	char *msg1 = "Thread 1";
	char *msg2 = "Thread 2";
	char *msg3 = "Thread 3";
	char *msg4 = "Thread 4";
	char *msg5 = "Thread 5";
	char *msg6 = "Thread 6";
	char *msg7 = "Thread 7";

	pthread_create (&thread1, NULL, (void *) &myfunc1, (void *) msg1);
	pthread_create (&thread2, NULL, (void *) &myfunc2, (void *) msg2);

	pthread_join(thread1, NULL);
	pthread_join(thread2, NULL);
	
	return 0;
}

void myfunc1 ( void *ptr )
{
	char *msg = (char *)ptr;
	printf("%s\n", msg);

	pthread_exit(0);
}

void myfunc2 ( void *ptr )
{
	char *msg = (char *)ptr;

	printf("%s\n", msg);

	pthread_exit(0);
}
