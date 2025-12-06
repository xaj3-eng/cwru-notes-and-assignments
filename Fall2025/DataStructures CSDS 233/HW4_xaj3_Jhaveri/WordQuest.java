import java.util.ArrayList;
import java.util.Optional;

// Instances of this class contain hashtables with keys and values that are both strings
// Its main method includes testing of the hashtables
public class WordQuest {
    private class Entry {

        String key;
        String value;
        boolean removed;

        public Entry(String key, String value) {
            this.key = key;
            this.value = value;
            this.removed = false;
        }
    }

    private Entry[] table;
    private int tableSize;
    private int numKeys;

    public WordQuest(int size) {
        if (size <= 0) size = 1;

        tableSize = size;
        table = new Entry[tableSize];
        numKeys = 0;
    }

    // Calculates "polynomial rolling hash" from Lecture 16
    // Uses horner's method to do it iteratively like mentioned in class
    public int h1(String key) {
        final int B = 31;
        int result = 0;

        // Calculates key.0 * B^(length - 1) + key.1 * B^(length-2) + ... + key.(length - 1)
        for (int i = 0; i < key.length(); i++) {
            result = (result * B) + key.charAt(i);
        }

        return result % tableSize;
    }

    // Calculates 7 - (sum of ASCII codes of key characters mod 7)
    public int h2(String key) {
        int finalSum = 0;

        for (int i = 0; i < key.length(); i++) {
            finalSum += key.charAt(i);
        }

        return 7 - (finalSum % 7);
    }

    public void insert(String key, String value) {
        final int initialIndex = h1(key);
        final int increment = h2(key);

        int currentIndex = initialIndex;
        ArrayList<Integer> probeSequence = new ArrayList<>();

        do {
            probeSequence.add(currentIndex);

            // If the currentIndex is empty or contains a removed entry, insert a new entry with key/value
            // Increments the number of keys
            // Then check the load factor and rehash if its greater than 0.6
            if (table[currentIndex] == null || table[currentIndex].removed) {
                table[currentIndex] = new Entry(key, value);
                numKeys++;

                System.out.printf(
                    "\"%s\" inserted. Probe Sequence: %s%n",
                    key,
                    probeSequence.toString()
                );

                if (((double) numKeys / tableSize) > 0.6) {
                  System.out.println("Load factor exceeded 0.6. Rehashing...");
                  rehash();
                }

                return;
            }
            // If the key already exists, replace the old value with the new
            else if (table[currentIndex].key.equals(key)) {
                table[currentIndex].value = value;
                System.out.printf(
                    "Key \"%s\" already exists. (Probe Sequence: %s)%nValue updated to \"%s\"%n",
                    key,
                    probeSequence.toString(),
                    value
                );

                return;
            }

            // If neither of the above conditions are met, increment the current index by h2(key)
            currentIndex = (currentIndex + increment) % tableSize;

            // Loop until you will check the same index twice
        } while (currentIndex != initialIndex);

        System.out.printf(
            "Failed to insert Key \"%s\". The Hash table is full or doesn't have a prime table size",
            key
        );
    }

    // Returns the index in the table where the inputted key is
    private Optional<Integer> probe(String key) {
        final int initialIndex = h1(key);
        final int increment = h2(key);

        int currentIndex = initialIndex;

        do {
            // If the current index is null, return None
            if (table[currentIndex] == null) return Optional.empty();
            // If the current entry's key matches the key parameter, return the current index
            else if (table[currentIndex].key.equals(key))
                return Optional.of(currentIndex);

            // Increment the current index by h2(key)
            currentIndex = (currentIndex + increment) % tableSize;
        } while (currentIndex != initialIndex);

        return Optional.empty();
    }

    // Calls the probe function, and if an index of the key is found, returns its entry's corresponding value
    // Otherwise returns "NOT FOUND"
    public String search(String key) {
        return probe(key)
            .map(index -> table[index].value)
            .orElse("NOT FOUND");
    }

    // Calls the probe function, and if an index of the key is found, sets its entry as removed
    public void remove(String key) {
        probe(key).ifPresentOrElse(
            index -> {
                table[index].removed = true;
                numKeys--;
                System.out.println(
                    "\"" + key + "\" removed (marked as removed)"
                );
            },
            () -> System.out.println(
                    "\"" + key + "\" wasn't found and therefore was not removed"
                )
        );
    }

    // Creates a new array with twice the size as the old table and resets the number of Keys
    // Then loops through the old table and, if there is a non-null entry, inserts its key-value pair into the new table
    // Inserts using the 'rehashInsert' method so the numKeys variable isn't updated and there is no output
    public void rehash() {
        Entry[] oldTable = table;

        tableSize *= 2;
        table = new Entry[tableSize];
        numKeys = 0;

        for (Entry entry : oldTable)
            if (entry != null) rehashInsert(entry.key, entry.value);

        System.out.println("Rehash Complete: new table size = " + tableSize);
    }

    // Copy of the 'insert' method with no output
    private void rehashInsert(String key, String value) {
        final int initialIndex = h1(key);
        final int increment = h2(key);

        int currentIndex = initialIndex;

        do {
            if (table[currentIndex] == null || table[currentIndex].removed) {
                table[currentIndex] = new Entry(key, value);
                numKeys++;
                return;
            }
            // This should never happen
            else if (table[currentIndex].key.equals(key)) {
                table[currentIndex].value = value;
                return;
            }

            currentIndex = (currentIndex + increment) % tableSize;
        } while (currentIndex != initialIndex);

        System.out.printf(
            "Failed to insert Key \"%s\" during rehash. The Hash table is full or doesn't have a prime table size",
            key
        );
    }

    public void printTable() {
        for (int i = 0; i < tableSize; i++) {
            if (table[i] == null) System.out.printf("[%d] null%n", i);
            else if (table[i].removed) System.out.printf("[%d] removed%n", i);
            else System.out.printf(
                "[%d] %s : %s%n",
                i,
                table[i].key,
                table[i].value
            );
        }
    }

    public static void main(String[] args) {
        // Sample Input Case 1: Basic Insertion
        System.out.println("Sample Input Case 1: Basic Insertion\n");

        WordQuest game = new WordQuest(7);
        game.insert("apple", "Latin");
        game.insert("zebra", "African");
        game.insert("mango", "Tamil");
        game.printTable();

        // Sample Input Case 2: Collision + Update
        System.out.println("\n\nSample Input Case 2: Collision + Update\n");

        game.insert("bee", "Old English");
        game.insert("eel", "Greek");
        game.insert("bee", "Germanic");
        game.printTable();

        // Sample Input Case 3: Deletion + Rehashing
        System.out.println("\n\nSample Input Case 3: Deletion + Rehashing\n");

        WordQuest game2 = new WordQuest(7);
        game2.insert("apple", "English");
        game2.insert("mango", "Tamil");
        game2.remove("apple");
        game2.insert("coconut", "Portuguese");
        game2.insert("peach", "Persian");
        game2.insert("melon", "Greek");
        game2.printTable();
    }
}
