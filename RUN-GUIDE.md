# 🚀 RUN Guide - Java Error Fixer Extension

## Quick Start - Choose Your Operating System

### 🪟 Windows Users

#### Option A: Automated Setup (Easiest)
```bash
setup-and-run.bat
```
This script will automatically:
1. Check for Node.js/npm
2. Create project folders
3. Copy files
4. Install dependencies
5. Compile TypeScript
6. Show next steps

#### Option B: Manual Step-by-Step
```bash
# 1. Check Node.js is installed
node --version
npm --version

# 2. Create and organize the project
mkdir java-error-fixer-vscode
cd java-error-fixer-vscode
mkdir src
mkdir dist

# 3. Copy files from parent directory
copy ..\tsconfig.json tsconfig.json
copy ..\package.json package.json
copy ..\extension-src-extension.ts src\extension.ts
copy ..\extension-src-errorAnalyzer.ts src\errorAnalyzer.ts
copy ..\extension-src-javaDocProvider.ts src\javaDocProvider.ts

# 4. Install dependencies
npm install

# 5. Compile
npm run compile

# 6. Open in VS Code and press F5
code .
```

---

### 🍎 Mac Users

#### Option A: Automated Setup
```bash
chmod +x setup-and-run.sh
./setup-and-run.sh
```

#### Option B: Manual Setup
```bash
# 1. Verify Node.js
node --version
npm --version

# 2. Create project structure
mkdir -p java-error-fixer-vscode/src
mkdir -p java-error-fixer-vscode/dist
cd java-error-fixer-vscode

# 3. Copy files
cp ../tsconfig.json tsconfig.json
cp ../package.json package.json
cp ../extension-src-extension.ts src/extension.ts
cp ../extension-src-errorAnalyzer.ts src/errorAnalyzer.ts
cp ../extension-src-javaDocProvider.ts src/javaDocProvider.ts

# 4. Install & compile
npm install
npm run compile

# 5. Launch
code .
# Then press F5
```

---

### 🐧 Linux Users

Same as Mac:
```bash
chmod +x setup-and-run.sh
./setup-and-run.sh
```

---

## After Setup - Running the Extension

### 🟢 Method 1: Debug Mode (Recommended)

1. After setup completes, the folder opens in VS Code:
```bash
code .
```

2. Press **F5** to start debugging

3. A new VS Code window opens with your extension loaded

4. Create a test Java file to verify it works

---

### 🟢 Method 2: Watch Mode (Development)

Keep TypeScript auto-compiling while you edit:

```bash
npm run watch
```

This compiles automatically when you save files. Use in one terminal while editing in another.

---

### 🟢 Method 3: Manual Compile

Compile once:
```bash
npm run compile
```

---

## Testing the Extension

### Create Test Java File

Create `test.java`:
```java
public class Test {
    public static void main(String[] args) {
        // Test NullPointerException
        String text = null;
        System.out.println(text.length());  // Error!
        
        // Test ClassNotFoundException
        try {
            Class.forName("com.unknown.Class");
        } catch (Exception e) {}
        
        // Test missing method
        unknownMethod();  // Error!
        
        // Test type mismatch
        String number = 42;  // Error!
    }
}
```

### See Error Suggestions

1. Open the test file in VS Code
2. Look for red error squiggles
3. **Hover over the squiggles**
4. You should see:
   - Error type
   - Explanation
   - Suggested fix
   - Code snippet
   - Documentation link

---

## Troubleshooting

### Problem: "node: command not found"
**Solution:** Install Node.js from https://nodejs.org/

### Problem: "npm install" fails
**Solution:**
```bash
# Clear npm cache
npm cache clean --force

# Try again
npm install
```

### Problem: Compilation errors
**Solution:**
```bash
# Delete generated files
rm -rf dist node_modules
rm package-lock.json

# Reinstall
npm install
npm run compile
```

### Problem: Extension not loading in VS Code
**Solution:**
1. Make sure `dist/extension.js` exists
2. Check Output panel: View → Output → Java Error Fixer
3. Restart VS Code
4. Try F5 again

