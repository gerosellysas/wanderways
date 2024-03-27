import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/features/network/domain/network.domain.dart';
import 'package:wander_ways/features/storage/domain/storage.domain.dart';

import 'card.widget.dart';

class BookingList extends StatelessWidget {
  final int? languageSelected;
  final String? locale;
  final List<Purchase>? listPurchase;
  final List<Trip>? listTrip;
  final void Function(int)? onDeleteTap;
  final void Function(int)? onTap;

  const BookingList({
    super.key,
    this.languageSelected,
    this.locale,
    this.listPurchase,
    this.listTrip,
    this.onDeleteTap,
    this.onTap,
  });

  Trip _trip(int? tid) {
    var tripIndex = listTrip!.indexWhere((t) => t.id == tid);
    if (tripIndex == -1) return const Trip();
    return listTrip![tripIndex];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 24.h),
      itemCount: listPurchase!.length,
      itemBuilder: (context, index) {
        return BookingCard(
          languageSelected: languageSelected,
          locale: locale,
          purchase: listPurchase![index],
          departureTrip: _trip(listPurchase![index].departureTripId),
          returnTrip: _trip(listPurchase![index].returnTripId),
          onDeleteTap: () => onDeleteTap!(listPurchase![index].id!),
          onTap: () => onTap!(listPurchase![index].id!),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 24.h),
    );
  }
}
