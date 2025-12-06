import java.util.LinkedList;
import java.util.Queue;

public class QStack {
  // Create two Queue Fields
  private Queue<String> queue1;
  private Queue<String> queue2;
  // This won't act as a third queue but rather as a pointer to one of the first two
  private Queue<String> currentQueue;

  // Contstrctor that initializes queues 1 & 2 as linkedLists and sets the current queue to queue1
  public QStack() {
    queue1 = new LinkedList<>();
    queue2 = new LinkedList<>();
    
    currentQueue = queue1;
  }
  
  // The push operation simply adds the input to the current queue
  public void push(String input) {
    currentQueue.add(input);
  }
  
  // The pop operation loops through the entire queue, moving each element to the other queue unless there is only one element left
  // If there is only one element left, then it was the last item added, so you don't move it to the other queue and return it instead
  public String pop() {
    if (currentQueue.isEmpty()) return null;

    Queue<String> lastQueue = swapCurrentQueue();

    while (lastQueue.size() > 1) {
      currentQueue.add(lastQueue.poll());
    }    
    
    return lastQueue.poll();
  }
  
  // This wasn't necessary but I found it useful
  public boolean isEmpty() {
    return currentQueue.isEmpty();
  }

  // Private method that swaps the current queue pointer between queues 1 and 2
  // It also returns the previous queue so I can use it if necessary
  private Queue<String> swapCurrentQueue() {
    if (currentQueue == queue1) {
      currentQueue = queue2;
      return queue1;
    } else if (currentQueue == queue2) {
      currentQueue = queue1;
      return queue2;
    }
    return null;
  }

  // This method creates a new stack and adds all of the elements of the string array to it
  // It then calls the recursive method below (further explanation there)
  public static int evaluate(String[] postfix) {
    QStack evalStack = new QStack();
    
    for (String s : postfix) evalStack.push(s);

    return evaluateOperation(evalStack, evalStack.pop());
  }
  
  /* This recursive method takes a stack and an operation as a string.
  Without complications, it will simply return the result of the operation on the previous two numbers.
  The method is recursive because if an string is popped off of the stack and it's another operation instead of an integer,
  then it calls this method recursively on the same stack for that operation and uses the result instead of the integer
  If the provided list of strings is a valid postfix expression, the recursion will continue until there are no
  Strings left in the stack. If it is invalid, then you will get a random number because 0 is returned in the middle,
  or an exception will be thrown. */
  private static int evaluateOperation(QStack evalStack, String operation) {
    int num1;
    int num2;
    
    String nextItem = evalStack.pop();
    if (isOperation(nextItem)) num2 = evaluateOperation(evalStack, nextItem);
    else num2 = Integer.parseInt(nextItem);

    nextItem = evalStack.pop();
    if (isOperation(nextItem)) num1 = evaluateOperation(evalStack, nextItem);
    else num1 = Integer.parseInt(nextItem);

    if (operation.equals("+")) return num1 + num2;
    else if (operation.equals("-")) return num1 - num2;
    else if (operation.equals("*")) return num1 * num2;
    else if (operation.equals("/")) return num1 / num2;
    return 0;
  }
  
  // Helper method to determine if a string is an operation. I definitely could've used try-catch blocks
  // with parse int, but I didn't
  private static boolean isOperation(String s) {
    return s.equals("+") || s.equals("-") || s.equals("*") || s.equals("/");
  }
  
  public static void main(String[] args) {
    QStack myStack = new QStack();

    myStack.push("Hello");
    myStack.push("World!");
      
    // Should print "World"
    System.out.println(myStack.pop());
    
    myStack.push("Yay!");
    myStack.push("Yay!");

    // Should print "Yay!\nYay!"
    System.out.println(myStack.pop());
    System.out.println(myStack.pop());
    
    System.out.println();

    String[] postfix1 = {"3", "6", "7", "+", "-"};
    // Should print -10
    System.out.println(evaluate(postfix1));
    String[] postfix2 = {"5","2","1","+", "*", "7", "/"};
    // Should print 2
    System.out.println(evaluate(postfix2));
  }
}
