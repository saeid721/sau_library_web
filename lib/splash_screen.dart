import 'package:flutter/material.dart';

import 'global/constants/colors_resources.dart';
import 'global/constants/enum.dart';
import 'global/widget/global_image_loader.dart';
import 'global/widget/global_text.dart';
import 'views/home_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: ColorRes.backgroundColor
        ),
        child: const Center(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlobalImageLoader(
                imagePath: 'assets/images/app_logo.png',
                //imagePath: Images.appLogo,
                width: 180,
                imageFor: ImageFor.asset,
              ),
              GlobalText(
                str: 'Sher-e-Bangla Agricultural University Library',
                color: ColorRes.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                fontFamily: 'Rubik',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
