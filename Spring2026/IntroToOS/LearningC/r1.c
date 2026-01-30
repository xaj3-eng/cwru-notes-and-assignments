#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

signed main(int argc, char **argv) {
  pid_t pid = getpid();
  printf("The PID of %s is %d", argv[0], pid);

  char buf[64];
  snprintf(buf, sizeof(buf), "/proc/%d/maps", pid);

  char cmd[96];
  snprintf(cmd, sizeof(cmd), "cat %s", buf);
  system(cmd);

  system("sleep 100");

  return 0;
}
