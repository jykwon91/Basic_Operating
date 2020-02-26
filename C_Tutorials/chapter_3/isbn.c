#include <stdio.h>

int main(void)
{
	int gsi, group_id, pub_code, item_num, check_digit;

	printf("Enter ISBN: ");
	scanf("%d-%d-%d-%d-%d", &gsi, &group_id, &pub_code, &item_num, &check_digit);

	printf("GSI prefix: %d\n", gsi);
	printf("Group identified: %d\n", group_id);
	printf("Publisher code: %d\n", pub_code);
	printf("Item number: %d\n", item_num);
	printf("Check digit: %d\n", check_digit);
}
