public class Sorting {

    public static void main(String[] args) {
        int[] arr = { 5, 2, 7, 3, 8, 25, 10, -5 };

        mergeSort(arr);

        for (int x : arr) System.out.println(x);
    }

    public static void mergeSort(int[] arr) {
        int[] temp = new int[arr.length];
        myMergeSort(arr, temp, 0, arr.length - 1);
    }

    static void myMergeSort(int[] arr, int[] temp, int start, int end) {
        if (start >= end) return;

        final int middle = (start + end) / 2;

        myMergeSort(arr, temp, start, middle);
        myMergeSort(arr, temp, middle + 1, end);

        merge(arr, temp, start, middle, middle + 1, end);
    }

    static void merge(
        int[] arr,
        int[] temp,
        int leftStart,
        int leftEnd,
        int rightStart,
        int rightEnd
    ) {
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
            temp[k] = arr[i];
            i++;
            k++;
        }

        while (j <= rightEnd) {
            temp[k] = arr[j];
            j++;
            k++;
        }

        for (int x = 0; x < temp.length; x++) {
            arr[x] = temp[x];
        }
    }
}
