#!/bin/bash

# Java Error Fixer - Setup and Run Script

echo ""
echo "============================================"
echo "Java Error Fixer - Project Setup & Run"
echo "============================================"
echo ""

# Check for Node.js
echo "Checking for Node.js..."
if ! command -v node &> /dev/null; then
    echo "✗ Node.js is not installed!"
    echo "Please install from https://nodejs.org/"
    exit 1
fi
echo "✓ Node.js installed: $(node --version)"

# Check for npm
echo "Checking for npm..."
if ! command -v npm &> /dev/null; then
    echo "✗ npm is not installed!"
    exit 1
fi
echo "✓ npm installed: $(npm --version)"
echo ""

# Create project directory
echo "Creating project structure..."
mkdir -p java-error-fixer-vscode/src
mkdir -p java-error-fixer-vscode/dist
cd java-error-fixer-vscode
echo "✓ Created: java-error-fixer-vscode/"
echo "✓ Created: src/"
echo "✓ Created: dist/"

# Copy configuration files
echo ""
echo "============================================"
echo "Step 1: Copying configuration files..."
echo "============================================"
echo ""

if [ -f "../tsconfig.json" ]; then
    cp ../tsconfig.json tsconfig.json
    echo "✓ Copied tsconfig.json"
fi

if [ -f "../package.json" ]; then
    cp ../package.json package.json
    echo "✓ Copied package.json"
fi

# Copy source files
echo ""
echo "============================================"
echo "Step 2: Copying source files..."
echo "============================================"
echo ""

if [ -f "../extension-src-extension.ts" ]; then
    cp ../extension-src-extension.ts src/extension.ts
    echo "✓ Copied extension.ts"
fi

if [ -f "../extension-src-errorAnalyzer.ts" ]; then
    cp ../extension-src-errorAnalyzer.ts src/errorAnalyzer.ts
    echo "✓ Copied errorAnalyzer.ts"
fi

if [ -f "../extension-src-javaDocProvider.ts" ]; then
    cp ../extension-src-javaDocProvider.ts src/javaDocProvider.ts
    echo "✓ Copied javaDocProvider.ts"
fi

# Install dependencies
echo ""
echo "============================================"
echo "Step 3: Installing dependencies..."
echo "============================================"
echo ""
echo "This may take a few minutes..."
echo ""

npm install
if [ $? -ne 0 ]; then
    echo "✗ npm install failed!"
    exit 1
fi

echo ""
echo "✓ Dependencies installed successfully!"

# Compile TypeScript
echo ""
echo "============================================"
echo "Step 4: Compiling TypeScript..."
echo "============================================"
echo ""

npm run compile
if [ $? -ne 0 ]; then
    echo "✗ Compilation failed!"
    exit 1
fi

echo ""
echo "✓ TypeScript compiled successfully!"

# Success message
echo ""
echo "============================================"
echo "SUCCESS! Setup Complete!"
echo "============================================"
echo ""
echo "Your Java Error Fixer extension is ready!"
echo ""
echo "Next steps:"
echo ""
echo "Option 1 - Run in Debug Mode (Recommended):"
echo "  1. Type: code ."
echo "  2. Press F5 in VS Code to start debugging"
echo ""
echo "Option 2 - Run Watch Mode (Auto-recompile):"
echo "  Type: npm run watch"
echo ""
echo "Option 3 - Install as Extension:"
echo "  1. Install vsce: npm install -g vsce"
echo "  2. Package: vsce package"
echo "  3. Install in VS Code: Extensions > Install from VSIX"
echo ""
echo "============================================"
echo "Happy coding! 🚀"
echo "============================================"
echo ""
