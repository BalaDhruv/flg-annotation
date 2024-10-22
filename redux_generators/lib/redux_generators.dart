library redux_generators;

import 'package:build/build.dart';
import 'package:redux_generators/src/action_generator.dart';
import 'package:redux_generators/src/state_generator.dart';
import 'package:redux_generators/src/middleware_generator.dart';
import 'package:redux_generators/src/reducer_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateReduxcode(BuilderOptions options) {
  return PartBuilder(
    [
      StateGenerator(),
      ActionGenerator(),
      MiddlewareGenerator(),
      ReducerGenerator()
    ],
    '.g.dart',
  );
}
