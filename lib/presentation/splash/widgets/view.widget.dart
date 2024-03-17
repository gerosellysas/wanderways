import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

class SplashView extends StatelessWidget {
  final List<Widget>? children;

  const SplashView({
    super.key,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hues.primary,
      body: Center(
        child: Container(
          color: Colors.transparent,
          height: 145.w,
          width: 280.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: children!,
          ),
        ),
      ),
    );
  }
}
