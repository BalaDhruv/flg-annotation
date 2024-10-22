import 'package:examble/state.dart';
import 'package:redux_annotations/redux_annotations.dart';
part 'state.g.dart';

@ReduxState
class SignUpState {
  // const factory SignUpState({
  //   bool? loading,
  //   bool? isSignedUp,
  //   String? error,
  // }) = _SignUpState;
  final bool loading;
  final bool isSignedUp;
  final String error;
  SignUpState(this.loading, this.isSignedUp, this.error);
  factory SignUpState.initial() => _$SignUpStateInitial();
}
