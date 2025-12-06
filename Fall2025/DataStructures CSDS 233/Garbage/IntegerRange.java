import java.lang.Iterable;
import java.util.Iterator;

public class IntegerRange implements Iterable<Integer> {

    private int min;
    private int max;

    public IntegerRange(int min, int max) {
        this.min = min;
        this.max = max;
    }

    public int getMin() {
        return min;
    }

    public int getMax() {
        return max;
    }

    public int difference() {
        return max - min;
    }

    public Iterator<Integer> iterator() {
        return new IntegerRangeIterator(min, max);
    }

    private class IntegerRangeIterator implements Iterator<Integer> {

        private int max;
        private int current;

        public IntegerRangeIterator(int min, int max) {
            this.current = min - 1;
            this.max = max;
        }

        public boolean hasNext() {
            return current < max;
        }

        public Integer next() {
            return ++current;
        }
    }

    public static void main(String[] args) {
        IntegerRange range = new IntegerRange(5, 10);

        Iterator<Integer> iter = range.iterator();

        while (iter.hasNext()) {
            System.out.println(iter.next());
        }
    }
}
