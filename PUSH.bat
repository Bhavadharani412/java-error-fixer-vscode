@echo off
cd /d D:\code\github-cli

echo Initializing git...
git init

echo Configuring user...
git config user.name "Bhavadharani412"
git config user.email "user@github.com"

echo Adding files...
git add .

echo Creating commit...
git commit -m "Initial commit: Java Error Fixer VS Code Extension - Production Ready"

echo Setting main branch...
git branch -M main

echo Adding remote...
git remote add origin https://github.com/Bhavadharani412/java-error-fixer-vscode.git

echo Pushing to GitHub...
git push -u origin main

echo Done!
pause
