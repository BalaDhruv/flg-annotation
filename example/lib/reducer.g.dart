// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reducer.dart';

// **************************************************************************
// ReducerGenerator
// **************************************************************************

final removeWatchlistReducer = combineReducers<RemoveWatchlistState>([
  TypedReducer<RemoveWatchlistState, RemoveWatchlistAction>(_setLoading),
  TypedReducer<RemoveWatchlistState, RemoveWatchlistSuccessAction>(
      _removeWatchlistSuccess),
  TypedReducer<RemoveWatchlistState, RemoveWatchlistFailedAction>(
      _removeWatchlistFailed),
]);
RemoveWatchlistState _setLoading(
  RemoveWatchlistState state,
  RemoveWatchlistAction action,
) =>
    state.copyWith(loading: true, error: "");
RemoveWatchlistState _removeWatchlistSuccess(
  RemoveWatchlistState state,
  RemoveWatchlistSuccessAction action,
) =>
    state.copyWith(loading: true, error: "");
RemoveWatchlistState _removeWatchlistFailed(
  RemoveWatchlistState state,
  RemoveWatchlistFailedAction action,
) =>
    state.copyWith(loading: true, error: "");
