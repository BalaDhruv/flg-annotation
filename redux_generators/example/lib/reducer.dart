import 'package:examble/action.dart';
import 'package:examble/state.dart';
import 'package:redux_annotations/redux_annotations.dart';
import 'package:redux/redux.dart';
part 'reducer.a.dart';

final signUpStateReducer = _$signUpStateReducer;
// @ReduxReducer
SignUpState setLoading(SignUpState state, GetAction action) =>
    state.copyWith(isSignedUp: true);
// @ReduxReducer
SignUpState removeWatchlistSuccess(SignUpState state, SuccessAction action) =>
    state.copyWith(isSignedUp: true);
// @ReduxReducer
SignUpState removeWatchlistFailed(SignUpState state, FailedAction action) =>
    state.copyWith(isSignedUp: false);
