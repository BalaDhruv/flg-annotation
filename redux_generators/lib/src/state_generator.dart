// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:redux_annotations/redux_annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:redux_generators/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class StateGenerator extends GeneratorForAnnotation<StateGenAnnotation> {
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);
    // print('element:$element');
    // print("annotatio :$annotation");
    // print("buildStep :$buildStep");
    print('inside stategenerat');
    final buffer = StringBuffer();

    String className = visitor.className;
    String classImpl = '_\$${className}Impl';
    String classImplCopywith = '_\$\$${className}ImplCopyWith';
    String classImplCopywithImpl = '__\$\$${className}ImplCopyWithImpl';
    String classCopyWith = '\$${className}CopyWith';
    String classCopyWithImpl = '_\$${className}CopyWithImpl';

    List<ParameterElement> constructorParameters =
        visitor.constructorParameters;
    for (var parameter in constructorParameters) {
      print('Parameter: ${parameter.name}, Type: ${parameter.type}');
    }
    //generate code like Freezed
    buffer.writeln('T _\$identity<T>(T value) => value;');

    buffer.writeln('final _privateConstructorUsedError = UnsupportedError(');
    buffer.writeln(
        "'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.);");
    // create Mixin
    buffer.writeln('mixin _\$$className {');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        '${constructorParameters[i].type} get ${constructorParameters[i].name} => throw _privateConstructorUsedError;',
      );
    }
    // create a copy of class
    buffer.writeln('/// Create a copy of SignUpState');
    buffer.writeln(
        '/// /// with the given fields replaced by the non-null parameter values.');
    buffer.writeln(' $classCopyWith<$className> get copyWith =>');
    buffer.writeln('throw _privateConstructorUsedError;');

    buffer.writeln('}');
    //define copywithFunction
    buffer.writeln('abstract class $classCopyWith<\$Res> {');
    buffer.writeln('factory $classCopyWith(');
    buffer.writeln('$className value, \$Res Function($className) then) =');
    buffer.writeln(' $classCopyWithImpl<\$Res, $className>;');
    buffer.writeln('\$Res call({');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        '${constructorParameters[i].type} ${constructorParameters[i].name},',
      );
    }
    buffer.writeln('});');

    // End of Genrate code
    return buffer.toString();
    /*
    // Get the AssetId (reference to the current file)
    final assetId = buildStep.inputId;

    // Read the entire file's content as a string
    final fileContent = await buildStep.readAsString(assetId);

    // Optionally, you can print or manipulate the content
    // print('File content for ${assetId.path}:\n$fileContent');

    // Return or process the content further
    print('inside stategenerat cose');
    // return 'File content:\n$fileContent';
    */

    // // --------------------Start Initial Generation Code--------------------//
    // buffer.writeln('// Initial Method');
    // buffer.writeln('$className _\$${className}Initial({ ');
    // for (int i = 0; i < visitor.fields.length; i++) {
    //   buffer.writeln(
    //     '${visitor.fields.values.elementAt(i).toString().contains('?') ? visitor.fields.values.elementAt(i).replaceFirst('?', '') : visitor.fields.values.elementAt(i)}? ${visitor.fields.keys.elementAt(i)},',
    //   );
    // }
    // buffer.writeln('})=>');
    // buffer.write('$className(');
    // for (int i = 0; i < visitor.fields.length; i++) {
    //   String dataType =
    //       visitor.fields.values.elementAt(i).toString().contains('?')
    //           ? visitor.fields.values.elementAt(i).replaceFirst('?', '')
    //           : visitor.fields.values.elementAt(i);
    //   if (dataType == 'bool') {
    //     buffer.writeln('${visitor.fields.keys.elementAt(i)} ?? false,');
    //   } else if (dataType == 'String') {
    //     buffer.writeln("${visitor.fields.keys.elementAt(i)} ?? '',");
    //   } else if (dataType == 'int') {
    //     buffer.writeln("${visitor.fields.keys.elementAt(i)} ?? 0,");
    //   } else if (dataType == 'double') {
    //     buffer.writeln("${visitor.fields.keys.elementAt(i)} ?? 0.0,");
    //   } else if (dataType == 'num') {
    //     buffer.writeln("${visitor.fields.keys.elementAt(i)} ?? 0,");
    //   } else if (dataType.contains('List')) {
    //     buffer.writeln("${visitor.fields.keys.elementAt(i)} ?? [],");
    //   } else if (dataType.contains('Map')) {
    //     buffer.writeln("${visitor.fields.keys.elementAt(i)} ?? {},");
    //   } else {
    //     buffer.writeln(
    //         "${visitor.fields.keys.elementAt(i)} ?? $dataType.empty(),");
    //   }
    // }
    // buffer.writeln(');');
    // buffer.toString();
    // // --------------------End Initial Generation Code--------------------//

    // // --------------------Start copyWith Generation Code--------------------//
    // buffer.writeln(
    //     "// Extension for a $className class to provide 'copyWith' method");
    // buffer.writeln('extension \$${className}Extension on $className {');
    // buffer.writeln('$className copyWith({');
    // for (int i = 0; i < visitor.fields.length; i++) {
    //   buffer.writeln(
    //     '${visitor.fields.values.elementAt(i).toString().contains('?') ? visitor.fields.values.elementAt(i).replaceFirst('?', '') : visitor.fields.values.elementAt(i)}? ${visitor.fields.keys.elementAt(i)},',
    //   );
    // }
    // buffer.writeln('}) {');
    // buffer.writeln('return $className(');
    // for (int i = 0; i < visitor.fields.length; i++) {
    //   buffer.writeln(
    //     "${visitor.fields.keys.elementAt(i)} ?? this.${visitor.fields.keys.elementAt(i)},",
    //   );
    // }
    // buffer.writeln(');');
    // buffer.writeln('}');
    // buffer.writeln('}');
    // --------------------End copyWith Generation Code--------------------//

