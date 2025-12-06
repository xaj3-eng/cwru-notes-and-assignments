public class StringNode {
  public char ch;
  public StringNode next;

  public StringNode(char ch) {
    this.ch = ch;
    this.next = null;
  }

  public String toString() {
    if (next == null) return "" + ch;

    return "" + ch + next;
  }
}
