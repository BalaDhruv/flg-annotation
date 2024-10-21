import 'package:redux_annotations/redux_annotations.dart';

part 'action.g.dart';

@action
class Action {
  String? name;
  int? id;
  bool? isSuccess;
  double? amount;
  List<BidIncrementItemModel>? bidIncrementDetails;
}

@action
class SuccessAction {
  bool? isSuccess;
  List<BidIncrementItemModel>? bidIncrementDetails;
}

class BidIncrementItemModel {}

@action
class FailedAction {
  String? error;
}
