# Week 6 Java Concepts - Clean Study Guide

## 1. Java Generics

**What's the problem?**
Without generics, you'd need separate classes for each data type:
- `BoxForIntegers` to store integers
- `BoxForString` to store strings
- etc.

**The solution: Generics**
Use type parameters (like templates in C++) to write one class that works with any type.

```java
// Instead of multiple classes, one generic class:
public class Box<T> {
    private T item;

    public void set(T item) {
        this.item = item;
    }

    public T get() {
        return item;
    }
}

// Usage:
Box<Integer> intBox = new Box<>();
Box<String> stringBox = new Box<>();
```

**Key points:**
- `<T>` is a type parameter (you can use any letter)
- Common conventions: `T` (Type), `E` (Element), `K` (Key), `V` (Value)
- Catches type errors at compile time, not runtime

---

## 2. Collections Framework

Think of collections as smart containers for storing multiple objects.

### ArrayList - Dynamic Array
```java
import java.util.ArrayList;

ArrayList<String> items = new ArrayList<>();
items.add("Apple");           // Add item
items.add(1, "Banana");      // Add at specific index
items.remove("Apple");        // Remove item
items.get(0);                // Get item at index
items.size();                // Get number of items
items.contains("Apple");      // Check if contains item
```

### HashMap - Key-Value Pairs
```java
import java.util.HashMap;

HashMap<String, Integer> scores = new HashMap<>();
scores.put("Alice", 95);      // Add key-value pair
scores.put("Bob", 87);
scores.get("Alice");          // Returns 95
scores.containsKey("Alice");  // Check if key exists
scores.size();                // Number of pairs
```

---

## 3. File Operations

### Reading Files
```java
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

try {
    File file = new File("data/myfile.txt");
    Scanner scanner = new Scanner(file);

    while (scanner.hasNextLine()) {
        String line = scanner.nextLine();
        System.out.println(line);
    }
    scanner.close();
} catch (FileNotFoundException e) {
    System.out.println("File not found!");
}
```

### Writing Files
```java
import java.io.FileWriter;
import java.io.IOException;

try {
    FileWriter writer = new FileWriter("output.txt");
    writer.write("Hello World\n");
    writer.write("Second line\n");
    writer.close();  // Important: Always close!
} catch (IOException e) {
    System.out.println("Error writing file!");
}
```

### Appending to Files
```java
FileWriter writer = new FileWriter("output.txt", true); // true = append mode
```

---

## 4. JAR Files

JAR = Java Archive. Think of it as a zip file containing your compiled Java program.

**Running a JAR:**
```bash
java -jar myprogram.jar
```

Your IDE can package your project into a JAR file automatically.

---

## 5. Requirements Engineering

### Types of Requirements

**Functional Requirements**: What the system should do
- "Users can create accounts"
- "System can process payments"

**Non-Functional Requirements**: Constraints and quality attributes
- Performance: "Response time under 2 seconds"
- Security: "Data must be encrypted"
- Usability: "Novice users can complete tasks in 5 minutes"

### Gathering Requirements

**Techniques:**
- **Brainstorming**: Generate lots of ideas without judgment
- **Interviews**: Talk directly with users/stakeholders
- **Surveys**: Collect opinions from many people
- **Observation**: Watch users in their natural environment
- **Prototyping**: Build mockups to get feedback

### Specifying Requirements

**User Stories Format:**
```
As a [user type], I can [action] so that [benefit]
```

Examples:
- "As a student, I can download lecture files so that I can study offline"
- "As a teacher, I can create quizzes so that I can assess student understanding"

**Other formats:**
- Prose (text descriptions)
- Use cases (detailed interaction scenarios)
- Feature lists
- Glossaries (define important terms)

---

## 6. IDE Debugging

**Instead of adding print statements everywhere**, use your IDE's debugger:

1. Set **breakpoints** by clicking in the margin next to line numbers
2. Run in **debug mode**
3. When code hits a breakpoint, execution pauses
4. You can:
   - Examine variable values
   - Step through code line by line
   - Step into/over method calls

---

## 7. Git Merge Conflicts

**When do they happen?** When you and someone else modify the same part of a file differently.

**How to resolve:**
1. Git marks conflicts in files like this:
```
<<<<<<< HEAD
Your version
=======
Their version
>>>>>>> branch-name
```

2. Edit the file to keep what you want:
```
Combined version that makes sense
```

3. Remove the conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)
4. Stage and commit the resolved file

---

## 8. Code Quality - Avoid These Mistakes

### Always include default cases
```java
// Bad
if (color.equals("red")) {
    System.out.println("Red");
} else {
    System.out.println("Blue"); // What if it's green?
}

// Good
if (color.equals("red")) {
    System.out.println("Red");
} else if (color.equals("blue")) {
    System.out.println("Blue");
} else {
    System.out.println("Unknown color");
}
```

### Don't reuse variables for different purposes
```java
// Bad
double area(double length, double width) {
    length = length * width; // Confusing!
    return length;
}

// Good
double area(double length, double width) {
    double result = length * width;
    return result;
}
```

### Delete unused code
Don't keep "just in case" code. If you need it later, get it from version control.

---

## Quick Practice Tips

1. **Start small**: Try each concept with simple examples first
2. **Type the code**: Don't just read - actually write and run the examples
3. **Break it intentionally**: Make mistakes to see what error messages look like
4. **Use your IDE's features**: Auto-completion, debugging, error highlighting

The key is understanding these concepts step by step, not memorizing the entire document at once.