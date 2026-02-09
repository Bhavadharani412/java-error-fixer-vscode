# 💻 Java Error Fixer - Usage Examples & Scenarios

## Real-World Error Scenarios

This guide shows common Java errors and how the extension helps fix them.

---

## 1️⃣ NullPointerException

### Problem Code
```java
public class UserManager {
    private User currentUser;
    
    public void printUserAge() {
        System.out.println(currentUser.getAge()); // ❌ ERROR
    }
}
```

### What Happens
- User hovers over `currentUser`
- Red squiggle appears
- **ERROR:** `NullPointerException`

### Extension Shows
```
Error: NullPointerException

Explanation:
You attempted to use an object reference that hasn't been assigned a value.

Suggested Fix:
Add a null check before using the object. Use if (obj != null) or Optional<T>.

Code Snippet:
if (currentUser != null) {
    System.out.println(currentUser.getAge());
}

Alternative (Modern Java 8+):
Optional.ofNullable(currentUser)
    .ifPresent(user -> System.out.println(user.getAge()));

📚 Learn More: https://docs.oracle.com/javase/tutorial/...
```

### Fixed Code
```java
public void printUserAge() {
    if (currentUser != null) {
        System.out.println(currentUser.getAge());
    }
}
```

---

## 2️⃣ ClassNotFoundException

### Problem Code
```java
public class DataLoader {
    public void loadDatabase() {
        try {
            Class<?> dbClass = Class.forName("com.mysql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
```

### What Happens
- IDE detects caught exception
- Hover shows context
- **ERROR:** `ClassNotFoundException`

### Extension Shows
```
Error: ClassNotFoundException

Explanation:
The JVM cannot find the specified class at runtime.

Suggested Fix:
Ensure the class is on the classpath. Check the class name spelling 
and package name.

Common Causes:
✗ Missing JAR files in classpath
✗ Incorrect fully qualified class names
✗ Typos in class names

Code Snippet:
try {
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver loaded successfully");
} catch (ClassNotFoundException e) {
    System.err.println("MySQL Driver not found!");
    e.printStackTrace();
}

📚 Learn More: https://docs.oracle.com/javase/8/docs/api/...
```

### Solution
Add MySQL JDBC driver to classpath:
```bash
# Maven
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.33</version>
</dependency>

# Gradle
implementation 'mysql:mysql-connector-java:8.0.33'
```

---

## 3️⃣ Cannot Find Symbol

### Problem Code
```java
public class Calculator {
    public void calculate() {
        int result = performAddition(5, 3); // ❌ ERROR - method doesn't exist
        System.out.println(result);
    }
    
    public int add(int a, int b) {
        return a + b;
    }
}
```

### What Happens
- Red squiggle under `performAddition`
- Method name typo detected
- **ERROR:** `cannot find symbol`

### Extension Shows
```
Error: Symbol Not Found

Explanation:
The compiler cannot find the referenced symbol (variable, method, or class).

Suggested Fix:
Check the spelling, ensure the class is imported, and verify it's in scope.

Similar Methods Found:
- add(int, int) → Did you mean this?

Code Snippet:
import package.name.*;

Checking Checklist:
☐ Is method spelled correctly?
☐ Is method in the correct class?
☐ Is the import statement present?
☐ Is the method public/accessible?

📚 Learn More: https://docs.oracle.com/javase/tutorial/java/package/...
```

### Fixed Code
```java
public void calculate() {
    int result = add(5, 3); // ✅ Corrected method name
    System.out.println(result);
}
```

---

## 4️⃣ Incompatible Types

### Problem Code
```java
public class DataConverter {
    public void convertData() {
        String number = 42;  // ❌ ERROR - int cannot be assigned to String
        double decimal = "3.14"; // ❌ ERROR - String cannot be assigned to double
    }
}
```

### What Happens
- Red squiggles appear on assignments
- Type mismatch detected
- **ERROR:** `incompatible types`

