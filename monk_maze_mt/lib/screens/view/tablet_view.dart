import 'package:flutter/material.dart';

import 'mobile_view.dart';

class TabletView extends StatelessWidget {
  const TabletView({
    super.key,
    required this.w,
  });

  final double w;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1/2,
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: w * 0.20),
        child: SizedBox(
          width: w * 0.025,
          child: const MobileView(),
        ),
      ),
    );
  }
}
