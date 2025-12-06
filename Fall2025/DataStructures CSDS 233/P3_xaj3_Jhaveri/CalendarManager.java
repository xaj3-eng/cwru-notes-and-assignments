public class CalendarManager {

    private Node root;

    public CalendarManager() {
        root = null;
    }

    public boolean addEvent(int startTime, int endTime, String title) {
        System.out.println(
            "Inserting " + title + " from " + startTime + " to " + endTime + "."
        );

        // Create a new event from the input values
        Appointment event = new Appointment(startTime, endTime, title);

        if (root == null) {
            root = new Node(event);
            return true;
        }

        Node ptr = root;

        // Loop through all nodes in the BST
        while (ptr != null) {
            // If the event conflicts with the current node's event, return false because you can't insert
            if (ptr.event().conflictsWith(event)) return false;
            // If the input event is before the current node's event, check the left subtree
            else if (event.endTime() <= ptr.event().startTime()) {
                // If the new node is null, insert the event
                if (ptr.left() == null) {
                    ptr.setLeft(new Node(event));
                    return true;
                } else {
                    ptr = ptr.left();
                }
                // If the input event is after the current node's event, check the right subtree
            } else if (event.startTime() >= ptr.event().endTime()) {
                // If the new node is null, insert the event
                if (ptr.right() == null) {
                    ptr.setRight(new Node(event));
                    return true;
                } else {
                    ptr = ptr.right();
                }
            }
        }

        System.out.println(
            "addEvent reached a point that should be unreachable"
        );

        return false;
    }

    public boolean checkTimeSlotConflict(Appointment event) {
        Node ptr = root;

        // Loop through the BST, if the input event is before the current node's event, check the left subtree, otherwise check the right subtree
        while (ptr != null) {
            if (ptr.event().conflictsWith(event)) return false;
            else if (event.endTime() <= ptr.event().startTime()) ptr =
                ptr.left();
            else if (event.startTime() >= ptr.event().endTime()) ptr =
                ptr.right();
            else return false;
        }

        return true;
    }

    public Appointment eventTimeLookup(int time) {
        Node ptr = root;

        // Loop through all nodes in the BST
        while (ptr != null) {
            // If the input time is between the start and end times of the current node, then its event is the return value
            if (
                ptr.event().startTime() <= time && time <= ptr.event().endTime()
            ) return ptr.event();
            // If the input time is less than the start time, check the left subtree
            else if (ptr.event().startTime() >= time) ptr = ptr.left();
            // If the input time is greater than the end time, check the right subtree
            else if (ptr.event().endTime() <= time) ptr = ptr.right();
            else break;
        }

        return null;
    }

    public boolean deleteEvent(int startTime) {
        Node parent = null;
        Node ptr = root;

        // Simply does the binary search explained in the next function, eventExists
        // However instead of simply returning true, it calls the deleteFromBST function on the node that it finds
        // It also keeps track of the parent of the current node
        while (ptr != null) {
            if (ptr.event().startTime() == startTime) {
                root = ptr.deleteFromBST(root, parent);
                return true;
            } else if (startTime < ptr.event().startTime()) {
                parent = ptr;
                ptr = ptr.left();
            } else if (startTime > ptr.event().startTime()) {
                parent = ptr;
                ptr = ptr.right();
            } else {
                break;
            }
        }

        return false;
    }

    public boolean eventExists(int startTime) {
        Node ptr = root;

        // Binary search checking for the specific start time
        // If input equals current event start time, return true,
        // If less, check left subtree
        // If greater, check right subtree
        while (ptr != null) {
            if (ptr.event().startTime() == startTime) return true;
            else if (startTime < ptr.event().startTime()) ptr = ptr.left();
            else if (startTime > ptr.event().startTime()) ptr = ptr.right();
            else break;
        }

        return false;
    }

    // Simply calls a recusive method in the node class
    public int totalMeetingTime() {
        return root.sumMeetingTimeRecursive();
    }

    // Simply calls a recusive method in the node class
    public void inorderTrav() {
        root.inOrderPrint();
    }

    // Simply calls a recusive method in the node class
    public void preorderTrav() {
        root.preOrderPrint();
    }

    // Simply calls a recusive method in the node class
    public void postorderTrav() {
        root.postOrderPrint();
    }
}

class Node {

    private Appointment event;
    private Node left;
    private Node right;

    public Node(Appointment event) {
        this.event = event;
    }

    public Node(Appointment event, Node left, Node right) {
        this.event = event;
        this.left = left;
        this.right = right;
    }

    public Appointment event() {
        return event;
    }

    public int sumMeetingTimeRecursive() {
        // Calculates the minutes of this node's event, then adds it with the left minutes and right minutes if those nodes exist
        // (Left and right minutes calculated via recursive call)
        final int thisEventMinutes =
            60 * (event.endTime() / 100 - event.startTime() / 100) +
            (event.endTime() % 100) -
            (event.startTime() % 100);

        final int leftMinutes = left == null
            ? 0
            : left.sumMeetingTimeRecursive();
        final int rightMinutes = right == null
            ? 0
            : right.sumMeetingTimeRecursive();

        return thisEventMinutes + leftMinutes + rightMinutes;
    }

    // Recursively calls the function for the left child, then prints this node's event, then calls it for the right child
    public void inOrderPrint() {
        if (left != null) left.inOrderPrint();
        System.out.println(this.event());
        if (right != null) right.inOrderPrint();
    }

    // Prints this event, then calls the function for the left child, then the right
    public void preOrderPrint() {
        System.out.println(this.event());
        if (left != null) left.preOrderPrint();
        if (right != null) right.preOrderPrint();
    }

    // Calls the function for the left child, then the right, then prints this event
    public void postOrderPrint() {
        if (left != null) left.postOrderPrint();
        if (right != null) right.postOrderPrint();
        System.out.println(this.event());
    }

    // Deletion function:
    //   - This function handles the returning the root and changing the parent poiters
    //   - The helper function "deleteFromBSTInner" handles everything else
    // Root and parent must be passed in
    public Node deleteFromBST(Node root, Node parent) {
        // Case where you are deleting root: return the new node that should be pointed to
        if (parent == null) {
            assert this == root;
            return deleteSelf(root);
        }
        // Case where the node has a parent: replace the variable pointing to this with the result of deleteSelf
        else if (parent.left() == this) {
            parent.setLeft(deleteSelf(root));
        } else if (parent.right() == this) {
            parent.setRight(deleteSelf(root));
        } else {
            System.out.println("Tried to delete node with invalid parent node");
        }

        return root;
    }

    // Helper deletion function that returns the node to replace the deleted node
    // Does everything besides change parent pointers
    private Node deleteSelf(Node root) {
        // Two children case:
        if (left != null && right != null) {
            // Find in-order-successor and its parent
            Node iosParent = this;
            Node iosPtr = right;

            while (iosPtr.left() != null) {
                iosParent = iosPtr;
                iosPtr = iosPtr.left();
            }

            // Replace this event with the in-order-successor event, then delete the successor
            event = iosPtr.event();
            iosPtr.deleteFromBST(root, iosParent);

            // Return self because that's what the parent should point to
            return this;
        }
        // Left child only case:
        else if (left != null && right == null) {
            // Parent should point to this.left
            return left;
        }
        // Right child only case:
        else if (left == null && right != null) {
            // Parent should point to this.right
            return right;
        }
        // If no children, parent should point to nothing
        else return null;
    }

    public void setLeft(Node left) {
        this.left = left;
    }

    public void setRight(Node right) {
        this.right = right;
    }

    public Node left() {
        return left;
    }

    public Node right() {
        return right;
    }
}
