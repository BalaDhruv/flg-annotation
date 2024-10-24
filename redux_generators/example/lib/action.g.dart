

part of 'action.dart';
var _privateConstructorUsedError = UnsupportedError(
'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by ReduxAnnotations and you are not supposed to need it nor use it.');
// **************************************************************************
// ActionGenerator
// **************************************************************************

mixin _$GetAction {
String? get name => throw _privateConstructorUsedError;
int? get id => throw _privateConstructorUsedError;
bool? get isSuccess => throw _privateConstructorUsedError;
double? get amount => throw _privateConstructorUsedError;
List<BidIncrementItemModel>? get bidIncrementDetails => throw _privateConstructorUsedError;
 // Setter
set name (String? value) => throw _privateConstructorUsedError;
set id (int? value) => throw _privateConstructorUsedError;
set isSuccess (bool? value) => throw _privateConstructorUsedError;
set amount (double? value) => throw _privateConstructorUsedError;
set bidIncrementDetails (List<BidIncrementItemModel>? value) => throw _privateConstructorUsedError;
}
class _$GetActionImpl implements _GetAction {
 // Private fields to store data
String? _name;
int? _id;
bool? _isSuccess;
double? _amount;
List<BidIncrementItemModel>? _bidIncrementDetails;
_$GetActionImpl({
String? name,
int? id,
bool? isSuccess,
double? amount,
List<BidIncrementItemModel>? bidIncrementDetails,
}) :
_name = name ,
_id = id ,
_isSuccess = isSuccess ,
_amount = amount ,
_bidIncrementDetails = bidIncrementDetails 
;
@override
String? get name => _name ;
@override
int? get id => _id ;
@override
bool? get isSuccess => _isSuccess ;
@override
double? get amount => _amount ;
@override
List<BidIncrementItemModel>? get bidIncrementDetails => _bidIncrementDetails ;
@override
set name(String? value) { _name = value;}
@override
set id(int? value) { _id = value;}
@override
set isSuccess(bool? value) { _isSuccess = value;}
@override
set amount(double? value) { _amount = value;}
@override
set bidIncrementDetails(List<BidIncrementItemModel>? value) { _bidIncrementDetails = value;}
@override
String toString() {
 return 'GetAction(name : $name, id : $id, isSuccess : $isSuccess, amount : $amount, bidIncrementDetails : $bidIncrementDetails)';
}
}
abstract class _GetAction implements GetAction {
factory _GetAction({
final String? name,
final int? id,
final bool? isSuccess,
final double? amount,
final List<BidIncrementItemModel>? bidIncrementDetails,
}) = _$GetActionImpl;
@override
String? get name;
@override
int? get id;
@override
bool? get isSuccess;
@override
double? get amount;
@override
List<BidIncrementItemModel>? get bidIncrementDetails;
@override
set name(String? value);
@override
set id(int? value);
@override
set isSuccess(bool? value);
@override
set amount(double? value);
@override
set bidIncrementDetails(List<BidIncrementItemModel>? value);
}

mixin _$SuccessAction {
bool? get isSuccess => throw _privateConstructorUsedError;
List<BidIncrementItemModel>? get bidIncrementDetails => throw _privateConstructorUsedError;
 // Setter
set isSuccess (bool? value) => throw _privateConstructorUsedError;
set bidIncrementDetails (List<BidIncrementItemModel>? value) => throw _privateConstructorUsedError;
}
class _$SuccessActionImpl implements _SuccessAction {
 // Private fields to store data
bool? _isSuccess;
List<BidIncrementItemModel>? _bidIncrementDetails;
_$SuccessActionImpl({
bool? isSuccess,
List<BidIncrementItemModel>? bidIncrementDetails,
}) :
_isSuccess = isSuccess ,
_bidIncrementDetails = bidIncrementDetails 
;
@override
bool? get isSuccess => _isSuccess ;
@override
List<BidIncrementItemModel>? get bidIncrementDetails => _bidIncrementDetails ;
@override
set isSuccess(bool? value) { _isSuccess = value;}
@override
set bidIncrementDetails(List<BidIncrementItemModel>? value) { _bidIncrementDetails = value;}
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
List<BidIncrementItemModel>? get bidIncrementDetails;
@override
set isSuccess(bool? value);
@override
set bidIncrementDetails(List<BidIncrementItemModel>? value);
}

mixin _$FailedAction {
String? get error => throw _privateConstructorUsedError;
 // Setter
set error (String? value) => throw _privateConstructorUsedError;
}
class _$FailedActionImpl implements _FailedAction {
 // Private fields to store data
String? _error;
_$FailedActionImpl({
String? error,
}) :
_error = error 
;
@override
String? get error => _error ;
@override
set error(String? value) { _error = value;}
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
