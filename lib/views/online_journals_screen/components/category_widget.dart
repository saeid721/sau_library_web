import 'package:flutter/material.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/global_sizedbox.dart';
import '../../../global/widget/global_text.dart';

class EbooksCategoryCardWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final int? maxLines;
  final String imagePath;
  final String text;
  const EbooksCategoryCardWidget({
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
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: ColorRes.grey,
                    width: 1.0,
                  ),
                ),
              ),
              child: GlobalImageLoader(
                imagePath: imagePath,
                height: height ?? 40,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            flex: 2,
            child: GlobalText(
              str: text,
              color: ColorRes.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              maxLines: maxLines ?? 2,
            ),
          ),
        ],
      ),
    );
  }
}
