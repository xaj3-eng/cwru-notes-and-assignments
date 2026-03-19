#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

#define MAX_SIZE 1000000000

int main() {
  int iterations = 1000000; // number of mallocs
  srand(time(NULL));        // seed the random number generator

  for (int i = 0; i < iterations; i++) {
    // Generate a random size for malloc
    size_t size = rand() % MAX_SIZE + 1; // avoid zero size
    size = MAX_SIZE;                     // avoid zero size

    // Allocate memory
    char *ptr = (char *)malloc(size);
    if (ptr == NULL) {
      perror("malloc failed");
      continue;
    }

    // Fill the allocated space with random characters
    for (size_t j = 0; j < size; j++) {
      ptr[j] = (char)(rand() % 94 + 33); // printable characters from '!' to '~'
    }

    // Optional: print some info
    // printf("Allocated %zu bytes and initialized with random chars.\n", size);

    // Free the allocated memory
    free(ptr);
    sleep(.3);
  }

  return 0;
}
