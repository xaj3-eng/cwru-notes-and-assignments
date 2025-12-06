public class Test {
  public static void main(String[] args) {
    print57Result(
        (int x, int y) -> ("(" + x + "," + y + ")")
        );
  }

  static void print57Result(TwoIntToString f) {
    System.out.println(
        f.apply(5,7)
    );
  }
}

