// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generators/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class MiddlewareGenerator
    extends GeneratorForAnnotation<MiddlewareGenAnnotation> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);
    print('inside MiddlewareGenerat');
    final buffer = StringBuffer();
    String lowercaseFirstLetter(String str) {
      if (str.isEmpty) return str;

      return str[0].toLowerCase() + str.substring(1);
    }

    String middName = lowercaseFirstLetter(visitor.className);
    // buffer.writeln("import 'package:redux/redux.dart';");
    buffer.writeln('Middleware<AppState> $middName(Repository repository){');
    buffer.writeln(
        'return (Store<AppState> store,action,NextDispatcher dispatch)async{ ');
    buffer.writeln('dispatch(action);');
    buffer.writeln('try{');
    buffer.writeln('// TODO: Write here your middleware logic and api calls');
    buffer.writeln('} catch (error){');
    buffer.writeln('// TODO: API Error handling');
    buffer.writeln('}');
    buffer.writeln('};');
    buffer.writeln('}');
    return buffer.toString();
  }
}
