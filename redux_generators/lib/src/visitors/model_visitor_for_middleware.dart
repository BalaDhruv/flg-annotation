// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ModelVisitorForMiddleware extends SimpleElementVisitor<void> {
  final List<MiddlewareInfo> middlewares = [];

  @override
  void visitFunctionElement(FunctionElement element) {
    // Check if the function has the @Reduxeducer annotation
    print('------inside Middleware Fuction ------');
    for (var annotation in element.metadata) {
      print('------inside Middleware Fuction in element.metadata------');
      // Collect function details for the reducer
      final functionName = element.name;
      // final stateType = element.parameters.first.type;
      // final actionType = element.parameters.last.type;
      final functionReturnType = element.returnType;
      print('functionReturnType : $functionReturnType');
      print('functionName : $functionName');
      // print('stateType : $stateType');
      // print('actionType : $actionType');

      middlewares.add(MiddlewareInfo(functionReturnType, functionName));
    }
  }
}

class MiddlewareInfo {
  final DartType functionReturnType;
  final String functionName;
  // final DartType stateType;
  // final DartType actionType;

  MiddlewareInfo(
    this.functionReturnType,
    this.functionName,
  );
}
