import java.util.Random;
import java.util.stream.*;

public class Sort {

    public static void main(String[] args) {
        // Testing

        int[] insArray = { 26, 13, 72, 3, 17, 37, 0, 17, 73, 45 };
        int[] mergeArray = { 26, 13, 72, 3, 17, 37, 0, 17, 73, 45 };
        int[] quickArray = { 26, 13, 72, 3, 17, 37, 0, 17, 73, 45 };

        insertionSort(insArray);
        mergeSort(mergeArray);
        quickSort(quickArray);

        System.out.println(
            "Initial Array: [26, 13, 72, 3, 17, 37, 0, 17, 73, 45]"
        );
        System.out.println(
            "Insertion Sorted Array: " + formattedArray(insArray)
        );
        System.out.println("Merge Sorted Array: " + formattedArray(mergeArray));
        System.out.println("Quick Sorted Array: " + formattedArray(quickArray));

        // Analysis

        int[] inputSizes = { 100, 500, 1000, 5000, 10000, 50000, 100000 };

        System.out.println(
            "\n\nInsertion Sort Time Comparisons (Avg. of 4 Trials):"
        );
        performTimeComparisons(Sort::insertionSort, inputSizes, 4);

        System.out.println(
            "\n\nMerge Sort Time Comparisons: (Avg. of 10 Trials)"
        );
        performTimeComparisons(Sort::mergeSort, inputSizes, 10);

        System.out.println(
            "\n\nQuick Sort Time Comparisons: (Avg. of 10 Trials)"
        );
        performTimeComparisons(Sort::quickSort, inputSizes, 10);

        System.out.println(
            "\n\nAnalysis and Graphs are on the written portion of the assignment submitted as a pdf"
        );
    }

    private static void performTimeComparisons(
        SortingAlgorithm alg,
        int[] inputSizes,
        int iterationCount
    ) {
        System.out.printf(
            "%-15s%-15s%-15s%n",
            "Input Length",
            "Time in ns",
            "Time / n"
        );
        System.out.println("-------------- -------------- --------------");

        long[] outputTimeArr = new long[inputSizes.length];

        for (
            int iterationNum = 0;
            iterationNum < iterationCount;
            iterationNum++
        ) {
            for (int i = 0; i < inputSizes.length; i++) {
                int[] arr = generateRandomArray(inputSizes[i], -10000, 10000);

                final long initalTime = System.nanoTime();
                alg.sort(arr);
                outputTimeArr[i] += System.nanoTime() - initalTime;
            }
        }

        for (int i = 0; i < inputSizes.length; i++) {
            outputTimeArr[i] /= iterationCount;
            System.out.printf(
                "%-15d%-15d%-15d%n",
                inputSizes[i],
                outputTimeArr[i],
                outputTimeArr[i] / inputSizes[i]
            );
        }
    }

    private static String formattedArray(int[] arr) {
        String ret = "[";

        for (int i = 0; i < arr.length - 1; i++) {
            ret += arr[i] + ", ";
        }
        ret += arr[arr.length - 1] + "]";

        return ret;
    }

    public static int[] generateRandomArray(int n, int a, int b) {
        Random rand = new Random();

        return IntStream.generate(() -> rand.nextInt(a, b))
            .limit(n)
            .toArray();
    }

    // Insertion sort algorithm: For every index i--starting at index 1 and incrementing--define a new variable j that is equal to i.
    // If the value at j is greater than the value at j-1, then swap the two values and decrement j until j is less than the value at j-1.
    // Optimization: don't make a swap for every shift, instead just shift the value at j-1 up to j, and keep track of the initial value
    //    to insert it when that value is finally less than j-1
    public static void insertionSort(int[] array) {
        for (int i = 1; i < array.length; i++) {
            int temp = array[i];
            int j = i;

            while (j > 0 && temp > array[j - 1]) {
                array[j] = array[j - 1];
                j--;
            }

            array[j] = temp;
        }
    }

    // Mergesort function simply calls the recursive 'innerMergeSort' function
    public static void mergeSort(int[] array) {
        int[] temp = new int[array.length];
        innerMergeSort(array, temp, 0, array.length - 1);
    }

