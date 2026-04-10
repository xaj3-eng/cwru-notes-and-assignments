#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>

#define HEAP_SIZE 256
#define MAX_ORDER 8
#define LEVELS 9

typedef struct Node {
  uint8_t addr;
  struct Node *next;
} Node;

Node *free_lists[LEVELS];
uint8_t alloc_order[HEAP_SIZE];

void fl_push(int order, uint8_t addr) {
  Node *n = malloc(sizeof(Node));
  n->addr = addr;
  n->next = free_lists[order];
  free_lists[order] = n;
}

uint8_t fl_pop(int order) {
  Node *n = free_lists[order];
  uint8_t addr = n->addr;
  free_lists[order] = n->next;
  free(n);
  return addr;
}

bool fl_remove(int order, uint8_t addr) {
  Node **cur = &free_lists[order];
  while (*cur) {
    if ((*cur)->addr == addr) {
      Node *tmp = *cur;
      *cur = tmp->next;
      free(tmp);
      return true;
    }
    cur = &(*cur)->next;
  }
  return false;
}

uint8_t balloc(size_t size) {
  int order = 0;
  while ((1 << order) < (int)size)
    order++;

  int found = -1;
  for (int i = order; i < LEVELS; i++) {
    if (free_lists[i]) {
      found = i;
      break;
    }
  }
  if (found == -1) {
    printf("Error: Not enough space for attempted allocation of size %ld\n",
           size);
    return 0xFF;
  }

  uint8_t addr = fl_pop(found);
  while (found > order) {
    int prev = found;
    found--;
    printf("- Splitting size %d block into size %d blocks\n", 1 << prev,
           1 << found);
    fl_push(found, addr + (1 << found));
  }
  printf("Allocation of size %ld: Using a block with size %d (addr: %d)\n",
         size, 1 << order, addr);

  alloc_order[addr] = order;
  return addr;
}

void bfree(uint8_t addr) {
  int order = alloc_order[addr];
  while (order < MAX_ORDER) {
    uint8_t buddy = addr ^ (1 << order);
    if (!fl_remove(order, buddy))
      break;
    if (buddy < addr)
      addr = buddy;
    order++;
    printf("- Merging size %d blocks into a size %d block\n", 1 << (order - 1),
           1 << order);
  }
  printf("Freeing address %d; Block of size %d regained\n", addr, 1 << order);
  fl_push(order, addr);
}

void print_flists() {
  printf("---- Available Blocks ----\n");
  for (int i = MAX_ORDER; i >= 0; i--) {
    int free_spaces = 0;
    Node *ptr = free_lists[i];
    while (ptr) {
      free_spaces++;
      ptr = ptr->next;
    }
    if (free_spaces != 0) {
      printf("Size %d: %d\n", 1 << i, free_spaces);
    }
  }
  printf("\n");
}

void init() {
  for (int i = 0; i < LEVELS; i++)
    free_lists[i] = NULL;
  fl_push(MAX_ORDER, 0);
}

int main(void) {
  init();

  print_flists();
  uint8_t a = balloc(46);
  uint8_t b = balloc(15);
  print_flists();
  bfree(a);
  print_flists();
  uint8_t c = balloc(29);
  uint8_t d = balloc(119);
  print_flists();
  bfree(c);
  print_flists();
  uint8_t e = balloc(12);
  print_flists();
  bfree(b);
  bfree(e);
  print_flists();
  uint8_t f = balloc(31);
  print_flists();
  uint8_t g = balloc(79);
  print_flists();
  bfree(d);
  print_flists();
  uint8_t h = balloc(56);
  print_flists();

  return EXIT_SUCCESS;
}
