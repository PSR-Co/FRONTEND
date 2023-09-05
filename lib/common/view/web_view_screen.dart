import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../const/colors.dart';

class WebViewScreen extends StatefulWidget {

  final String appbarTitle;
  final String url;

  const WebViewScreen({
    required this.appbarTitle,
    required this.url,
    Key? key
  }) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  WebViewController? controller;

  @override
  void initState() {
    super.initState();

    final url = Uri.parse(widget.url);
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBarLayout(titleText: widget.appbarTitle,),
      body: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 0, right: 20, left: 20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: GRAY_0_COLOR,
          )
        ),
        child: WebViewWidget(
          controller: controller!,
        ),
      )
    );
  }
}
