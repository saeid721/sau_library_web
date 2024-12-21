import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../global/constants/colors_resources.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final WebViewController controller;
  final VoidCallback onHomePressed;

  const CustomBottomNavigationBar({
    super.key,
    required this.controller,
    required this.onHomePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            onPressed: onHomePressed,
          ),
        ],
      ),
    );
  }
}
