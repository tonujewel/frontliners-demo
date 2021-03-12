import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontliners/widget/customLoader.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  final String url;
  NewsWebView(this.url);

  @override
  _NewsWebViewState createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {

  final Completer <WebViewController> _controller = Completer<WebViewController>();

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(this.widget.url),
        ),
        body:ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: CustomLoader(),
          child: WebView(
            initialUrl: "${widget.url}",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webviewController ){
              _controller.complete(webviewController);
            },
            onPageFinished: (finish){
              setState(() {
                isLoading = false;
              });
            },
          ),
        ),
    );
  }
}
