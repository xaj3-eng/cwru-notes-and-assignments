public class TestStudent {
  public static void main(String[] args) {
    // Create a new student
    Student s = new Student("Xander Jhaveri", "xaj3");

    // Add three grades
    s.addGrade(93);
    s.addGrade(97);
    s.addGrade(88);

    // Prints average grade
    System.out.println("Average Grade: " + s.getAverageGrade());
  }
}
