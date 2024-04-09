// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'affiliation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Affiliation {
  Team get team => throw _privateConstructorUsedError;
  DateTime? get contractEndedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Team team, DateTime? contractEndedAt) current,
    required TResult Function(Team team, DateTime? contractEndedAt) lender,
    required TResult Function(Team team, DateTime? contractEndedAt) former,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Team team, DateTime? contractEndedAt)? current,
    TResult? Function(Team team, DateTime? contractEndedAt)? lender,
    TResult? Function(Team team, DateTime? contractEndedAt)? former,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Team team, DateTime? contractEndedAt)? current,
    TResult Function(Team team, DateTime? contractEndedAt)? lender,
    TResult Function(Team team, DateTime? contractEndedAt)? former,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CurrentAffiliation value) current,
    required TResult Function(_LenderAffiliation value) lender,
    required TResult Function(_FormerAffiliation value) former,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CurrentAffiliation value)? current,
    TResult? Function(_LenderAffiliation value)? lender,
    TResult? Function(_FormerAffiliation value)? former,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CurrentAffiliation value)? current,
    TResult Function(_LenderAffiliation value)? lender,
    TResult Function(_FormerAffiliation value)? former,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AffiliationCopyWith<Affiliation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AffiliationCopyWith<$Res> {
  factory $AffiliationCopyWith(
          Affiliation value, $Res Function(Affiliation) then) =
      _$AffiliationCopyWithImpl<$Res, Affiliation>;
  @useResult
  $Res call({Team team, DateTime? contractEndedAt});

  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class _$AffiliationCopyWithImpl<$Res, $Val extends Affiliation>
    implements $AffiliationCopyWith<$Res> {
  _$AffiliationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = null,
    Object? contractEndedAt = freezed,
  }) {
    return _then(_value.copyWith(
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      contractEndedAt: freezed == contractEndedAt
          ? _value.contractEndedAt
          : contractEndedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get team {
    return $TeamCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrentAffiliationImplCopyWith<$Res>
    implements $AffiliationCopyWith<$Res> {
  factory _$$CurrentAffiliationImplCopyWith(_$CurrentAffiliationImpl value,
          $Res Function(_$CurrentAffiliationImpl) then) =
      __$$CurrentAffiliationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Team team, DateTime? contractEndedAt});

  @override
  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class __$$CurrentAffiliationImplCopyWithImpl<$Res>
    extends _$AffiliationCopyWithImpl<$Res, _$CurrentAffiliationImpl>
    implements _$$CurrentAffiliationImplCopyWith<$Res> {
  __$$CurrentAffiliationImplCopyWithImpl(_$CurrentAffiliationImpl _value,
      $Res Function(_$CurrentAffiliationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = null,
    Object? contractEndedAt = freezed,
  }) {
    return _then(_$CurrentAffiliationImpl(
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      contractEndedAt: freezed == contractEndedAt
          ? _value.contractEndedAt
          : contractEndedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$CurrentAffiliationImpl implements _CurrentAffiliation {
  const _$CurrentAffiliationImpl({required this.team, this.contractEndedAt});

  @override
  final Team team;
  @override
  final DateTime? contractEndedAt;

  @override
  String toString() {
    return 'Affiliation.current(team: $team, contractEndedAt: $contractEndedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentAffiliationImpl &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.contractEndedAt, contractEndedAt) ||
                other.contractEndedAt == contractEndedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, team, contractEndedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentAffiliationImplCopyWith<_$CurrentAffiliationImpl> get copyWith =>
      __$$CurrentAffiliationImplCopyWithImpl<_$CurrentAffiliationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Team team, DateTime? contractEndedAt) current,
    required TResult Function(Team team, DateTime? contractEndedAt) lender,
    required TResult Function(Team team, DateTime? contractEndedAt) former,
  }) {
    return current(team, contractEndedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Team team, DateTime? contractEndedAt)? current,
    TResult? Function(Team team, DateTime? contractEndedAt)? lender,
    TResult? Function(Team team, DateTime? contractEndedAt)? former,
  }) {
    return current?.call(team, contractEndedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Team team, DateTime? contractEndedAt)? current,
    TResult Function(Team team, DateTime? contractEndedAt)? lender,
    TResult Function(Team team, DateTime? contractEndedAt)? former,
    required TResult orElse(),
  }) {
    if (current != null) {
      return current(team, contractEndedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CurrentAffiliation value) current,
    required TResult Function(_LenderAffiliation value) lender,
    required TResult Function(_FormerAffiliation value) former,
  }) {
    return current(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CurrentAffiliation value)? current,
    TResult? Function(_LenderAffiliation value)? lender,
    TResult? Function(_FormerAffiliation value)? former,
  }) {
    return current?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CurrentAffiliation value)? current,
    TResult Function(_LenderAffiliation value)? lender,
    TResult Function(_FormerAffiliation value)? former,
    required TResult orElse(),
  }) {
    if (current != null) {
      return current(this);
    }
    return orElse();
  }
}

