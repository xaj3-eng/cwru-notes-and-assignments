## **Basics of Sorting**
Given an array

**Ground Rules**
- Sort the values in increasing order
- Sort in place, minimizing the amount of extra storage

**Terminology**
- position: one of the memory locations in the array (indices)
- element: one piece of data stored in the array
- element i: the element at position i

**Goal**
- Minimize the number of comparisons 'C'
- Minimize the number of moves 'M'

### **Algorithm 1: Selection Sort**
There is a sorted region and an unsorted region within the array. Initially, the entire array is the unsorted region

Loop through the unsorted region to find the smallest element, and swap it with the first element in the unsorted region

The first index of the unsorted region is then removed from the unsorted region and becomes the sorted region.

Repeat until the entire array is sorted.
```java
public static void selectionSort(int[] arr) {
    for (int i = 0; i < arr.length - 1; i++) {
        // Start of unsorted region: i
        int index_of_min = i;

        // This is often pulled out as a separate function
        for (int j = i + 1; j < arr.length; j++)
            if (arr[j] < arr[index_of_min])
                index_of_min = j;

        swap(i, index_of_min);
    }
}
```
**Worst Case Complexities Element by Element:**
| Item # | # Comparisons | # Moves |
|:--:|:----:|:----:|
| 1 | n | 3 |
| 2 | n-1 | 3 |
| 3 | n-2 | 3 |
| ... |...|...|
| n | 0 | 3 |

- Number of Comparisons: O(n^2)
- Number of Moves: O(n)
  - *Number of Swaps: O(n)*
  - *Number of Moves = Number of Swaps \* 3*

These values don't change even if the array is already sorted, you would still loop through two nested for loops

### **Algorithm 2: Insertion Sort**
```java
public static void insertionSort(int[] arr) {
    for (int i = 1; i< arr.length; i++) {
        int toInsert = arr[i];

        for (j = i; j > 0 && toInsert < arr[j - 1]; j--)
            arr[j] = arr[j-1]; // Shift the greater element to the right

        arr[j] = toInsert;
    }
}
```
- Best Case Scenario is an array sorted in increasing order
- Worse Case Scenario is an array sorted in decreasing order

**Worst Case Complexities Element by Element:**
| Item # | # Comparisons | # Moves |
|:---:|:---:|:---:|
| 1 | 1 | 3 |
| 2 | 2 | 4 |
| 3 | 3 | 5 |
| ... |...|...|
| n | n | n + 2 |

- Number of Comparisons: O(n^2) worst case, O(n) best case
- Number of Moves: O(n^2) worst case, O(n) best case
  - This is because you are doing a lot of moves by shifting every element up
- *Note: Average Cases are also O(n^2)*

### **Algorithm 2.5: Insertion Sort w/ Binary Search**
Using binary search to find the optimal place for the current element is an improvement on the number of comparisons, but not the number of moves.

- Time Complexity: O(n^2) worst case, O(n) best case
- Number of Comparisons: **O(n log n)** worst case, O(n) best case
- Number of Moves: O(n^2) worst case, O(n) best case

### **Algorithm 3: Shell Sort**
1. **Divides the array into "subarrys" which look like this:**

[a0,a1,a2,a3,a4,a5,a6,a7,a8,a9] Divided with Increment Size 3:
- Subarry 1: [a0, a3, a6, a9]
- Subarray 2: [a1, a4, a7]
- Subarray 3: [a2, a5, a8]

