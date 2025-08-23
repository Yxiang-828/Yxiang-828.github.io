class Main {
  public static void main(String[] args) {
    // add code here
    String x = args[0];
    String y = args[1];
    boolean isSame = x.equals(y);
    System.out.println("Words given: " + x + ", " + y);
    System.out.println("They are the same: " + isSame);
  }
}
