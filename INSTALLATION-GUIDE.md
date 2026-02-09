# 🚀 Installation & Setup Guide

## Complete Setup Instructions for Java Error Fixer Extension

### Prerequisites
- Node.js (v14 or higher)
- npm (comes with Node.js)
- VS Code (v1.75.0 or higher)
- Basic familiarity with terminal/command line

---

## Step 1: Prepare Project Files

### Option A: Manual Setup
1. Create a new directory:
   ```bash
   mkdir java-error-fixer
   cd java-error-fixer
   ```

2. Create subdirectories:
   ```bash
   mkdir src
   mkdir dist
   ```

3. Copy files:
   - Rename `extension-src-extension.ts` → `src/extension.ts`
   - Rename `extension-src-errorAnalyzer.ts` → `src/errorAnalyzer.ts`
   - Rename `extension-src-javaDocProvider.ts` → `src/javaDocProvider.ts`
   - Copy `extension-tsconfig.json` → `tsconfig.json`

4. Ensure `package.json` is in the root directory

### Option B: Using Git/Scripts
(After copying files from this project)

---

## Step 2: Install Dependencies

```bash
npm install
```

This installs:
- VS Code API types
- TypeScript compiler
- ESLint (for code quality)
- Node types

**Expected Output:**
```
added X packages in Y seconds
```

---

## Step 3: Compile TypeScript

```bash
npm run compile
```

This compiles TypeScript files in `src/` to JavaScript in `dist/`.

**Expected Output:**
```
src/extension.ts
src/errorAnalyzer.ts
src/javaDocProvider.ts
✓ Compilation successful
```

If you see no errors, the compilation was successful!

---

## Step 4: Load Extension in VS Code

### Method 1: Debug Mode (Development)
Perfect for testing while developing:

1. Open VS Code
2. Press `F5` (or go to Run → Start Debugging)
3. A new VS Code window opens with your extension loaded
4. The extension auto-reloads when you change code

### Method 2: Install as Extension

