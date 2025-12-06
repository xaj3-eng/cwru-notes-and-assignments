# Hashing
## Day 1

So far we've only been able to search and find something in a minimum of O(log n)
- Sorted Arrays
- Various Trees

Also Insertion, Removal, Finding Max/Min, etc. have tradeoffs

Let's say there is an array A with index i:

A=[k0, k1, ... , ki, ... , k(n-1)]

Thus A[i] = k1, this operation is O(n)
Let's say you could get the value based on the key, so A[ki] = ki

This would give constant time search, giving you access to an object instantly based on a key

**KEY-VALUE Pairs**, a hash table is just an array where the index is passed through a function

Let's say we want to organize every case student in an array based on their case ID, seven digits
If we want to use the student numbers as a key, we need an array of size 10^7, so A[0] would be the student
with id 0 and A[2953782] would be the student with id 2953782. 

That is a huge waste of space. We want to cut down the waste of space while still having some way to uniquely identify each id


If we try to use the last two digits, say id % 100, then we only need an array of size 100.
However, then the id's cannot be uniquely identified. i.e. 123 and 223 would be represented the same way
We need to find an operation that reduces the number of possible values, but still uniquely identifies each input


This operation is called **The Hashing Function**

i.e. for an array indexed by i,
the key value is passed through the hashing function and returns a unique i value
This must be done for getting and setting

**No Hash Function is Perfect**, if there is a lot of data, there may be **"hash collisions"**
**Hashing function must be O(1)**, otherwise this whole data structure is pointless
Thus **Hashing Functions should be very very Simple**, then you address collisions

Modulo is used often at the end of hashing functions to trim down the index to fit the size of the table

Picking hash table size is important


### Example 1: Hashing Workers with Salary as a key
Hash Function: salary % 10
Hash Table size: 10 because the hash function can only output 10 unique values

What if the salaries are all multiples of $10K?
We are screwed because every value would be placed at index 0, every value causes a hash collision

**Note: The size of hash tables are usually prime numbers**

### Example 2: Hashing with Strings as a key
Common Solution: use the byte sum of all characters as the index.
Hashing function: str.chars().forEach(|c| c.byte_value()).sum() % 2540

Maximum sum of 20 characters = 127*20 = 2540

## Handling Hash Collisions
**HASH COLLISIONS WILL HAPPEN, CONSIDER THEM**

**Load Factor = # items / n**

**Solution 1: OPEN ADDRESSING**
- If there is a collision at the index returned by the hash function, simply find another open position
- Let h(key) be the index returned by the hash function
1. **Linear Probing**:
  - Check every open position linearly after h(key), making sure to wrap around the array
  - first check h(key), then check h(key) + 1, then h(key) + 2, +3, +4, ...
  - Will always find an empty position, but it may take a while if there is clustering
2. **Quadratic Probing**:
  - Check h(key) plus the square of the linear probing
  - first check h(key), then check h(key) + 1^2, then h(key) + 2^2, +3^2, +4^2, ... 
  - Reducing the effects of clustering, won't always find an empty position
3. **Double Hashing**: let h2(key) be some other hashing function that returns the increment
  - h(key) computes the starting position to check, h2(key) computes the probe increment
  - first check h(key), then h(key) + h2(key), then h(key) + 2 * h2(key), + 3*h2(key), ...

- When removing with open addressing, you need to make sure that you mark the removed items with some boolean as removed, otherwise it will stay

**Solution 2**: Chaining
- Instead of storing Ts in the hash table, store  LinkedList<T>s in the hash table
- Load Factor must be less than 1 if you want to preserve O(1) time

Irrelevant Solution: Double Hashing
- hash table at each index in the hash table
- When there is a collision, pass through another hash function to put it in some crazy hash matrix

