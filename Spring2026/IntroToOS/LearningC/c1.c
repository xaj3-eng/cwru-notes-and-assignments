#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int n;

int main() {
  FILE *fp;
  char line[1024];

  // Run top in batch mode, one iteration
  fp = popen("top -b -n 1", "r");
  if (fp == NULL) {
    perror("popen failed");
    return 1;
  }

  // Skip header lines until we reach the process list
  while (fgets(line, sizeof(line), fp)) {
    // The process list usually starts with a line beginning with "PID"
    if (strncmp(line, "  PID", 5) == 0) {
      break;
    }
  }
  // printf("HERE1 %s\n",line);

  // Now read process lines
  char *token; // pointer will keep pointing to new output of strok
  do {
    printf("HERE2\n");
    // Tokenize the line to get the first field (PID)
    token = strtok(line, " \t");
    printf("PID as string: %s\n", line);
    if (token != NULL) {
      int pid = atoi(token);
      if (pid > 0) {
        printf("PID as int: %d\n", pid);
      }
    }
    for (int i = 2; i < 9; i++)
      token = strtok(NULL, " \t\n");
    printf("P as string: %s\n", token);
    if (token != NULL) {
      int cpunum = atoi(token);
      printf("P as int: %d\n", cpunum);
    }
  } while (fgets(NULL, sizeof(line), fp) != nullptr);

  pclose(fp);
  return 0;
}
