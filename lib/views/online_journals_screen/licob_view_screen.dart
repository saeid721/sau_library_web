import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sau_library_web/views/home_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../global/widget/custom_app_bar.dart';
import '../../global/widget/custom_bottom_navigation_bar.dart';

class LicobScreen extends StatefulWidget {
  const LicobScreen({super.key});

  @override
  State<LicobScreen> createState() => _LicobScreenState();
}

class _LicobScreenState extends State<LicobScreen> {
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
        Uri.parse('https://saulibrary.edu.bd/new/licob.php'),
      );
  }

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
