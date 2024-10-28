// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// ActionGenerator
// **************************************************************************

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by ReduxAnnotations and you are not supposed to need it nor use it.');
mixin _$GetAction {
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  set isSuccess(bool? value) => throw _privateConstructorUsedError;
  List<BidIncrementItemModel>? get bidIncrementDetails =>
      throw _privateConstructorUsedError;
  set bidIncrementDetails(List<BidIncrementItemModel>? value) =>
      throw _privateConstructorUsedError;
}

class _$GetActionImpl implements _GetAction {
  _$GetActionImpl({
    this.name,
    this.id,
    this.isSuccess,
    this.bidIncrementDetails,
  });
  @override
  String? name;
  @override
  int? id;
  @override
  bool? isSuccess;
  @override
  List<BidIncrementItemModel>? bidIncrementDetails;
  @override
  String toString() {
    return 'GetAction(name : $name, id : $id, isSuccess : $isSuccess, bidIncrementDetails : $bidIncrementDetails)';
  }
}

abstract class _GetAction implements GetAction {
  factory _GetAction({
    final String? name,
    final int? id,
    final bool? isSuccess,
    final List<BidIncrementItemModel>? bidIncrementDetails,
  }) = _$GetActionImpl;
  @override
  String? get name;
  @override
  set name(String? value);
  @override
  int? get id;
  @override
  set id(int? value);
  @override
  bool? get isSuccess;
  @override
  set isSuccess(bool? value);
  @override
  List<BidIncrementItemModel>? get bidIncrementDetails;
  @override
  set bidIncrementDetails(List<BidIncrementItemModel>? value);
}

mixin _$SuccessAction {
  bool? get isSuccess => throw _privateConstructorUsedError;
  set isSuccess(bool? value) => throw _privateConstructorUsedError;
  List<BidIncrementItemModel>? get bidIncrementDetails =>
      throw _privateConstructorUsedError;
  set bidIncrementDetails(List<BidIncrementItemModel>? value) =>
      throw _privateConstructorUsedError;
}

class _$SuccessActionImpl implements _SuccessAction {
  _$SuccessActionImpl({
    this.isSuccess,
    this.bidIncrementDetails,
  });
  @override
  bool? isSuccess;
  @override
  List<BidIncrementItemModel>? bidIncrementDetails;
  @override
  String toString() {
    return 'SuccessAction(isSuccess : $isSuccess, bidIncrementDetails : $bidIncrementDetails)';
  }
}

abstract class _SuccessAction implements SuccessAction {
  factory _SuccessAction({
    final bool? isSuccess,
    final List<BidIncrementItemModel>? bidIncrementDetails,
  }) = _$SuccessActionImpl;
  @override
  bool? get isSuccess;
  @override
  set isSuccess(bool? value);
  @override
  List<BidIncrementItemModel>? get bidIncrementDetails;
  @override
  set bidIncrementDetails(List<BidIncrementItemModel>? value);
}

mixin _$FailedAction {
  String? get error => throw _privateConstructorUsedError;
  set error(String? value) => throw _privateConstructorUsedError;
}

class _$FailedActionImpl implements _FailedAction {
  _$FailedActionImpl({
    this.error,
  });
  @override
  String? error;
  @override
  String toString() {
    return 'FailedAction(error : $error)';
  }
}

abstract class _FailedAction implements FailedAction {
  factory _FailedAction({
    final String? error,
  }) = _$FailedActionImpl;
  @override
  String? get error;
  @override
  set error(String? value);
}
