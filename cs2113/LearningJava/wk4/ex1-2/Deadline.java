public class Deadline extends Todo {
    String by;

    public String getBy() {
        return by;
    }

    public void setBy(String date) {
        this.by = date;
    }

    Deadline(String description, String by) {
        super(description);
        this.by = by;
    }

    @Override
    public String toString() {
        return super.toString() + '\n' + "do by: " + this.by;
    }
}
