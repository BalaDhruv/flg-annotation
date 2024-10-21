// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// ActionGenerator
// **************************************************************************

class ActionGen {
  final String? name;
  final int? id;
  final bool? isSuccess;
  final double? amount;
  final List<BidIncrementItemModel>? bidIncrementDetails;
  const ActionGen({
    required this.name,
    required this.id,
    required this.isSuccess,
    required this.amount,
    required this.bidIncrementDetails,
  });
  @override
  String toString() {
    return 'ActionGen { name: $name, id: $id, isSuccess: $isSuccess, amount: $amount, bidIncrementDetails: $bidIncrementDetails}';
  }
}

class SuccessActionGen {
  final bool? isSuccess;
  final List<BidIncrementItemModel>? bidIncrementDetails;
  const SuccessActionGen({
    required this.isSuccess,
    required this.bidIncrementDetails,
  });
  @override
  String toString() {
    return 'SuccessActionGen { isSuccess: $isSuccess, bidIncrementDetails: $bidIncrementDetails}';
  }
}

class FailedActionGen {
  final String? error;
  const FailedActionGen({
    required this.error,
  });
  @override
  String toString() {
    return 'FailedActionGen { error: $error}';
  }
}
