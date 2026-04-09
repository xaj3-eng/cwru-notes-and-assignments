/*
 * Buddy allocator simulation with bursty demand.
 *
 * Printfs marked  [AI]   were added by the AI.
 * Printfs marked  [ME]   were added by me to show I understand the code.
 * (Add your own [ME] printfs to improve your score.)
 *
 * Pool layout: 256 bytes, minimum block 16 bytes → 5 orders (0..4)
 *   order 0 = 16 B,  order 1 = 32 B,  order 2 = 64 B,
 *   order 3 = 128 B, order 4 = 256 B
 *
 * Each allocated block starts with a 1-byte header that stores the order,
 * so the caller's pointer is header+1 and we can recover metadata on free.
 *
 * Buddy address: given block at byte-offset `off` with block-size `sz`,
 * its buddy is at offset  (off XOR sz).  This works because blocks at
 * each order are naturally aligned to their size.
 */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>

/* ── constants ─────────────────────────────────────────────────────────── */

#define HEAP_SIZE   256
#define MIN_BLOCK    16
#define NUM_ORDERS    5   /* 16, 32, 64, 128, 256 */

/* ── pool & free lists ──────────────────────────────────────────────────── */

static uint8_t pool[HEAP_SIZE];

/*
 * Intrusive linked-list node stored at the START of every free block.
 * When a block is free its first bytes hold this struct; when it is
 * allocated those bytes are overwritten (the 1-byte order tag is first).
 */
typedef struct FreeNode {
    struct FreeNode *next;
} FreeNode;

/* free_list[o] is the head of a singly-linked list of free blocks whose
 * size is  MIN_BLOCK << o  bytes. */
static FreeNode *free_list[NUM_ORDERS];

/* ── helpers ────────────────────────────────────────────────────────────── */

/* smallest order whose block size is >= `need` bytes */
static int order_of(size_t need)
{
    int    o  = 0;
    size_t bs = MIN_BLOCK;
    while (bs < need) { bs <<= 1; ++o; }
    return o;
}

static size_t block_size(int order) { return (size_t)MIN_BLOCK << order; }

/* byte offset of a pointer within the pool */
static size_t offset_of(const void *p)
{
    return (const uint8_t *)p - pool;
}

/*
 * Find the buddy of block `p` at `order`.
 * XOR flips exactly the bit that distinguishes left/right sibling at this
 * level, giving the partner's start address.
 */
static void *buddy_of(void *p, int order)
{
    return pool + (offset_of(p) ^ block_size(order));
}

/* ── init ───────────────────────────────────────────────────────────────── */

void buddy_init(void)
{
    memset(pool, 0, HEAP_SIZE);
    for (int i = 0; i < NUM_ORDERS; ++i)
        free_list[i] = NULL;

    /* the whole pool starts as one free block at the maximum order */
    free_list[NUM_ORDERS - 1]       = (FreeNode *)pool;
    free_list[NUM_ORDERS - 1]->next = NULL;

    printf("[AI][INIT] pool base=%p  total=%d B  min_block=%d B  orders=0..%d\n", /*[AI]*/
           (void *)pool, HEAP_SIZE, MIN_BLOCK, NUM_ORDERS - 1);
}

/* ── print free lists ───────────────────────────────────────────────────── */

void print_free_lists(void)
{
    printf("[AI][STATE] free lists:\n"); /*[AI]*/
    for (int o = 0; o < NUM_ORDERS; ++o) {
        printf("  order %d (%3zu B):", o, block_size(o)); /*[AI]*/
        int count = 0;
        for (FreeNode *n = free_list[o]; n; n = n->next) {
            printf(" [off=%zu]", offset_of(n)); /*[AI]*/
            ++count;
        }
        if (count == 0) printf(" (empty)"); /*[AI]*/
        printf("\n");
    }
}

/* ── alloc ──────────────────────────────────────────────────────────────── */

/*
 * Allocate at least `req` bytes.
 * Strategy:
 *   1. Round up to the smallest block that fits req + 1 (header byte).
 *   2. Walk free_list upward until we find a non-empty order.
 *   3. Split that block down to the target order, adding upper halves
 *      back to the free lists.
 *   4. Write the order into the first byte; return pointer to byte 1.
 */
