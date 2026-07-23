import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ex27 {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>();

        names.add("Ravi");
        names.add("Anil");
        names.add("Kiran");
        names.add("Bhanu");

        Collections.sort(names, (a, b) -> a.compareTo(b));

        System.out.println("Sorted List:");
        names.forEach(System.out::println);
    }
}