import java.util.Arrays;
import java.util.Scanner;

public class Main {

    // You can add more methods here
    public static String[] filterAmounts(String sentence) {
        String[] words = sentence.split(" ");
        String[] result = new String[words.length];
        int k = 0;
        for (int i = 0; i < words.length; i++) {
            if (words[i].startsWith("$")) {
                result[k] = words[i];
                k++;
            }
        }
        return Arrays.copyOf(result, k);
    }

    public static void main(String[] args) {
        String line;
        Scanner in = new Scanner(System.in);

        System.out.print("Your expenses while overseas?");
        line = in.nextLine();
        String[] expenses = filterAmounts(line);
        System.out.println("Expenses in overseas currency:" + Arrays.toString(expenses));

        double total = 0.0;
        for (int i = 0; i < expenses.length; i++) {
            total += Double.parseDouble(expenses[i].substring(1)) * 1.70;
        }
        System.out.println("Total in local currency: $" + String.format("%.2f", total));
    }
}