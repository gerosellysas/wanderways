// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Purchase _$PurchaseFromJson(Map<String, dynamic> json) {
  return _Purchase.fromJson(json);
}

/// @nodoc
mixin _$Purchase {
  int? get id => throw _privateConstructorUsedError;
  int? get uid => throw _privateConstructorUsedError;
  @JsonKey(name: "booking_id")
  String? get bookingId => throw _privateConstructorUsedError;
  int? get passenger => throw _privateConstructorUsedError;
  @JsonKey(name: "round_trip")
  int? get roundTrip => throw _privateConstructorUsedError;
  @JsonKey(name: "departure_trip_id")
  int? get departureTripId => throw _privateConstructorUsedError;
  @JsonKey(name: "departure_ticket_id")
  String? get departureTicketId => throw _privateConstructorUsedError;
  @JsonKey(name: "departure_date")
  String? get departureDate => throw _privateConstructorUsedError;
  @JsonKey(name: "departure_seats")
  String? get departureSeats => throw _privateConstructorUsedError;
  @JsonKey(name: "departure_price")
  int? get departurePrice => throw _privateConstructorUsedError;
  @JsonKey(name: "return_trip_id")
  int? get returnTripId => throw _privateConstructorUsedError;
  @JsonKey(name: "return_ticket_id")
  String? get returnTicketId => throw _privateConstructorUsedError;
  @JsonKey(name: "return_date")
  String? get returnDate => throw _privateConstructorUsedError;
  @JsonKey(name: "return_seats")
  String? get returnSeats => throw _privateConstructorUsedError;
  @JsonKey(name: "return_price")
  int? get returnPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_status")
  String? get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "paid_at")
  String? get paidAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseCopyWith<Purchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseCopyWith<$Res> {
  factory $PurchaseCopyWith(Purchase value, $Res Function(Purchase) then) =
      _$PurchaseCopyWithImpl<$Res, Purchase>;
  @useResult
  $Res call(
      {int? id,
      int? uid,
      @JsonKey(name: "booking_id") String? bookingId,
      int? passenger,
      @JsonKey(name: "round_trip") int? roundTrip,
      @JsonKey(name: "departure_trip_id") int? departureTripId,
      @JsonKey(name: "departure_ticket_id") String? departureTicketId,
      @JsonKey(name: "departure_date") String? departureDate,
      @JsonKey(name: "departure_seats") String? departureSeats,
      @JsonKey(name: "departure_price") int? departurePrice,
      @JsonKey(name: "return_trip_id") int? returnTripId,
      @JsonKey(name: "return_ticket_id") String? returnTicketId,
      @JsonKey(name: "return_date") String? returnDate,
      @JsonKey(name: "return_seats") String? returnSeats,
      @JsonKey(name: "return_price") int? returnPrice,
      @JsonKey(name: "payment_status") String? paymentStatus,
      @JsonKey(name: "paid_at") String? paidAt});
}

