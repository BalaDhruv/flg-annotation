import 'package:redux_annotations/redux_annotations.dart';

part 'action.g.dart';

@ReduxAction
class Action {
  String? name;
  int? id;
  bool? isSuccess;
  double? amount;
  List<BidIncrementItemModel>? bidIncrementDetails;
}

@ReduxAction
class SuccessAction {
  bool? isSuccess;
  List<BidIncrementItemModel>? bidIncrementDetails;
}

class BidIncrementItemModel {}

@ReduxAction
class FailedAction {
  String? error;
}
