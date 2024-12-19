import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/constants/colors_resources.dart';
import '../global/constants/enum.dart';
import '../global/constants/images.dart';
import '../global/model.dart';
import '../global/widget/category_card_widget.dart';
import '../global/widget/global_container.dart';
import '../global/widget/global_image_loader.dart';
import '../global/widget/global_sizedbox.dart';
import '../global/widget/global_text.dart';
import 'e_books_screen/e_books_screen.dart';
import 'library_screen/library_web_view_screen.dart';
import 'university_web_screen/university_web_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<GlobalMenuModel> menuItem = [
    GlobalMenuModel(img: Images.appLogo, text: 'Library site'),
    GlobalMenuModel(img: Images.appLogo, text: 'Book Search'),
    GlobalMenuModel(img: Images.appLogo, text: 'e-Theses Search'),
    GlobalMenuModel(img: Images.appLogo, text: 'Online Books'),
    GlobalMenuModel(img: Images.appLogo, text: 'University Site'),
  ];

  int currentIndex = 0;
  final CarouselController buttonCarouselController = CarouselController();

  final List<String> sliderImage = [
    'assets/images/01.jpg',
    'assets/images/02.jpg',
    'assets/images/03.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: ColorRes.primaryColor,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GlobalImageLoader(
                imagePath: Images.appLogo,
                width: 40,
                fit: BoxFit.fill,
                imageFor: ImageFor.asset,
              ),
              Expanded(
                child: const GlobalText(
                  str: 'Sher-e-Bangla Agricultural University Library',
                  color: ColorRes.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  fontFamily: 'Rubik',
                  maxLines: 2,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to Notification Screen
                    },
                    child: const Icon(
                      Icons.search,
                      color: ColorRes.white,
                      size: 22,
                    ),
                  ),
                  sizedBoxW(15),
                ],
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            spacing: 5,
            children: [
              // Carousel Slider
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: CarouselSlider(
                  items: sliderImage.map((item) {
                    return GlobalContainer(
                      borderCornerRadius: const BorderRadius.all(Radius.circular(10.0)),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: sliderImage.asMap().entries.map((entry) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 7,
                    width: currentIndex == entry.key ? 15 : 7,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == entry.key
                          ? ColorRes.primaryColor
                          : ColorRes.borderColor,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 5),
              // Categories Row
              Row(
                children: [
                  Expanded(
                    child: CategoryCardWidget(
                      imagePath: 'assets/icons/library.png',
                      title: 'Library Site',
                      onTap: () {
                        Get.off(() => LibraryWebViewScreen());
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: CategoryCardWidget(
                      imagePath: 'assets/icons/books.png',
                      title: 'Book Search',
                      onTap: () {
                        Get.to(() => LibraryWebViewScreen());
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CategoryCardWidget(
                      imagePath: 'assets/icons/thesis.png',
                      title: 'e-Theses Search',
                      onTap: () {
                        Get.to(() => LibraryWebViewScreen());
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: CategoryCardWidget(
                      imagePath: 'assets/icons/e_books.png',
                      title: 'Online Books',
                      onTap: () {
                        Get.to(() => EbooksScreen());
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CategoryCardWidget(
                      imagePath: 'assets/icons/website.png',
                      title: 'University Site',
                      onTap: () {
                        Get.to(() => UniversityWebViewScreen());
                      },
                    ),
                  ),
                  // const SizedBox(width: 5),
                  // Expanded(
                  //   child: CategoryCardWidget(
                  //     imagePath: 'assets/icons/e_books.png',
                  //     title: 'Online Books',
                  //     onTap: () {
                  //       // Navigate to General SubCategory Screen
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
