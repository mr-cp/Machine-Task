import 'package:flutter/material.dart';

import 'mobile_view.dart';
import 'tablet_view.dart';

class HomeScreenContainer extends StatefulWidget {
  const HomeScreenContainer({super.key});

  @override
  State<HomeScreenContainer> createState() => _HomeScreenContainerState();
}

class _HomeScreenContainerState extends State<HomeScreenContainer> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return SizedBox(
      height: h,
      width: w,
      child: LayoutBuilder(
        builder: (context, constraints) =>
            constraints.maxWidth < 500 ? const MobileView() : TabletView(w: w),
      ),
    );
  }
}
