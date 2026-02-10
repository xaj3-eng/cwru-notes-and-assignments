#include <stdlib.h>

signed main() {
  for (int i = 0; i < 180; i++) {
    malloc(10 * sizeof(int));
    system("sleep 1");
  }
}
