@echo off
REM Java Error Fixer - Push to GitHub
REM This script initializes git and pushes to GitHub

echo.
echo ╔══════════════════════════════════════════════════════════╗
echo ║                                                          ║
echo ║  🚀 PUSHING JAVA ERROR FIXER TO GITHUB 🚀               ║
echo ║                                                          ║
echo ╚══════════════════════════════════════════════════════════╝
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ ERROR: Git is not installed!
    echo Please install Git from: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo ✅ Git found
echo.

REM Initialize git
echo 📝 Initializing repository...
git init
if errorlevel 1 goto error

REM Configure git
echo ✅ Configuring git...
git config user.name "Bhavadharani412"
git config user.email "noreply@github.com"

REM Add all files
echo 📦 Adding files...
git add .
if errorlevel 1 goto error

REM Create commit
echo 💾 Creating commit...
git commit -m "Initial commit: Java Error Fixer VS Code Extension - Production Ready"
if errorlevel 1 goto error

REM Rename to main branch
git branch -M main
if errorlevel 1 goto error

REM Add remote
echo 🔗 Adding GitHub remote...
git remote add origin https://github.com/Bhavadharani412/java-error-fixer-vscode.git
if errorlevel 1 goto error

REM Push to GitHub
echo.
echo 📤 Pushing to GitHub...
echo ⚠️  Authenticate with your GitHub credentials when prompted.
echo.
git push -u origin main

if errorlevel 1 goto error

echo.
echo ╔══════════════════════════════════════════════════════════╗
echo ║                                                          ║
echo ║  ✅ SUCCESSFULLY PUSHED TO GITHUB! ✅                    ║
echo ║                                                          ║
echo ║  Repository:                                             ║
echo ║  https://github.com/Bhavadharani412/                     ║
echo ║  java-error-fixer-vscode                                 ║
echo ║                                                          ║
echo ║  📋 Next Steps:                                          ║
echo ║  1. Open your GitHub repo                                ║
echo ║  2. Share the link with recipients                       ║
echo ║  3. They can clone: git clone <repo-url>                 ║
echo ║  4. Then run: DEPLOY-NOW.bat                             ║
echo ║                                                          ║
echo ╚══════════════════════════════════════════════════════════╝
echo.
pause
exit /b 0

:error
echo.
echo ❌ ERROR during push!
echo.
echo Troubleshooting:
echo 1. Create repo first: https://github.com/new
echo    Name: java-error-fixer-vscode
echo 2. Check internet connection
echo 3. Verify GitHub credentials
echo 4. Run this script again
echo.
pause
exit /b 1
