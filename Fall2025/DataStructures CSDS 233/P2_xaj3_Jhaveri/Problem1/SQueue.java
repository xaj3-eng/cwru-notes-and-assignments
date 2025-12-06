import java.util.Stack;

public class SQueue {
  // Two Stacks, one for adding to the queue, one for removing from the queue
  // When you call add, you pop items off of the remove stack one by one and push them to the add stack one by one.
  // After that, you actually push the input to the add stack
  //
  // The opposite is done for removing: remove everything from add stack and add to remove stack
  // After this is done, you can pop from the remove stack
  private Stack<Integer> addStack;
  private Stack<Integer> remStack;

  // No argument constructor; simply initializes two stacks
  public SQueue() {
    addStack = new Stack<>();
    this.remStack = new Stack<>();
  }

  // Constructor that takes an array of integers as a parameter
  // Initializes the two stacks and calls 'add' for every element in the array
  public SQueue(int[] queued) {
    addStack = new Stack<>();
    remStack = new Stack<>();

    for (int num : queued) add(num);
  }

  // Moves everything to the 'add stack', then pushes the input to the add stack
  public void add(int input) {
    moveToAddStack();
    addStack.push(input);
  }

  // Moves everything to the 'remove stack', then returns the popped element if there is one
  public Integer poll() {
    moveToRemStack();
    return !remStack.isEmpty() ? remStack.pop() : null;
  }

  // Same as poll, but utilizes 'peek' instead of 'pop' so the element isn't removed from the remove stack
  public Integer peek() {
    moveToRemStack();
    return !remStack.isEmpty() ? remStack.peek() : null;
  }

  public static void main(String[] args) {
    int[] arr = {2,6,3,8};
    SQueue EXQueue = new SQueue(arr);

    System.out.println(EXQueue.poll());
    System.out.println(EXQueue.poll());

    EXQueue.add(5);
    EXQueue.add(9);

    System.out.println(EXQueue.poll());
    System.out.println(EXQueue.poll());

    // Should print "2", "6", "3", "8"
  }

  // Private method that pops elements from the rem stack and pushes them onto the add stack one by one
  private void moveToAddStack() {
    while (!remStack.isEmpty()) addStack.push(remStack.pop());
  }

  // Private method that pops elements from the add stack and pushes them onto the rem stack one by one
  private void moveToRemStack() {
    while (!addStack.isEmpty()) remStack.push(addStack.pop());
  }
}