### Problem: "tsc: command not found"
**Solution:**
```bash
# Reinstall TypeScript locally
npm install

# Try compile again
npm run compile
```

---

## Project Structure After Running

```
java-error-fixer-vscode/
├── src/
│   ├── extension.ts              (Source)
│   ├── errorAnalyzer.ts          (Source)
│   └── javaDocProvider.ts        (Source)
│
├── dist/                         (Generated)
│   ├── extension.js              (Compiled)
│   ├── errorAnalyzer.js          (Compiled)
│   ├── javaDocProvider.js        (Compiled)
│   ├── extension.d.ts            (Types)
│   ├── errorAnalyzer.d.ts        (Types)
│   └── javaDocProvider.d.ts      (Types)
│
├── node_modules/                 (Dependencies)
│   └── @types, vscode, typescript, eslint...
│
├── package.json                  (Configuration)
├── package-lock.json             (Generated)
├── tsconfig.json                 (TypeScript config)
└── .vscodeignore                (Optional)
```

---

## Available npm Commands

```bash
# Compile TypeScript to JavaScript
npm run compile

# Watch mode - auto-compile on save
npm run watch

# Lint code with ESLint
npm run lint

# Prepare for publishing
npm run vscode:prepublish
```

---

## Publishing to VS Code Marketplace (Optional)

If you want to share your extension:

```bash
# 1. Install vsce (VS Code Extension CLI)
npm install -g vsce

# 2. Package the extension
vsce package

# 3. This creates a .vsix file

# 4. In VS Code, go to Extensions
# 5. Click "..." menu > "Install from VSIX"
# 6. Select the .vsix file
```

---

## Development Workflow

### 1. Make Changes
Edit files in `src/` folder

### 2. Watch for Changes
Keep this running:
```bash
npm run watch
```

### 3. Test in Debug Mode
Press F5 in VS Code to reload extension

### 4. Iterate
Repeat: Edit → Save → Test

---

## Getting Help

| Problem | Solution |
|---------|----------|
| Setup not working? | Check INSTALLATION-GUIDE.md |
| Don't understand steps? | Read SETUP-AND-RUN.md |
| Want to learn? | Read USAGE-EXAMPLES.md |
| Want technical details? | Read ARCHITECTURE.md |
| Need error reference? | Read ERROR-DATABASE-DOCS.md |

---

## Quick Reference

| Task | Command |
|------|---------|
| Automatic setup | `setup-and-run.bat` (Windows) |
| Automatic setup | `./setup-and-run.sh` (Mac/Linux) |
| Manual compile | `npm run compile` |
| Watch mode | `npm run watch` |
| Lint code | `npm run lint` |
| Open in VS Code | `code .` |
| Debug/Run | Press F5 in VS Code |

---

## What Should Happen

### After Running Setup:
```
✓ Folders created (src/, dist/)
✓ Files copied from parent directory
✓ Dependencies installed (npm, TypeScript, etc.)
✓ TypeScript compiled to JavaScript
✓ dist/extension.js exists
✓ Ready to use!
```

### After Pressing F5:
```
✓ New VS Code window opens
✓ Extension loaded
✓ Java files show error squiggles
✓ Hovering shows suggestions
✓ Click links to see documentation
✓ Extension working!
```

---

## Success Indicators

✅ `dist/extension.js` exists  
✅ No compilation errors in output  
✅ New VS Code window opens (F5)  
✅ Java errors show in editor  
✅ Hovering shows suggestion tooltip  
✅ Tooltip has error explanation  
✅ Code snippet is visible  
✅ Documentation link is clickable  

---

## 🎉 You're All Set!

Your Java Error Fixer extension is running!

### Next Steps:
1. Create Java files with errors
2. Hover over the red squiggles
3. See intelligent suggestions
4. Learn from the explanations
5. Enjoy faster Java development!

---

**Happy Coding! 🚀**

*Need more help? Check the other documentation files in the project!*
