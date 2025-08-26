public class hello {
    public static void main(String[] args) {
        double score;
        switch (args[0]) {
            case "A+":
                score = 5.0;
                break;
            case "A":
                score = 5.0;
                break;
            case "A-":
                score = 4.5;
                break;
            case "B+":
                score = 4.0;
                break;
            case "B":
                score = 3.5;
                break;
            case "B-":
                score = 3.0;
                break;
            case "C":
                score = 2.5;
                break;
            default:
                score = 0.0;
                break;
        }
        System.out.println("CAP for grade " + args[0] + " is " + score);
    }
}