import java.util.ArrayList;

public class Student {
  private String name;
  private String studentId;
  private ArrayList<Integer> grades;

  public Student(String name, String studentId) {
    this.name = name;
    this.studentId = studentId;
    this.grades = new ArrayList<Integer>();
  }

  public void addGrade(int grade) {
    grades.add(grade);
  }

  public double getAverageGrade() {
    int sum = 0;

    for (int grade : grades) {
      sum += grade;
    }

    return (double) sum / grades.size();
  }
}
