import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/constants/colors_resources.dart';
import '../global/constants/images.dart';
import '../global/model.dart';
import '../global/widget/custom_app_bar.dart';
import '../global/widget/global_container.dart';
import '../global/widget/home_menu_widget.dart';
import 'books_search_screen/books_search_screen.dart';
import 'e_books_screen/e_books_screen.dart';
import 'e_theses_search_screen/e_theses_search_screen.dart';
import 'library_screen/library_web_view_screen.dart';
import 'online_journals_screen/online_journals_screen.dart';
import 'university_web_screen/university_web_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<GlobalMenuModel> menuItem = [
    GlobalMenuModel(img: Images.librarySiteInc, text: 'Library Site'),
    GlobalMenuModel(img: Images.bookSearchInc, text: 'Book Search'),
    GlobalMenuModel(img: Images.eThesesSearchInc, text: 'e-Theses Search'),
    GlobalMenuModel(img: Images.onlineBooksInc, text: 'Online Books'),
    GlobalMenuModel(img: Images.onlineJournalInc, text: 'Online Journal'),
    GlobalMenuModel(img: Images.universitySiteInc, text: 'University Site'),
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
      appBar: CustomAppBar(
        title: 'Sher-e-Bangla Agricultural University Library',
        // onSearchTap: () {
        //   // Handle search action
        // },
      ),
      body: SafeArea(
        child: Column(
          spacing: 5,
          children: [
            // Carousel Slider
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
              child: ClipRRect(
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: sliderImage.asMap().entries.map((entry) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 5,
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
            const SizedBox(height: 10),


            GridView.builder(
                itemCount: menuItem.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    mainAxisExtent: 145
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (ctx, index){
                  return GestureDetector(
                      onTap: (){
                        switch(index){
                          case 0:
                            Get.to(()=> const LibraryWebViewScreen());
                            break;
                          case 1:
                            Get.to(()=> const BooksSearchScreen());
                            break;
                          case 2:
                            Get.to(()=> const EthesesSearchScreen());
                            break;
                          case 3:
                            Get.to(()=> const EbooksScreen());
                            break;
                          case 4:
                            Get.to(()=> const OnlineJournalsScreen());
                            break;
                          case 5:
                            Get.to(()=> const UniversityWebViewScreen());
                            break;
                        }
                      },
                      child: HomeMenuWidget(
                          height: 40,
                          width: 40,
                          maxLines: 2,
                          imagePath: menuItem[index].img,
                          text: menuItem[index].text
                      )
                  );
                }
            ),

            // Row(
            //   children: [
            //     Expanded(
            //       child: CategoryCardWidget(
            //         imagePath: 'assets/icons/library.png',
            //         title: 'Library Site',
            //         onTap: () {
            //           Get.off(() => LibraryWebViewScreen());
            //         },
            //       ),
            //     ),
            //     const SizedBox(width: 5),
            //     Expanded(
            //       child: CategoryCardWidget(
            //         imagePath: 'assets/icons/books.png',
            //         title: 'Book Search',
            //         onTap: () {
            //           Get.to(() => BooksSearchScreen());
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: CategoryCardWidget(
            //         imagePath: 'assets/icons/thesis.png',
            //         title: 'e-Theses Search',
            //         onTap: () {
            //           Get.to(() => LibraryWebViewScreen());
            //         },
            //       ),
            //     ),
            //     const SizedBox(width: 5),
            //     Expanded(
            //       child: CategoryCardWidget(
            //         imagePath: 'assets/icons/e_books.png',
            //         title: 'Online Books',
            //         onTap: () {
            //           Get.to(() => EbooksScreen());
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: CategoryCardWidget(
            //         imagePath: 'assets/icons/website.png',
            //         title: 'University Site',
            //         onTap: () {
            //           Get.to(() => UniversityWebViewScreen());
            //         },
            //       ),
            //     ),
            //     // const SizedBox(width: 5),
            //     // Expanded(
            //     //   child: CategoryCardWidget(
            //     //     imagePath: 'assets/icons/e_books.png',
            //     //     title: 'Online Books',
            //     //     onTap: () {
            //     //       // Navigate to General SubCategory Screen
            //     //     },
            //     //   ),
            //     // ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
