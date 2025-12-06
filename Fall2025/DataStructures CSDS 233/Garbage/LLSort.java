import java.awt.List;

public class LLSort {
    private class ListNode {
        ListNode next;
        int val;

        public ListNode(int val) {
            this.val = val;
            this.next = null;
        }

        public ListNode(int val, ListNode next) {
            this.val = val;
            this.next = next;
        }
    }

    private static ListNode insertionSort(ListNode head) {
        return LLInsSortInner(head.next, head);
    }

    private static ListNode LLInsSortInner(ListNode node, ListNode parent) {
        if (node == null) return parent;
        System.out.println(node.val);
        if (parent.val > node.val) {
            parent.next = node.next;
            node.next = LLInsSortInner(parent.next, parent);

            return node;
        }

        ListNode temp = parent.next;
        parent.next = LLInsSortInner(node.next, node);
        if (temp != parent.next) {
            return LLInsSortInner(parent.next, parent);
        }
        return parent;
    }

    private ListNode getList() {
        return new ListNode(7,
                new ListNode(14,
                    new ListNode(3,
                        new ListNode(19,
                            new ListNode(11,
                                new ListNode(4,
                                    new ListNode(17,
                                        new ListNode(8,
                                            new ListNode(20,
                                                new ListNode(2, null)
                                            )))))))));

    }

    public static void main(String[] args) {
        LLSort x = new LLSort();
        ListNode head = x.getList();

        ListNode ptr1 = head;
        while (ptr1 != null) {
            //System.out.println(ptr1.val);
            ptr1 = ptr1.next;
        }

        System.out.println("\n\n");

        ListNode ptr2 = insertionSort(head);
        while (ptr2 != null) {
            //System.out.println(ptr2.val);
            ptr2 = ptr2.next;
        }
    }
}
