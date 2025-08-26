public class hello1 {

    static double getGradeCap(String grade){
        double score;
        switch (grade) {
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
        return score;
    }
    public static void main(String[] args) {
        System.out.println("A+: " + getGradeCap("A+"));
        System.out.println("B: " + getGradeCap("B"));
    }
}