// This uses a circular array, which is just an array that you use 'mod index' to get indices
public class ArrayQueue<T> implements Queue<T> {
  private int size = 0;
  private int front = 0;
  private int rear = 0;
  private int maxSize;
  private T[] items;

  public ArrayQueue(int capacity) {
    this.maxSize = capacity;
    items = (T[]) new Object[maxSize];
  }

  @Override
  public boolean insert(T item) {
    if (isFull())
      return false;

    items[rear++ % maxSize] = item;
    size++;
    return true;
  }

  @Override
  public T remove() {
    if (isEmpty())
      return null;

    size--;
    return items[front++ % maxSize];
  }

  @Override
  public T peek() {
    return items[front % maxSize];
  }

  @Override
  public boolean isFull() {
    return size >= maxSize;
  }

  @Override
  public boolean isEmpty() {
    return rear == front;
  }

  public static void main(String[] args) {
    ArrayQueue<Integer> myQueue = new ArrayQueue<>(3);

    myQueue.insert(1);
    myQueue.insert(2);
    myQueue.insert(3);
    if (!myQueue.insert(4))
      System.out.println("Tried to insert when Queue is full, didn't insert element");
    System.out.println(myQueue.remove());
    System.out.println(myQueue.remove());
    myQueue.insert(5);
    System.out.println(myQueue.remove());
    System.out.println(myQueue.remove());
  }
}
