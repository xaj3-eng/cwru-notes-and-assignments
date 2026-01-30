#include <stdio.h>
#include <stdlib.h>
#include <threads.h>
#include <unistd.h>
signed main() {
  pid_t pid = getpid();

  pid = fork(); // A new "Child process is created, and for the child process,
                // pid=0"
  // For the parent process, pid=pid

  if (pid == 0) {
    for (int i = 0; i < 100; i++)
      if (i % 20 == 0)
        thrd_yield();
      else
        printf("%d, ", i);
    printf("Child Complete \n");
  } else {
    for (int i = 100; i < 200; i++)
      if (i % 20 == 0)
        thrd_yield();
      else
        printf("%d, ", i);
    printf("Parent Complete \n");
  }
}
