public class Main {

    public static void printArea(String descriptor) {
        try {
            System.out.println(descriptor + "=" + calculateArea(descriptor));
        } catch (NumberFormatException e) {
            System.out.println("WIDTH or HEIGHT is not a number: " + descriptor);
        } catch (IndexOutOfBoundsException e) {
            System.out.println("WIDTH or HEIGHT is missing: " + descriptor);
        } catch (IllegalShapeException e) {
            System.out.println("Too many dimensions: " + descriptor);
        }
    }

    private static int calculateArea(String descriptor) throws IllegalShapeException {
        String[] dimensions = descriptor.split("x");
        if (dimensions.length > 2) {
            throw new IllegalShapeException();
        }
        return Integer.parseInt(dimensions[0]) * Integer.parseInt(dimensions[1]);
    }

    public static void main(String[] args) {
        printArea("3x4");
        printArea("5x5");
        printArea("3xy");
        printArea("4");
        printArea("2x3x4");
    }
}