#include <stdio.h>

#define N 10

void quicksort(int a[], int low, int high);
int split(int a[], int low, int high);

int main(void)
{
	int a[N], i;

	printf("Enter %d numbers to be sorted: ", N);
	for (i = 0; i < N; i++)
		scanf("%d", &a[i]);
	quicksort(a, 0, N - 1);

	printf("In sorted order: ");
	for (i = 0; i < N; i++)
		printf("%d ", a[i]);
	printf("\n");

	return 0;
}

void quicksort(int a[], int low, int high)
{
	int middle;

	if (low >= high) return;
	middle = split(a, low, high);
	printf("middle = %d\n", middle);
	quicksort(a, low, middle - 1);
	quicksort(a, middle + 1, high);
}

int split(int a[], int low, int high)
{
	int part_element = a[low];

	for (;;) {
		while (low < high && part_element <= a[high]){
			printf("part_element: %d, a[high]: %d\n", part_element, a[high]);
			high--;
		}
		if (low >= high) break;
		printf("a[high] = %d\n", a[high]);
		printf("a[low] = %d\n", a[low]);
		printf("a[low++] = %d\n", a[low+1]);
		a[low++] = a[high];

		while (low < high && a[low] <= part_element){
			printf("part_element: %d, a[low]: %d\n", part_element, a[low]);
			low++;
		}
		if (low >= high) break;
		printf("a[low] = %d\n", a[low]);
		printf("a[high] = %d\n", a[high]);
		printf("a[high--] = %d\n", a[high-1]);
		a[high--] = a[low];
	}

	a[high] = part_element;
	return high;
}
