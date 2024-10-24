// ignore_for_file: implementation_imports, depend_on_referenced_packages

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
    String concreteClassName = '_$className';
    String classImpl = '_\$${className}Impl';
    String classImplCopywith = '_\$\$${className}ImplCopyWith';
    String classImplCopywithImpl = '__\$\$${className}ImplCopyWithImpl';
    String classCopyWith = '\$${className}CopyWith';
    String classCopyWithImpl = '_\$${className}CopyWithImpl';

    List<ParameterElement> constructorParameters =
        visitor.constructorParameters;
    // for (var parameter in constructorParameters) {
    //   print('Parameter: ${parameter.name}, Type: ${parameter.type}');
    // }
    //generate code like Freezed
    buffer.writeln('T _\$identity<T>(T value) => value;');

    buffer.writeln('final _privateConstructorUsedError = UnsupportedError(');
    buffer.writeln(
        "'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by ReduxAnnotations and you are not supposed to need it nor use it.');");
// ------- Initail method -----------
    buffer.writeln('// Initial Method');
    buffer.writeln('$className _\$${className}Initial({ ');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        '${constructorParameters[i].type.toString().contains('?') ? constructorParameters[i].type.toString().replaceFirst('?', '') : constructorParameters[i].type}? ${constructorParameters[i].name},',
      );
    }
    buffer.writeln('})=>');
    buffer.write('$className(');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      String dataType = constructorParameters[i].type.toString().contains('?')
          ? constructorParameters[i].type.toString().replaceFirst('?', '')
          : constructorParameters[i].type.toString();
      String varName = constructorParameters[i].name;
      if (dataType == 'bool') {
        buffer.writeln(' $varName: $varName ?? false,');
      } else if (dataType == 'String') {
        buffer.writeln("$varName: $varName ?? '',");
      } else if (dataType == 'int') {
        buffer.writeln("$varName: $varName ?? 0,");
      } else if (dataType == 'double') {
        buffer.writeln("$varName: $varName ?? 0.0,");
      } else if (dataType == 'num') {
        buffer.writeln("$varName: $varName ?? 0,");
      } else if (dataType.contains('List')) {
        buffer.writeln("$varName: $varName ?? [],");
      } else if (dataType.contains('Map')) {
        buffer.writeln("$varName: $varName ?? {},");
      } else {
        buffer.writeln("$varName: $varName ?? $dataType.empty(),");
      }
    }
    buffer.writeln(');');
// ----------------- End Initail method -------------
    // ----------------- create Mixin -----------------
    buffer.writeln('mixin _\$$className {');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        '${constructorParameters[i].type} get ${constructorParameters[i].name} => throw _privateConstructorUsedError;',
      );
    }
    // create a copy of class
    buffer.writeln('/// Create a copy of $className');
    buffer.writeln(
        '/// with the given fields replaced by the non-null parameter values.');
    buffer.writeln(' $classCopyWith<$className> get copyWith =>');
    buffer.writeln('throw _privateConstructorUsedError;');

    buffer.writeln('}');
    // ----------------- End create Mixin -----------------
    // ----------------- Create classcopywith -----------------
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
    buffer.writeln('}');
// ----------------- End define classcopywith -----------------
    // -----------------Create ClassCopyWithImplementations -----------------
    buffer.writeln(
        'class $classCopyWithImpl<\$Res, \$Val extends $className> implements $classCopyWith<\$Res> {');
    buffer.writeln('$classCopyWithImpl(this._value, this._then);');

    buffer.writeln('// ignore: unused_field');
    buffer.writeln('final \$Val _value;');
    buffer.writeln(' // ignore: unused_field');
    buffer.writeln(' final \$Res Function(\$Val) _then;');

    buffer.writeln(' /// Create a copy of $className');
    buffer.writeln(
        ' /// with the given fields replaced by the non-null parameter values.');
    buffer.writeln(" @pragma('vm:prefer-inline')");
    buffer.writeln(' @override');
    buffer.writeln('\$Res call({');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        'Object? ${constructorParameters[i].name} = ReduxState ,',
      );
    }
    buffer.writeln('}) {');
    buffer.writeln(' return _then(_value.copyWith(');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        '${constructorParameters[i].name}: ReduxState == ${constructorParameters[i].name} ? _value.${constructorParameters[i].name} : ${constructorParameters[i].name} as ${constructorParameters[i].type} ,',
      );
    }
    buffer.writeln(' ) as \$Val);');
    buffer.writeln('}');
    buffer.writeln('}');
