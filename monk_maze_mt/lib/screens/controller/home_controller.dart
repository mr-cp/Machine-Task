import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  bool? isVisible = false;

  bool _isScrollingProgrammatically = false;

  int _isTapped = 0;
  int get isTapped => _isTapped;

  void indexTapped(int index) {
    _isTapped = index;
    isVisible = true;
    notifyListeners();
  }

  List<String> rowImageList = [
    "assets/rowImg_0.png",
    "assets/rowImg_1.png",
    "assets/rowImg_2.png",
    "assets/rowImg_3.png",
    "assets/rowImg_4.png",
    "assets/rowImg_5.png",
    "assets/rowImg_6.png",
  ];
  List<String> rowCategoryList = [
    "Kids",
    "Mobile",
    "Electronics",
    "Women",
    "Men",
    "Decor",
    "Furniture",
  ];
  List<String> displayImageList = [
    "assets/displayImage_1.jpg",
    "assets/displayImage_2.jpg",
    "assets/displayImage_3.jpg",
    "assets/displayImage_4.jpg",
  ];
  List<String> displayNameList = [
    "Shirts",
    "Fusion Wear",
    "Co-ords",
    "Dresses",
  ];
  List<String> beautyProductList = [
    "assets/beautyProduct_1.jpg",
    "assets/beautyProduct_2.jpg",
    "assets/beautyProduct_3.jpg",
    "assets/beautyProduct_4.jpg",
  ];

  final ScrollController scrollController = ScrollController();

  final Map<int, GlobalKey> categoryKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
    4: GlobalKey(),
    5: GlobalKey(),
    6: GlobalKey(),
  };

  void scrollToCategory(int index) {
    _isScrollingProgrammatically = true;
    final context = categoryKeys[index]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.bounceIn,
      ).then((_) => _isScrollingProgrammatically = false);
      _isTapped = index;
      notifyListeners();
    }
  }

  HomeController() {
    scrollController.addListener(_updateActiveCategoryOnScroll);
  }

  void _updateActiveCategoryOnScroll() {
    if (_isScrollingProgrammatically) return; 
    for (int index = 0; index < categoryKeys.length; index++) {
      final context = categoryKeys[index]?.currentContext;
      if (context != null) {
        final renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero).dy;
        if (position >= 0 && position < 200) {
          if (_isTapped != index) {
            _isTapped = index;
            notifyListeners();
          }
          break;
        }
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
