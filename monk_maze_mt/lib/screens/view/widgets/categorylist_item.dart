
import 'package:flutter/material.dart';

import '../../../shared_widget/custom_text.dart';

class CategoryItem extends StatelessWidget {
  String categoryName;
  CategoryItem({
    super.key,
    required this.categoryName,
    required this.w,
    required this.h,
  });

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
            text: categoryName,
            fontSize: h * 0.015,
            color: Colors.black54,
            fontWeight: FontWeight.w500),
        SizedBox(
          width: h * 0.015,
        ),
        Flexible(
          child: Divider(
            height: 0,
            thickness: 1,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}