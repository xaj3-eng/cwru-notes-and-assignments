public class TreeTest {
  /*
   * Trees are made up of a set of nodes.
   * Nodes are connected by edges.
   *
   * The top node in a tree is called the "root node"
   *
   * There can be NO CYCLES in Trees
   * This means that there is only 1 unique path to every node in a tree
   *
   * Relationships between nodes:
   * - parent/child relationship
   * - Nodes can only have 1 PARENT because no cycles
   * - Only root has no parent
   * - "siblings" are nodes that share a parent
   *
   * A "leaf node" is a node with no children. Meaning it is the end of a branch
   * An "interior node" is not a leaf or a root
   *
   * "Binary Tree" is different than "Binary Search Tree"
   * - Binary Trees can have a max. of 2 children
   * - (Yes it can have 1 child, meaning a left and not a right or vice versa)
   *
   * __Path, Depth/Level, and Height__
   * The depth/level of a node is the number of edges between a node and the root
   * - Starts from depth/level 0 and works upwards
   *
   * The height of a tree is the maximum depth of a tree
   *
   * __Traversal__
   * Preorder Traversal:
   * - Start with the root, process it
   * - Every process, you first process the node itself, then left, then right
   *
   * Postorder Traversal:
   * - Kind of start with the root, by processing left, right, then the node
   * itself
   *
   * Inorder Traversal:
   * - Process in order: left, root, right.
   * - If a binary tree is sorted by left and right, it will print everything in
   * order
   *
   * Level-Order traversal (breadth-first):
   * - Process top to bottom (left to right is secondary)
   * -
   */

  public static void main(String[] args) {
    TreeNode<Integer> root = new TreeNode<>(7,
        new TreeNode<>(5,
            new TreeNode<>(2, null,
                new TreeNode<>(4)),
            new TreeNode<>(6)),
        new TreeNode<>(9,
            new TreeNode<>(8), null));

    root.dfsPrint();
  }

  public class TreeNode<T> {
    public T val;
    public TreeNode<T> left;
    public TreeNode<T> right;

    public TreeNode(T val) {
      this.val = val;
    }

    public TreeNode(T val, TreeNode<T> left, TreeNode<T> right) {
      this.val = val;
      this.left = left;
      this.right = right;
    }

    public void dfsPrint() {
      System.out.print(val + " ");

      if (left != null)
        left.dfsPrint();
      if (right != null)
        right.dfsPrint();
    }
  }
}
