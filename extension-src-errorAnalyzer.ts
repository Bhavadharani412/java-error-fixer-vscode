/**
 * Analyzes Java error messages and extracts error type and details
 */
export class ErrorAnalyzer {
    private errorPatterns = [
        { pattern: /NullPointerException/, type: 'NullPointerException', severity: 'high' },
        { pattern: /ClassNotFoundException/, type: 'ClassNotFoundException', severity: 'high' },
        { pattern: /cannot find symbol/, type: 'SymbolNotFound', severity: 'high' },
        { pattern: /incompatible types/, type: 'TypeMismatch', severity: 'medium' },
        { pattern: /ArrayIndexOutOfBoundsException/, type: 'ArrayIndexOutOfBounds', severity: 'high' },
        { pattern: /FileNotFoundException/, type: 'FileNotFound', severity: 'medium' },
        { pattern: /NumberFormatException/, type: 'NumberFormatException', severity: 'medium' },
        { pattern: /StringIndexOutOfBoundsException/, type: 'StringIndexOutOfBounds', severity: 'medium' },
        { pattern: /method .+ not found/, type: 'MethodNotFound', severity: 'high' },
        { pattern: /is not abstract and does not override abstract method/, type: 'AbstractMethodNotImplemented', severity: 'high' },
        { pattern: /duplicate class/, type: 'DuplicateClass', severity: 'medium' },
        { pattern: /reached end of file while parsing/, type: 'SyntaxError', severity: 'high' },
    ];

    analyze(errorMessage: string): {
        errorType: string;
        message: string;
        severity: string;
        details: string;
    } {
        // Find matching pattern
        for (const { pattern, type, severity } of this.errorPatterns) {
            if (pattern.test(errorMessage)) {
                return {
                    errorType: type,
                    message: errorMessage,
                    severity,
                    details: this.extractDetails(errorMessage)
                };
            }
        }

        // Default for unknown errors
        return {
            errorType: 'UnknownError',
            message: errorMessage,
            severity: 'low',
            details: errorMessage
        };
    }

    private extractDetails(errorMessage: string): string {
        // Extract relevant details from error message
        const lines = errorMessage.split('\n');
        return lines.slice(0, 3).join(' ');
    }
}