    private static void innerMergeSort(
        int[] array,
        int[] temp,
        int left,
        int right
    ) {
        // Base Case: If the left pointer is equal to the right pointer, then the subarray is of size 1 and is inherently sorted.
        if (left >= right) return;

        final int middle = (left + right) / 2;

        // Recursively calls the method on two equal sized subarrays (this will continue until subarrays are size 1)
        innerMergeSort(array, temp, left, middle);
        innerMergeSort(array, temp, middle + 1, right);

        // Merges the two subarrays that it just divided (which is now after they are sorted thanks to the recursive calls)
        merge(array, temp, left, right);
    }

    // Merges the two equally sized subarrays--one starts at initialLeft, and the other ends at initialRight
    // It begins with a pointer to the start of each subarray, then whichever subarray has the smaller pointed to value,
    //  it will add that value to the final list 'temp', and increment the pointer.
    // Repeat until all the values from one subarray have been added, then add the rest of the values from the other subarray.
    // Finally copies the 'temp' array back into the array variable
    private static void merge(
        int[] array,
        int[] temp,
        final int initialLeft,
        final int initialRight
    ) {
        int left = initialLeft;
        final int leftF = (initialLeft + initialRight) / 2;
        int right = (initialLeft + initialRight) / 2 + 1;
        final int rightF = initialRight;

        int arrayIndex = left;

        for (; left <= leftF && right <= rightF; arrayIndex++) {
            if (array[left] >= array[right]) {
                temp[arrayIndex] = array[left];
                left++;
            } else {
                temp[arrayIndex] = array[right];
                right++;
            }
        }

        while (left <= leftF) {
            temp[arrayIndex] = array[left];
            left++;
            arrayIndex++;
        }

        while (right <= rightF) {
            temp[arrayIndex] = array[right];
            right++;
            arrayIndex++;
        }

        System.arraycopy(
            temp,
            initialLeft,
            array,
            initialLeft,
            initialRight - initialLeft + 1
        );
    }

    // Quick sort algorithm
    // Simply calls the recursive quick sort method 'inner quick sort'
    public static void quickSort(int[] array) {
        innerQuickSort(array, 0, array.length - 1);
    }

    // Recursive quick sorting method
    private static void innerQuickSort(int[] array, int left, int right) {
        // If the right index is equal to the left index, its a 1 length subarray, nothing needs to be done
        if (right <= left) return;

        // Split the array into two subarrays
        int split = partition(array, left, right);

        // Sort each subarray
        innerQuickSort(array, left, split);
        innerQuickSort(array, split + 1, right);
    }

    // Partitions the subarray (array[left : right]) into two subarrays of values less than the pivot and values greater than the pivot
    // Returns the last index of the first subarray
    private static int partition(int[] array, int left, int right) {
        int pivot = generatePivot(array, left, right, 3);
        int i = left - 1;
        int j = right + 1;

        // If the left pointer is greater than the pivot value, increment until it finds a value less than the pivot
        // Repeat for right pointer, except it decrements until it finds a value greater than the pivot
        // Then swap the two poiners and repeat until the two pointers meet
        while (true) {
            do {
                i++;
            } while (array[i] > pivot);
            do {
                j--;
            } while (array[j] < pivot);

            if (i < j) {
                int temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            } else return j;
        }
    }

    // Generates a pivot value by finding the median of 'median array size' randomly selected numbers
    private static int generatePivot(
        int[] array,
        int left,
        int right,
        final int medianArraySize
    ) {
        if (right - left <= medianArraySize * 2) return array[(right + left) /
        2];

        Random rand = new Random();
        int[] medianArray = new int[medianArraySize];

        for (int i = 0; i < medianArray.length; i++) {
            medianArray[i] = array[rand.nextInt(left, right + 1)];
        }

        insertionSort(medianArray);

        return medianArray[medianArraySize / 2];
    }

    @FunctionalInterface
    interface SortingAlgorithm {
        void sort(int[] array);
    }
}
