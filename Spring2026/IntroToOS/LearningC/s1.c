#include <stdio.h>

int main() {
  int n = 1;
  for (int i=1; i<100; i++) {
    n*=2;
    printf("%d\n",n);
  }

  return 0;
}
