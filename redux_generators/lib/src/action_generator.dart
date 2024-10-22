// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:redux_generators/src/model_visitor.dart';
import 'package:redux_annotations/redux_annotations.dart';
import 'package:source_gen/source_gen.dart';

class ActionGenerator extends GeneratorForAnnotation<ActionGenAnnotation> {
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
    String className = '${visitor.className}Gen';
    buffer.writeln('class $className {');
    for (int i = 0; i < visitor.fields.length; i++) {
      buffer.writeln(
        'final ${visitor.fields.values.elementAt(i)} ${visitor.fields.keys.elementAt(i)};',
      );
    }
    // CONSTRUCTOR
    buffer.writeln('const $className({');
    for (int i = 0; i < visitor.fields.length; i++) {
      buffer.writeln(
        'required this.${visitor.fields.keys.elementAt(i)},',
      );
    }
    buffer.writeln('});');

    //To String
    buffer.writeln('@override');
    buffer.writeln('String toString(){');
    List<String> varNameList = [];
    for (int i = 0; i < visitor.fields.length; i++) {
      String key = visitor.fields.keys.elementAt(i);
      varNameList.add('$key: \$$key');
    }
    buffer.writeln("return '$className { ${varNameList.join(', ')}}';");
    buffer.writeln('}');

    buffer.writeln('}');
    print('final Actiongenerator');
    // print(buffer.toString());
    // // Manually write the generated code to a file
    // final outputFilePath = buildStep.inputId.changeExtension('.action.dart').path;
    // final outputFile = File(outputFilePath);
    // outputFile.writeAsStringSync(buffer.toString());
    return buffer.toString();
  }
}
