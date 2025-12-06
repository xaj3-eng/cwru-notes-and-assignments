public interface Queue<T> {
    public boolean insert(T item);
    public T remove();
    public T peek();
    public boolean isEmpty();
    public boolean isFull();
}
