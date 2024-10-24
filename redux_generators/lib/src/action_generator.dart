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
    String className = visitor.className;
    String concreteClassName = '_$className';
    String classImpl = '_\$${className}Impl';
    // String classImplCopywith = '_\$\$${className}ImplCopyWith';
    // String classImplCopywithImpl = '__\$\$${className}ImplCopyWithImpl';
    // String classCopyWith = '\$${className}CopyWith';
    // String classCopyWithImpl = '_\$${className}CopyWithImpl';
    List<ParameterElement> constructorParameters =
        visitor.constructorParameters;
    // helper function

    buffer.writeln('final _privateConstructorUsedError = UnsupportedError(');
    buffer.writeln(
        "'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by ReduxAnnotations and you are not supposed to need it nor use it.');");
    // ----------------- create Mixin -----------------
    buffer.writeln('mixin _\$$className {');
    // Getter
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        '${constructorParameters[i].type} get ${constructorParameters[i].name} => throw _privateConstructorUsedError;',
      );
    }
    // Setter
    buffer.writeln(' // Setter');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        'set ${constructorParameters[i].name} (${constructorParameters[i].type} value) => throw _privateConstructorUsedError;',
      );
    }
    buffer.writeln('}');
    // ----------------- End create Mixin -----------------
    // ----------------- Create concrete class(classImpl) for _class -----------------
    buffer.writeln('class $classImpl implements $concreteClassName {');
    // Private fields to store data
    buffer.writeln(' // Private fields to store data');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        '${constructorParameters[i].type} _${constructorParameters[i].name};',
      );
    }
    // Actual Constructor
    buffer.writeln('$classImpl({');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        '${constructorParameters[i].type} ${constructorParameters[i].name},',
      );
    }
    buffer.writeln('}) :');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        '_${constructorParameters[i].name} = ${constructorParameters[i].name} ${(i + 1) == visitor.constructorParameters.length ? '' : ','}',
      );
    }
    buffer.writeln(';');
    // Actual Variables
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln('@override');
      buffer.writeln(
        '${constructorParameters[i].type} get ${constructorParameters[i].name} => _${constructorParameters[i].name} ;',
      );
    }

    // Setters for each field
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln('@override');
      buffer.writeln(
          'set ${constructorParameters[i].name}(${constructorParameters[i].type} value) { _${constructorParameters[i].name} = value;}');
    }
    // Actual toString Method
    List<String> toStringList = constructorParameters.map(
      (e) {
        return '${e.name} : \$${e.name}';
      },
    ).toList();
    buffer.writeln('@override');
    buffer.writeln('String toString() {');
    buffer.writeln(" return '$className(${toStringList.join(', ')})';");
    buffer.writeln('}');

    buffer.writeln('}');
    // ----------------- End Create concrete class(classImpl) for _class -----------------

    // ----------------- create concrete class(_class) for class -----------------
    buffer.writeln('abstract class $concreteClassName implements $className {');
    buffer.writeln('factory $concreteClassName({');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        'final ${constructorParameters[i].type} ${constructorParameters[i].name},',
      );
    }
    buffer.writeln('}) = $classImpl;');

    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln('@override');
      buffer.writeln(
        '${constructorParameters[i].type} get ${constructorParameters[i].name};',
      );
    }
    // New setters for each field
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln('@override');
      buffer.writeln(
        'set ${constructorParameters[i].name}(${constructorParameters[i].type} value);',
      );
    }
    buffer.writeln('}');
    // ----------------- End create concrete class(_class) for class -----------------
    return buffer.toString();
/*
    //  Actual Actions
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
    */
  }
}