### Extension Shows
```
Error: Type Mismatch

Explanation:
You're trying to assign a value of incompatible type to a variable.

Suggested Fix:
Cast the value explicitly or change the variable type to match the assigned value.

Code Snippet (Option 1 - Change Variable Type):
int number = 42;

Code Snippet (Option 2 - Cast the Value):
String number = String.valueOf(42);
String number = Integer.toString(42);

Code Snippet (Option 3 - Use Object):
Object value = 42;

📚 Learn More: https://docs.oracle.com/javase/tutorial/java/data/index.html
```

### Fixed Code
```java
// Option 1: Correct types
String number = "42";
double decimal = 3.14;

// Option 2: Use conversion
String number = String.valueOf(42);
double decimal = Double.parseDouble("3.14");

// Option 3: Variable type casting
int numValue = 42;
String number = numValue + "";  // Auto-boxing + string concatenation
```

---

## 5️⃣ ArrayIndexOutOfBoundsException

### Problem Code
```java
public class ArrayProcessor {
    public void processArray() {
        int[] numbers = {1, 2, 3};
        
        for (int i = 0; i <= numbers.length; i++) {  // ❌ ERROR - i goes beyond bounds
            System.out.println(numbers[i]);
        }
    }
}
```

### What Happens
- Loop tries to access index 3 when max is 2
- Runtime error detected
- **ERROR:** `ArrayIndexOutOfBoundsException`

### Extension Shows
```
Error: ArrayIndexOutOfBoundsException

Explanation:
You're accessing an array element with an invalid index (out of bounds).

Suggested Fix:
Check array bounds before accessing. Use if (index >= 0 && index < array.length).

Common Mistake:
❌ for (int i = 0; i <= array.length; i++)  // Goes too far!
✅ for (int i = 0; i < array.length; i++)   // Correct!

Code Snippet:
if (index >= 0 && index < array.length) {
    element = array[index];
}

Or use Enhanced For Loop:
for (int element : numbers) {
    System.out.println(element);
}

📚 Learn More: https://docs.oracle.com/javase/8/docs/api/...
```

### Fixed Code
```java
// Option 1: Fix loop condition
for (int i = 0; i < numbers.length; i++) {  // Use < not <=
    System.out.println(numbers[i]);
}

// Option 2: Enhanced for loop (better practice)
for (int num : numbers) {
    System.out.println(num);
}

// Option 3: With boundary check
for (int i = 0; i < numbers.length; i++) {
    if (i >= 0 && i < numbers.length) {
        System.out.println(numbers[i]);
    }
}
```

---

## 6️⃣ NumberFormatException

### Problem Code
```java
public class AgeValidator {
    public int parseAge(String ageString) {
        int age = Integer.parseInt(ageString);  // ❌ ERROR - might not be numeric
        return age;
    }
    
    // Call with invalid input
    public void userInput() {
        int age = parseAge("abc");  // Throws exception!
    }
}
```

### What Happens
- String "abc" cannot be converted to integer
- **ERROR:** `NumberFormatException`

### Extension Shows
```
Error: NumberFormatException

Explanation:
You're trying to convert an invalid string to a number.

Suggested Fix:
Validate the string format before conversion. Use try-catch for robustness.

Safe Parsing Options:

Option 1 - Try-Catch:
try {
    int age = Integer.parseInt(userInput);
    System.out.println("Age: " + age);
} catch (NumberFormatException e) {
    System.out.println("Please enter a valid number");
}

Option 2 - Validation Check:
if (ageString.matches("\\d+")) {
    int age = Integer.parseInt(ageString);
}

Option 3 - Apache Commons Lang:
int age = NumberUtils.toInt(ageString, -1);

📚 Learn More: https://docs.oracle.com/javase/8/docs/api/...
```

### Fixed Code
```java
public int parseAge(String ageString) {
    try {
        int age = Integer.parseInt(ageString.trim());
        if (age >= 0 && age <= 150) {
            return age;
        } else {
            throw new IllegalArgumentException("Age must be between 0 and 150");
        }
    } catch (NumberFormatException e) {
        System.err.println("Invalid age format: " + ageString);
        return -1;  // Return sentinel value
    }
}
```

