// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reducer.dart';

// **************************************************************************
// ReducerGenerator
// **************************************************************************

final signUpReducer = combineReducers<SignUpState>([
  TypedReducer<SignUpState, Action>(setLoading),
  TypedReducer<SignUpState, SuccessActionGen>(removeWatchlistSuccess),
  TypedReducer<SignUpState, FailedActionGen>(removeWatchlistFailed),
]);
SignUpState setLoading(
  SignUpState state,
  ActionGen action,
) =>
    state.copyWith(loading: true, error: "");
SignUpState removeWatchlistSuccess(
  SignUpState state,
  SuccessActionGen action,
) =>
    state.copyWith(loading: true, error: "");
SignUpState removeWatchlistFailed(
  SignUpState state,
  FailedActionGen action,
) =>
    state.copyWith(loading: true, error: "");
