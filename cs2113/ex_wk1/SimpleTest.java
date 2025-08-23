import java.io.*;

public class SimpleTest {
    public static void main(String[] args) {
        System.out.println("=== Testing Main class ===\n");

        // Test cases
        runTest("hello", "hello", true);
        runTest("hello", "world", false);
        runTest("Java", "java", false);
        runTest("", "", true);

        System.out.println("=== All tests completed ===");
    }

    private static void runTest(String arg1, String arg2, boolean expectedSame) {
        System.out.println("Test: '" + arg1 + "' vs '" + arg2 + "'");

        // Capture output
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        PrintStream originalOut = System.out;
        System.setOut(new PrintStream(outputStream));

        try {
            // Run the Main class
            Main.main(new String[] { arg1, arg2 });
        } catch (Exception e) {
            System.setOut(originalOut);
            System.out.println("ERROR: " + e.getMessage());
            return;
        }

        // Restore output and get captured result
        System.setOut(originalOut);
        String output = outputStream.toString().trim();

        // Check results
        boolean actualSame = output.contains("They are the same: " + expectedSame);
        String status = actualSame ? "PASS" : "FAIL";

        System.out.println("Expected same: " + expectedSame);
        System.out.println("Output: " + output.replace("\n", " | "));
        System.out.println("Status: " + status);
        System.out.println("---");
    }
}
