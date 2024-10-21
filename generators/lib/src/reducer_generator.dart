// ignore_for_file: implementation_imports, depend_on_referenced_packages
import 'package:analyzer/dart/element/element.dart';
import 'package:redux_annotations/redux_annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generators/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class ReducerGenerator extends GeneratorForAnnotation<ReducerGenAnnotation> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);
    print('inside Actiongenerat');
    final buffer = StringBuffer();
    String lowercaseFirstLetter(String str) {
      if (str.isEmpty) return str;

      return str[0].toLowerCase() + str.substring(1);
    }

    // String uppercaseFirstLetter(String str) {
    //   if (str.isEmpty) return str;

    //   return str[0].toUpperCase() + str.substring(1);
    // }

    String reducerName = lowercaseFirstLetter(visitor.className);
    String returnState = visitor.functions.first.type;
    // buffer.writeln("import 'package:redux/redux.dart';");
//define reducer
    buffer.writeln('final $reducerName =combineReducers<$returnState>([');
    for (int i = 0; i < visitor.functions.length; i++) {
      buffer.writeln(
          'TypedReducer<${visitor.functions[i].type},${visitor.functions[i].parameters.last.type != 'dynamic' ? visitor.functions[i].parameters.last.type : visitor.functions[i].parameters.last.name}>(${visitor.functions[i].name}),');
    }
    buffer.writeln(']);');
    // define function
    for (int i = 0; i < visitor.functions.length; i++) {
      print("---------difine Function------");
      buffer.writeln(
        '${visitor.functions[i].type} ${visitor.functions[i].name}(',
      );
      var parameters = visitor.functions[i].parameters;
      for (int p = 0; p < visitor.functions[i].parameters.length; p++) {
        buffer.writeln('${parameters[p].type} ${parameters[p].name},');
      }
      buffer.writeln(')=>');
      buffer.writeln('state.copyWith(loading: true, error: "");');
    }
    print(buffer.toString());
    return buffer.toString();
  }
}
