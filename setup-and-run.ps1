#!/usr/bin/env pwsh
# Java Error Fixer - Setup and Run Script

Write-Host "`n============================================" -ForegroundColor Green
Write-Host "Java Error Fixer - Project Setup & Run" -ForegroundColor Green
Write-Host "============================================`n" -ForegroundColor Green

# Check for Node.js
Write-Host "Checking for Node.js..." -ForegroundColor Cyan
try {
    $nodeVersion = node --version 2>$null
    Write-Host "✓ Node.js installed: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Node.js not found! Please install from https://nodejs.org/" -ForegroundColor Red
    exit 1
}

# Check for npm
Write-Host "Checking for npm..." -ForegroundColor Cyan
try {
    $npmVersion = npm --version 2>$null
    Write-Host "✓ npm installed: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ npm not found!" -ForegroundColor Red
    exit 1
}

# Create project directory
Write-Host "`nCreating project structure..." -ForegroundColor Cyan
$projectDir = "java-error-fixer-vscode"
if (-not (Test-Path $projectDir)) {
    New-Item -ItemType Directory -Path $projectDir | Out-Null
    Write-Host "✓ Created: $projectDir" -ForegroundColor Green
}

Set-Location $projectDir

if (-not (Test-Path "src")) {
    New-Item -ItemType Directory -Path "src" | Out-Null
    Write-Host "✓ Created: src/" -ForegroundColor Green
}

if (-not (Test-Path "dist")) {
    New-Item -ItemType Directory -Path "dist" | Out-Null
    Write-Host "✓ Created: dist/" -ForegroundColor Green
}

# Copy configuration files
Write-Host "`n============================================" -ForegroundColor Cyan
Write-Host "Step 1: Copying configuration files..." -ForegroundColor Cyan
Write-Host "============================================`n" -ForegroundColor Cyan

if (Test-Path "..\tsconfig.json") {
    Copy-Item "..\tsconfig.json" "tsconfig.json" -Force
    Write-Host "✓ Copied tsconfig.json" -ForegroundColor Green
}

if (Test-Path "..\package.json") {
    Copy-Item "..\package.json" "package.json" -Force
    Write-Host "✓ Copied package.json" -ForegroundColor Green
}

# Copy source files
Write-Host "`n============================================" -ForegroundColor Cyan
Write-Host "Step 2: Copying source files..." -ForegroundColor Cyan
Write-Host "============================================`n" -ForegroundColor Cyan

if (Test-Path "..\extension-src-extension.ts") {
    Copy-Item "..\extension-src-extension.ts" "src\extension.ts" -Force
    Write-Host "✓ Copied extension.ts" -ForegroundColor Green
}

if (Test-Path "..\extension-src-errorAnalyzer.ts") {
    Copy-Item "..\extension-src-errorAnalyzer.ts" "src\errorAnalyzer.ts" -Force
    Write-Host "✓ Copied errorAnalyzer.ts" -ForegroundColor Green
}

if (Test-Path "..\extension-src-javaDocProvider.ts") {
    Copy-Item "..\extension-src-javaDocProvider.ts" "src\javaDocProvider.ts" -Force
    Write-Host "✓ Copied javaDocProvider.ts" -ForegroundColor Green
}

# Install dependencies
Write-Host "`n============================================" -ForegroundColor Cyan
Write-Host "Step 3: Installing dependencies..." -ForegroundColor Cyan
Write-Host "============================================`n" -ForegroundColor Cyan
Write-Host "This may take a few minutes...`n" -ForegroundColor Yellow

npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ npm install failed!" -ForegroundColor Red
    exit 1
}

Write-Host "`n✓ Dependencies installed successfully!" -ForegroundColor Green

# Compile TypeScript
Write-Host "`n============================================" -ForegroundColor Cyan
Write-Host "Step 4: Compiling TypeScript..." -ForegroundColor Cyan
Write-Host "============================================`n" -ForegroundColor Cyan

npm run compile
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ Compilation failed!" -ForegroundColor Red
    exit 1
}

Write-Host "`n✓ TypeScript compiled successfully!" -ForegroundColor Green

# Success message
Write-Host "`n============================================" -ForegroundColor Green
Write-Host "SUCCESS! Setup Complete!" -ForegroundColor Green
Write-Host "============================================`n" -ForegroundColor Green

Write-Host "Your Java Error Fixer extension is ready!`n" -ForegroundColor Green

Write-Host "Next steps:`n" -ForegroundColor Yellow

Write-Host "Option 1 - Run in Debug Mode (Recommended):" -ForegroundColor Cyan
Write-Host "  1. Type: code ." -ForegroundColor White
Write-Host "  2. Press F5 in VS Code to start debugging`n" -ForegroundColor White

Write-Host "Option 2 - Run Watch Mode (Auto-recompile):" -ForegroundColor Cyan
Write-Host "  Type: npm run watch`n" -ForegroundColor White

Write-Host "Option 3 - Install as Extension:" -ForegroundColor Cyan
Write-Host "  1. Install vsce: npm install -g vsce" -ForegroundColor White
Write-Host "  2. Package: vsce package" -ForegroundColor White
Write-Host "  3. Install in VS Code: Extensions > Install from VSIX`n" -ForegroundColor White

Write-Host "============================================" -ForegroundColor Green
Write-Host "Happy coding! 🚀" -ForegroundColor Green
Write-Host "============================================`n" -ForegroundColor Green