1. Press `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (Mac)
2. Type: "Extensions: Install from VSIX"
3. Select this option
4. Build the VSIX first:
   ```bash
   npx vsce package
   ```
5. Select the generated `.vsix` file

### Method 3: Manual Installation
Copy the project folder to VS Code extensions directory:

**Windows:**
```powershell
Copy-Item -Recurse -Path .\java-error-fixer -Destination $env:USERPROFILE\.vscode\extensions\
```

**Mac/Linux:**
```bash
cp -r java-error-fixer ~/.vscode/extensions/
```

Then restart VS Code.

---

## Step 5: Verify Installation

### Quick Test
1. Create a test Java file:
   ```java
   public class Test {
       public static void main(String[] args) {
           String str = null;
           System.out.println(str.length()); // Error!
       }
   }
   ```

2. Look for red squiggle under `str.length()`

3. Hover over the error

4. You should see the error suggestion with fix!

### Troubleshooting

**Extension doesn't load:**
- Check VS Code version: `Help → About`
- Ensure `dist/extension.js` exists
- Check the Output panel: `View → Output → Extension`

**No hover suggestions appear:**
- Make sure you're in a `.java` file
- Ensure Java extension is installed (provides error squiggles)
- Try hovering directly over red squiggles

**Compilation errors:**
- Delete `node_modules/` and `dist/`
- Run `npm install` again
- Run `npm run compile` again

---

## Step 6: Configure Settings (Optional)

Add to your VS Code settings.json:

1. Press `Ctrl+,` (Windows/Linux) or `Cmd+,` (Mac)
2. Search for "Java Error Fixer"
3. Toggle option: "Enable Hover Fix"

Or edit `.vscode/settings.json`:
```json
{
  "javaErrorFixer.enableHoverFix": true
}
```

---

## Development Workflow

### Watch for Changes
While developing, keep watch mode running:
```bash
npm run watch
```

This auto-compiles whenever you save files.

### Debugging
Press `F5` in VS Code to:
- Start debug instance
- Load your extension
- Set breakpoints in code

### Testing
Create test files to verify functionality:
```java
// Test different error types
String s = null; s.length();        // NullPointerException
Class<?> c = Class.forName("Bad");  // ClassNotFoundException
unknownMethod();                     // Symbol not found
```

---

## Publishing to Marketplace (Optional)

To share your extension publicly:

1. Create publisher account: https://marketplace.visualstudio.com/
2. Get personal access token
3. Install vsce: `npm install -g vsce`
4. Update package.json with your publisher name
5. Package extension: `vsce package`
6. Publish: `vsce publish`

---

## Updating the Extension

### Add New Errors
Edit `src/javaDocProvider.ts`:
1. Add error pattern to `errorAnalyzer.ts`
2. Add fix to `fixDatabase` in `javaDocProvider.ts`
3. Recompile: `npm run compile`

### Modify Existing Fixes
1. Edit `src/javaDocProvider.ts`
2. Update `fixDatabase` entry
3. Recompile: `npm run compile`
4. Reload VS Code (`F5` or restart)

---

## File Structure After Setup

```
java-error-fixer/
├── src/
│   ├── extension.ts
│   ├── errorAnalyzer.ts
│   └── javaDocProvider.ts
├── dist/                    (generated)
│   ├── extension.js
│   ├── errorAnalyzer.js
│   └── javaDocProvider.js
├── node_modules/           (generated)
├── package.json
├── tsconfig.json
└── README-EXTENSION.md
```

---

## System Requirements

| Component | Requirement |
|-----------|------------|
| VS Code | v1.75.0 or higher |
| Node.js | v14 or higher |
| npm | v6 or higher |
| TypeScript | v5.0.0 |
| OS | Windows, Mac, Linux |

---

## Environment Setup

### Windows
```powershell
# Install Node.js from nodejs.org or use chocolatey
choco install nodejs

# Verify installation
node --version
npm --version
```

### Mac
```bash
# Using Homebrew
brew install node

# Verify
node --version
npm --version
```

### Linux (Ubuntu/Debian)
```bash
# Update package manager
sudo apt update

# Install Node.js
sudo apt install nodejs npm

# Verify
node --version
npm --version
```

---

## Common Issues & Solutions

### Issue: "Cannot find module 'vscode'"
**Solution:**
```bash
npm install
npm run compile
```

### Issue: "Extension not loading in VS Code"
**Solution:**
1. Restart VS Code completely
2. Check extensions panel: `Ctrl+Shift+X`
3. Look for "Java Error Fixer"
4. Check Output panel for errors

### Issue: "Port already in use" (Debug mode)
**Solution:**
- Only run one VS Code debug instance
- Or change port in `.vscode/launch.json`

### Issue: "Permission denied" (Mac/Linux)
**Solution:**
```bash
chmod +x ./node_modules/.bin/*
npm run compile
```

---

## Next Steps

1. ✅ Installation complete!
2. Open a Java file with errors
3. Hover over red squiggles
4. Start getting intelligent fix suggestions
5. Read the documentation links
6. Customize the error database for your needs

---

## Support & Documentation

- **Full Docs**: See `README-EXTENSION.md`
- **Error Reference**: See `ERROR-DATABASE-DOCS.md`
- **Quick Start**: See `QUICK-START-GUIDE.md`
- **VS Code API**: https://code.visualstudio.com/api
- **Java Docs**: https://docs.oracle.com/javase/

---

## Feedback & Contributions

Have ideas? Found bugs? Want to contribute?

1. Add new error types to `fixDatabase`
2. Improve explanations and solutions
3. Enhance code snippets
4. Test across different Java projects
5. Share improvements with the community

---

**Happy debugging! 🎉**

*Java Error Fixer - Making Java development easier, one error at a time.*