// ----------------- End Create ClassCopyWithImplementations -----------------
    // ----------------- Create classImplCopywith -----------------
    buffer.writeln(
        'abstract class $classImplCopywith<\$Res> implements $classCopyWith<\$Res> {');
    buffer.writeln(
        'factory $classImplCopywith($classImpl value, \$Res Function($classImpl) then)=$classImplCopywithImpl<\$Res>;');
    buffer.writeln('@override');
    buffer.writeln('\$Res call({');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        '${constructorParameters[i].type} ${constructorParameters[i].name},',
      );
    }
    buffer.writeln('});');
    buffer.writeln('}');
    // ----------------- End Create classImplCopywith -----------------
// ----------------- Create classImplCopywithImpl -----------------
    buffer.writeln(
        'class $classImplCopywithImpl<\$Res> extends $classCopyWithImpl<\$Res, $classImpl> implements $classImplCopywith<\$Res> {');
    buffer.writeln(
        '$classImplCopywithImpl( $classImpl _value, \$Res Function($classImpl) _then): super(_value, _then);');
    buffer.writeln('/// Create a copy of $className');
    buffer.writeln(
        '/// with the given fields replaced by the non-null parameter values.');
    buffer.writeln(" @pragma('vm:prefer-inline')");
    buffer.writeln('@override');
    buffer.writeln(' \$Res call({');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        'Object? ${constructorParameters[i].name} = ReduxState ,',
      );
    }
    buffer.writeln('}) {');
    buffer.writeln('return _then($classImpl(');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        '${constructorParameters[i].name}: ReduxState == ${constructorParameters[i].name} ? _value.${constructorParameters[i].name} : ${constructorParameters[i].name} as ${constructorParameters[i].type} ,',
      );
    }
    buffer.writeln('));');
    buffer.writeln('}');
    buffer.writeln('}');
// -----------------End Create classImplCopywithImpl -----------------

    // ----------------- Create concrete class(classImpl) for _class -----------------
    buffer.writeln('class $classImpl implements $concreteClassName {');
    // Actual Constructor
    buffer.writeln('const $classImpl({');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        'this.${constructorParameters[i].name},',
      );
    }
    buffer.writeln('});');
    // Actual Variables
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln('@override');
      buffer.writeln(
        'final ${constructorParameters[i].type} ${constructorParameters[i].name};',
      );
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

    // Actual == Mehtod
    buffer.writeln('@override');
    buffer.writeln('bool operator ==(Object other) {');
    buffer.writeln(
        'return identical(this, other) || (other.runtimeType == runtimeType');
    buffer.writeln(' && other is $classImpl ');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        '&& (identical(other.${constructorParameters[i].name}, ${constructorParameters[i].name}) || other.${constructorParameters[i].name} == ${constructorParameters[i].name})',
      );
    }
    buffer.writeln(');}');

    // // Actual hashcode Method
    buffer.writeln('@override');
    buffer.writeln('int get hashCode => Object.hash(runtimeType,');
    for (int i = 0; i < visitor.constructorParameters.length; i++) {
      buffer.writeln(
        '${constructorParameters[i].name},',
      );
    }
    buffer.writeln(');');
    // Create a copy of SignUpState
    /// with the given fields replaced by the non-null parameter values.
    buffer.writeln('@override');
    buffer.writeln("@pragma('vm:prefer-inline')");
    buffer.writeln(' $classImplCopywith<$classImpl> get copyWith =>');
    buffer.writeln('$classImplCopywithImpl<$classImpl>(this, _\$identity);');

    buffer.writeln('}');
    // ----------------- End Create concrete class(classImpl) for _class -----------------

    // ----------------- create concrete class(_class) for class -----------------
    buffer.writeln('abstract class $concreteClassName implements $className {');
    buffer.writeln('const factory $concreteClassName({');
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
    buffer.writeln('/// Create a copy of $className');
    buffer.writeln(
        '/// with the given fields replaced by the non-null parameter values.');
    buffer.writeln('@override');
    buffer.writeln(
        '  $classImplCopywith<$classImpl> get copyWith =>throw _privateConstructorUsedError;');

    buffer.writeln('}');
    // ----------------- End create concrete class(_class) for class -----------------

    // ----------------- End of Genrate code -----------------
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
