import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global/constants/images.dart';
import '../../global/model.dart';
import '../../global/widget/custom_app_bar.dart';
import 'components/category_widget.dart';
import 'imf_elibrary_view_screen.dart';
import 'oxford_scholarship_online_view_screen.dart';
import 'proquest_ebook_central_screen.dart';
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
    GlobalMenuModel(img: Images.proquestEbookCentralInc, text: 'Proquest Ebook Central'),
    GlobalMenuModel(img: Images.taylorInc, text: 'Taylor & Francis Online'),
    GlobalMenuModel(img: Images.wileyInc, text: 'Wiley Online Library'),
    GlobalMenuModel(img: Images.elibraryInc, text: 'IMF eLibrary'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'SAU - Online Books',
        onSearchTap: () {
          // Handle search action
        },
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
                            Get.to(()=> const ProquestEbookCentralScreen());
                            break;
                          case 2:
                            Get.to(()=> const TaylorFrancisOnlineScreen());
                            break;
                          case 3:
                            Get.to(()=> const WileyOnlineLibraryScreen());
                            break;
                          case 4:
                            Get.to(()=> const IMFeLibraryScreen());
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
