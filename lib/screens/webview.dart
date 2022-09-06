import 'dart:io'; // Add this import.
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  // Add from here ...
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }
  // ... to here.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.web),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Lista Star Wars'),
      ),
      body: const WebView(
        initialUrl: 'https://www.starwars.com/community',
      ),
    );
  }
}
