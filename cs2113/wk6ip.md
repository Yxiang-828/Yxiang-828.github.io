# 📚 **Complete Tutorial: From Level 6 to A-Jar - Understanding File I/O, JAR Files & Packaging**

## 🎯 **What Are Duke Levels?**

Duke is a **progressive coding project** where you build a task manager step-by-step:

- **Level 6**: Basic task manager with ToDo, Deadline, Event classes
- **Level 7**: Add **persistent storage** (save/load tasks to/from disk)
- **A-Jar**: Package the application into an **executable JAR file**

---

## 📁 **Level 6 → Level 7: Adding Persistent Storage (File I/O)**

### **What is File I/O?**
File I/O (Input/Output) means **reading from and writing to files** on disk. This allows your app to:
- ✅ **Save data** when the program closes
- ✅ **Load data** when the program starts
- ✅ **Persist data** between program runs

### **Step 1: Understanding the Data Format**

We designed a **text-based format** to store tasks:

```text
T | 0 | buy groceries          # ToDo: T=type, 0=not done, description
D | 1 | submit report | 2024   # Deadline: D=type, 1=done, desc, date
E | 0 | party | 6pm | 10pm     # Event: E=type, 0=not done, desc, start, end
```

### **Step 2: The `saveTasks()` Method**

```java
private static void saveTasks(ArrayList<Task> storage) {
    try {
        // 1. Create data directory if it doesn't exist
        File dataDir = new File("./data");
        if (!dataDir.exists()) {
            dataDir.mkdirs();  // Creates ./data/ folder
        }

        // 2. Create/open the file for writing
        File file = new File("./data/tasks.txt");
        try (PrintWriter writer = new PrintWriter(file)) {

            // 3. Write each task to file
            for (Task task : storage) {
                if (task instanceof ToDo) {
                    writer.println("T | " + (task.isDone ? 1 : 0) + " | " + task.description);
                } else if (task instanceof Deadline) {
                    Deadline d = (Deadline) task;
                    writer.println("D | " + (task.isDone ? 1 : 0) + " | " + task.description + " | " + d.by);
                } else if (task instanceof Event) {
                    Event e = (Event) task;
                    writer.println("E | " + (task.isDone ? 1 : 0) + " | " + task.description + " | " + e.from + " | " + e.to);
                }
            }
        }
    } catch (IOException e) {
        System.out.println("Error saving tasks: " + e.getMessage());
    }
}
```

**Key Concepts:**
- `PrintWriter`: Writes text to files
- `File.mkdirs()`: Creates directories
- **Relative paths**: `./data/tasks.txt` (relative to where you run the program)
- **Exception handling**: `try-catch` for file errors

### **Step 3: The `loadTasks()` Method**

```java
private static void loadTasks(ArrayList<Task> storage) {
    File file = new File("./data/tasks.txt");
    if (!file.exists()) {
        return; // No file to load from
    }

    try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(" \\| ");
            if (parts.length >= 3) {
                String type = parts[0];           // T, D, or E
                boolean done = parts[1].equals("1"); // 1=done, 0=not done
                String desc = parts[2];           // task description

                Task task = null;
                if (type.equals("T")) {
                    task = new ToDo(desc);
                } else if (type.equals("D") && parts.length >= 4) {
                    task = new Deadline(desc, parts[3]);
                } else if (type.equals("E") && parts.length >= 5) {
                    task = new Event(desc, parts[3], parts[4]);
                }

                if (task != null) {
                    if (done) task.mark();  // Mark as done if needed
                    storage.add(task);     // Add to our task list
                }
            }
        }
    } catch (IOException e) {
        System.out.println("Error loading tasks: " + e.getMessage());
    }
}
```

**Key Concepts:**
- `BufferedReader` & `FileReader`: Read text from files
- `split(" \\| ")`: Split on " | " (pipe with spaces)
- **Data validation**: Check if line has enough parts
- **Error recovery**: Skip corrupted lines

### **Step 4: Integrating Save/Load with Main Logic**

```java
public static void main(String[] args) {
    ArrayList<Task> storage = new ArrayList<>();

    // 🔄 LOAD tasks when program starts
    loadTasks(storage);

    // ... main program loop ...

    while (!userInput.trim().equals("bye")) {
        // ... handle commands ...

        if (command.equals("todo")) {
            Task newTask = new ToDo(description);
            storage.add(newTask);
            saveTasks(storage);  // 💾 SAVE after adding
        }

        if (command.equals("delete")) {
            Delete deleteCommand = new Delete(deleteTaskNumber);
            if (deleteCommand.execute(storage)) {
                saveTasks(storage);  // 💾 SAVE after deleting
            }
        }

        // ... etc for all commands that modify data ...
    }
}
```

**Key Points:**
- **Load once** at startup
- **Save after every change** (add, delete, mark/unmark)
- **Automatic persistence** - no manual save command needed

---

## 📦 **What is a JAR File?**

### **JAR = Java ARchive**

A JAR file is like a **ZIP file for Java** that contains:
- ✅ **Compiled .class files** (your Java bytecode)
- ✅ **Source .java files** (optional, for reference)
- ✅ **Resources** (images, config files, etc.)
- ✅ **Manifest file** (special instructions for Java)

### **Why JAR Files?**
- 📦 **Packaging**: Bundle everything into one file
- 🚀 **Distribution**: Easy to share and run
- 📱 **Portability**: Works on any system with Java
- 🔒 **Compression**: Smaller file size

