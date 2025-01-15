import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global/constants/images.dart';
import '../../global/model.dart';
import '../../global/widget/custom_app_bar.dart';
import 'components/category_widget.dart';
import 'jstor_view_screen.dart';
import 'emerald_insight_view_screen.dart';
import 'licob_view_screen.dart';
import 'teeal_view_screen.dart';
import 'indian_journal_view_screen.dart';

class OnlineJournalsScreen extends StatefulWidget {
  const OnlineJournalsScreen({super.key});

  @override
  State<OnlineJournalsScreen> createState() => _OnlineJournalsScreenState();
}

class _OnlineJournalsScreenState extends State<OnlineJournalsScreen> {
  List<GlobalMenuModel> menuItem = [
    GlobalMenuModel(img: Images.jstorInc, text: 'JSTOR'),
    GlobalMenuModel(img: Images.emeraldInsightInc, text: 'Emerald insight'),
    GlobalMenuModel(img: Images.teealInc, text: 'Teeal'),
    GlobalMenuModel(img: Images.indianJournalInc, text: 'Indian Journal.com'),
    GlobalMenuModel(img: Images.licobInc, text: 'Subscribed e-Journal Consortia'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'SAU - Online Journals',
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
                            Get.to(()=> const JstorScreen());
                            break;
                          case 1:
                            Get.to(()=> const EmeraldInsightScreen());
                            break;
                          case 2:
                            Get.to(()=> const TeealScreen());
                            break;
                          case 3:
                            Get.to(()=> const IndianJournalScreen());
                            break;
                          case 4:
                            Get.to(()=> const LicobScreen());
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
