import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Ofksdfsdf extends StatefulWidget {
  final String url;
  final String title;

  const Ofksdfsdf({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<Ofksdfsdf> createState() => _OfksdfsdfState();
}

class _OfksdfsdfState extends State<Ofksdfsdf> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
