import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sau_library_web/views/home_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../global/widget/custom_app_bar.dart';
import '../../global/widget/custom_bottom_navigation_bar.dart';

class OxfordScholarshipOnlineScreen extends StatefulWidget {
  const OxfordScholarshipOnlineScreen({super.key});

  @override
  State<OxfordScholarshipOnlineScreen> createState() => _OxfordScholarshipOnlineScreenState();
}

class _OxfordScholarshipOnlineScreenState extends State<OxfordScholarshipOnlineScreen> {
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
        Uri.parse('https://academic.oup.com/oxford-scholarship-online'),
      );
  }

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

      bottomNavigationBar: CustomBottomNavigationBar(
        controller: controller,
        onHomePressed: () {
          Get.offAll(HomeScreen());
        },
      ),
    );
  }
}
