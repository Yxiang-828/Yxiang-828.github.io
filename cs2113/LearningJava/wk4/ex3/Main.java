public class Main {
    private static Shape[] shapes = new Shape[100];
    private static int count = 0;

    public static void addShape(Shape shape) {
        shapes[count] = shape;
        count++;
    }

    public static void printAreas() {
        for (int i = 0; i < count; i++) {
            System.out.println(shapes[i].area());
        }
    }

    public static void main(String[] args) {
        addShape(new Circle(5));
        addShape(new Rectangle(3, 4));
        addShape(new Circle(10));
        printAreas();
        addShape(new Rectangle(4, 4));
        printAreas();
    }
}

/*
78
12
314
78
12
314
16 */