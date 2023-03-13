import 'package:flutter/material.dart';
import 'package:thepetgazette/presentation/components/app_bars/app_bar_default.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebview extends StatefulWidget {
  final String title;
  final String url;

  const CustomWebview({super.key, this.title = '', required this.url});

  @override
  State<CustomWebview> createState() => _CustomWebviewState();
}

class _CustomWebviewState extends State<CustomWebview> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBarDefault(widget.title),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: widget.url,
            backgroundColor: Colors.white,
            javascriptMode: JavascriptMode.unrestricted,

            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(),
        ],
      ),
    );
  }
}
