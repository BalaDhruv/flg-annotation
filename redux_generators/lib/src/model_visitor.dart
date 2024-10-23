// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  String className = '';
  Map<String, dynamic> fields = {};
  final List<FunctionInfo> functions = [];
  List<ParameterElement> constructorParameters = [];

  @override
  void visitConstructorElement(ConstructorElement element) {
    final returnType = element.returnType.toString();
    className = returnType.replaceFirst('*', '');
    print('----inside construct element -----');
    if (element.isFactory) {
      print('----inside construct element infactory -----');
      for (var i = 0; i < element.parameters.length; i++) {
        print(
            'parameters: name = ${element.parameters[i].name} , type = ${element.parameters[i].type}');
      }

      print(className);
      if (element.parameters.isNotEmpty) {
        constructorParameters.addAll(element.parameters);
      }
      print(constructorParameters);
    }
  }

  @override
  void visitFieldElement(FieldElement element) {
    fields[element.name] = element.type.toString().replaceFirst('*', '');
  }

  @override
  void visitFunctionElement(FunctionElement element) {
    functions.add(FunctionInfo(
      name: element.name,
      type: element.returnType
          .getDisplayString()
          .toString()
          .replaceFirst('*', ''),
      parameters: element.parameters
          .map((param) => ParametersInfo(
              name: param.name,
              type: param.type
                  .getDisplayString()
                  .toString()
                  .replaceFirst('*', '')))
          .toList(),
    ));
  }

  @override
  void visitMethodElement(MethodElement element) {
    // Capture the method name and its parameters
    print(
      element.returnType
          .getDisplayString(withNullability: false)
          .toString()
          .replaceFirst('*', ''),
    );
    functions.add(FunctionInfo(
      name: element.name,
      type: element.returnType
          .getDisplayString(withNullability: false)
          .toString()
          .replaceFirst('*', ''),
      parameters: element.parameters.map((param) {
        print(param.type.getDisplayString().toString().replaceFirst("*", ''));
        return ParametersInfo(
            name: param.name,
            type:
                param.type.getDisplayString().toString().replaceFirst("*", ''));
      }).toList(),
    ));
  }
}

class FunctionInfo {
  final String name;
  final String type;
  final List<ParametersInfo> parameters;

  FunctionInfo(
      {required this.name, required this.parameters, required this.type});

  @override
  String toString() {
    return 'Function: $name, Parameters: $parameters, type : $type';
  }
}

class ParametersInfo {
  String type;
  String name;
  ParametersInfo({required this.name, required this.type});

  @override
  String toString() {
    return 'type: $type, name: $name';
  }
}
