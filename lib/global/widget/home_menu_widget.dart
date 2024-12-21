import 'package:flutter/material.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/widget/global_image_loader.dart';
import '../../global/widget/global_sizedbox.dart';
import '../../global/widget/global_text.dart';

class HomeMenuWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final int? maxLines;
  final String imagePath;
  final String text;
  const HomeMenuWidget({
    super.key,
    this.height,
    this.width,
    this.maxLines,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size(context).width,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: ColorRes.white,
        boxShadow: [
          BoxShadow(
            color: ColorRes.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlobalImageLoader(
            imagePath: imagePath,
            height: height ?? 40,
            width: width ?? 40,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 5),
          GlobalText(
            str: text,
            color: ColorRes.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: maxLines ?? 2,
          ),
        ],
      ),
    );
  }
}
