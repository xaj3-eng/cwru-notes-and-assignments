public class LinkedTree {
  public Node root;

  public LinkedTree(Node root) {
    this.root = root;
  }

  public String search(int key) {
    Node n = searchTree(root, key);
    return (n == null ? null : n.data);
  }

  private Node searchTree(Node root, int key) {
    Node ptr = root;

    while (ptr != null) {
      if (key == ptr.key)
        return ptr;
      else if (key < ptr.key)
        ptr = ptr.left;
      else
        ptr = ptr.right;
    }

    return null;
  }

  public void insert(int key, String data) {
    Node ptr = root;

    while (ptr != null) {
      if (key < ptr.key) {
        if (ptr.left == null) {
          ptr.addLeft(new Node(key, data));
          break;
        }
        else
          ptr = ptr.left;
      } else {
        if (ptr.right == null)  {
          ptr.addRight(new Node(key, data));
          break;
        }
        else
          ptr = ptr.right;
      }
    }
  }

  public static void main(String[] args) {

    LinkedTree tree = new LinkedTree(new Node(26, "Root").addLeft(
        new Node(12, "Root.Left").addLeft(
            new Node(4, "Root.Left.Left").addRight(new Node(7, "Root.Left.Left.Right"))).addRight(
                new Node(18, "Root.Left.Right")))
        .addRight(
            new Node(32, "Root.Right").addRight(new Node(38, "Root.Right.Right"))));

    tree.root.print();

    System.out.println("Fix Rotation! It's Broken");

    tree.insert(35, "Root.Left.Left.Right?");

    tree.root.print();

  }
}
