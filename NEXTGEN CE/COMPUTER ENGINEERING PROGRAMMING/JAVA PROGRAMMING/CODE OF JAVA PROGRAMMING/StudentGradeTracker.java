/*:STUDENT GRADE TRACKER 
*● Build a Java program to input and manage student grades.
*● Calculate average, highest, and lowest scores.
*● Use arrays or ArrayLists to store and manage data.
*● Display a summary report of all students.
*● Make the interface console-based or GUI-based as desired.
*/
import java.util.ArrayList;
import java.util.Scanner;

// Student class
class Student {
    private String name;
    private double score;

    public Student(String name, double score) {
        this.name = name;
        this.score = score;
    }

    public String getName() {
        return name;
    }

    public double getScore() {
        return score;
    }
}

// Main class
public class StudentGradeTracker {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        ArrayList<Student> students = new ArrayList<>();

        System.out.print("Enter number of students: ");
        int n = scanner.nextInt();
        scanner.nextLine(); // clear buffer

        for (int i = 0; i < n; i++) {
            System.out.println("\nStudent " + (i + 1));

            System.out.print("Enter name: ");
            String name = scanner.nextLine();

            System.out.print("Enter score: ");
            double score = scanner.nextDouble();
            scanner.nextLine(); // clear buffer

            students.add(new Student(name, score));
        }

        // Initialize calculations
        double total = 0;
        double highest = students.get(0).getScore();
        double lowest = students.get(0).getScore();

        for (Student s : students) {
            double score = s.getScore();
            total += score;

            if (score > highest) {
                highest = score;
            }
            if (score < lowest) {
                lowest = score;
            }
        }

        double average = total / students.size();

        // Summary Report
        System.out.println("\n========= STUDENT GRADE REPORT =========");
        for (Student s : students) {
            System.out.println("Name: " + s.getName() + " | Score: " + s.getScore());
        }

        System.out.println("----------------------------------------");
        System.out.println("Average Score : " + average);
        System.out.println("Highest Score : " + highest);
        System.out.println("Lowest Score  : " + lowest);
        System.out.println("========================================");

        scanner.close();
    }
}