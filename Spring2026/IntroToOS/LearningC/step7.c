#include <stdio.h>
#include <stdlib.h>

signed main() {
  for (int i = 0; i < 999; i++) {
    printf("\033[2J\033[1;1H");
    system("grep \"heap\" /proc/*/maps");
    system("sleep 1");
  }
}
