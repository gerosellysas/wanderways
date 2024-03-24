import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/features/network/domain/network.domain.dart';

import 'card.widget.dart';

class ScheduleList extends StatelessWidget {
  final int? languageSelected;
  final String? locale;
  final List<Trip>? listTrip;
  final void Function(int)? onTap;

  const ScheduleList({
    super.key,
    this.languageSelected,
    this.locale,
    this.listTrip,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 24.h),
        itemCount: listTrip!.length,
        itemBuilder: (context, index) {
          return ScheduleCard(
            languageSelected: languageSelected,
            locale: locale,
            origin: listTrip![index].origin,
            destination: listTrip![index].destination,
            departure: listTrip![index].departure,
            arrival: listTrip![index].arrival,
            price: listTrip![index].price,
            seats: listTrip![index].seats,
            onTap: () => onTap!(index),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
      ),
    );
  }
}