void *balloc(size_t req)
{
    int order = order_of(req + 1);   /* +1 for the order-tag header byte */

    if (order >= NUM_ORDERS) {
        printf("[AI][ALLOC] ERROR: request %zu B is too large for this heap\n", req); /*[AI]*/
        return NULL;
    }

    /* find the lowest available order >= desired order */
    int avail = -1;
    for (int o = order; o < NUM_ORDERS; ++o) {
        if (free_list[o]) { avail = o; break; }
    }

    if (avail == -1) {
        printf("[AI][ALLOC] ERROR: out of memory (req=%zu)\n", req); /*[AI]*/
        return NULL;
    }

    /* pop the block from avail's free list */
    FreeNode *blk   = free_list[avail];
    free_list[avail] = blk->next;

    printf("[AI][ALLOC] found free block at order=%d (off=%zu); need order=%d\n", /*[AI]*/
           avail, offset_of(blk), order);

    /*
     * Split: each iteration halves the block and pushes the upper half
     * onto the free list one order below, until we reach the target order.
     */
    while (avail > order) {
        --avail;
        size_t   half  = block_size(avail);
        FreeNode *split = (FreeNode *)((uint8_t *)blk + half);
        split->next     = free_list[avail];
        free_list[avail] = split;
        printf("[AI][SPLIT] pushed buddy at off=%zu onto order=%d free list\n", /*[AI]*/
               offset_of(split), avail);
    }

    /* store order in first byte; hand back pointer to the rest */
    *(uint8_t *)blk = (uint8_t)order;
    void *ptr = (uint8_t *)blk + 1;

    printf("[AI][ALLOC] => req=%zu B  order=%d (%zu B block)  hdr_off=%zu  ptr=%p\n", /*[AI]*/
           req, order, block_size(order), offset_of(blk), ptr);

    return ptr;
}

/* ── free ───────────────────────────────────────────────────────────────── */

/*
 * Free a pointer returned by balloc.
 * Recover the order from the header byte, then repeatedly try to coalesce
 * with the buddy: if the buddy is in the free list at this order, remove it
 * and merge (use the lower address, bump the order).  Stop when the buddy
 * is not free or we reach the top order.
 */
void bfree(void *ptr)
{
    if (!ptr) return;

    uint8_t *blk  = (uint8_t *)ptr - 1;   /* step back over header */
    int      order = (int)*blk;

    printf("[AI][FREE ] ptr=%p  hdr_off=%zu  order=%d (%zu B)\n", /*[AI]*/
           ptr, offset_of(blk), order, block_size(order));

    while (order < NUM_ORDERS - 1) {
        FreeNode *bud = (FreeNode *)buddy_of(blk, order);

        /* search for the buddy in the current order's free list */
        FreeNode **pp = &free_list[order];
        while (*pp && *pp != bud)
            pp = &(*pp)->next;

        if (!*pp) break;          /* buddy is allocated – cannot merge */

        *pp = bud->next;          /* unlink buddy from free list */

        /* the lower-addressed half becomes the merged block */
        if ((uint8_t *)bud < blk)
            blk = (uint8_t *)bud;

        ++order;
        printf("[AI][MERGE] coalesced with buddy at off=%zu → order=%d (%zu B) at off=%zu\n", /*[AI]*/
               offset_of(bud), order, block_size(order), offset_of(blk));
    }

    FreeNode *node  = (FreeNode *)blk;
    node->next      = free_list[order];
    free_list[order] = node;

    printf("[AI][FREE ] block returned to order=%d free list at off=%zu\n", /*[AI]*/
           order, offset_of(blk));
}

/* ── bursty demand simulation ───────────────────────────────────────────── */

#define MAX_ALLOCS 15

int main(void)
{
    srand(42);
    buddy_init();
    printf("\n");
    print_free_lists();

    void *ptrs [MAX_ALLOCS] = {NULL};
    int   sizes[MAX_ALLOCS] = {0};
    int   next_slot = 0;

    /*
     * Three bursts.  Each burst allocates 5 blocks of random size,
     * then frees them all in reverse order (reverse order maximises
     * the chance of observing buddy coalescing).
     */
    for (int burst = 0; burst < 3; ++burst) {
        printf("\n══════════════════════════════════════\n");
        printf("  BURST %d — ALLOCATIONS\n", burst);
        printf("══════════════════════════════════════\n");

        int start = next_slot;
        for (int i = 0; i < 5 && next_slot < MAX_ALLOCS; ++i, ++next_slot) {
            /* random size: 1–28 bytes (fits in an order-1 block at most) */
            sizes[next_slot] = (rand() % 7 + 1) * 4;
            ptrs [next_slot] = balloc(sizes[next_slot]);
        }
        printf("\n");
        print_free_lists();

        printf("\n══════════════════════════════════════\n");
        printf("  BURST %d — FREES (reverse order)\n", burst);
        printf("══════════════════════════════════════\n");

        for (int i = next_slot - 1; i >= start; --i) {
            if (ptrs[i]) {
                bfree(ptrs[i]);
                ptrs[i] = NULL;
            }
        }
        printf("\n");
        print_free_lists();
    }

    return 0;
}
