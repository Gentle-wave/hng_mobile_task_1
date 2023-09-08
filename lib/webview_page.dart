import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        const Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        );
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://github.com/Gentle-wave'));

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});
   final double progress = 0.0;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 30.00,
        title: const Text(
          'My github profile',
          style: TextStyle(fontSize: 20.0),
        ),
        backgroundColor: Colors.green,
      ),
           body: Stack(
        children: [
          WebViewWidget(controller: controller),
          FloatingActionButton(
            mini: true,
            onPressed: () {
              controller.reload();
            },
            child: const Icon(
              Icons.refresh,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}

