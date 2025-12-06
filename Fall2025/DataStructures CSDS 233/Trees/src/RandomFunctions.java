public class RandomTests {
  private void leftRotation(Node y) {
    y.right.parent = y.parent;
    y.parent.{child} = y.right;
    y.parent = y.right;

    Node temp = y.right.left;
    y.right.left = y;
    y.right = temp;
  }
}
