import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/constants/enum.dart';
import '../../global/constants/images.dart';
import '../../global/model.dart';
import '../../global/widget/global_image_loader.dart';
import '../../global/widget/global_sizedbox.dart';
import '../../global/widget/global_text.dart';
import '../../global/widget/home_menu_widget.dart';
import 'components/category_widget.dart';
import 'imf_elibrary_view_screen.dart';
import 'oxford_scholarship_online_view_screen.dart';
import 'taylor_view_screen.dart';
import 'wiley_view_screen.dart';

class EbooksScreen extends StatefulWidget {
  const EbooksScreen({super.key});

  @override
  State<EbooksScreen> createState() => _EbooksScreenState();
}

class _EbooksScreenState extends State<EbooksScreen> {
  List<GlobalMenuModel> menuItem = [
    GlobalMenuModel(img: Images.oxfordInc, text: 'Oxford Scholarship Online'),
    GlobalMenuModel(img: Images.elibraryInc, text: 'IMF eLibrary'),
    GlobalMenuModel(img: Images.taylorInc, text: 'Taylor & Francis Online'),
    GlobalMenuModel(img: Images.wileyInc, text: 'Wiley Online Library'),
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
                  str: 'SAU - Online Books',
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

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 15),
            GridView.builder(
                itemCount: menuItem.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    mainAxisExtent: 80
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (ctx, index){
                  return GestureDetector(
                      onTap: (){
                        switch(index){
                          case 0:
                            Get.to(()=> const OxfordScholarshipOnlineScreen());
                            break;
                          case 1:
                            Get.to(()=> const IMFeLibraryScreen());
                            break;
                          case 2:
                            Get.to(()=> const TaylorFrancisOnlineScreen());
                            break;
                          case 3:
                            Get.to(()=> const WileyOnlineLibraryScreen());
                            break;
                        }
                      },
                      child: EbooksCategoryCardWidget(
                          height: 40,
                          width: 40,
                          maxLines: 2,
                          imagePath: menuItem[index].img,
                          text: menuItem[index].text
                      )
                  );
                }
            ),

            // eBooksCategoryCardWidget(
            //   imagePath: 'assets/images/oxford.png',
            //   title: 'Oxford Scholarship Online',
            //   onTap: () {
            //     Get.off(() => OxfordScholarshipOnlineScreen());
            //   },
            // ),
            // eBooksCategoryCardWidget(
            //   imagePath: 'assets/images/elibrary.png',
            //   title: 'IMF eLibrary',
            //   onTap: () {
            //     Get.off(() => IMFeLibraryScreen());
            //   },
            // ),
            // eBooksCategoryCardWidget(
            //   imagePath: 'assets/images/taylor.png',
            //   title: 'Taylor & Francis Online',
            //   onTap: () {
            //     Get.off(() => TaylorFrancisOnlineScreen());
            //   },
            // ),
            // eBooksCategoryCardWidget(
            //   imagePath: 'assets/images/wiley.png',
            //   title: 'Wiley Online Library',
            //   onTap: () {
            //     Get.off(() => WileyOnlineLibraryScreen());
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