// // full original method
//     buffer.writeln('class $className {');
//     for (int i = 0; i < visitor.fields.length; i++) {
//       buffer.writeln(
//         'final ${visitor.fields.values.elementAt(i)} ${visitor.fields.keys.elementAt(i)};',
//       );
//     }
//     // CONSTRUCTOR
//     buffer.writeln('$className(');
//     for (int i = 0; i < visitor.fields.length; i++) {
//       buffer.writeln(
//         'this.${visitor.fields.keys.elementAt(i)},',
//       );
//     }
//     buffer.writeln(');');

//     // Initial Method
//     buffer.writeln('factory $className.initial()=> $className(');
//     for (int i = 0; i < visitor.fields.length; i++) {
//       String dataType =
//           visitor.fields.values.elementAt(i).toString().contains('?')
//               ? visitor.fields.values.elementAt(i).replaceFirst('?', '')
//               : visitor.fields.values.elementAt(i);
//       if (dataType == 'bool') {
//         buffer.writeln('false,');
//       } else if (dataType == 'String') {
//         buffer.writeln("'',");
//       } else if (dataType == 'int') {
//         buffer.writeln("0,");
//       } else if (dataType == 'double') {
//         buffer.writeln("0.0,");
//       } else if (dataType == 'num') {
//         buffer.writeln("0,");
//       } else if (dataType.contains('List')) {
//         buffer.writeln("[],");
//       } else if (dataType.contains('Map')) {
//         buffer.writeln("{},");
//       } else {
//         buffer.writeln("$dataType.empty(),");
//       }
//     }
//     buffer.writeln(');');

//     // // TO MAP
//     // buffer.writeln('Map<String, dynamic> toMap() {');
//     // buffer.writeln('return {');
//     // for (int i = 0; i < visitor.fields.length; i++) {
//     //   buffer.writeln(
//     //     "'${visitor.fields.keys.elementAt(i)}': ${visitor.fields.keys.elementAt(i)},",
//     //   );
//     // }
//     // buffer.writeln('};');
//     // buffer.writeln('}');

//     // // FROM MAP
//     // buffer.writeln('factory $className.fromMap(Map<String, dynamic> map) {');
//     // buffer.writeln('return $className(');
//     // for (int i = 0; i < visitor.fields.length; i++) {
//     //   buffer.writeln(
//     //     "${visitor.fields.keys.elementAt(i)}: map['${visitor.fields.keys.elementAt(i)}'],",
//     //   );
//     // }
//     // buffer.writeln(');');
//     // buffer.writeln('}');

//     // copyWith
//     buffer.writeln('$className copyWith({');
//     for (int i = 0; i < visitor.fields.length; i++) {
//       buffer.writeln(
//         '${visitor.fields.values.elementAt(i).toString().contains('?') ? visitor.fields.values.elementAt(i).replaceFirst('?', '') : visitor.fields.values.elementAt(i)}? ${visitor.fields.keys.elementAt(i)},',
//       );
//     }
//     buffer.writeln('}) {');
//     buffer.writeln('return $className(');
//     for (int i = 0; i < visitor.fields.length; i++) {
//       buffer.writeln(
//         "${visitor.fields.keys.elementAt(i)} ?? this.${visitor.fields.keys.elementAt(i)},",
//       );
//     }
//     buffer.writeln(');');
//     buffer.writeln('}');

//     // == Method
//     buffer.writeln('@override');
//     buffer.writeln('bool operator ==(other) =>');
//     buffer.writeln('identical(this, other) ||');
//     buffer.writeln('other is $className &&');
//     buffer.writeln('runtimeType == other.runtimeType');
//     for (int i = 0; i < visitor.fields.length; i++) {
//       buffer.writeln(
//         "&& ${visitor.fields.keys.elementAt(i)} == other.${visitor.fields.keys.elementAt(i)}",
//       );
//     }
//     buffer.writeln(';');

//     // HashCode Method
//     buffer.writeln('@override');
//     buffer.writeln('int get hashCode =>');
//     buffer.writeln('super.hashCode ^');
//     buffer.writeln('runtimeType.hashCode ');
//     for (int i = 0; i < visitor.fields.length; i++) {
//       buffer.writeln(
//         "^ ${visitor.fields.keys.elementAt(i)}.hashCode",
//       );
//     }
//     buffer.writeln(';');

//     buffer.writeln('}');
//     print('final stategenerator');
//     print(buffer.toString());
//     // // Manually write the generated code to a file
//     // final outputFilePath = buildStep.inputId.changeExtension('.g.dart').path;
//     // final outputFile = File(outputFilePath);
//     // outputFile.writeAsStringSync(buffer.toString());
//     return buffer.toString();
  }
}
