# Java Error Fixer - VS Code Extension

## Project Structure

```
java-error-fixer/
├── src/
│   ├── extension.ts
│   ├── errorAnalyzer.ts
│   └── javaDocProvider.ts
├── resources/
│   └── java-errors.json
├── package.json
├── tsconfig.json
└── README.md
```

## Features

- Hover over Java error squiggles to see suggested fixes
- Reads Java documentation to provide accurate error explanations
- Supports common Java compilation and runtime errors
- One-click quick fixes for common issues

## Installation

1. Copy this directory to VS Code extensions folder
2. Run `npm install`
3. Run `npm run compile`
4. Reload VS Code

## Supported Errors

- NullPointerException
- ClassNotFoundException
- ImportError / SymbolNotFound
- Type Mismatch
- ArrayIndexOutOfBoundsException
- And more...

## How It Works

1. VS Code detects Java errors
2. User hovers over error squiggle
3. Extension analyzes error message
4. Extension looks up fix in Java documentation database
5. Displays suggested fix and explanation

## Development

```bash
npm run watch       # Compile on save
npm run compile     # Manual compile
npm run lint        # Lint code
```
