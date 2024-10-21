library generators;

import 'package:build/build.dart';
import 'package:generators/src/action_generator.dart';
import 'package:generators/src/json_generator.dart';
import 'package:generators/src/middleware_generator.dart';
import 'package:generators/src/reducer_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateJsonClass(BuilderOptions options) {
  return PartBuilder(
    [
      JsonGenerator(),
      ActionGenerator(),
      MiddlewareGenerator(),
      ReducerGenerator()
    ],
    '.g.dart',
  );
}
