public class MathFunction {
  // Given Implementation
  public static int powerIterative(int x, int n) {
    int result = 1;

    for (int i = 0; i < n; i++) {
      result *= x;
    }

    return result;
  }

  // My Implementation
  public static int powerRecursive(int x, int n) {
    if (n < 0)
      return 0;
    if (n == 0)
      return 1;

    return x * powerRecursive(x, n - 1);
  }

  // Given Implementation
  public static int factorialIterative(int n) {
    int result = 1;

    for (int i = 1; i <= n; i++) {
      result *= i;
    }

    return result;
  }

  // My Implementation
  public static int factorialRecursive(int n) {
    if (n <= 1)
      return 1;

    return n * factorialRecursive(n - 1);
  }

  public static void main(String[] args) {
    System.out.println("\nProblem 3 Test:");

    System.out.println("powerRecursive(4,3): " + powerRecursive(4, 3));
    System.out.println("factorialRecursive(6): " + factorialRecursive(6));
  }
}
