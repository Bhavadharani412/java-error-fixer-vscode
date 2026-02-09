@echo off
REM Quick Deploy Script for Java Error Fixer
REM This is a simplified version that shows exactly what to do

echo.
echo ============================================
echo JAVA ERROR FIXER - DEPLOYMENT START
echo ============================================
echo.

REM Display instructions
echo STEP 1: Check Prerequisites
echo.
echo Checking Node.js...
node --version
if errorlevel 1 (
    echo ERROR: Node.js not installed!
    echo Install from: https://nodejs.org/
    pause
    exit /b 1
)

echo Checking npm...
npm --version
if errorlevel 1 (
    echo ERROR: npm not installed!
    pause
    exit /b 1
)

echo.
echo STEP 2: Create Project Folder
echo.
if not exist "java-error-fixer-vscode" (
    mkdir java-error-fixer-vscode
    echo Created: java-error-fixer-vscode
) else (
    echo Folder exists: java-error-fixer-vscode
)

cd java-error-fixer-vscode

REM Create src and dist directories
if not exist "src" mkdir src
if not exist "dist" mkdir dist
echo Created: src/ and dist/

echo.
echo STEP 3: Copy Configuration Files
echo.
copy ..\tsconfig.json tsconfig.json >nul
echo Copied: tsconfig.json
copy ..\package.json package.json >nul
echo Copied: package.json

echo.
echo STEP 4: Copy Source Files
echo.
copy ..\extension-src-extension.ts src\extension.ts >nul
echo Copied: src/extension.ts
copy ..\extension-src-errorAnalyzer.ts src\errorAnalyzer.ts >nul
echo Copied: src/errorAnalyzer.ts
copy ..\extension-src-javaDocProvider.ts src\javaDocProvider.ts >nul
echo Copied: src/javaDocProvider.ts

echo.
echo STEP 5: Install Dependencies (This may take 5-10 minutes...)
echo.
call npm install
if errorlevel 1 (
    echo ERROR: npm install failed!
    pause
    exit /b 1
)

echo.
echo STEP 6: Compile TypeScript
echo.
call npm run compile
if errorlevel 1 (
    echo ERROR: Compilation failed!
    pause
    exit /b 1
)

echo.
echo ============================================
echo SUCCESS! PROJECT READY!
echo ============================================
echo.
echo Your Java Error Fixer extension is ready!
echo.
echo NEXT STEPS:
echo.
echo 1. Open VS Code in this folder:
echo    code .
echo.
echo 2. Press F5 to start debugging
echo.
echo 3. A new VS Code window will open
echo    with your extension loaded!
echo.
echo TESTING:
echo.
echo 1. Create a test.java file
echo 2. Add code with errors
echo 3. Hover over red squiggles
echo 4. See suggestions appear!
echo.
echo ============================================
echo.
pause
