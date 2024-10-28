import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monk_maze_mt/shared_widget/custom_text.dart';
import 'package:monk_maze_mt/utils/size_constants.dart';
import 'package:provider/provider.dart';

import '../controller/home_controller.dart';
import 'widgets/category_widget.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    final hP = Provider.of<HomeController>(context, listen: false);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Divider(
              height: 0,
              thickness: 1,
              color: Colors.grey[200],
            )),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: const CustomText(
          text: 'Categories',
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        leadingWidth: 70,
        toolbarHeight: 65,
        leading: IconButton(
          onPressed: () {},
          icon: const Image(
            image: AssetImage('assets/back.png'),
            height: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage('assets/whishlist.png'),
              height: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage('assets/cart.png'),
              height: 24,
            ),
          ),
          w7,
        ],
      ),
      body: Container(
        height: h,
        width: w,
        color: Colors.white,
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First column (category buttons)
              ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: w * 0.19,
                        height: h ,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF8F7FE),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 0,
                              thickness: 1,
                              color: Colors.grey[200],
                            );
                          },
                          shrinkWrap: true,
                          itemCount: hP.rowImageList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context
                                    .read<HomeController>()
                                    .indexTapped(index);
                                hP.scrollToCategory(index);
                              },
                              child: SizedBox(
                                height: h * 0.105,
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: w * 0.01,
                                            decoration: BoxDecoration(
                                              color: context
                                                          .watch<
                                                              HomeController>()
                                                          .isTapped ==
                                                      index
                                                  ? const Color(0xFF8034DA)
                                                  : null,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(40),
                                                topRight: Radius.circular(40),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: context
                                                    .read<HomeController>()
                                                    .isTapped ==
                                                index
                                            ? Colors.white
                                            : null,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: h * 0.07,
                                              width: w * 0.12,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: const Color(0xFFE3E1F1),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      hP.rowImageList[index],
                                                    ),
                                                    fit: BoxFit.contain),
                                              ),
                                            ),
                                            // h5,
                                            Text(hP.rowCategoryList[index],
                                                style: GoogleFonts.manrope(
                                                  fontSize: h * 0.01,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Second column (category sections)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: h * 0.015, vertical: h * 0.018),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: hP.scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CustomText(
                                text: 'Women',
                                fontSize: 12,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              width: w * 0.015,
                            ),
                            Flexible(
                              child: Divider(
                                height: 0,
                                thickness: 1,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: h * 0.015),
                        Categories(
                          key: hP.categoryKeys[0],
                          h: h,
                          w: w,
                          hP: hP,
                          titleText: 'Upper Wear',
                          displayImageList: hP.displayImageList,
                        ),
                        SizedBox(height: h * 0.015),
                        Categories(
                          key: hP.categoryKeys[1],
                          h: h,
                          w: w,
                          hP: hP,
                          titleText: 'Lower Wear',
                          displayImageList: hP.displayImageList,
                        ),
                        SizedBox(height: h * 0.015),
                        Categories(
                          key: hP.categoryKeys[2],
                          h: h,
                          w: w,
                          hP: hP,
                          titleText: 'Beauty Product',
                          displayImageList: hP.beautyProductList,
                        ),
                        SizedBox(height: h * 0.015),
                        Categories(
                          key: hP.categoryKeys[3],
                          h: h,
                          w: w,
                          hP: hP,
                          titleText: 'Inner wear',
                          displayImageList: hP.displayImageList,
                        ),
                        SizedBox(height: h * 0.015),
                        Categories(
                          key: hP.categoryKeys[4],
                          h: h,
                          w: w,
                          hP: hP,
                          titleText: 'Lounge wear',
                          displayImageList: hP.beautyProductList,
                        ),
                        SizedBox(height: h * 0.015),
                        Categories(
                          key: hP.categoryKeys[5],
                          h: h,
                          w: w,
                          hP: hP,
                          titleText: 'Sleep wear',
                          displayImageList: hP.displayImageList,
                        ),
                        SizedBox(height: h * 0.015),
                        Categories(
                          key: hP.categoryKeys[6],
                          h: h,
                          w: w,
                          hP: hP,
                          titleText: 'Party wear',
                          displayImageList: hP.beautyProductList,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
