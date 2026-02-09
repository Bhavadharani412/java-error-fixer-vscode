# Java Error Database Documentation

This document describes the error database used by the Java Error Fixer extension.

## Error Database Structure

Each error in the database follows this structure:

```typescript
{
  errorType: {
    explanation: string;      // Why this error occurs
    solution: string;          // How to fix it
    codeSnippet: string;       // Template code with placeholders
    documentationUrl: string;  // Link to official docs
  }
}
```

## Supported Errors

### 1. NullPointerException
**Trigger Pattern:** `NullPointerException`

**Explanation:** You attempted to use an object reference that hasn't been assigned a value.

**Solution:** Add a null check before using the object. Use if (obj != null) or Optional<T>.

**Code Snippet:**
```java
if (${1:object} != null) {
    ${2:// your code}
}
```

**Common Causes:**
- Calling methods on null objects
- Accessing properties of null references
- No default initialization of objects

---

### 2. ClassNotFoundException
**Trigger Pattern:** `ClassNotFoundException`

**Explanation:** The JVM cannot find the specified class at runtime.

**Solution:** Ensure the class is on the classpath. Check the class name spelling and package name.

**Code Snippet:**
```java
Class.forName("${1:fully.qualified.ClassName}");
```

**Common Causes:**
- Missing JAR files in classpath
- Incorrect fully qualified class names
- Typos in class names

---

### 3. Symbol Not Found
**Trigger Pattern:** `cannot find symbol`

**Explanation:** The compiler cannot find the referenced symbol (variable, method, or class).

**Solution:** Check the spelling, ensure the class is imported, and verify it's in scope.

**Code Snippet:**
```java
import ${1:package.name}.*;
```

**Common Causes:**
- Missing import statements
- Typos in variable/method names
- Classes in different packages without import

---

### 4. Type Mismatch
**Trigger Pattern:** `incompatible types`

**Explanation:** You're trying to assign a value of incompatible type to a variable.

**Solution:** Cast the value explicitly or change the variable type to match the assigned value.

**Code Snippet:**
```java
${1:TargetType} var = (${1:TargetType}) ${2:sourceValue};
```

**Common Causes:**
- Assigning int to String without conversion
- Forgetting type casts
- Incompatible object types

---

### 5. ArrayIndexOutOfBoundsException
**Trigger Pattern:** `ArrayIndexOutOfBoundsException`

**Explanation:** You're accessing an array element with an invalid index (out of bounds).

**Solution:** Check array bounds before accessing. Use if (index >= 0 && index < array.length).

**Code Snippet:**
```java
if (${1:index} >= 0 && ${1:index} < ${2:array}.length) {
    ${3:// access element}
}
```

**Common Causes:**
- Off-by-one errors in loops
- Accessing negative indices
- Index >= array.length

---

### 6. FileNotFoundException
**Trigger Pattern:** `FileNotFoundException`

**Explanation:** The specified file cannot be found in the expected location.

**Solution:** Check if the file path is correct. Use absolute paths or verify relative paths.

**Code Snippet:**
```java
File file = new File("${1:path/to/file}");
```

**Common Causes:**
- Wrong file paths
- File doesn't exist
- Permission issues

---

### 7. NumberFormatException
**Trigger Pattern:** `NumberFormatException`

**Explanation:** You're trying to convert an invalid string to a number.

**Solution:** Validate the string format before conversion. Use try-catch for robustness.

**Code Snippet:**
```java
try {
    int num = Integer.parseInt("${1:numberString}");
} catch (NumberFormatException e) {
    ${2:// handle error}
}
```

**Common Causes:**
- Parsing non-numeric strings as numbers
- Whitespace in number strings
- Invalid number formats

---

### 8. StringIndexOutOfBoundsException
**Trigger Pattern:** `StringIndexOutOfBoundsException`

**Explanation:** Accessing a character position in a string that doesn't exist.

**Solution:** Verify the index is within string bounds before accessing.

**Code Snippet:**
```java
if (${1:index} >= 0 && ${1:index} < ${2:str}}.length()) {
    char c = ${2:str}}.charAt(${1:index});
}
```

---

### 9. Method Not Found
**Trigger Pattern:** `method .+ not found`

**Explanation:** The method you're calling doesn't exist on the object or has different parameters.

**Solution:** Verify the method name and parameter types. Check the class documentation.

**Code Snippet:**
```java
${1:object}}.${2:methodName}(${3:parameters});
```

---

### 10. Abstract Method Not Implemented
**Trigger Pattern:** `is not abstract and does not override abstract method`

**Explanation:** Your class implements an interface or extends an abstract class but doesn't implement all required methods.

**Solution:** Implement all abstract methods from the parent class or interface.

**Code Snippet:**
```java
@Override
public void ${1:methodName}() {
    ${2:// implementation}
}
```

---

### 11. Duplicate Class
**Trigger Pattern:** `duplicate class`

**Explanation:** You have two classes with the same name in the same package.

**Solution:** Rename one of the classes or move it to a different package.

**Code Snippet:**
```java
package ${1:com.example.subpackage};

public class ${2:UniqueClassName} {}
```

---

### 12. Syntax Error
**Trigger Pattern:** `reached end of file while parsing`

**Explanation:** There's a syntax error in your Java code (missing braces, semicolons, etc.).

**Solution:** Check for missing semicolons, braces, or other syntax issues.

**Code Snippet:**
```java
// Ensure all statements end with semicolon
statement${1:;}
```

## Adding New Errors

To add a new error type to the database:

1. **Edit** `javaDocProvider.ts`
2. **Add** a new entry to the `fixDatabase` object:

```typescript
'YourErrorType': {
    explanation: 'What causes this error...',
    solution: 'How to fix this error...',
    codeSnippet: 'Code template with ${1:placeholders}',
    documentationUrl: 'https://docs.oracle.com/...'
}
```

3. **Update** `errorAnalyzer.ts` to recognize the error pattern:

```typescript
{ pattern: /your error pattern/, type: 'YourErrorType', severity: 'high' }
```

4. **Recompile:**
```bash
npm run compile
```

## Severity Levels

- **High**: Runtime crashes or compilation failures (NullPointerException, ClassNotFoundException)
- **Medium**: Logical errors or wrong API usage (NumberFormatException, FileNotFound)
- **Low**: Minor issues or warnings (Unused variables, style issues)

## Documentation Links

All errors link to official Oracle Java documentation:
- Base: https://docs.oracle.com/javase/
- Exceptions: https://docs.oracle.com/javase/8/docs/api/
- Tutorials: https://docs.oracle.com/javase/tutorial/

---

**Last Updated:** 2024
**Maintained by:** Java Error Fixer Contributors
