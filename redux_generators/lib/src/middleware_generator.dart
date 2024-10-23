// ignore_for_file: implementation_imports, depend_on_referenced_packages
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/src/dart/analysis/driver.dart';
import 'package:redux_annotations/redux_annotations.dart';
import 'package:redux_generators/src/model_visitor.dart';

class MiddlewareGenerator extends GeneratorForAnnotation<ReduxMiddleware> {
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);
    print('inside MiddlewareGenerat');
    if (element is! FunctionElement) {
      throw InvalidGenerationSourceError(
        'Generator cannot target `${element.runtimeType}`.',
        element: element,
      );
    }

    // Get the function's name and annotation details
    final functionName = element.name;
    final description =
        annotation.peek('description')?.stringValue ?? 'No description';
    final body = element.enclosingElement;
    final functionElement = element as FunctionElement;

    //   // Get the parsed library of the element
    //   final resolvedLibrary = await functionElement.session?.getResolvedLibraryByElement(functionElement.library);

    //   // Fetch the declaration asynchronously
    //   final functionDeclaration = await resolvedLibrary?.(functionElement);

    //   // Now you can access the function node and its body
    //   if (functionDeclaration != null && functionDeclaration.node is FunctionDeclaration) {
    //     final functionNode = functionDeclaration.node as FunctionDeclaration;
    //     final functionBody = functionNode.functionExpression.body;

    //     // Extract the body source code
    //     return _extractBodyCode(functionBody);
    //   }

    //   return '// Could not extract function body';
    // }

    // String _extractBodyCode(FunctionBody body) {
    //   // Convert the body back to source code (simple example)
    //   if (body is BlockFunctionBody) {
    //     // Get the code inside the curly braces for a block body
    //     return body.toSource();
    //   } else if (body is ExpressionFunctionBody) {
    //     // For functions that use the shorthand "=>" syntax
    //     return body.toSource();
    //   }

    // return '// Unknown function body type';

    // Generate Dart code that prints information about the function
    return '''
    // Auto-generated code for function: $functionName
    void print${functionName}Info() {
      print('Function name: $functionName');
      print('Description: $description');
      '$body';
    }
    ''';
    // final buffer = StringBuffer();
    // String lowercaseFirstLetter(String str) {
    //   if (str.isEmpty) return str;

    //   return str[0].toLowerCase() + str.substring(1);
    // }

    // String middName = lowercaseFirstLetter(visitor.functions.first.name);
    // // buffer.writeln("import 'package:redux/redux.dart';");
    // buffer.writeln('Middleware<AppState> $middName(Repository repository){');
    // buffer.writeln(
    //     'return (Store<AppState> store,action,NextDispatcher dispatch)async{ ');
    // buffer.writeln('dispatch(action);');
    // buffer.writeln('try{');
    // buffer.writeln('// TODO: Write here your middleware logic and api calls');
    // buffer.writeln('} catch (error){');
    // buffer.writeln('// TODO: API Error handling');
    // buffer.writeln('}');
    // buffer.writeln('};');
    // buffer.writeln('}');
    // return buffer.toString();
  }
}
