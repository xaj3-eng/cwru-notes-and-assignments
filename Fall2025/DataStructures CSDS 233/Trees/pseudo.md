```java
public void levelOrderPrint() {
  Queue<TreeNode<T>> processingQueue;
  processingQueue.insert(root);

  while (!processingQueue.isEmpty()) {
    TreeNode<T> node = processingQueue.pop();
    System.out.println(node.val + " ");

    if (node.left) processingQueue.insert(node.left);
    if (node.right) processingQueue.insert(node.right);
  }
}
```

Add the root to a queue

Queue:
--------------------
7
--------------------
Pop from the queue, process it, and add left and right

Queue:
--------------------
X, 5, 9
--------------------

Repeat:

Queue:
--------------------
X, X, 9, 2, 6
--------------------

