import java.lang.Math;
import java.util.Queue;
import java.util.LinkedList;

public class Node {
  public int key;
  public String data;
  public Node left;
  public Node right;
  public Node parent;

  public Node(int key, String data) {
    this.key = key;
    this.data = data;
  }

  public int height() {
    if (left == null && right == null) return 1;
    return Math.max(left.height(), right.height()) + 1;
  }

  public int balance() {
    return right.height() - left.height();
  }

  public Node addLeft(Node left) {
    this.left = left;
    this.left.parent = this;

    return this;
  }

  public Node addRight(Node right) {
    this.right = right;
    this.right.parent = this;

    return this;
  }

  public Node rotateLeft() {
    if (parent == null) {
      this.right.parent = null;      
    } else if (parent.left == this) {
      parent.addLeft(this.right);
    } else if (parent.right == this) {
      parent.addRight(this.right);
    }

    Node newRight = this.right.left;

    this.right.addLeft(this);
    this.addRight(newRight);

    return parent;
  }

  public Node rotateRight() {
    if (parent == null) {
      this.left.parent = null;
    } else if (parent.left == this) {
      parent.addLeft(this.left);
    } else if (parent.right == this) {
      parent.addRight(this.left);
    }

    Node newLeft = this.left.right;

    this.left.addRight(this);
    this.addLeft(newLeft);

    return parent;
  }

  public int depth() {
    int finalDepth = 0;

    Node ptr = this;

    while (true) {
      if (ptr.parent == null) break;
      finalDepth++;
      ptr = ptr.parent;
    }

    return finalDepth;
  }

  public void print() {
    printRecursive(new LinkedList<Node>(), 0);

    System.out.println("\n");
  }

  public void printRecursive(Queue<Node> currentQueue, int prevDepth) {
    if (depth() > prevDepth) {
      System.out.println();
    }

    if (this.left != null)
      currentQueue.add(this.left);
    if (this.right != null)
      currentQueue.add(this.right);

    System.out.print(this.key + "-");

    Node nextNode = currentQueue.poll();

    if (nextNode != null) {
      nextNode.printRecursive(currentQueue, this.depth());
    }
  }
}