abstract class _CurrentAffiliation implements Affiliation {
  const factory _CurrentAffiliation(
      {required final Team team,
      final DateTime? contractEndedAt}) = _$CurrentAffiliationImpl;

  @override
  Team get team;
  @override
  DateTime? get contractEndedAt;
  @override
  @JsonKey(ignore: true)
  _$$CurrentAffiliationImplCopyWith<_$CurrentAffiliationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LenderAffiliationImplCopyWith<$Res>
    implements $AffiliationCopyWith<$Res> {
  factory _$$LenderAffiliationImplCopyWith(_$LenderAffiliationImpl value,
          $Res Function(_$LenderAffiliationImpl) then) =
      __$$LenderAffiliationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Team team, DateTime? contractEndedAt});

  @override
  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class __$$LenderAffiliationImplCopyWithImpl<$Res>
    extends _$AffiliationCopyWithImpl<$Res, _$LenderAffiliationImpl>
    implements _$$LenderAffiliationImplCopyWith<$Res> {
  __$$LenderAffiliationImplCopyWithImpl(_$LenderAffiliationImpl _value,
      $Res Function(_$LenderAffiliationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = null,
    Object? contractEndedAt = freezed,
  }) {
    return _then(_$LenderAffiliationImpl(
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      contractEndedAt: freezed == contractEndedAt
          ? _value.contractEndedAt
          : contractEndedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$LenderAffiliationImpl implements _LenderAffiliation {
  const _$LenderAffiliationImpl({required this.team, this.contractEndedAt});

  @override
  final Team team;
  @override
  final DateTime? contractEndedAt;

  @override
  String toString() {
    return 'Affiliation.lender(team: $team, contractEndedAt: $contractEndedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LenderAffiliationImpl &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.contractEndedAt, contractEndedAt) ||
                other.contractEndedAt == contractEndedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, team, contractEndedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LenderAffiliationImplCopyWith<_$LenderAffiliationImpl> get copyWith =>
      __$$LenderAffiliationImplCopyWithImpl<_$LenderAffiliationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Team team, DateTime? contractEndedAt) current,
    required TResult Function(Team team, DateTime? contractEndedAt) lender,
    required TResult Function(Team team, DateTime? contractEndedAt) former,
  }) {
    return lender(team, contractEndedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Team team, DateTime? contractEndedAt)? current,
    TResult? Function(Team team, DateTime? contractEndedAt)? lender,
    TResult? Function(Team team, DateTime? contractEndedAt)? former,
  }) {
    return lender?.call(team, contractEndedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Team team, DateTime? contractEndedAt)? current,
    TResult Function(Team team, DateTime? contractEndedAt)? lender,
    TResult Function(Team team, DateTime? contractEndedAt)? former,
    required TResult orElse(),
  }) {
    if (lender != null) {
      return lender(team, contractEndedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CurrentAffiliation value) current,
    required TResult Function(_LenderAffiliation value) lender,
    required TResult Function(_FormerAffiliation value) former,
  }) {
    return lender(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CurrentAffiliation value)? current,
    TResult? Function(_LenderAffiliation value)? lender,
    TResult? Function(_FormerAffiliation value)? former,
  }) {
    return lender?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CurrentAffiliation value)? current,
    TResult Function(_LenderAffiliation value)? lender,
    TResult Function(_FormerAffiliation value)? former,
    required TResult orElse(),
  }) {
    if (lender != null) {
      return lender(this);
    }
    return orElse();
  }
}

