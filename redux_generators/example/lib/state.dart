import 'package:redux_annotations/redux_annotations.dart';
part 'state.g.dart';

@ReduxState
class SignUpState with _$SignUpState {
  const factory SignUpState({
    bool? loading,
    bool? isSignedUp,
    String? error,
  }) = _SignUpState;

  factory SignUpState.initial() => _$SignUpStateInitial();
  // final bool loading;
  // final bool isSignedUp;
  // final String error;
  // SignUpState(this.loading, this.isSignedUp, this.error);
}
