import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monk_maze_mt/shared_widget/custom_text.dart';
import 'package:monk_maze_mt/utils/size_constants.dart';
import 'package:provider/provider.dart';

import '../controller/home_controller.dart';
import '../widgets/category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 92,
                      height: 1233.52,
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
                              context.read<HomeController>().indexTapped(index);
                              hP.scrollToCategory(index);
                            },
                            child: SizedBox(
                              height: h * 0.115,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 3.5,
                                          decoration: BoxDecoration(
                                            color: context
                                                        .watch<HomeController>()
                                                        .isTapped ==
                                                    index
                                                ? const Color(0xFF8034DA)
                                                : null,
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight: Radius.circular(45),
                                              topRight: Radius.circular(45),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          h13,
                                          Container(
                                            height: 45,
                                            width: 45,
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      h * 0.092),
                                              color: const Color(0xFFE3E1F1),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  hP.rowImageList[index],
                                                ),
                                              ),
                                            ),
                                          ),
                                          h2,
                                          Text(hP.rowCategoryList[index],
                                              style: GoogleFonts.manrope(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          h13,
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

              // Second column (category sections)
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                            w10,
                            SizedBox(
                              width: w * 0.5,
                              child: Divider(
                                height: 0,
                                thickness: 1,
                                color: Colors.grey[300],
                              ),
                            )
                          ],
                        ),
                        h15,
                        Categories(
                          key: hP.categoryKeys[0],
                          h: h,
                          w: w,
                          hP: hP,
                          titleText: 'Upper Wear',
                          displayImageList: hP.displayImageList,
                        ),
                        h20,
                        Categories(
                          key: hP.categoryKeys[1],
                          h: h,
                          w: w,
                          hP: hP,
                          titleText: 'Lower Wear',
                          displayImageList: hP.displayImageList,
                        ),
                        h20,
                        Categories(
                          key: hP.categoryKeys[2],
                          h: h,
                          w: w,
                          hP: hP,
                          titleText: 'Beauty Product',
                          displayImageList: hP.beautyProductList,
                        ),
                        h20,
                        Categories(
                          key: hP.categoryKeys[3],
                          h: h,
                          w: w,
                          hP: hP,
                          titleText: 'Inner wear',
                          displayImageList: hP.displayImageList,
                        ),
                        Categories(
                          key: hP.categoryKeys[4],
                          h: h,
                          w: w,
                          hP: hP,
                          titleText: 'Lounge wear',
                           displayImageList: hP.beautyProductList,
                        ),
                        Categories(
                          key: hP.categoryKeys[5],
                          h: h,
                          w: w,
                          hP: hP,
                          titleText: 'Sleep wear',
                          displayImageList: hP.displayImageList,
                        ),
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