*(You don't actually move the elements into new arrays obviously)*

2. **Do insertion sort on each subarray**
3. **Then you do insertion sort on either the whole array, or the array divided into smaller subarrays**
4. **Repeat until you sort the entire array**

- you can use any increments as long as they are decreasing
- However, you shouldn't use increments that are multiples of each other (ex. 64, 32, 16, 8, ...) is bad.
- Hibbard's sequence is great: 2^k - 1, (ex. 63, 31, 15, 7, 3, 1)

```java
public static void shellSort(int[] arr) {
    todo!();
}
```

- \# Comparisons: Between O(n^2) and O(n log n)
- \# Moves: Between O(n^2) and O(n log n)

### **Algorithm 4: Bubble Sort**
1. Perform a sequence of passes through the unsorted region of the array
2. On each pass from left to right, if i > i + 1, swap i and i + 1.
3. On every pass, the sorted region at the right of the array extends by one because the greatest element in the unsorted region "bubbled to the top"
4. At the end of the kth pass, the k rightmost elements are in their final positions.

#### **Example**
[28, 24, 27, 18]
- continuously swap 28 with element to the right until you have the following:
[24, 27, 18, 28]
- Don't swap 24 with 27 because it's smaller, then swap 27 with 18:
[24, 18, 27, 28]
- Swap 24 with 18:

[18, 24, 27, 28]

```java
public static void bubbleSort(int[] arr) {
    for (int i = arr.length - 1; i > 0; i--) {
        boolean noMoveFlag = true;

        for (int j = 0; j < i; j++) {
            if (arr[j] > arr[j + 1]) {
                swap(arr, j, j+1);
                noMoveFlag = false;
            }
        }

        if (noMoveFlag) return;
    }
}
```
- Best Case Scenario is an array sorted in increasing order
- Worse Case Scenario is an array sorted in decreasing order

**Worst Case Complexities Element by Element:** *(Only the number of moves would change best case, all # Moves would be 0)*
| Item # | # Comparisons | # Moves |
|:---:|:---:|:---:|
| 1 | n - 1 | 3(n - 1) |
| 2 | n - 2 | 3(n - 2) |
| 3 | n - 3| 3(n - 3) |
| ... |...|...|
| n | 0 | 0 |

- \# Comparisons: O(n^2)
- \# Moves: O(n^2) worst case, no moves best case

- If **the number of moves** in the last iteration was zero (use a flag), then the array is sorted and you can stop
- This flag makes the best case scenario for comparisons O(n)

### The following algorithms are called "divide and conquer" algorithms
### **Algorthm 5: Quick Sort**

- Partitioning: Rearrange the elements into two subarrays. Every element in the left subarray is less than every element in the right subarray
- The **index and element** that separates the left subarray from the right subarray is called the "pivot"

Quick Sort simply partitions until you can't partition anymore

How to partition:
1. Pick a pivot
1. Create two pointers **outside of the array**, (lets call them i and j), set i to the beginning of the array - 1 and j to the end of the array + 1 (which is just the length)
1. increment i until arr[i] > pivot while simultaneously decrementing j until arr[j] < pivot
1. When both i and j have stopped moving, swap the elements at i and j
1. Continue until j < i, you now have two subarrays one up to and including j, the other from j + 1 until the end

```java
// I DON'T THINK THIS WORKS I DIDN'T REALLY LOOK
// Returns the index at which the array is split
private static int partition(int[] arr, int first, int last) {
    int pivot = /* This is a completely random number */ arr[(first + last) / 2];
    int i = first; // Ayday sets it to first - 1 & last + 1 respectively
    int j = last; // He then uses a 'do while' type loop

    while (j > i) {
        if (arr[i] <= pivot) i++;
        else if (arr[j] >= pivot) j++;
        else swap(arr, i, j);
    }

    return j;
}

private static int aydayPartition(int[arr], int first, int last) {
    int pivot = /* This is a completely random number */ arr[(first + last) / 2];
    int i = first - 1;
    int j = last + 1;
    while (true) {
        do {
            i++;
        } while (arr[i] < pivot);
        do {
            j--;
        } while (arr[j] > pivot);

        if (i < j)
            swap(arr, i, j);
        else
            return j;
    }
}
```
Partition Time Complexity:
- Comparisons: O(n)
- Movements: O(n)

Quick sort simply partitions recursively until you can't partition anymore

```java
public static void quickSort(int[] arr) {
    innerQuickSort(arr, 0, arr.length - 1);
}

private static void innerQuickSort(int[] arr, int first, int last) {
    if (first >= last) return;
    int split = partition(arr, first, last);
    innerQuickSort(arr, first, split);
    innerQuickSort(arr, split + 1, last);
}
```
Quick sort must partition approximately log(n) times

Quick Sort Time Complexity:
- Comparisons: O(n log n)
- Movements: O(n log n)

**Storage Complexity:**
- Number of recursive calls = log n
- You create two integers on the stack for every call
- O(log n)

But how do you pick a pivot when you can't get the median without a sorted array?

**PIVOT SELECTION**
- There are many ways to do this, but a common one is to pick three random numbers and take the median of those

The problem with quicksort is that you don't know what to use as a pivot.
Ideally you want the pivot to divide the list into two subarrays of equal size.
The recursion depth varies from best case: O(log n) to worst case: O(n). (Neither is likely)

### **Algorithm 6: Merge Sort**
Another divide and conquer algorithm

1. In this case, you split the array until you can't anymore (i.e. until all subarrays are size 1)
1. Then you merge the length-1 arrays into length-2 in a sorted way. Then into length-4 sorted, and so on.

**Merging Sorted Subarrays**

- Let's say there are two sorted subarrays A & B
- Create two pointers pA & pB, both set to 0
- The smallest element is either A[0] or B[0], append the smaller element to the array and increment the associated pointer.
- Repeat until there are no elements left in either subarray

```java
public static void mergeSort(int[] arr) {
    int[] temp = new int[arr.length];
    myMergeSort(arr);
}

static void myMergeSort(int[] arr, int[] temp, int start, int end) {
    if (start >= end) return;

    final int middle = (start + end) / 2;

    myMergeSort(arr, temp, start, middle);
    myMergeSort(arr, temp, middle + 1, end);

    merge(arr, temp, start, middle, middle + 1, end);
}

static void merge(int[] arr, int[] temp, int leftStart, int leftEnd, int rightStart, int rightEnd) {
    int i = leftStart;
    int j = rightStart;
    int k = leftStart;

    while (i <= leftEnd && j <= rightEnd) {
        if (arr[i] <= arr[j]) {
            temp[k] = arr[i];
            i++;
        } else {
            temp[k] = arr[j];
            j++;
        }
        k++;
    }

    while (i <= leftEnd) {
        tempt[k] = arr[i];
        i++;
        k++;
    }

    while (j <= rightEnd) {
        tempt[k] = arr[j];
        j++;
        k++;
    }

    for (int i = 0; i < temp.length; i++) {
        arr[i] = temp[i];
    }
}
```

Time Complexity
- Comparisons: O(n log n)
- Moves: O(n log n)
  - 2nlogn

Storage Complexity: O(n) // You create a temporary array of max size n/2

### **Bucket Sort**

Requires the assumption that all of the integers in the array are between 0 and M
Let's say M = 6:

[5,2,6,2,4,2,1,5,3,6,3]

Create an array of size {M + 1} 7,
put a linked list at each index

Traverse the array, and for every value, append that value to the index equal to the value:
- Append a 5 to the linked list at index 5
- Append a 2 to the linked list at index 2
- etc.

The merge the linked lists into an array

Bam O(n + m) time complexity
- (Technically it is n + m because when you merge the linked lists, there are n elements total and m arrays to loop through)

But this algorithm is very niche because the storage complexity is O(M)
and you must know the range of values.

**This algorithm is only good when sorting an array of small values with plenty of duplicates**
