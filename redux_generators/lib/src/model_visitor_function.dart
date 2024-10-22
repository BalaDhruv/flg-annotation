// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ModelVisitorFunction extends SimpleElementVisitor<void> {
  final BuildStep buildStep;
  List<String> returnStatements = []; // List to store return statements

  ModelVisitorFunction(this.buildStep);

  @override
  void visitMethodElement(MethodElement element) {
    super.visitMethodElement(element); // Visit the method
    _extractReturnStatements(element); // Extract return statements
  }

  Future<void> _extractReturnStatements(MethodElement element) async {
    // Get the resolved library
    var resolvedLibrary =
        await element.session?.getResolvedLibraryByElement(element.library);

    // Find the declaration of the method in the source
    var unit = resolvedLibrary!.getElementDeclaration(element);
    var node = unit!.node as MethodDeclaration;

    // Traverse the method body to find return statements
    node.body.visitChildren(ReturnVisitor(returnStatements) as AstVisitor);
  }
}

extension on SomeResolvedLibraryResult {
  getElementDeclaration(MethodElement element) {}
}

class ReturnVisitor {
  final List<String> returnStatements;

  ReturnVisitor(this.returnStatements);

  @override
  void visitReturnStatement(ReturnStatement node) {
    // Add the return expression to the list
    returnStatements.add(node.toSource());
  }
}

class MyCodeGenerator extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final output = StringBuffer();

    // Iterate through all the classes in the library
    for (var annotatedElement in library.classes) {
      final visitor = ModelVisitorFunction(buildStep);
      annotatedElement.visitChildren(visitor);

      // Access extracted return statements
      for (var returnStatement in visitor.returnStatements) {
        output.writeln('// Return statement: $returnStatement');
      }
    }

    return output.toString();
  }
}
