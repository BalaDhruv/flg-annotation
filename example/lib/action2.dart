import 'package:redux_annotations/redux_annotations.dart';

part 'action2.g.dart';

@ReduxAction
class SetAction with _$SetAction {
  factory SetAction({
    String? name,
    bool? isSuccess,
    double? amount,
    List<IncrementItemModel>? bidIncrementDetails,
  }) = _SetAction;
}

@ReduxAction
class SetSuccessAction with _$SetSuccessAction {
  factory SetSuccessAction({
    bool? isSuccess,
    List<IncrementItemModel>? bidIncrementDetails,
  }) = _SetSuccessAction;
}

class IncrementItemModel {}

@ReduxAction
class SetFailedAction with _$SetFailedAction {
  factory SetFailedAction({
    String? error,
  }) = _SetFailedAction;
}
