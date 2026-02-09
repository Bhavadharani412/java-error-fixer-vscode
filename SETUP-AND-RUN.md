# Java Error Fixer - Setup & Run Guide

## Quick Setup (Copy-Paste Ready)

### Step 1: Create Project Directory Structure
```bash
# Create the project folder
mkdir java-error-fixer-vscode
cd java-error-fixer-vscode

# Create subdirectories
mkdir src
mkdir dist
```

### Step 2: Copy Source Files
Copy these files from the current location to src/:

From:
- D:\code\github-cli\extension-src-extension.ts
- D:\code\github-cli\extension-src-errorAnalyzer.ts
- D:\code\github-cli\extension-src-javaDocProvider.ts

To:
- java-error-fixer-vscode\src\extension.ts
- java-error-fixer-vscode\src\errorAnalyzer.ts
- java-error-fixer-vscode\src\javaDocProvider.ts

### Step 3: Copy Configuration
Copy:
- D:\code\github-cli\extension-tsconfig.json → java-error-fixer-vscode\tsconfig.json

### Step 4: Create package.json

Create file: `java-error-fixer-vscode\package.json` with this content:

```json
{
  "name": "java-error-fixer",
  "displayName": "Java Error Fixer",
  "description": "Reads Java documentation and suggests fixes for errors",
  "version": "0.1.0",
  "publisher": "errorFixer",
  "engines": {
    "vscode": "^1.75.0"
  },
  "categories": ["Other"],
  "activationEvents": ["onLanguage:java"],
  "main": "./dist/extension.js",
  "contributes": {
    "configuration": {
      "title": "Java Error Fixer",
      "properties": {
        "javaErrorFixer.enableHoverFix": {
          "type": "boolean",
          "default": true,
          "description": "Enable hover suggestions for Java errors"
        }
      }
    }
  },
  "scripts": {
    "vscode:prepublish": "npm run compile",
    "compile": "tsc -p ./",
    "watch": "tsc -watch -p ./",
    "lint": "eslint src --ext ts"
  },
  "devDependencies": {
    "@types/vscode": "^1.75.0",
    "@types/node": "^18.0.0",
    "typescript": "^5.0.0",
    "eslint": "^8.0.0",
    "@typescript-eslint/eslint-plugin": "^5.0.0",
    "@typescript-eslint/parser": "^5.0.0"
  }
}
```

### Step 5: Install Dependencies

```bash
cd java-error-fixer-vscode
npm install
```

This will install:
- TypeScript compiler
- VS Code types
- ESLint

### Step 6: Compile TypeScript to JavaScript

```bash
npm run compile
```

You should see output like:
```
src/extension.ts
src/errorAnalyzer.ts
src/javaDocProvider.ts
```

This creates JavaScript files in the `dist/` folder.

### Step 7: Test the Extension in VS Code

#### Option A: Debug Mode (Easiest)
```bash
# Open VS Code from this directory
code .

# In VS Code, press F5 to start debugging
# This launches a new VS Code window with your extension loaded
```

#### Option B: Manual Installation
1. Copy the `java-error-fixer-vscode` folder to:
   - **Windows:** `%USERPROFILE%\.vscode\extensions\`
   - **Mac:** `~/.vscode/extensions/`
   - **Linux:** `~/.vscode/extensions/`

2. Restart VS Code

3. Create a test Java file:
```java
public class Test {
    public static void main(String[] args) {
        String text = null;
        System.out.println(text.length());  // Error here!
    }
}
```

4. Look for the red error squiggle
5. Hover over it to see the fix suggestion!

---

## ✅ Final Project Structure

After setup, your project should look like:

```
java-error-fixer-vscode/
├── src/
│   ├── extension.ts
│   ├── errorAnalyzer.ts
│   └── javaDocProvider.ts
├── dist/
│   ├── extension.js
│   ├── errorAnalyzer.js
│   └── javaDocProvider.js
├── node_modules/        (created by npm install)
├── package.json
├── tsconfig.json
└── README.md            (optional, copy from docs)
```

---

## 🐛 Troubleshooting

### "npm: command not found"
- Install Node.js from nodejs.org
- Restart your terminal/cmd
- Try again

### "tsc: command not found"
- Run `npm install` again
- Make sure you're in the correct directory

### TypeScript compilation errors
- Delete `dist/` folder
- Run `npm install` again
- Run `npm run compile` again

### Extension not loading in VS Code
- Make sure `dist/extension.js` exists
- Restart VS Code completely
- Check Extensions panel (Ctrl+Shift+X)

---

## 📝 Watch Mode (For Development)

To automatically recompile when you save files:

```bash
npm run watch
```

Leave this running in one terminal while editing files in another.

---

## 🎉 You're All Set!

Your Java Error Fixer extension is now running in VS Code!

**Enjoy instant Java error fixes! 🚀**