/// @nodoc
class _$PurchaseCopyWithImpl<$Res, $Val extends Purchase>
    implements $PurchaseCopyWith<$Res> {
  _$PurchaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? bookingId = freezed,
    Object? passenger = freezed,
    Object? roundTrip = freezed,
    Object? departureTripId = freezed,
    Object? departureTicketId = freezed,
    Object? departureDate = freezed,
    Object? departureSeats = freezed,
    Object? departurePrice = freezed,
    Object? returnTripId = freezed,
    Object? returnTicketId = freezed,
    Object? returnDate = freezed,
    Object? returnSeats = freezed,
    Object? returnPrice = freezed,
    Object? paymentStatus = freezed,
    Object? paidAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int?,
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      passenger: freezed == passenger
          ? _value.passenger
          : passenger // ignore: cast_nullable_to_non_nullable
              as int?,
      roundTrip: freezed == roundTrip
          ? _value.roundTrip
          : roundTrip // ignore: cast_nullable_to_non_nullable
              as int?,
      departureTripId: freezed == departureTripId
          ? _value.departureTripId
          : departureTripId // ignore: cast_nullable_to_non_nullable
              as int?,
      departureTicketId: freezed == departureTicketId
          ? _value.departureTicketId
          : departureTicketId // ignore: cast_nullable_to_non_nullable
              as String?,
      departureDate: freezed == departureDate
          ? _value.departureDate
          : departureDate // ignore: cast_nullable_to_non_nullable
              as String?,
      departureSeats: freezed == departureSeats
          ? _value.departureSeats
          : departureSeats // ignore: cast_nullable_to_non_nullable
              as String?,
      departurePrice: freezed == departurePrice
          ? _value.departurePrice
          : departurePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      returnTripId: freezed == returnTripId
          ? _value.returnTripId
          : returnTripId // ignore: cast_nullable_to_non_nullable
              as int?,
      returnTicketId: freezed == returnTicketId
          ? _value.returnTicketId
          : returnTicketId // ignore: cast_nullable_to_non_nullable
              as String?,
      returnDate: freezed == returnDate
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as String?,
      returnSeats: freezed == returnSeats
          ? _value.returnSeats
          : returnSeats // ignore: cast_nullable_to_non_nullable
              as String?,
      returnPrice: freezed == returnPrice
          ? _value.returnPrice
          : returnPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseImplCopyWith<$Res>
    implements $PurchaseCopyWith<$Res> {
  factory _$$PurchaseImplCopyWith(
          _$PurchaseImpl value, $Res Function(_$PurchaseImpl) then) =
      __$$PurchaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? uid,
      @JsonKey(name: "booking_id") String? bookingId,
      int? passenger,
      @JsonKey(name: "round_trip") int? roundTrip,
      @JsonKey(name: "departure_trip_id") int? departureTripId,
      @JsonKey(name: "departure_ticket_id") String? departureTicketId,
      @JsonKey(name: "departure_date") String? departureDate,
      @JsonKey(name: "departure_seats") String? departureSeats,
      @JsonKey(name: "departure_price") int? departurePrice,
      @JsonKey(name: "return_trip_id") int? returnTripId,
      @JsonKey(name: "return_ticket_id") String? returnTicketId,
      @JsonKey(name: "return_date") String? returnDate,
      @JsonKey(name: "return_seats") String? returnSeats,
      @JsonKey(name: "return_price") int? returnPrice,
      @JsonKey(name: "payment_status") String? paymentStatus,
      @JsonKey(name: "paid_at") String? paidAt});
}

