// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

class PersonGen {
  final String? name;
  final String? yourName;
  final bool? isAdult;
  final int? age;
  const PersonGen({
    required this.name,
    required this.yourName,
    required this.isAdult,
    required this.age,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'yourName': yourName,
      'isAdult': isAdult,
      'age': age,
    };
  }

  factory PersonGen.fromMap(Map<String, dynamic> map) {
    return PersonGen(
      name: map['name'],
      yourName: map['yourName'],
      isAdult: map['isAdult'],
      age: map['age'],
    );
  }
  PersonGen copyWith({
    String? name,
    String? yourName,
    bool? isAdult,
    int? age,
  }) {
    return PersonGen(
      name: name ?? this.name,
      yourName: yourName ?? this.yourName,
      isAdult: isAdult ?? this.isAdult,
      age: age ?? this.age,
    );
  }
}
