import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sau_library_web/views/home_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/constants/enum.dart';
import '../../global/constants/images.dart';
import '../../global/widget/global_image_loader.dart';
import '../../global/widget/global_sizedbox.dart';
import '../../global/widget/global_text.dart';

class LibraryWebViewScreen extends StatefulWidget {
  const LibraryWebViewScreen({super.key});

  @override
  State<LibraryWebViewScreen> createState() => _LibraryWebViewScreenState();
}

class _LibraryWebViewScreenState extends State<LibraryWebViewScreen> {
  late WebViewController controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse('https://saulibrary.edu.bd/new/index.php'),
      );
  }

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
                  str: 'SAU - Library',
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

      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          loadingPercentage < 100
              ? LinearProgressIndicator(
            color: Colors.red,
            value: loadingPercentage / 100.0,
          )
              : Container(),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(

              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: ColorRes.primaryColor),
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    if (await controller.canGoBack()) {
                      await controller.goBack();
                    } else {
                      messenger.showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 200),
                          content: Text(
                            'Can\'t go back',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                      return;
                    }
                  },
                ),
                // IconButton(
                //   icon: const Icon(Icons.arrow_forward_ios),
                //   onPressed: () async {
                //     final messenger = ScaffoldMessenger.of(context);
                //     if (await controller.canGoForward()) {
                //       await controller.goForward();
                //     } else {
                //       messenger.showSnackBar(
                //         const SnackBar(
                //           duration: Duration(milliseconds: 200),
                //           content: Text(
                //             'No forward history item',
                //             style: TextStyle(
                //                 fontSize: 20, fontWeight: FontWeight.bold),
                //           ),
                //         ),
                //       );
                //       return;
                //     }
                //   },
                // ),
                // IconButton(
                //   icon: const Icon(Icons.replay),
                //   onPressed: () {
                //     controller.reload();
                //   },
                // ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.home, color: ColorRes.primaryColor, size: 30),
              onPressed: () async {
                Get.offAll(HomeScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
