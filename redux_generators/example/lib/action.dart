import 'package:redux_annotations/redux_annotations.dart';

part 'action.g.dart';

@ReduxAction
class GetAction with _$GetAction {
  factory GetAction({
    String? name,
    int? id,
    bool? isSuccess,
    double? amount,
    List<BidIncrementItemModel>? bidIncrementDetails,
  }) = _GetAction;
}

@ReduxAction
class SuccessAction with _$SuccessAction {
  factory SuccessAction({
    bool? isSuccess,
    List<BidIncrementItemModel>? bidIncrementDetails,
  }) = _SuccessAction;
}

class BidIncrementItemModel {}

@ReduxAction
class FailedAction with _$FailedAction {
  factory FailedAction({
    String? error,
  }) = _FailedAction;
}
