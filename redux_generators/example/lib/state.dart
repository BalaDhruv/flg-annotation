import 'package:redux_annotations/redux_annotations.dart';
part 'state.g.dart';

@ReduxState
class SignUpState {
  const factory SignUpState({
    required bool loading,
    required bool isSignedUp,
    required String error,
  }) = _SignUpState;

  factory SignUpState.initial() => _$SignUpStateInitial();
  // final bool loading;
  // final bool isSignedUp;
  // final String error;
  // SignUpState(this.loading, this.isSignedUp, this.error);
}
