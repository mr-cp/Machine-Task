import 'package:flutter/material.dart';

import '../../shared_widget/custom_text.dart';
import '../controller/home_controller.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.h,
    required this.w,
    required this.hP,
    required this.titleText,
    required this.displayImageList,
  });

  final double h;
  final double w;
  final HomeController hP;
  final String titleText;
  final List<String> displayImageList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: titleText,
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: h * 0.31,
          width: w * 0.65,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 12.0,
              mainAxisExtent: 113,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image(
                    image: AssetImage(
                      displayImageList[index % displayImageList.length],
                    ),
                  ),
                  Container(
                    width: 67.98,
                    height: 21.24,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 0.5, color: Colors.white),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: CustomText(
                      text:
                          hP.displayNameList[index % hP.displayNameList.length],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}