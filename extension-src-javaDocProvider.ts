/**
 * Provides Java documentation and suggested fixes for errors
 */
export class JavaDocProvider {
    private fixDatabase = {
        'NullPointerException': {
            explanation: 'You attempted to use an object reference that hasn\'t been assigned a value.',
            solution: 'Add a null check before using the object. Use if (obj != null) or Optional<T>.',
            codeSnippet: 'if (${1:object} != null) {\n    ${2:// your code}\n}',
            documentationUrl: 'https://docs.oracle.com/javase/tutorial/i18n/resbundle/concept.html'
        },
        'ClassNotFoundException': {
            explanation: 'The JVM cannot find the specified class at runtime.',
            solution: 'Ensure the class is on the classpath. Check the class name spelling and package name.',
            codeSnippet: 'Class.forName("${1:fully.qualified.ClassName}");',
            documentationUrl: 'https://docs.oracle.com/javase/8/docs/api/java/lang/ClassNotFoundException.html'
        },
        'SymbolNotFound': {
            explanation: 'The compiler cannot find the referenced symbol (variable, method, or class).',
            solution: 'Check the spelling, ensure the class is imported, and verify it\'s in scope.',
            codeSnippet: 'import ${1:package.name}.*;',
            documentationUrl: 'https://docs.oracle.com/javase/tutorial/java/package/usepkgs.html'
        },
        'TypeMismatch': {
            explanation: 'You\'re trying to assign a value of incompatible type to a variable.',
            solution: 'Cast the value explicitly or change the variable type to match the assigned value.',
            codeSnippet: '${1:TargetType} var = (${1:TargetType}) ${2:sourceValue};',
            documentationUrl: 'https://docs.oracle.com/javase/tutorial/java/data/index.html'
        },
        'ArrayIndexOutOfBounds': {
            explanation: 'You\'re accessing an array element with an invalid index (out of bounds).',
            solution: 'Check array bounds before accessing. Use if (index >= 0 && index < array.length).',
            codeSnippet: 'if (${1:index} >= 0 && ${1:index} < ${2:array}.length) {\n    ${3:// access element}\n}',
            documentationUrl: 'https://docs.oracle.com/javase/8/docs/api/java/lang/ArrayIndexOutOfBoundsException.html'
        },
        'FileNotFound': {
            explanation: 'The specified file cannot be found in the expected location.',
            solution: 'Check if the file path is correct. Use absolute paths or verify relative paths.',
            codeSnippet: 'File file = new File("${1:path/to/file}");',
            documentationUrl: 'https://docs.oracle.com/javase/8/docs/api/java/io/FileNotFoundException.html'
        },
        'NumberFormatException': {
            explanation: 'You\'re trying to convert an invalid string to a number.',
            solution: 'Validate the string format before conversion. Use try-catch for robustness.',
            codeSnippet: 'try {\n    int num = Integer.parseInt("${1:numberString}");\n} catch (NumberFormatException e) {\n    ${2:// handle error}\n}',
            documentationUrl: 'https://docs.oracle.com/javase/8/docs/api/java/lang/NumberFormatException.html'
        },
        'MethodNotFound': {
            explanation: 'The method you\'re calling doesn\'t exist on the object or has different parameters.',
            solution: 'Verify the method name and parameter types. Check the class documentation.',
            codeSnippet: '${1:object}}.${2:methodName}(${3:parameters});',
            documentationUrl: 'https://docs.oracle.com/javase/tutorial/java/javaOO/methods.html'
        },
        'AbstractMethodNotImplemented': {
            explanation: 'Your class implements an interface or extends an abstract class but doesn\'t implement all required methods.',
            solution: 'Implement all abstract methods from the parent class or interface.',
            codeSnippet: '@Override\npublic void ${1:methodName}() {\n    ${2:// implementation}\n}',
            documentationUrl: 'https://docs.oracle.com/javase/tutorial/java/IandI/abstract.html'
        },
        'DuplicateClass': {
            explanation: 'You have two classes with the same name in the same package.',
            solution: 'Rename one of the classes or move it to a different package.',
            codeSnippet: 'package ${1:com.example.subpackage};\n\npublic class ${2:UniqueClassName} {}',
            documentationUrl: 'https://docs.oracle.com/javase/tutorial/java/package/packages.html'
        },
        'SyntaxError': {
            explanation: 'There\'s a syntax error in your Java code (missing braces, semicolons, etc.).',
            solution: 'Check for missing semicolons, braces, or other syntax issues.',
            codeSnippet: '// Ensure all statements end with semicolon\nstatement${1:;}',
            documentationUrl: 'https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html'
        }
    };

    getSuggestedFix(analysis: any): any {
        const fix = this.fixDatabase[analysis.errorType as keyof typeof this.fixDatabase];
        return fix || {
            explanation: 'An unknown error occurred. Please check the Java documentation.',
            solution: 'Review the error message and consult official Java documentation.',
            codeSnippet: '',
            documentationUrl: 'https://docs.oracle.com/javase/'
        };
    }
}
