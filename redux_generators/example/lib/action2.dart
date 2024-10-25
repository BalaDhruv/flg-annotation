import 'package:redux_annotations/redux_annotations.dart';

part 'action2.a.dart';

// @ReduxAction
class SetAction with _$SetAction {
  factory SetAction({
    String? name,
    bool? isSuccess,
    double? amount,
    List<BidIncrementItemModel>? bidIncrementDetails,
  }) = _SetAction;
}

// @ReduxAction
class SetSuccessAction with _$SetSuccessAction {
  factory SetSuccessAction({
    bool? isSuccess,
    List<BidIncrementItemModel>? bidIncrementDetails,
  }) = _SetSuccessAction;
}

class BidIncrementItemModel {}

// @ReduxAction
class SetFailedAction with _$SetFailedAction {
  factory SetFailedAction({
    String? error,
  }) = _SetFailedAction;
}
