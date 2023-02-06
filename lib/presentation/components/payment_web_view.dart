import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thepetgazette/utils/http_api_client.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  const PaymentWebView({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  PaymentWebViewState createState() => PaymentWebViewState();
}

class PaymentWebViewState extends State<PaymentWebView> {
  WebViewController? webViewController;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  bool transactionStarted = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitFromWebView(),
      child: Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(transactionStarted),
          ),
        ),
        body: WebView(
          // initialUrl: widget.url,
          onWebViewCreated: (WebViewController webViewController) {
            this.webViewController = webViewController;
            webViewController.loadUrl(widget.url,
                headers: {"Authorization": "Bearer $authToken"});
          },
          navigationDelegate: (NavigationRequest request) {
            transactionStarted = true;
            debugPrint('navigate url ${request.url}');

            return NavigationDecision.navigate;
          },

          onPageFinished: (_) {
            readResponse();
          },

          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
          zoomEnabled: true,
        ),
      ),
    );
  }

  void readResponse() async {
    webViewController!
        .runJavascriptReturningResult("document.documentElement.innerHTML")
        .then((value) async {
      debugPrint('readResponse $value');
    });
  }

  Future<bool> exitFromWebView() async {
    Navigator.of(context).pop(transactionStarted);
    return false;
  }
}
