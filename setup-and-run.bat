@echo off
REM Java Error Fixer - Automated Setup Script

echo.
echo ============================================
echo Java Error Fixer - Project Setup & Run
echo ============================================
echo.

REM Check if Node.js is installed
echo Checking for Node.js...
node --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo ERROR: Node.js is not installed!
    echo Please install Node.js from https://nodejs.org/
    echo Then run this script again.
    pause
    exit /b 1
)

echo Node.js is installed: 
node --version

echo Checking for npm...
npm --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: npm is not installed!
    pause
    exit /b 1
)

echo npm is installed:
npm --version
echo.

REM Create project directory
echo Creating project structure...
if not exist "java-error-fixer-vscode" (
    mkdir java-error-fixer-vscode
    echo Created: java-error-fixer-vscode
) else (
    echo Folder exists: java-error-fixer-vscode
)

cd java-error-fixer-vscode

REM Create src directory
if not exist "src" (
    mkdir src
    echo Created: src/
)

if not exist "dist" (
    mkdir dist
    echo Created: dist/
)

echo.
echo ============================================
echo Step 1: Copying configuration files...
echo ============================================
echo.

REM Copy tsconfig.json
if exist "..\tsconfig.json" (
    copy "..\tsconfig.json" "tsconfig.json" >nul
    echo ✓ Copied tsconfig.json
) else (
    echo ! tsconfig.json not found in parent directory
)

REM Copy package.json
if exist "..\package.json" (
    copy "..\package.json" "package.json" >nul
    echo ✓ Copied package.json
) else (
    echo ! package.json not found
)

echo.
echo ============================================
echo Step 2: Copying source files...
echo ============================================
echo.

REM Copy TypeScript source files
if exist "..\extension-src-extension.ts" (
    copy "..\extension-src-extension.ts" "src\extension.ts" >nul
    echo ✓ Copied extension.ts
) else (
    echo ! extension.ts not found
)

if exist "..\extension-src-errorAnalyzer.ts" (
    copy "..\extension-src-errorAnalyzer.ts" "src\errorAnalyzer.ts" >nul
    echo ✓ Copied errorAnalyzer.ts
) else (
    echo ! errorAnalyzer.ts not found
)

if exist "..\extension-src-javaDocProvider.ts" (
    copy "..\extension-src-javaDocProvider.ts" "src\javaDocProvider.ts" >nul
    echo ✓ Copied javaDocProvider.ts
) else (
    echo ! javaDocProvider.ts not found
)

echo.
echo ============================================
echo Step 3: Installing dependencies...
echo ============================================
echo.
echo This may take a few minutes...
echo.

npm install
if errorlevel 1 (
    echo ERROR: npm install failed!
    pause
    exit /b 1
)

echo.
echo ✓ Dependencies installed successfully!

echo.
echo ============================================
echo Step 4: Compiling TypeScript...
echo ============================================
echo.

npm run compile
if errorlevel 1 (
    echo ERROR: Compilation failed!
    pause
    exit /b 1
)

echo.
echo ✓ TypeScript compiled successfully!

echo.
echo ============================================
echo SUCCESS! Setup Complete!
echo ============================================
echo.
echo Your Java Error Fixer extension is ready!
echo.
echo Next steps:
echo.
echo Option 1 - Run in Debug Mode:
echo   1. Type: code .
echo   2. Press F5 in VS Code to start debugging
echo.
echo Option 2 - Run Watch Mode (Auto-recompile):
echo   Type: npm run watch
echo.
echo Option 3 - Install as Extension:
echo   1. Install vsce: npm install -g vsce
echo   2. Package: vsce package
echo   3. Install in VS Code: Extensions > Install from VSIX
echo.
echo ============================================
echo.
pause
