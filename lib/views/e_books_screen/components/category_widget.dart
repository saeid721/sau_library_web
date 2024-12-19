import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/constants/colors_resources.dart';

const double cardHeight = 130.0;
const double imageWidth = 120.0;
const double imageHeight = 120.0;

class eBooksCategoryCardWidget extends StatelessWidget {
  final String? imagePath;
  final String title;
  final VoidCallback onTap;

  const eBooksCategoryCardWidget({
    super.key,
    this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: Get.width,
          padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorRes.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (imagePath != null)
                Image.asset(
                  imagePath!,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 5),
              Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorRes.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
