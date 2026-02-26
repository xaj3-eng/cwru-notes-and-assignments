#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  FILE *fp;
  char pid[10], user[32], pr[8], ni[8], virt[16], res[16], shr[16], s[4];
  char cpu[8], mem[8], time[32], command[128];
  unsigned p;

  char final_strings[4][2048];

  for (int i = 0; i < 10; i++) {
    memset(final_strings, 0, sizeof(final_strings));

    system("top -b -n 1 | tail -n +8 | sort > out.top");

    fp = fopen("out.top", "r");
    if (fp == NULL) {
      perror("Error opening file");
      return 1;
    }

    char buffer[1024];

    while (fgets(buffer, sizeof(buffer), fp) != NULL) {
      sscanf(buffer, " %s %s %s %s %s %s %s %s %s %s %s %s %d\n", pid, user, pr,
             ni, virt, res, shr, s, cpu, mem, time, command, &p);
      char pid_buf[32];
      sprintf(pid_buf, "%s, ", pid);
      strcat(final_strings[p], pid_buf);
    }

    for (int p = 0; p < 4; p++) {
      printf("Core %d: %s\n\n", p, final_strings[p]);
    }

    fclose(fp);

    system("sleep 1");
    printf("\e[1;1H\e[2J");
  }

  return 0;
}