abstract class _LenderAffiliation implements Affiliation {
  const factory _LenderAffiliation(
      {required final Team team,
      final DateTime? contractEndedAt}) = _$LenderAffiliationImpl;

  @override
  Team get team;
  @override
  DateTime? get contractEndedAt;
  @override
  @JsonKey(ignore: true)
  _$$LenderAffiliationImplCopyWith<_$LenderAffiliationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormerAffiliationImplCopyWith<$Res>
    implements $AffiliationCopyWith<$Res> {
  factory _$$FormerAffiliationImplCopyWith(_$FormerAffiliationImpl value,
          $Res Function(_$FormerAffiliationImpl) then) =
      __$$FormerAffiliationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Team team, DateTime? contractEndedAt});

  @override
  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class __$$FormerAffiliationImplCopyWithImpl<$Res>
    extends _$AffiliationCopyWithImpl<$Res, _$FormerAffiliationImpl>
    implements _$$FormerAffiliationImplCopyWith<$Res> {
  __$$FormerAffiliationImplCopyWithImpl(_$FormerAffiliationImpl _value,
      $Res Function(_$FormerAffiliationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = null,
    Object? contractEndedAt = freezed,
  }) {
    return _then(_$FormerAffiliationImpl(
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      contractEndedAt: freezed == contractEndedAt
          ? _value.contractEndedAt
          : contractEndedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$FormerAffiliationImpl implements _FormerAffiliation {
  const _$FormerAffiliationImpl({required this.team, this.contractEndedAt});

  @override
  final Team team;
  @override
  final DateTime? contractEndedAt;

  @override
  String toString() {
    return 'Affiliation.former(team: $team, contractEndedAt: $contractEndedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormerAffiliationImpl &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.contractEndedAt, contractEndedAt) ||
                other.contractEndedAt == contractEndedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, team, contractEndedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormerAffiliationImplCopyWith<_$FormerAffiliationImpl> get copyWith =>
      __$$FormerAffiliationImplCopyWithImpl<_$FormerAffiliationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Team team, DateTime? contractEndedAt) current,
    required TResult Function(Team team, DateTime? contractEndedAt) lender,
    required TResult Function(Team team, DateTime? contractEndedAt) former,
  }) {
    return former(team, contractEndedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Team team, DateTime? contractEndedAt)? current,
    TResult? Function(Team team, DateTime? contractEndedAt)? lender,
    TResult? Function(Team team, DateTime? contractEndedAt)? former,
  }) {
    return former?.call(team, contractEndedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Team team, DateTime? contractEndedAt)? current,
    TResult Function(Team team, DateTime? contractEndedAt)? lender,
    TResult Function(Team team, DateTime? contractEndedAt)? former,
    required TResult orElse(),
  }) {
    if (former != null) {
      return former(team, contractEndedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CurrentAffiliation value) current,
    required TResult Function(_LenderAffiliation value) lender,
    required TResult Function(_FormerAffiliation value) former,
  }) {
    return former(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CurrentAffiliation value)? current,
    TResult? Function(_LenderAffiliation value)? lender,
    TResult? Function(_FormerAffiliation value)? former,
  }) {
    return former?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CurrentAffiliation value)? current,
    TResult Function(_LenderAffiliation value)? lender,
    TResult Function(_FormerAffiliation value)? former,
    required TResult orElse(),
  }) {
    if (former != null) {
      return former(this);
    }
    return orElse();
  }
}

abstract class _FormerAffiliation implements Affiliation {
  const factory _FormerAffiliation(
      {required final Team team,
      final DateTime? contractEndedAt}) = _$FormerAffiliationImpl;

  @override
  Team get team;
  @override
  DateTime? get contractEndedAt;
  @override
  @JsonKey(ignore: true)
  _$$FormerAffiliationImplCopyWith<_$FormerAffiliationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
