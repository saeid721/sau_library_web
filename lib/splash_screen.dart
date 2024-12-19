import 'package:flutter/material.dart';

import 'global/constants/colors_resources.dart';
import 'global/constants/enum.dart';
import 'global/constants/images.dart';
import 'global/widget/global_image_loader.dart';
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
          child: GlobalImageLoader(
            imagePath: 'assets/images/app_logo.png',
            //imagePath: Images.appLogo,
            height: 220,
            width: 220,
            fit: BoxFit.fill,
            imageFor: ImageFor.asset,
          ),
        ),
      ),
    );
  }
}
