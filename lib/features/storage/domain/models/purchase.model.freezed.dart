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
  @JsonKey(name: "ticket_id")
  String? get ticketId => throw _privateConstructorUsedError;
  int? get passenger => throw _privateConstructorUsedError;
  String? get seats => throw _privateConstructorUsedError;
  int? get tid => throw _privateConstructorUsedError;
  @JsonKey(name: "total_price")
  String? get totalPrice => throw _privateConstructorUsedError;
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
      @JsonKey(name: "ticket_id") String? ticketId,
      int? passenger,
      String? seats,
      int? tid,
      @JsonKey(name: "total_price") String? totalPrice,
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
    Object? ticketId = freezed,
    Object? passenger = freezed,
    Object? seats = freezed,
    Object? tid = freezed,
    Object? totalPrice = freezed,
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
      ticketId: freezed == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String?,
      passenger: freezed == passenger
          ? _value.passenger
          : passenger // ignore: cast_nullable_to_non_nullable
              as int?,
      seats: freezed == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as String?,
      tid: freezed == tid
          ? _value.tid
          : tid // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String?,
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
      @JsonKey(name: "ticket_id") String? ticketId,
      int? passenger,
      String? seats,
      int? tid,
      @JsonKey(name: "total_price") String? totalPrice,
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
    Object? ticketId = freezed,
    Object? passenger = freezed,
    Object? seats = freezed,
    Object? tid = freezed,
    Object? totalPrice = freezed,
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
      ticketId: freezed == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String?,
      passenger: freezed == passenger
          ? _value.passenger
          : passenger // ignore: cast_nullable_to_non_nullable
              as int?,
      seats: freezed == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as String?,
      tid: freezed == tid
          ? _value.tid
          : tid // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String?,
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
      @JsonKey(name: "ticket_id") this.ticketId,
      this.passenger,
      this.seats,
      this.tid,
      @JsonKey(name: "total_price") this.totalPrice,
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
  @JsonKey(name: "ticket_id")
  final String? ticketId;
  @override
  final int? passenger;
  @override
  final String? seats;
  @override
  final int? tid;
  @override
  @JsonKey(name: "total_price")
  final String? totalPrice;
  @override
  @JsonKey(name: "payment_status")
  final String? paymentStatus;
  @override
  @JsonKey(name: "paid_at")
  final String? paidAt;

  @override
  String toString() {
    return 'Purchase(id: $id, uid: $uid, bookingId: $bookingId, ticketId: $ticketId, passenger: $passenger, seats: $seats, tid: $tid, totalPrice: $totalPrice, paymentStatus: $paymentStatus, paidAt: $paidAt)';
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
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.passenger, passenger) ||
                other.passenger == passenger) &&
            (identical(other.seats, seats) || other.seats == seats) &&
            (identical(other.tid, tid) || other.tid == tid) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uid, bookingId, ticketId,
      passenger, seats, tid, totalPrice, paymentStatus, paidAt);

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
      @JsonKey(name: "ticket_id") final String? ticketId,
      final int? passenger,
      final String? seats,
      final int? tid,
      @JsonKey(name: "total_price") final String? totalPrice,
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
  @JsonKey(name: "ticket_id")
  String? get ticketId;
  @override
  int? get passenger;
  @override
  String? get seats;
  @override
  int? get tid;
  @override
  @JsonKey(name: "total_price")
  String? get totalPrice;
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
