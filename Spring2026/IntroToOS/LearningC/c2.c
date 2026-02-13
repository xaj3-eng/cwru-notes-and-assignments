#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int n;
/*
  assumes .toprc is set manually so P is the 13th field
*/

int main() {
  FILE *fp;
  char line[1024];

  system("top -b -n 1 > out.top");

  // Run top in batch mode, one iteration
  fp = fopen("out.top", "r");
  if (fp == NULL) {
    perror("fopen failed");
    return 1;
  }

  // Skip header lines until we reach the process list
  while (fgets(line, sizeof(line), fp)) {
    // The process list usually starts with a line beginning with "PID"
    if (strncmp(line, "    PID", 7) == 0) {
      break;
    }
  }
  printf("HERE1 %s\n", line);

  // Now read process lines
  char *token; // pointer will keep pointing to new output of strok
  do {
    // printf("HERE2\n");
    // Tokenize the line to get the first field (PID)
    token = strtok(line, " \t");
    printf("PID as string: %s\n", line);
    if (token != NULL) {
      int pid = atoi(token);
      if (pid > 0) {
        printf("PID as int: %d\n", pid);
      }
    }
    for (int i = 2; i < 12; i++)
      token = strtok(NULL, " \t\n");
    printf("TIME as string: %s\n", token);
    if (token != NULL) {
      int cpunum = atoi(token);
      printf("TIME as int: %d\n", cpunum);
    }
    // fgets(line, sizeof(line), fp);
    // } while (++n < 99);
    for (int i = 0; i < 40; i++)
      printf("HERE3 %p %d %s\n", line + i, i, line + i);
  } while (
      fgets(line, sizeof(line), fp) !=
      NULL); // probably while(!=NULL) different behavior different compilers!

  pclose(fp);
  return 0;
}
