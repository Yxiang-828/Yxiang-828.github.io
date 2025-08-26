public class Main {
    public static class Circle {
        private int x;
        private int y;
        private double radius;

        public Circle() {
            this(0, 0, 0);
        }

        public Circle(int x, int y, double radius) {
            this.x = x;
            this.y = y;
            this.radius = radius;
        }

        public int getArea() {
            double area = Math.PI * Math.pow(radius, 2);
            return (int) area;
        }

        public int getX() {
            return x;
        }

        public int getY() {
            return y;
        }

        public double getRadius() {
            return radius < 0 ? radius = 0 : radius;
        }

        public void setX(int x) {
            this.x = x;
        }

        public void setY(int y) {
            this.y = y;
        }

        public void setRadius(double radius) {
            this.radius = radius < 0 ? 0 : radius;
        }
    }

    public static void main(String[] args) {
        Circle c = new Circle(1, 2, 5);

        c.setX(4);
        c.setY(5);
        c.setRadius(6);
        System.out.println("x      : " + c.getX());
        System.out.println("y      : " + c.getY());
        System.out.println("radius : " + c.getRadius());
        System.out.println("area   : " + c.getArea());

        c.setRadius(-5);
        System.out.println("radius : " + c.getRadius());
        c = new Circle(1, 1, -4);
        System.out.println("radius : " + c.getRadius());

    }
}