---

## 7️⃣ FileNotFoundException

### Problem Code
```java
public class FileReader {
    public void readFile() throws FileNotFoundException {
        FileInputStream fis = new FileInputStream("data.txt");
        // If file doesn't exist: FileNotFoundException ❌
    }
}
```

### What Happens
- File "data.txt" doesn't exist in expected location
- **ERROR:** `FileNotFoundException`

### Extension Shows
```
Error: FileNotFoundException

Explanation:
The specified file cannot be found in the expected location.

Suggested Fix:
Check if the file path is correct. Use absolute paths or verify relative paths.

Code Snippet (Check Before Reading):
File file = new File("path/to/file.txt");
if (file.exists()) {
    FileInputStream fis = new FileInputStream(file);
} else {
    System.out.println("File not found at: " + file.getAbsolutePath());
}

Code Snippet (Use Try-With-Resources):
try (FileInputStream fis = new FileInputStream("data.txt")) {
    // Read file
} catch (FileNotFoundException e) {
    System.err.println("File not found: " + e.getMessage());
}

📚 Learn More: https://docs.oracle.com/javase/8/docs/api/...
```

### Fixed Code
```java
public void readFile() {
    String filePath = "data.txt";
    File file = new File(filePath);
    
    if (!file.exists()) {
        System.out.println("File not found: " + file.getAbsolutePath());
        return;
    }
    
    try (FileInputStream fis = new FileInputStream(file);
         BufferedReader reader = new BufferedReader(new InputStreamReader(fis))) {
        String line;
        while ((line = reader.readLine()) != null) {
            System.out.println(line);
        }
    } catch (IOException e) {
        System.err.println("Error reading file: " + e.getMessage());
    }
}
```

---

## 8️⃣ Method Not Found / Wrong Signature

### Problem Code
```java
public class StringManipulator {
    public void demonstrateError() {
        String text = "Hello World";
        
        // Wrong method name
        text.toLowercase();  // ❌ Method doesn't exist (correct: toLowerCase)
        
        // Wrong parameters
        text.substring(5, 1, 10);  // ❌ substring takes 2 params, not 3
    }
}
```

### What Happens
- Method doesn't exist or has wrong parameters
- **ERROR:** `Method not found` or `method has wrong number of parameters`

### Extension Shows
```
Error: Method Not Found

Explanation:
The method you're calling doesn't exist on the object or has different parameters.

Available String Methods:
✓ toLowerCase()        - Convert to lowercase
✓ toUpperCase()        - Convert to uppercase
✓ length()             - Get string length
✓ substring(int, int)  - Get substring (2 parameters)

Suggested Fix:
Check the method name and parameter types. Check the class documentation.

Code Snippet (Corrected):
String text = "Hello World";
text.toLowerCase();           // ✓ Correct
text.substring(0, 5);         // ✓ Correct (returns "Hello")

📚 Learn More: https://docs.oracle.com/javase/tutorial/java/data/strings.html
```

### Fixed Code
```java
public void demonstrateCorrect() {
    String text = "Hello World";
    
    // Correct method names and parameters
    System.out.println(text.toLowerCase());        // "hello world"
    System.out.println(text.toUpperCase());        // "HELLO WORLD"
    System.out.println(text.length());             // 11
    System.out.println(text.substring(0, 5));      // "Hello"
}
```

---

## 9️⃣ Abstract Method Not Implemented

### Problem Code
```java
// Interface definition
public interface Animal {
    void makeSound();
    void eat();
}

// Incomplete implementation ❌ ERROR
public class Dog implements Animal {
    @Override
    public void makeSound() {
        System.out.println("Woof!");
    }
    // Missing: eat() method!
}
```

### What Happens
- Class implements interface but missing method
- **ERROR:** `is not abstract and does not override abstract method`

