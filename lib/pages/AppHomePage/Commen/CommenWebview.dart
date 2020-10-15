import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
class CommenWebview extends StatefulWidget {
  CommenWebview({Key key,this.params}):super(key:key);
  final params;
  @override
  _CommenWebviewState createState() => _CommenWebviewState();
}

class _CommenWebviewState extends State<CommenWebview> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _loadWeb(){
      return WebView(
        initialUrl: widget.params["url"],
        javascriptMode: JavascriptMode.unrestricted,
        // 监听
//        onWebViewCreated: (controller) {
//          _controller = controller;
//          _title = widget.navTtile;
//        },
//        onPageFinished: (url) {
//          // js监听
//          _controller.evaluateJavascript("document.title").then((result) {
//            setState(() {
//              _title = result;
//            });
//          });
//        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith("gxmobile://")) {
            // 拦截处理
            return NavigationDecision.prevent;
          }
          // 不需要链接处理
          return NavigationDecision.navigate;
        },
        onWebResourceError: (error) {
          // 界面加载错误
          print(error.description);
        },
        // 注入js
        javascriptChannels: <JavascriptChannel>[
          JavascriptChannel(
              name: 'name',
              onMessageReceived: (JavascriptMessage message) {
                print("参数： ${message.message}");
              })
        ].toSet(),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.params["title"]),
      ),
      body: Container(
        color: Colors.white,
        child: _loadWeb()
      ),
    );
  }
}
