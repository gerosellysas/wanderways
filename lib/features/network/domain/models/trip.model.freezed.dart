// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Trip _$TripFromJson(Map<String, dynamic> json) {
  return _Trip.fromJson(json);
}

/// @nodoc
mixin _$Trip {
  int? get id => throw _privateConstructorUsedError;
  String? get origin => throw _privateConstructorUsedError;
  String? get destination => throw _privateConstructorUsedError;
  String? get departure => throw _privateConstructorUsedError;
  String? get arrival => throw _privateConstructorUsedError;
  List<String>? get seats => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripCopyWith<Trip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCopyWith<$Res> {
  factory $TripCopyWith(Trip value, $Res Function(Trip) then) =
      _$TripCopyWithImpl<$Res, Trip>;
  @useResult
  $Res call(
      {int? id,
      String? origin,
      String? destination,
      String? departure,
      String? arrival,
      List<String>? seats,
      int? price});
}

/// @nodoc
class _$TripCopyWithImpl<$Res, $Val extends Trip>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? origin = freezed,
    Object? destination = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? seats = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      departure: freezed == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as String?,
      arrival: freezed == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as String?,
      seats: freezed == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TripImplCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$$TripImplCopyWith(
          _$TripImpl value, $Res Function(_$TripImpl) then) =
      __$$TripImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? origin,
      String? destination,
      String? departure,
      String? arrival,
      List<String>? seats,
      int? price});
}

/// @nodoc
class __$$TripImplCopyWithImpl<$Res>
    extends _$TripCopyWithImpl<$Res, _$TripImpl>
    implements _$$TripImplCopyWith<$Res> {
  __$$TripImplCopyWithImpl(_$TripImpl _value, $Res Function(_$TripImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? origin = freezed,
    Object? destination = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? seats = freezed,
    Object? price = freezed,
  }) {
    return _then(_$TripImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      departure: freezed == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as String?,
      arrival: freezed == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as String?,
      seats: freezed == seats
          ? _value._seats
          : seats // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TripImpl implements _Trip {
  const _$TripImpl(
      {this.id,
      this.origin,
      this.destination,
      this.departure,
      this.arrival,
      final List<String>? seats,
      this.price})
      : _seats = seats;

  factory _$TripImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripImplFromJson(json);

  @override
  final int? id;
  @override
  final String? origin;
  @override
  final String? destination;
  @override
  final String? departure;
  @override
  final String? arrival;
  final List<String>? _seats;
  @override
  List<String>? get seats {
    final value = _seats;
    if (value == null) return null;
    if (_seats is EqualUnmodifiableListView) return _seats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? price;

  @override
  String toString() {
    return 'Trip(id: $id, origin: $origin, destination: $destination, departure: $departure, arrival: $arrival, seats: $seats, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.departure, departure) ||
                other.departure == departure) &&
            (identical(other.arrival, arrival) || other.arrival == arrival) &&
            const DeepCollectionEquality().equals(other._seats, _seats) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, origin, destination,
      departure, arrival, const DeepCollectionEquality().hash(_seats), price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      __$$TripImplCopyWithImpl<_$TripImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripImplToJson(
      this,
    );
  }
}

abstract class _Trip implements Trip {
  const factory _Trip(
      {final int? id,
      final String? origin,
      final String? destination,
      final String? departure,
      final String? arrival,
      final List<String>? seats,
      final int? price}) = _$TripImpl;

  factory _Trip.fromJson(Map<String, dynamic> json) = _$TripImpl.fromJson;

  @override
  int? get id;
  @override
  String? get origin;
  @override
  String? get destination;
  @override
  String? get departure;
  @override
  String? get arrival;
  @override
  List<String>? get seats;
  @override
  int? get price;
  @override
  @JsonKey(ignore: true)
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