### Extension Shows
```
Error: AbstractMethodNotImplemented

Explanation:
Your class implements an interface or extends an abstract class but doesn't 
implement all required methods.

Missing Methods:
- eat()    [from Animal interface]

Suggested Fix:
Implement all abstract methods from the parent class or interface.

Code Snippet:
@Override
public void eat() {
    System.out.println("Dog is eating...");
}

All Required Methods:
☐ makeSound()
☐ eat()

📚 Learn More: https://docs.oracle.com/javase/tutorial/java/IandI/...
```

### Fixed Code
```java
public class Dog implements Animal {
    @Override
    public void makeSound() {
        System.out.println("Woof!");
    }
    
    @Override
    public void eat() {
        System.out.println("Dog is eating...");
    }
}
```

---

## 🔟 Syntax Error

### Problem Code
```java
public class SyntaxErrors {
    public void example() {
        int x = 5  // ❌ Missing semicolon
        System.out.println(x)
        
        if (x > 0) {
            System.out.println("positive");
        // ❌ Missing closing brace for method
}
```

### What Happens
- Syntax error detected
- **ERROR:** `reached end of file while parsing` or similar

### Extension Shows
```
Error: Syntax Error

Explanation:
There's a syntax error in your Java code (missing braces, semicolons, etc.).

Common Syntax Issues:
✗ Missing semicolons at end of statements
✗ Missing closing braces }
✗ Mismatched parentheses ()
✗ Incorrect operator usage

Checking Checklist:
☐ Every statement ends with semicolon?
☐ All opening braces { have closing braces }?
☐ All opening parentheses ( have closing )?
☐ All strings have matching quotes?

Code Snippet (Corrected):
int x = 5;                    // ✓ Semicolon added
System.out.println(x);        // ✓ Semicolon added

if (x > 0) {
    System.out.println("positive");
}                             // ✓ Closing brace added

📚 Learn More: https://docs.oracle.com/javase/tutorial/java/nutsandbolts/
```

### Fixed Code
```java
public class SyntaxCorrect {
    public void example() {
        int x = 5;  // ✓ Added semicolon
        System.out.println(x);  // ✓ Added semicolon
        
        if (x > 0) {
            System.out.println("positive");
        }  // ✓ Added closing brace
    }  // ✓ Method closing brace
}  // ✓ Class closing brace
```

---

## 🎯 Tips for Maximum Effectiveness

### 1. Read the Explanation
- Understand **why** the error occurred
- Learn the underlying concept
- Avoid similar mistakes

### 2. Review the Code Snippet
- Copy-paste ready code
- Adapt it to your situation
- Follow best practices

### 3. Check the Documentation
- Click documentation links
- Learn more about the API
- Explore related topics

### 4. Apply the Fix
- Make the suggested change
- Test your code
- Verify it works

---

## 📊 Error Resolution Statistics

Based on common usage patterns:

| Error Type | Frequency | Avg Fix Time | Difficulty |
|-----------|-----------|-------------|-----------|
| NullPointerException | 25% | 2-5 min | Medium |
| Symbol Not Found | 20% | 1-3 min | Easy |
| Type Mismatch | 15% | 3-5 min | Medium |
| Array Index OOB | 10% | 2-4 min | Easy |
| Method Not Found | 10% | 1-2 min | Easy |
| NumberFormat | 8% | 3-5 min | Medium |
| FileNotFound | 5% | 2-3 min | Easy |
| ClassNotFound | 4% | 5-10 min | Hard |
| Syntax Error | 2% | 1-2 min | Easy |
| Abstract Method | 1% | 5-10 min | Hard |

---

## 🚀 Getting Help Faster

1. **Hover immediately** - See the error type right away
2. **Read explanation** - Understand the root cause
3. **Copy snippet** - Get working code quickly
4. **Click docs** - Learn best practices
5. **Apply fix** - Resolve the issue
6. **Test thoroughly** - Verify the solution

---

**Happy debugging with Java Error Fixer! 🎉**

*Making Java errors easier to understand and fix, one hover at a time.*
