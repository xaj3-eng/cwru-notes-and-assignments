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

  // Now read process lines
  while (fgets(line, sizeof(line), fp) != NULL) {
    // Skip empty lines
    if (strlen(line) == 0) continue;
    
    // Make a copy of the line for tokenization
    char line_copy[1024];
    strcpy(line_copy, line);
    
    char *token = strtok(line_copy, " \t");
    if (token != NULL) {
      int pid = atoi(token);
      if (pid > 0) {
        printf("PID as int: %d\n", pid);
      }
    }
    
    // Skip fields to get to CPU usage (field 9 typically)
    for (int i = 1; i < 9; i++) {
      token = strtok(NULL, " \t\n");
    }
    
    if (token != NULL) {
      double cpu_usage = atof(token);
      printf("CPU usage: %.1f%%\n", cpu_usage);
    }
  }

  pclose(fp);
  return 0;
}