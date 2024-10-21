import 'package:redux_annotations/redux_annotations.dart';
import 'package:examble/middleware.dart';
part 'person.g.dart';

@jsonGen
class Person {
  String? name;
  String? yourName;
  bool? isAdult;
  int? age;
  Person({
    required this.name,
    required this.yourName,
    required this.isAdult,
    required this.age,
  });
}