/// @nodoc
class __$$PurchaseImplCopyWithImpl<$Res>
    extends _$PurchaseCopyWithImpl<$Res, _$PurchaseImpl>
    implements _$$PurchaseImplCopyWith<$Res> {
  __$$PurchaseImplCopyWithImpl(
      _$PurchaseImpl _value, $Res Function(_$PurchaseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? bookingId = freezed,
    Object? passenger = freezed,
    Object? roundTrip = freezed,
    Object? departureTripId = freezed,
    Object? departureTicketId = freezed,
    Object? departureDate = freezed,
    Object? departureSeats = freezed,
    Object? departurePrice = freezed,
    Object? returnTripId = freezed,
    Object? returnTicketId = freezed,
    Object? returnDate = freezed,
    Object? returnSeats = freezed,
    Object? returnPrice = freezed,
    Object? paymentStatus = freezed,
    Object? paidAt = freezed,
  }) {
    return _then(_$PurchaseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int?,
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      passenger: freezed == passenger
          ? _value.passenger
          : passenger // ignore: cast_nullable_to_non_nullable
              as int?,
      roundTrip: freezed == roundTrip
          ? _value.roundTrip
          : roundTrip // ignore: cast_nullable_to_non_nullable
              as int?,
      departureTripId: freezed == departureTripId
          ? _value.departureTripId
          : departureTripId // ignore: cast_nullable_to_non_nullable
              as int?,
      departureTicketId: freezed == departureTicketId
          ? _value.departureTicketId
          : departureTicketId // ignore: cast_nullable_to_non_nullable
              as String?,
      departureDate: freezed == departureDate
          ? _value.departureDate
          : departureDate // ignore: cast_nullable_to_non_nullable
              as String?,
      departureSeats: freezed == departureSeats
          ? _value.departureSeats
          : departureSeats // ignore: cast_nullable_to_non_nullable
              as String?,
      departurePrice: freezed == departurePrice
          ? _value.departurePrice
          : departurePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      returnTripId: freezed == returnTripId
          ? _value.returnTripId
          : returnTripId // ignore: cast_nullable_to_non_nullable
              as int?,
      returnTicketId: freezed == returnTicketId
          ? _value.returnTicketId
          : returnTicketId // ignore: cast_nullable_to_non_nullable
              as String?,
      returnDate: freezed == returnDate
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as String?,
      returnSeats: freezed == returnSeats
          ? _value.returnSeats
          : returnSeats // ignore: cast_nullable_to_non_nullable
              as String?,
      returnPrice: freezed == returnPrice
          ? _value.returnPrice
          : returnPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PurchaseImpl implements _Purchase {
  const _$PurchaseImpl(
      {this.id,
      this.uid,
      @JsonKey(name: "booking_id") this.bookingId,
      this.passenger,
      @JsonKey(name: "round_trip") this.roundTrip,
      @JsonKey(name: "departure_trip_id") this.departureTripId,
      @JsonKey(name: "departure_ticket_id") this.departureTicketId,
      @JsonKey(name: "departure_date") this.departureDate,
      @JsonKey(name: "departure_seats") this.departureSeats,
      @JsonKey(name: "departure_price") this.departurePrice,
      @JsonKey(name: "return_trip_id") this.returnTripId,
      @JsonKey(name: "return_ticket_id") this.returnTicketId,
      @JsonKey(name: "return_date") this.returnDate,
      @JsonKey(name: "return_seats") this.returnSeats,
      @JsonKey(name: "return_price") this.returnPrice,
      @JsonKey(name: "payment_status") this.paymentStatus,
      @JsonKey(name: "paid_at") this.paidAt});

  factory _$PurchaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseImplFromJson(json);

  @override
  final int? id;
  @override
  final int? uid;
  @override
  @JsonKey(name: "booking_id")
  final String? bookingId;
  @override
  final int? passenger;
  @override
  @JsonKey(name: "round_trip")
  final int? roundTrip;
  @override
  @JsonKey(name: "departure_trip_id")
  final int? departureTripId;
  @override
  @JsonKey(name: "departure_ticket_id")
  final String? departureTicketId;
  @override
  @JsonKey(name: "departure_date")
  final String? departureDate;
  @override
  @JsonKey(name: "departure_seats")
  final String? departureSeats;
  @override
  @JsonKey(name: "departure_price")
  final int? departurePrice;
  @override
  @JsonKey(name: "return_trip_id")
  final int? returnTripId;
  @override
  @JsonKey(name: "return_ticket_id")
  final String? returnTicketId;
  @override
  @JsonKey(name: "return_date")
  final String? returnDate;
  @override
  @JsonKey(name: "return_seats")
  final String? returnSeats;
  @override
  @JsonKey(name: "return_price")
  final int? returnPrice;
  @override
  @JsonKey(name: "payment_status")
  final String? paymentStatus;
  @override
  @JsonKey(name: "paid_at")
  final String? paidAt;

  @override
  String toString() {
    return 'Purchase(id: $id, uid: $uid, bookingId: $bookingId, passenger: $passenger, roundTrip: $roundTrip, departureTripId: $departureTripId, departureTicketId: $departureTicketId, departureDate: $departureDate, departureSeats: $departureSeats, departurePrice: $departurePrice, returnTripId: $returnTripId, returnTicketId: $returnTicketId, returnDate: $returnDate, returnSeats: $returnSeats, returnPrice: $returnPrice, paymentStatus: $paymentStatus, paidAt: $paidAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.passenger, passenger) ||
                other.passenger == passenger) &&
            (identical(other.roundTrip, roundTrip) ||
                other.roundTrip == roundTrip) &&
            (identical(other.departureTripId, departureTripId) ||
                other.departureTripId == departureTripId) &&
            (identical(other.departureTicketId, departureTicketId) ||
                other.departureTicketId == departureTicketId) &&
            (identical(other.departureDate, departureDate) ||
                other.departureDate == departureDate) &&
            (identical(other.departureSeats, departureSeats) ||
                other.departureSeats == departureSeats) &&
            (identical(other.departurePrice, departurePrice) ||
                other.departurePrice == departurePrice) &&
            (identical(other.returnTripId, returnTripId) ||
                other.returnTripId == returnTripId) &&
            (identical(other.returnTicketId, returnTicketId) ||
                other.returnTicketId == returnTicketId) &&
            (identical(other.returnDate, returnDate) ||
                other.returnDate == returnDate) &&
            (identical(other.returnSeats, returnSeats) ||
                other.returnSeats == returnSeats) &&
            (identical(other.returnPrice, returnPrice) ||
                other.returnPrice == returnPrice) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uid,
      bookingId,
      passenger,
      roundTrip,
      departureTripId,
      departureTicketId,
      departureDate,
      departureSeats,
      departurePrice,
      returnTripId,
      returnTicketId,
      returnDate,
      returnSeats,
      returnPrice,
      paymentStatus,
      paidAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseImplCopyWith<_$PurchaseImpl> get copyWith =>
      __$$PurchaseImplCopyWithImpl<_$PurchaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseImplToJson(
      this,
    );
  }
}

abstract class _Purchase implements Purchase {
  const factory _Purchase(
      {final int? id,
      final int? uid,
      @JsonKey(name: "booking_id") final String? bookingId,
      final int? passenger,
      @JsonKey(name: "round_trip") final int? roundTrip,
      @JsonKey(name: "departure_trip_id") final int? departureTripId,
      @JsonKey(name: "departure_ticket_id") final String? departureTicketId,
      @JsonKey(name: "departure_date") final String? departureDate,
      @JsonKey(name: "departure_seats") final String? departureSeats,
      @JsonKey(name: "departure_price") final int? departurePrice,
      @JsonKey(name: "return_trip_id") final int? returnTripId,
      @JsonKey(name: "return_ticket_id") final String? returnTicketId,
      @JsonKey(name: "return_date") final String? returnDate,
      @JsonKey(name: "return_seats") final String? returnSeats,
      @JsonKey(name: "return_price") final int? returnPrice,
      @JsonKey(name: "payment_status") final String? paymentStatus,
      @JsonKey(name: "paid_at") final String? paidAt}) = _$PurchaseImpl;

  factory _Purchase.fromJson(Map<String, dynamic> json) =
      _$PurchaseImpl.fromJson;

  @override
  int? get id;
  @override
  int? get uid;
  @override
  @JsonKey(name: "booking_id")
  String? get bookingId;
  @override
  int? get passenger;
  @override
  @JsonKey(name: "round_trip")
  int? get roundTrip;
  @override
  @JsonKey(name: "departure_trip_id")
  int? get departureTripId;
  @override
  @JsonKey(name: "departure_ticket_id")
  String? get departureTicketId;
  @override
  @JsonKey(name: "departure_date")
  String? get departureDate;
  @override
  @JsonKey(name: "departure_seats")
  String? get departureSeats;
  @override
  @JsonKey(name: "departure_price")
  int? get departurePrice;
  @override
  @JsonKey(name: "return_trip_id")
  int? get returnTripId;
  @override
  @JsonKey(name: "return_ticket_id")
  String? get returnTicketId;
  @override
  @JsonKey(name: "return_date")
  String? get returnDate;
  @override
  @JsonKey(name: "return_seats")
  String? get returnSeats;
  @override
  @JsonKey(name: "return_price")
  int? get returnPrice;
  @override
  @JsonKey(name: "payment_status")
  String? get paymentStatus;
  @override
  @JsonKey(name: "paid_at")
  String? get paidAt;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseImplCopyWith<_$PurchaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
