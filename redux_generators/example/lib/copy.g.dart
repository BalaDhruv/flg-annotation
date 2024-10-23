// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

import 'package:examble/state.dart';
import 'package:redux_annotations/redux_annotations.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

// SignUpState _$SignUpStateFromJson(Map<String, dynamic> json) {
//   return _SignUpState.fromJson(json);
// }

/// @nodoc
mixin _$SignUpState {
  bool? get loading => throw _privateConstructorUsedError;
  bool? get isSignedUp => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this SignUpState to a JSON map.
  // Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  $Res call({bool? loading, bool? isSignedUp, String? error});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = ReduxState,
    Object? isSignedUp = ReduxState,
    Object? error = ReduxState,
  }) {
    return _then(_value.copyWith(
      loading: ReduxState == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSignedUp: ReduxState == isSignedUp
          ? _value.isSignedUp
          : isSignedUp // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: ReduxState == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpStateImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpStateImplCopyWith(
          _$SignUpStateImpl value, $Res Function(_$SignUpStateImpl) then) =
      __$$SignUpStateImplCopyWithImpl<$Res>;
  @override
  // @useResult
  $Res call({bool? loading, bool? isSignedUp, String? error});
}

/// @nodoc
class __$$SignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateImpl>
    implements _$$SignUpStateImplCopyWith<$Res> {
  __$$SignUpStateImplCopyWithImpl(
      _$SignUpStateImpl _value, $Res Function(_$SignUpStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = ReduxState,
    Object? isSignedUp = ReduxState,
    Object? error = ReduxState,
  }) {
    return _then(_$SignUpStateImpl(
      loading: ReduxState == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSignedUp: ReduxState == isSignedUp
          ? _value.isSignedUp
          : isSignedUp // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: ReduxState == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
// @JsonSerializable()

class _$SignUpStateImpl implements _SignUpState {
  const _$SignUpStateImpl({this.loading, this.isSignedUp, this.error});

  // factory _$SignUpStateImpl.fromJson(Map<String, dynamic> json) =>
  //     _$$SignUpStateImplFromJson(json);

  @override
  final bool? loading;
  @override
  final bool? isSignedUp;
  @override
  final String? error;

  @override
  String toString() {
    return 'SignUpState(loading: $loading, isSignedUp: $isSignedUp, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isSignedUp, isSignedUp) ||
                other.isSignedUp == isSignedUp) &&
            (identical(other.error, error) || other.error == error));
  }

  // @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, loading, isSignedUp, error);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  // @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      __$$SignUpStateImplCopyWithImpl<_$SignUpStateImpl>(this, _$identity);
}

abstract class _SignUpState implements SignUpState {
  const factory _SignUpState(
      {final bool? loading,
      final bool? isSignedUp,
      final String? error}) = _$SignUpStateImpl;

  @override
  bool? get loading;
  @override
  bool? get isSignedUp;
  @override
  String? get error;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
