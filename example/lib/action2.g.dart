// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action2.dart';

// **************************************************************************
// ActionGenerator
// **************************************************************************

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by ReduxAnnotations and you are not supposed to need it nor use it.');
mixin _$SetAction {
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  set isSuccess(bool? value) => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  set amount(double? value) => throw _privateConstructorUsedError;
  List<BidIncrementItemModel>? get bidIncrementDetails =>
      throw _privateConstructorUsedError;
  set bidIncrementDetails(List<BidIncrementItemModel>? value) =>
      throw _privateConstructorUsedError;
}

class _$SetActionImpl implements _SetAction {
  _$SetActionImpl({
    this.name,
    this.isSuccess,
    this.amount,
    this.bidIncrementDetails,
  });
  @override
  String? name;
  @override
  bool? isSuccess;
  @override
  double? amount;
  @override
  List<BidIncrementItemModel>? bidIncrementDetails;
  @override
  String toString() {
    return 'SetAction(name : $name, isSuccess : $isSuccess, amount : $amount, bidIncrementDetails : $bidIncrementDetails)';
  }
}

abstract class _SetAction implements SetAction {
  factory _SetAction({
    final String? name,
    final bool? isSuccess,
    final double? amount,
    final List<BidIncrementItemModel>? bidIncrementDetails,
  }) = _$SetActionImpl;
  @override
  String? get name;
  @override
  set name(String? value);
  @override
  bool? get isSuccess;
  @override
  set isSuccess(bool? value);
  @override
  double? get amount;
  @override
  set amount(double? value);
  @override
  List<BidIncrementItemModel>? get bidIncrementDetails;
  @override
  set bidIncrementDetails(List<BidIncrementItemModel>? value);
}

mixin _$SetSuccessAction {
  bool? get isSuccess => throw _privateConstructorUsedError;
  set isSuccess(bool? value) => throw _privateConstructorUsedError;
  List<BidIncrementItemModel>? get bidIncrementDetails =>
      throw _privateConstructorUsedError;
  set bidIncrementDetails(List<BidIncrementItemModel>? value) =>
      throw _privateConstructorUsedError;
}

class _$SetSuccessActionImpl implements _SetSuccessAction {
  _$SetSuccessActionImpl({
    this.isSuccess,
    this.bidIncrementDetails,
  });
  @override
  bool? isSuccess;
  @override
  List<BidIncrementItemModel>? bidIncrementDetails;
  @override
  String toString() {
    return 'SetSuccessAction(isSuccess : $isSuccess, bidIncrementDetails : $bidIncrementDetails)';
  }
}

abstract class _SetSuccessAction implements SetSuccessAction {
  factory _SetSuccessAction({
    final bool? isSuccess,
    final List<BidIncrementItemModel>? bidIncrementDetails,
  }) = _$SetSuccessActionImpl;
  @override
  bool? get isSuccess;
  @override
  set isSuccess(bool? value);
  @override
  List<BidIncrementItemModel>? get bidIncrementDetails;
  @override
  set bidIncrementDetails(List<BidIncrementItemModel>? value);
}

mixin _$SetFailedAction {
  String? get error => throw _privateConstructorUsedError;
  set error(String? value) => throw _privateConstructorUsedError;
}

class _$SetFailedActionImpl implements _SetFailedAction {
  _$SetFailedActionImpl({
    this.error,
  });
  @override
  String? error;
  @override
  String toString() {
    return 'SetFailedAction(error : $error)';
  }
}

abstract class _SetFailedAction implements SetFailedAction {
  factory _SetFailedAction({
    final String? error,
  }) = _$SetFailedActionImpl;
  @override
  String? get error;
  @override
  set error(String? value);
}
