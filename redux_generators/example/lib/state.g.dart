// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StateGenerator
// **************************************************************************

// Initial Method
SignUpState _$SignUpStateInitial({
  bool? loading,
  bool? isSignedUp,
  String? error,
}) =>
    SignUpState(
      loading ?? false,
      isSignedUp ?? false,
      error ?? '',
    );

// Extension for a SignUpState class to provide 'copyWith' method
extension $SignUpStateExtension on SignUpState {
  SignUpState copyWith({
    bool? loading,
    bool? isSignedUp,
    String? error,
  }) {
    return SignUpState(
      loading ?? this.loading,
      isSignedUp ?? this.isSignedUp,
      error ?? this.error,
    );
  }
}
