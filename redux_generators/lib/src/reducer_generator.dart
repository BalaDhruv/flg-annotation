// ignore_for_file: implementation_imports, depend_on_referenced_packages
import 'package:analyzer/dart/element/element.dart';
import 'package:redux_annotations/redux_annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:redux_generators/src/visitors/model_visitor_for_reducer.dart';
import 'package:source_gen/source_gen.dart';

class ReducerGenerator extends GeneratorForAnnotation<ReducerGenAnnotation> {
  @override
  Future<String> generate(
    LibraryReader library,
    BuildStep buildStep,
  ) async {
    final visitor = ModelVisitorForReducer();
    // Iterate through all elements in the library
    for (var element in library.allElements) {
      // Manually visit each top-level function
      if (element is FunctionElement) {
        element.accept(
            visitor); // This will call visitFunctionElement in ModelVisitor
      }
    }
    print('---------inside Reduxgenerat----------');
    final buffer = StringBuffer();
    String lowercaseFirstLetter(String str) {
      if (str.isEmpty) return str;

      return str[0].toLowerCase() + str.substring(1);
    }

    // String uppercaseFirstLetter(String str) {
    //   if (str.isEmpty) return str;

    //   return str[0].toUpperCase() + str.substring(1);
    // }

    String reducerName =
        "${lowercaseFirstLetter(visitor.reducers.first.functionReturnType.toString())}Reducer";
    String returnState = visitor.reducers.first.functionReturnType.toString();
// define reducer
    buffer.writeln('final _\$$reducerName =combineReducers<$returnState>([');
    for (int i = 0; i < visitor.reducers.length; i++) {
      buffer.writeln(
          'TypedReducer<${visitor.reducers[i].stateType},${visitor.reducers[i].actionType}>(${visitor.reducers[i].functionName}),');
    }
    buffer.writeln(']);');
    // // define function
    // for (int i = 0; i < visitor.functions.length; i++) {
    //   print("---------difine Function------");
    //   buffer.writeln(
    //     '${visitor.functions[i].type} ${visitor.functions[i].name}(',
    //   );
    //   var parameters = visitor.functions[i].parameters;
    //   for (int p = 0; p < visitor.functions[i].parameters.length; p++) {
    //     buffer.writeln('${parameters[p].type} ${parameters[p].name},');
    //   }
    //   buffer.writeln(')=>');
    //   buffer.writeln('state.copyWith(loading: true, error: "");');
    // }
    print(buffer.toString());
    return buffer.toString();
  }

  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    throw UnimplementedError();
  }
}
