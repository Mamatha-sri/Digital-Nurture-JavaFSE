import java.lang.reflect.Method;

public class ex39 {

    public void show() {
        System.out.println("Method Invoked");
    }

    public static void main(String[] args) {

        try {
           Class<?> c = Class.forName("ex39");

            Object obj = c.getDeclaredConstructor().newInstance();

            Method[] methods = c.getDeclaredMethods();

            for (Method m : methods) {
                System.out.println("Method: " + m.getName());
            }

            Method method = c.getMethod("show");
            method.invoke(obj);

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}