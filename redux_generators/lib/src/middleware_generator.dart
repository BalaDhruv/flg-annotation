// ignore_for_file: implementation_imports, depend_on_referenced_packages
import 'package:redux_generators/src/visitors/model_visitor_for_middleware.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:redux_annotations/redux_annotations.dart';

class MiddlewareGenerator
    extends GeneratorForAnnotation<MiddlewareGenAnnotation> {
  @override
  Future<String> generate(
    LibraryReader library,
    BuildStep buildStep,
  ) async {
    final visitor = ModelVisitorForMiddleware();
    print('--------- inside MiddlewareGenerat -----------');
    // Get the AssetId (reference to the current file)
    final assetId = buildStep.inputId;

    // Read the entire file's content as a string
    final fileContent = await buildStep.readAsString(assetId);

    // Optionally, you can print or manipulate the content
    print('File content for ${assetId.path}:\n$fileContent');
    // Iterate through all elements in the library
    for (var element in library.allElements) {
      // Manually visit each top-level function
      if (element is FunctionElement) {
        element.accept(
            visitor); // This will call visitFunctionElement in ModelVisitor
      }
    }

    final buffer = StringBuffer();
    String lowercaseFirstLetter(String str) {
      if (str.isEmpty) return str;

      return str[0].toLowerCase() + str.substring(1);
    }

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
    return buffer.toString();
  }

  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    throw UnimplementedError();
  }
}
