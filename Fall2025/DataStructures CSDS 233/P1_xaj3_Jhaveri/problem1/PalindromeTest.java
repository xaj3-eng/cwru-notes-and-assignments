public class PalindromeTest {
  // Time Complexity: O(n)
  public static boolean palindromeIterative(String input) {
    // Convert the input to all uppercase
    final String upperInput = input.toUpperCase();

    // Define variables to represent the indices of the left and right characters
    int left = 0;
    int right = upperInput.length() - 1;

    // Loop while the left index is left than the right
    // If the loop is run to completion, the input is a palindrome
    while (left < right) {
      // If the characters at the left and right indices aren't equal, the input isn't
      // a palindrome
      if (upperInput.charAt(left) != upperInput.charAt(right)) {
        return false;
      }

      // Shift the left and right variables to represent the innermore indices
      left++;
      right--;
    }

    return true;
  }

  // Time Complexity: O(n)
  public static boolean palindromeRecursive(String input) {
    final int len = input.length();

    // Base Case: If the length of the input is 0 or 1, the string is a palindrome
    if (len <= 1)
      return true;

    // If the first character as uppercase is different than the last as uppercase,
    // then return false (via short-circuiting)
    // Otherwise return the recursive call to the palindrome test without the first
    // and last characters of the input
    return Character.toUpperCase(input.charAt(0)) == Character.toUpperCase(input.charAt(len - 1)) &&
        palindromeRecursive(input.substring(1, len - 1));
  }

  public static void main(String[] args) {
    System.out.println("\nProblem 1:");

    // Both methods have the same time complexity of O(n), however the iterative
    // version will use less storage
    System.out.println("\"Racecar\" is a Palindrome: " + palindromeIterative("Racecar"));
    System.out.println(
        "\"Car that is used for Racing\" is a Palindrome: " + palindromeIterative("Car that is used for Racing"));
  }
}