### **Regular vs Executable JAR**

| Type               | What it contains   | How to run                     |
| ------------------ | ------------------ | ------------------------------ |
| **Regular JAR**    | Just classes       | `java -cp myapp.jar MainClass` |
| **Executable JAR** | Classes + Manifest | `java -jar myapp.jar`          |

---

## 📋 **What is `manifest.txt`?**

The **manifest file** is a special **configuration file** that tells Java how to run your JAR:

```text
Main-Class: starplatinum.task.StarPlatinum
```

### **Why Do We Need It?**

Without a manifest, Java doesn't know:
- ❓ **Which class** contains the `main()` method?
- ❓ **How to start** your application?

### **Manifest Rules:**
- 📝 **Must be named** `MANIFEST.MF` (uppercase)
- 📝 **Must end with** a blank line
- 📝 **Must use** Unix line endings (LF, not CRLF)
- 📝 **Contains** key-value pairs like `Main-Class: your.main.Class`

---

## 🛠️ **Step-by-Step: Creating an Executable JAR**

### **Step 1: Compile Your Code**
```bash
javac -d . src/main/java/starplatinum/task/*.java
```
- `javac`: Java compiler
- `-d .`: Output compiled classes to current directory
- `src/main/java/starplatinum/task/*.java`: Source files to compile

### **Step 2: Create Manifest File**
```bash
echo "Main-Class: starplatinum.task.StarPlatinum" > manifest.txt
echo "" >> manifest.txt  # Add blank line (IMPORTANT!)
```

### **Step 3: Create JAR File**
```bash
jar cfm StarPlatinum.jar manifest.txt -C src/main/java .
```

**Breaking down the command:**
- `jar`: Java archive tool
- `c`: Create new JAR
- `f`: Specify JAR filename
- `m`: Include manifest file
- `StarPlatinum.jar`: Output JAR name
- `manifest.txt`: Manifest file to include
- `-C src/main/java .`: Change to src/main/java and include all files

### **Step 4: Test Your JAR**
```bash
java -jar StarPlatinum.jar
```

---

## 🔧 **Key Technical Concepts We Used**

### **1. File I/O Classes**
```java
import java.io.*;

// Writing files
PrintWriter writer = new PrintWriter(file);

// Reading files
BufferedReader reader = new BufferedReader(new FileReader(file));

// File operations
File dataDir = new File("./data");
dataDir.mkdirs();  // Create directories
```

### **2. Exception Handling**
```java
try {
    // Code that might fail
    saveTasks(storage);
} catch (IOException e) {
    System.out.println("Error: " + e.getMessage());
}
```

### **3. Path Concepts**
- **Absolute path**: `C:\Users\xiang\autistic\data\tasks.txt`
- **Relative path**: `./data/tasks.txt` (relative to current directory)
- **Why relative?**: JAR works from any location

### **4. Data Serialization**
- **Serialization**: Converting objects to storable format
- **Our approach**: Custom text format (not binary)
- **Pros**: Human-readable, easy to debug
- **Cons**: Must parse manually

---

## 🎯 **Complete Workflow Summary**

```
Level 6: Basic Task Manager
    ↓ Add File I/O
Level 7: Persistent Storage (Save/Load)
    ↓ Package Application
A-Jar: Executable JAR File
```

### **What Happens When You Run the JAR:**
1. **Java reads** `MANIFEST.MF`
2. **Finds** `Main-Class: starplatinum.task.StarPlatinum`
3. **Loads** `StarPlatinum.class`
4. **Calls** `main()` method
5. **App runs** with full save/load functionality!

### **File Structure in JAR:**
```
StarPlatinum.jar/
├── META-INF/
│   └── MANIFEST.MF          # Contains Main-Class entry
├── starplatinum/
│   └── task/
│       ├── StarPlatinum.class
│       ├── Task.class
│       ├── ToDo.class
│       ├── Deadline.class
│       ├── Event.class
│       └── Delete.class
```

---

## 🚀 **Key Takeaways**

1. **File I/O** lets your app remember data between runs
2. **Save after every change** to keep data consistent
3. **JAR files** package your entire application
4. **Manifest tells Java** how to start your app
5. **Relative paths** make JARs portable
6. **Exception handling** prevents crashes from file errors

Your Duke task manager now has **professional-grade persistence** and can be **distributed as a single executable file**! 🎉

---

## 📝 **Additional Notes**

### **File I/O Imports Used:**
```java
import java.io.*;
```

This single import brings in all the necessary classes:
- `File` - File operations
- `PrintWriter` - Writing text files
- `BufferedReader` - Reading text files
- `FileReader` - File reading
- `IOException` - Exception handling

### **Why ArrayList Instead of Vector?**
- `ArrayList` is the modern, preferred collection
- `Vector` is legacy code (from Java 1.0)
- `ArrayList` is faster and more flexible
- Both work similarly for our use case

### **Data File Location:**
- **Relative path**: `./data/tasks.txt`
- **Created automatically** when first task is saved
- **Portable**: Works from any directory
- **Hidden from version control** (can be added to .gitignore)

### **Error Handling Strategy:**
- **Graceful degradation**: App continues if file operations fail
- **User feedback**: Clear error messages
- **Data integrity**: Skip corrupted lines instead of crashing
- **Recovery**: App works even without save file

---

*Created on: September 13, 2025*
*Duke Project: Level 6 → Level 7 → A-Jar Complete Tutorial*
