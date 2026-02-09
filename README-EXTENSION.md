# Java Error Fixer - VS Code Extension

An intelligent VS Code extension that reads Java documentation and suggests fixes for compilation and runtime errors.

## 🎯 Features

- **Hover-based Error Suggestions**: Hover over Java error squiggles to see detailed explanations and fixes
- **Documentation Integration**: Provides links to official Java documentation for deeper learning
- **Common Error Database**: Supports 11+ common Java errors with expert solutions
- **Quick Fix Snippets**: Copy-paste ready code snippets to fix errors
- **Real-time Error Analysis**: Analyzes error messages and provides contextual help

## 📋 Supported Error Types

1. **NullPointerException** - Handle null object references safely
2. **ClassNotFoundException** - Resolve missing classes and import issues
3. **Symbol Not Found** - Fix undefined variables, methods, and classes
4. **Type Mismatch** - Resolve type casting and assignment issues
5. **ArrayIndexOutOfBoundsException** - Prevent invalid array access
6. **FileNotFoundException** - Correct file paths and verify file existence
7. **NumberFormatException** - Validate string-to-number conversions
8. **StringIndexOutOfBoundsException** - Handle string indexing safely
9. **MethodNotFound** - Resolve missing method calls
10. **AbstractMethodNotImplemented** - Implement required interface methods
11. **DuplicateClass** - Resolve naming conflicts
12. **SyntaxError** - Fix parsing issues

## 🚀 Installation

### From Source
1. Clone this repository
2. Install dependencies: `npm install`
3. Compile: `npm run compile`
4. Copy to VS Code extensions folder:
   - **Windows**: `%USERPROFILE%\.vscode\extensions\java-error-fixer`
   - **Mac**: `~/.vscode/extensions/java-error-fixer`
   - **Linux**: `~/.vscode/extensions/java-error-fixer`
5. Reload VS Code

### From Marketplace
(Coming soon)

## 📖 How to Use

1. **Write Java Code**: Create or open a Java file in VS Code
2. **Trigger Errors**: Write code that causes compilation errors (IDE will show red squiggles)
3. **Hover for Help**: Move your cursor over the error and hover
4. **Read Suggestion**: The extension shows:
   - Error type and explanation
   - Suggested fix with code snippet
   - Link to official Java documentation
5. **Apply Fix**: Use the suggested code or click the documentation link for more details

## 📁 Project Structure

```
java-error-fixer/
├── src/
│   ├── extension.ts           # Main extension entry point
│   ├── errorAnalyzer.ts       # Error pattern recognition
│   └── javaDocProvider.ts     # Documentation and fix database
├── dist/                       # Compiled JavaScript (generated)
├── package.json               # NPM configuration
├── tsconfig.json              # TypeScript configuration
└── README.md                  # This file
```

## 🛠️ Development

### Build
```bash
npm run compile          # Compile TypeScript to JavaScript
npm run vscode:prepublish  # Prepare for publishing
```

### Watch Mode
```bash
npm run watch           # Compile on every file change
```

### Linting
```bash
npm run lint            # Check code style with ESLint
```

## 🔧 Architecture

### ErrorAnalyzer
- Parses Java error messages
- Matches against regex patterns
- Extracts error type and details
- Returns structured error information

### JavaDocProvider
- Maintains database of common Java errors
- Maps error types to solutions and explanations
- Provides links to official Oracle documentation
- Suggests code snippets for each error type

### Extension
- Registers hover provider for Java files
- Integrates with VS Code diagnostics
- Renders Markdown hover text with suggestions
- Handles command execution for quick fixes

## 🎓 Example Usage

```java
String value = null;
System.out.println(value.length());  // ❌ NullPointerException

// Hover over the error to see:
// Error: NullPointerException
// Explanation: You attempted to use an object reference that hasn't been assigned a value.
// Suggested Fix: Add a null check before using the object. Use if (obj != null) or Optional<T>.
// [Learn More](https://docs.oracle.com/...)
```

## 🔗 Configuration

Add these settings to your VS Code `settings.json`:

```json
{
  "javaErrorFixer.enableHoverFix": true
}
```

## 📚 Additional Resources

- [Java Documentation](https://docs.oracle.com/javase/)
- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [VS Code Extension API](https://code.visualstudio.com/api)

## 🤝 Contributing

Contributions welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Commit changes with clear messages
4. Submit a pull request

## 📝 License

MIT License - Feel free to use and modify

## 🐛 Known Issues

- Currently supports Java language only
- Error database covers most common errors (expandable)
- Requires VS Code 1.75.0 or later

## 🔮 Roadmap

- [ ] Support for Python errors
- [ ] Support for JavaScript/TypeScript errors
- [ ] Quick fix code generation
- [ ] Integration with Stack Overflow for additional solutions
- [ ] Error frequency analytics
- [ ] Custom error database configuration

## ❓ FAQ

**Q: Does this replace Java language server features?**
A: No, this complements existing error detection by providing better explanations and suggested fixes.

**Q: Can I add custom error messages?**
A: Yes, modify the `fixDatabase` in `javaDocProvider.ts` to add custom error patterns.

**Q: Does it work for runtime exceptions?**
A: This version focuses on compilation errors. Runtime exception support is planned.

---

**Made with ❤️ for Java developers**
