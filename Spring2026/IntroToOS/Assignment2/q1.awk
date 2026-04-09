#!/usr/bin/awk -f

# Number of Objects: $3
# Object Size: $4
# Pages per Slab: $6

BEGIN {
  PAGE_SIZE = 512;
}

function ceil(x) {
    return (x == int(x)) ? x : int(x) + (x > 0 ? 1 : 0)
}

{
  current_slab_alloc_pages = ceil(($3 * $4) / PAGE_SIZE)
  current_perobj_pages = $6 * $3

  slab_alloc_pages += current_slab_alloc_pages
  perobj_pages += current_perobj_pages
}

END {
  pages_saved = perobj_pages - slab_alloc_pages
  space_saved = pages_saved * PAGE_SIZE

  printf("Pages used with Slab Allocator: %d\n", slab_alloc_pages)
  printf("Pages used with Per Object Paging: %d\n", perobj_pages)
  printf("Pages Saved with Slab Allocator: %d\n", pages_saved)
  printf("Page Size (in bytes): %d\n", PAGE_SIZE)
  printf("Space Saved (in bytes): %d\n", space_saved)
}
