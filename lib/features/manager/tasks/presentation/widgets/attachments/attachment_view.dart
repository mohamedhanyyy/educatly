import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AttachmentViewScreen extends StatefulWidget {
  final String url;

  const AttachmentViewScreen({super.key, required this.url});

  @override
  State<AttachmentViewScreen> createState() => _AttachmentViewScreenState();
}

class _AttachmentViewScreenState extends State<AttachmentViewScreen> {
  int? _progress;
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) => setState(() => _progress = progress),
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return _progress != 100
        ? Center(child: CircularProgressIndicator.adaptive())
        : WebViewWidget(controller: controller);
  }
}
