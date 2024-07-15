// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'demo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DemoState {
  bool get initial => throw _privateConstructorUsedError;
  bool get medium => throw _privateConstructorUsedError;
  bool get last => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get prev => throw _privateConstructorUsedError;
  bool get final_state => throw _privateConstructorUsedError;
  PlatformFile? get file => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DemoStateCopyWith<DemoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemoStateCopyWith<$Res> {
  factory $DemoStateCopyWith(DemoState value, $Res Function(DemoState) then) =
      _$DemoStateCopyWithImpl<$Res, DemoState>;
  @useResult
  $Res call(
      {bool initial,
      bool medium,
      bool last,
      String message,
      bool prev,
      bool final_state,
      PlatformFile? file});
}

/// @nodoc
class _$DemoStateCopyWithImpl<$Res, $Val extends DemoState>
    implements $DemoStateCopyWith<$Res> {
  _$DemoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initial = null,
    Object? medium = null,
    Object? last = null,
    Object? message = null,
    Object? prev = null,
    Object? final_state = null,
    Object? file = freezed,
  }) {
    return _then(_value.copyWith(
      initial: null == initial
          ? _value.initial
          : initial // ignore: cast_nullable_to_non_nullable
              as bool,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as bool,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      prev: null == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as bool,
      final_state: null == final_state
          ? _value.final_state
          : final_state // ignore: cast_nullable_to_non_nullable
              as bool,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DemoStateImplCopyWith<$Res>
    implements $DemoStateCopyWith<$Res> {
  factory _$$DemoStateImplCopyWith(
          _$DemoStateImpl value, $Res Function(_$DemoStateImpl) then) =
      __$$DemoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool initial,
      bool medium,
      bool last,
      String message,
      bool prev,
      bool final_state,
      PlatformFile? file});
}

/// @nodoc
class __$$DemoStateImplCopyWithImpl<$Res>
    extends _$DemoStateCopyWithImpl<$Res, _$DemoStateImpl>
    implements _$$DemoStateImplCopyWith<$Res> {
  __$$DemoStateImplCopyWithImpl(
      _$DemoStateImpl _value, $Res Function(_$DemoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initial = null,
    Object? medium = null,
    Object? last = null,
    Object? message = null,
    Object? prev = null,
    Object? final_state = null,
    Object? file = freezed,
  }) {
    return _then(_$DemoStateImpl(
      initial: null == initial
          ? _value.initial
          : initial // ignore: cast_nullable_to_non_nullable
              as bool,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as bool,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      prev: null == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as bool,
      final_state: null == final_state
          ? _value.final_state
          : final_state // ignore: cast_nullable_to_non_nullable
              as bool,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
    ));
  }
}

/// @nodoc

class _$DemoStateImpl implements _DemoState {
  const _$DemoStateImpl(
      {this.initial = true,
      this.medium = false,
      this.last = false,
      this.message = 'Wait 3 minutes',
      this.prev = false,
      this.final_state = false,
      this.file});

  @override
  @JsonKey()
  final bool initial;
  @override
  @JsonKey()
  final bool medium;
  @override
  @JsonKey()
  final bool last;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final bool prev;
  @override
  @JsonKey()
  final bool final_state;
  @override
  final PlatformFile? file;

  @override
  String toString() {
    return 'DemoState(initial: $initial, medium: $medium, last: $last, message: $message, prev: $prev, final_state: $final_state, file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DemoStateImpl &&
            (identical(other.initial, initial) || other.initial == initial) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            (identical(other.final_state, final_state) ||
                other.final_state == final_state) &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, initial, medium, last, message, prev, final_state, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DemoStateImplCopyWith<_$DemoStateImpl> get copyWith =>
      __$$DemoStateImplCopyWithImpl<_$DemoStateImpl>(this, _$identity);
}

abstract class _DemoState implements DemoState {
  const factory _DemoState(
      {final bool initial,
      final bool medium,
      final bool last,
      final String message,
      final bool prev,
      final bool final_state,
      final PlatformFile? file}) = _$DemoStateImpl;

  @override
  bool get initial;
  @override
  bool get medium;
  @override
  bool get last;
  @override
  String get message;
  @override
  bool get prev;
  @override
  bool get final_state;
  @override
  PlatformFile? get file;
  @override
  @JsonKey(ignore: true)
  _$$DemoStateImplCopyWith<_$DemoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
