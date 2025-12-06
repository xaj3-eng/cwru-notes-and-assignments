public class PriorityQueue {
  public int[] items;
  int capacity;
  public int numItems;

  public PriorityQueue() {
    capacity = 100;
    items = new int[capacity];
    numItems = 0;
  }

  public PriorityQueue(int[] array) {
    capacity = 100;
    items = new int[capacity];
    numItems = array.length;

    System.arraycopy(array, 0, items, 0, numItems);

    for (int i = numItems / 2 - 1; i >= 0; i--) {
      siftDown(i);
    }
  }

  public void insert(int input) {
    if (numItems >= capacity) return;

    int index = numItems++;
    items[index] = input;

    siftUp(index);
  }

  public void siftUp(int index) {
    while (index > 0) {
      if (items[index] > items[getParent(index)]) {
        swapIndices(index, getParent(index));
        index = getParent(index);
      } else {
        break;
      }
    }
  }

  public String toString() {
    String ret = "[";
    for (int i = 0; i < numItems; i++) {
      ret += items[i] + ",";
    }
    ret = ret.substring(0,ret.length() - 1) + "]";

    return ret;
  }

  private int getParent(int index) {
    return (index - 1) / 2;
  }
  private int getLeft(int index) {
    return 2 * index + 1;
  }
  private int getRight(int index) {
    return 2 * index + 2;
  }

  private void swapIndices(int index1, int index2) {
    int temp = items[index1];
    items[index1] = items[index2];
    items[index2] = temp;
  }

  public void siftDown(int index)  {
    while (getLeft(index) < numItems) {
      if (items[index] < items[getLeft(index)] || items[index] < items[getRight(index)]) {
        int newIndex = (items[getLeft(index)] >= items[getRight(index)]) ? getLeft(index) : getRight(index);
        swapIndices(index, newIndex);
        index = newIndex;
      } else {
        break;
      }
    }
  }

  public int remove() {
    int index = 0;
    numItems--;

    int ret = items[index];
    swapIndices(index, numItems);

    siftDown(index);

    return ret;
  }

  public static void main(String[] args) {

    int[] array = {6,2,8,3,12,4,7,5,10};
    PriorityQueue pq2 = new PriorityQueue(array);

    System.out.println(pq2);
    System.out.println(pq2.remove());
    // PriorityQueue pq = new PriorityQueue();
    // pq.insert(5);
    // pq.insert(3);
    // pq.insert(2);
    // pq.insert(10);
    // pq.insert(8);
    // pq.insert(12);
    // pq.insert(4);
    // pq.insert(7);
    //
    // System.out.println(pq);
    // System.out.println(pq.remove());
    // System.out.println(pq.remove());
    // System.out.println(pq.remove());
    // System.out.println(pq);
  }
}
