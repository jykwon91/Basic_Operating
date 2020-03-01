#include <stdio.h>

int main(void)
{
  int m, n, remainder;

  printf("Enter two integers: ");
  scanf("%d%d", &m, &n);

  int count=0;
  while (n != 0) {
    printf("m = %d, n = %d\n", m, n);
    remainder = m % n;
    printf("remainder = %d\n", remainder);
    m = n;
    n = remainder;
    printf("count = %d, remainder = %d, m = %d\n", count, remainder, m);
    count++;
  }

  printf("Greatest common divisor: %d\n", m);

  return 0;
}
