import 'package:flutter/material.dart';

import '../../../shared_widget/custom_text.dart';
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
    double fontSize = w * 0.035;
    double containerWidth = w * 0.17;
    double containerHeight = h * 0.15;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: titleText,
          fontSize: fontSize,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: h * 0.015),
        SizedBox(
          height: h * 0.31,
          width: double.infinity,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: w * 0.015,
              crossAxisSpacing: w * 0.03,
              mainAxisExtent: containerHeight,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                      width: containerWidth,
                      height: containerWidth + 15,
                      child: Image(
                        image: AssetImage(
                          displayImageList[index % displayImageList.length],
                        ),
                      )),
                  Container(
                    height: h * 0.03,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 0.5, color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x0F000000),
                          blurRadius: 6,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center(
                      child: CustomText(
                        text: hP
                            .displayNameList[index % hP.displayNameList.length],
                        fontSize: fontSize * 0.7,
                        fontWeight: FontWeight.w500,
                      ),
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
