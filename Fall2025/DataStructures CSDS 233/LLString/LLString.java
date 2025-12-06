public class LLString {
  StringNode head;
  int size;

  public LLString(StringNode head) {
    this.head = head;
    this.size = 1;

    StringNode ptr = this.head;

    while (ptr.next != null) {
      this.size++;
      ptr = ptr.next;
    }
  }

  public String toString() {
    String finalStr = "";

    LLString.Iterator iter = this.iter();
    while (iter.hasNext()) {
      finalStr += iter.next();
    }

    return finalStr;
  }

  public static StringNode copy(StringNode str) {
    if (str == null)
      return null;

    StringNode newNode = new StringNode(str.ch);
    newNode.next = copy(str.next);

    return newNode;
  }

  public static void main(String[] args) {
    StringNode head = new StringNode('a');
    head.next = new StringNode('b');
    head.next.next = new StringNode('c');

    LLString myStr = new LLString(head);

    System.out.println(myStr.toString());
  }

  public Iterator iter() {
    return new Iterator();
  }

  public class Iterator {
    private StringNode node;

    private Iterator() {
      node = head;
    }

    public boolean hasNext() {
      return node != null;
    }

    public char next() {
      char c = node.ch;
      node = node.next;
      return c;
    }
  }
}
