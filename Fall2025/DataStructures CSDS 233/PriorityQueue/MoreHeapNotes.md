## Merging two heaps into a single heap

To do this, you would append one heap to the end of the other.
Then you would sift down every non-leaf node, just like you did when creating a heap

Time Complexity: O(N + M)
where N and M are the sizes of the two original heaps

## Final notes on heaps:

h is always proportional to log n
There is garbage in the array after index numItems - 1:

numItems = 5
[7,4,5,1,2,5,0,0,0,0,0,0,0]
          ^---Garbage---^

### Running Times:
findMax = O(1)
removeMax = O(log n)
insert = O(log n)
findMin = O(n)
buildHeapFromArray = O(n)
mergeHeaps = O(n) || O(n + m)

### Exercise: Update an Item

You have to implement a function that takes an item index and a new key as input and changes its priority value
To do this, you would just change the key value to the new value, then you would call siftUp on the index if it was a greater key, and you would call siftDown if it was a lesser key

Or you could just call siftUp and siftDown

### Exercise: Delete an Arbitrary Item (Not RemoveMax())

DFS / Iterate through the array to find the item and delete it.

Then you do the same removal method as if it was the root:
Replace the node/item with the last item in the heap, check if the replacement item is greater or lesser than the previous item.
If it was greater, sift it Up, if lesser, sift it Down

### Heap Sort

Convert an array into a heap by sifting Down all non-leaf nodes.
Then remove maxes from the heap until the array is empty, moving the max to the end of the array
This will result in a sorted array

Time Complexity: Build Heap=O(N) + RemoveMaxes= N * O(log N) = 
O(N log N)
