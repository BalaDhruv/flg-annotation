import 'package:redux_annotations/redux_annotations.dart';
import 'package:redux/redux.dart';
part 'reducer.g.dart';

@reducer
class RemoveWatchlistReducer {
  RemoveWatchlistState? _setLoading(
      RemoveWatchlistState state, RemoveWatchlistAction action) {}

  RemoveWatchlistState? _removeWatchlistSuccess(
      RemoveWatchlistState state, RemoveWatchlistSuccessAction action) {}
  RemoveWatchlistState? _removeWatchlistFailed(
      RemoveWatchlistState state, RemoveWatchlistFailedAction action) {}
}

class RemoveWatchlistFailedAction {}

class RemoveWatchlistSuccessAction {}

class RemoveWatchlistState {}

class RemoveWatchlistAction {}
