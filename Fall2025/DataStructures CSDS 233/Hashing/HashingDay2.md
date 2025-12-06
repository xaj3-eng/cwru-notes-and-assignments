# **Hashing Day 2: Implementation Issues**

### Main Idea from Day 1:
- Use the key value as an array index to get constant time access
- Make a big array and pass the keys through a hashing function to get the index
- Handling collisions with chaining
- Handling collisions with open addressing
  - Linear Probing
  - Quadratic Probing
  - Double Hashing
    - This is where you use another hashing function different than the first to determine the probing jump size
  - Note that with open addressing, if you visit an **empty** position, you can stop searching. HOWEVER, if you visit a position with a **removed** value, you cannot stop searching. Therefore you need a flag to differentiate between **removed** and **empty**

### Implementation Details

```java
public class HashTable {
  private class Entry {
    private String key;
    private String etymology;
    private boolean removed;
  }

  private Entry[] table;
  private int tableSize;
}
```

- For an empty position, table[i] = null
- For a removed position, don't set table[i] to null, set table[i].removed to true
- All real values are non-null Entries with removed = false
- Unoccupied spaces are represented by empty positions or removed positions

### Exercise 1: Double Hashing

```java
public class HashTable {
  private class Entry {
    public String key;
    public String etymology;
    public boolean removed;

    public Entry(String key, String etymology, boolean removed) {
      this.key = key;
      this.etymology = etymology;
      this.removed = removed;
    }
  }

  private Entry[] table;
  private int tableSize;

  // Finds an open space for the given key value
  private int probe(String key) {
    int i = h1(key);
    final int increment = h2(key);
    int iterations = 0;

    while (table[i] != null && table[i].removed == false) {
      i = (i + increment) % tableSize;

      iterations++;
      if (iterations >= tableSize) return -1;
    }

    return i;
  }

  private int findKey(String key) {
      int i = h1(key);
      final int increment = h2(key);

      for (int iterations = 0; table[i] != null && iterations < tableSize; iterations ++) {
          if (table[i].key.equals(key) && table[i].removed == false) {
              return i;
          }

          i = (i + j) % tableSize;
          iterations++;
      }

      return -1;
  }

  public void remove(String key) {
      int i = findKey(key);
      if (i == -1) return;
      table[i].removed = true;
  }

  // Linear Time Complexity
  // Public method so the user can rehash whenever they like
  public void rehash() {
      int oldSize = tableSize;
      Entry[] oldTable = table;

      tableSize = nextPrime(2 * oldSize); // You want to keep the size prime
      table = new Entry[tableSize];
      for (i = 0; i < oldSize; i++) {
          if (table[i] != null && table[i].removed == false) {
              table.insert(table[i].key, table[i].etymology);
          }
      }
  }
}
```

### Issues and Questions
- As the hash table is used, more positions will be marked as removed
  - This won't affect insertion, but it will make searching (especially unsuccessful) and deleting take longer
- If the table is close to full (you have almost n entries)
  - Insertion, searching (especially unsuccessful), and deletion will take longer
- **Load Factor** = # of items / tableSize

1. If you have too many items, you can create a new bigger hash table
2. If you have too many removed items, create a new hash table of the same size

### Efficiency of Hash Tables
Search/Insertion/Deletion Best Case = O(1)
Find Max/Min = O(n)

### Hash Functions for Strings
Sum of character codes is bad hash function

Better example:
hashvalue = (char0 * b^n-1 + char1 * b^n-2 + ... + char(n-1) * b^0)

char (also called a) is the byte encoding of the ith character
b is just a constant

But on the other hand, that operation is very complicated and probably expensive

##### There is a method called Horner's Method that calculates the above equation in an iterative way, which is very efficient
##### String::hashCode calculates that


### Substring Pattern Matching (Very common operation)
Input: A text string t and a pattern string p
Problem: Does t contain the pattern p as a substring, and if so where?

```java
String p = "abc" // Size m
String t = "skldfjklsjngakbsndkbfalsdbjfsdfl" // Size t
```

Checking every single index for every single substring is O(nm) time
- because you have to check each index of p for each index of t

If you calculate the hash value of m and compare to every substring, that works
- But you don't gain that much because calculating the hash value of an m-long string is O(m)

If you instead add and subtract individual byte values as you traverse t and compare that value with p's hash value, that is faster.
- first three letter hash value: h0 = c0 + c1 + c2
- second three letter hash value: h1 = h0 + c3 - c0
- repeat and compare each with hash value of p
