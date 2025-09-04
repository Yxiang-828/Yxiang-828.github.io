public class Todo extends Task { // inherits from Task.java
    boolean isDone;

    boolean isDone() {
        return isDone;
    }

    Todo(String description) {
        super(description);
        isDone = false;
    }

    void setDone(boolean isDone) {
        this.isDone = isDone;
    }

    @Override
    public String toString() {
        return super.toString() + '\n' + "is done? " + (isDone ? "Yes" : "No");
    }
}
