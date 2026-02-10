#include <stdio.h>
#include <stdlib.h>

int main() {
  for (char x = 0; x < 100; x++) {
    system("sleep 1");
    printf("%d: %c\n\n", x, x);
  }
  return 0;
}
