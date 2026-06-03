public class ex7
 {
    public static void main(String[] args) {

        // Double to Int (Narrowing)
        double d = 45.67;
        int i = (int) d;

        System.out.println("Double value: " + d);
        System.out.println("After casting to int: " + i);

        // Int to Double (Widening)
        int num = 100;
        double dbl = (double) num;

        System.out.println("Integer value: " + num);
        System.out.println("After casting to double: " + dbl);
    }
}