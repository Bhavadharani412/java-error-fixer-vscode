# 🎯 HOW TO RUN THE PROJECT - STEP BY STEP

## ⚡ Fastest Way (Windows)

### Step 1: Navigate to Project
```bash
cd D:\code\github-cli
```

### Step 2: Run Setup Script
```bash
setup-and-run.bat
```

That's it! The script will:
- ✅ Check for Node.js
- ✅ Create folders
- ✅ Copy files  
- ✅ Install dependencies
- ✅ Compile TypeScript
- ✅ Show next steps

---

## ⚡ Fastest Way (Mac/Linux)

```bash
cd D:\code\github-cli
chmod +x setup-and-run.sh
./setup-and-run.sh
```

---

## 📋 What Gets Created

After running the setup script, you'll have:

```
java-error-fixer-vscode/          (New folder)
├── src/                           (Source TypeScript)
│   ├── extension.ts
│   ├── errorAnalyzer.ts
│   └── javaDocProvider.ts
├── dist/                          (Compiled JavaScript)
│   ├── extension.js
│   ├── errorAnalyzer.js
│   └── javaDocProvider.js
├── node_modules/                  (Dependencies)
├── package.json
├── tsconfig.json
└── package-lock.json
```

---

## 🚀 Running the Extension

### After Setup Script Completes

You'll see instructions:

```
Option 1 - Debug Mode (Recommended):
  1. Type: code .
  2. Press F5 in VS Code
```

### Do This:

1. **Open VS Code in the project folder:**
```bash
code .
```

2. **Press F5 to start debugging**
   - A new VS Code window will open
   - Your extension is now loaded!

3. **Create a test Java file:**
```java
public class Test {
    public static void main(String[] args) {
        String text = null;
        System.out.println(text.length());  // Error!
    }
}
```

4. **Hover over the error squiggle**
   - You should see the suggestion tooltip!

---

## ✅ Success Checklist

After running and testing:

- [ ] Setup script completed without errors
- [ ] `java-error-fixer-vscode` folder created
- [ ] `dist/extension.js` exists
- [ ] VS Code opened with F5
- [ ] Created test.java file
- [ ] Red error squiggle appears
- [ ] Hovering shows suggestion
- [ ] Suggestion includes:
  - [ ] Error type
  - [ ] Explanation
  - [ ] Suggested fix
  - [ ] Code snippet
  - [ ] Documentation link

If all checked: **Extension is working! 🎉**

---

## 📁 Files Included for Setup

In **D:\code\github-cli\**:

```
Setup Scripts:
✅ setup-and-run.bat        (Windows - Automated)
✅ setup-and-run.sh         (Mac/Linux - Automated)
✅ setup-and-run.ps1        (PowerShell - Alternative)

Configuration:
✅ package.json             (NPM config)
✅ tsconfig.json            (TypeScript config)

Source Files:
✅ extension-src-extension.ts           
✅ extension-src-errorAnalyzer.ts       
✅ extension-src-javaDocProvider.ts     

Guides:
✅ RUN-GUIDE.md             (Detailed run instructions)
✅ SETUP-AND-RUN.md         (Setup walkthrough)
```

---

## 🔧 Manual Setup (If Script Doesn't Work)

```bash
# 1. Create folders
mkdir java-error-fixer-vscode
cd java-error-fixer-vscode
mkdir src
mkdir dist

# 2. Copy files
# (Use your file explorer or copy commands)
# From parent directory, copy:
#   - tsconfig.json → tsconfig.json
#   - package.json → package.json
#   - extension-src-extension.ts → src/extension.ts
#   - extension-src-errorAnalyzer.ts → src/errorAnalyzer.ts
#   - extension-src-javaDocProvider.ts → src/javaDocProvider.ts

# 3. Install & compile
npm install
npm run compile

# 4. Run
code .
# Then press F5
```

---

## 🐛 Troubleshooting

### Script Won't Run
```bash
# Windows - Try PowerShell
powershell -ExecutionPolicy Bypass -File setup-and-run.ps1

# Mac/Linux - Make executable
chmod +x setup-and-run.sh
./setup-and-run.sh
```

### "node not found"
→ Install from https://nodejs.org/

### "npm install" fails
```bash
npm cache clean --force
npm install
```

### Extension won't load
1. Delete `dist/` and `node_modules/`
2. Run `npm install` again
3. Run `npm run compile` again
4. Try F5 again

### Still having issues?
→ Read **RUN-GUIDE.md** for detailed troubleshooting

---

## 📚 Documentation Reference

| File | Purpose |
|------|---------|
| **RUN-GUIDE.md** | Detailed running instructions |
| **SETUP-AND-RUN.md** | Setup walkthrough |
| **README-EXTENSION.md** | Feature documentation |
| **INSTALLATION-GUIDE.md** | Installation details |
| **USAGE-EXAMPLES.md** | Real-world examples |
| **ARCHITECTURE.md** | Technical design |

---

## 💡 Quick Tips

1. **Keep watch mode running while developing:**
   ```bash
   npm run watch
   ```

2. **Reload extension:** Press Ctrl+Shift+P and type "Reload Window"

3. **Debug console:** View → Debug Console (F5 window)

4. **Extension output:** View → Output → Java Error Fixer

5. **Test with errors:** Hover over red squiggles

---

## 🎯 Expected Result

After running the project correctly:

```
You should see:
┌─────────────────────────────────────┐
│  Error: NullPointerException        │
│                                      │
│  Explanation: You attempted to use  │
│  an object reference that hasn't    │
│  been assigned a value.             │
│                                      │
│  Suggested Fix: Add a null check    │
│  before using the object.           │
│                                      │
│  if (object != null) {              │
│      // your code                   │
│  }                                  │
│                                      │
│  📚 Learn More                       │
└─────────────────────────────────────┘
```

This appears when you hover over Java errors!

---

## 📊 Setup Times

| Step | Time |
|------|------|
| Run setup script | 1-2 min |
| npm install | 5-10 min |
| TypeScript compile | 10-20 sec |
| **Total** | **6-12 min** |

---

## ✨ What Happens at Each Step

### Setup Script:
```
Creating project structure...    ✓
Copying files...                 ✓
Installing dependencies...       ⏳ (5-10 min)
Compiling TypeScript...          ✓
SUCCESS! Setup Complete!         ✓
```

### After F5:
```
New VS Code window opens...      ✓
Extension loaded...              ✓
Java language support active...  ✓
Ready for error detection...     ✓
```

### After Creating Error:
```
Red error squiggle appears...    ✓
Hover over squiggle...           ✓
Suggestion tooltip shows...      ✓
Fix explanation visible...       ✓
Copy snippet to apply fix...     ✓
```

---

## 🎉 YOU'RE READY!

Your setup process is ready:

### For Windows:
```
cd D:\code\github-cli
setup-and-run.bat
```

### For Mac/Linux:
```
cd D:\code\github-cli
./setup-and-run.sh
```

### Then:
```
code .
```
Press F5

### Done!
Start hovering over Java errors!

---

**Next Step: Run the setup script! 🚀**

*All files are in D:\code\github-cli\ ready to go!*
