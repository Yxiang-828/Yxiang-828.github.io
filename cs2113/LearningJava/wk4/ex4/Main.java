public class Main {

    // Add your method here
    public static void describe(String color, Priority priority) {
        switch (priority) {
            case HIGH:
                System.out.println(color + " indicates high priority");
                break;
            case MEDIUM:
                System.out.println(color + " indicates medium priority");
                break;
            case LOW:
                System.out.println(color + " indicates low priority");
                break;
        }
    }

    public static void main(String[] args) {
        describe("Red", Priority.HIGH);
        describe("Orange", Priority.MEDIUM);
        describe("Blue", Priority.MEDIUM);
        describe("Green", Priority.LOW);
    }
}
/*
 * Red indicates high priority
 * Orange indicates medium priority
 * Blue indicates medium priority
 * Green indicates low priority
 */