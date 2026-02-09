import * as vscode from 'vscode';
import { ErrorAnalyzer } from './errorAnalyzer';
import { JavaDocProvider } from './javaDocProvider';

export function activate(context: vscode.ExtensionContext) {
    console.log('Java Error Fixer extension activated');

    const errorAnalyzer = new ErrorAnalyzer();
    const javaDocProvider = new JavaDocProvider();

    // Register hover provider for Java files
    const hoverProvider = vscode.languages.registerHoverProvider('java', {
        provideHover(document: vscode.TextDocument, position: vscode.Position) {
            // Get diagnostics at cursor position
            const diagnostics = vscode.languages.getDiagnostics(document.uri);
            
            for (const diagnostic of diagnostics) {
                if (diagnostic.range.contains(position)) {
                    const errorMessage = diagnostic.message;
                    
                    // Analyze the error
                    const analysis = errorAnalyzer.analyze(errorMessage);
                    
                    // Get documentation and fix suggestion
                    const fix = javaDocProvider.getSuggestedFix(analysis);
                    
                    if (fix) {
                        const markdown = new vscode.MarkdownString();
                        markdown.appendMarkdown(`**Error:** ${analysis.errorType}\n\n`);
                        markdown.appendMarkdown(`**Explanation:** ${fix.explanation}\n\n`);
                        markdown.appendMarkdown(`**Suggested Fix:** ${fix.solution}\n\n`);
                        markdown.appendMarkdown(`[Learn More](${fix.documentationUrl})`);
                        
                        return new vscode.Hover(markdown);
                    }
                }
            }
            return null;
        }
    });

    context.subscriptions.push(hoverProvider);

    // Register command to apply quick fixes
    const disposable = vscode.commands.registerCommand('javaErrorFixer.applyFix', async (fix: any) => {
        const editor = vscode.window.activeTextEditor;
        if (!editor) return;

        const edit = new vscode.WorkspaceEdit();
        edit.replace(editor.document.uri, editor.selection, fix.codeSnippet);
        vscode.workspace.applyEdit(edit);
    });

    context.subscriptions.push(disposable);
}

export function deactivate() {
    console.log('Java Error Fixer extension deactivated');
}
