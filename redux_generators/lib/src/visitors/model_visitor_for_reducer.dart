// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ModelVisitorForReducer extends SimpleElementVisitor<void> {
  final List<ReducerInfo> reducers = [];

  @override
  void visitFunctionElement(FunctionElement element) {
    // Check if the function has the @Reduxeducer annotation
    print('------inside reducer Fuction ------');
    for (var annotation in element.metadata) {
      print('------inside reducer Fuction in element.metadata------');
      // Collect function details for the reducer
      final functionName = element.name;
      final stateType = element.parameters.first.type;
      final actionType = element.parameters.last.type;
      final functionReturnType = element.returnType;
      print('functionReturnType : $functionReturnType');
      print('functionName : $functionName');
      print('stateType : $stateType');
      print('actionType : $actionType');

      reducers.add(
          ReducerInfo(functionReturnType, functionName, stateType, actionType));
    }
  }
}

class ReducerInfo {
  final DartType functionReturnType;
  final String functionName;
  final DartType stateType;
  final DartType actionType;

  ReducerInfo(this.functionReturnType, this.functionName, this.stateType,
      this.actionType);
}
