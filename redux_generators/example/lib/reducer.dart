import 'package:examble/action.dart';
import 'package:examble/state.dart';
import 'package:redux_annotations/redux_annotations.dart';
import 'package:redux/redux.dart';
part 'reducer.g.dart';

@ReduxReducer
class SignUpReducer {
SignUpState setLoading(SignUpState state, Action action) =>
    state.copyWith(isSignedUp: false);
      SignUpState removeWatchlistSuccess(SignUpState state, SuccessAction action) =>
       state.copyWith(isSignedUp: );
  SignUpState removeWatchlistFailed(SignUpState state, FailedAction action) =>
     state.copyWith(isSignedUp: false);
}
