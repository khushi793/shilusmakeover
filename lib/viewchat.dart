import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';



class viewchat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
              'https://dashboard.tawk.to/login'),
        ),
        onWebViewCreated: (controller) {
          // Handle web view creation
        },
        onLoadStart: (controller, url) {
          // Handle page loading start
        },
        onLoadStop: (controller, url) {
          // Handle page loading stop
        },
        onProgressChanged: (controller, progress) {
          // Handle page loading progress
        },
      ),
    );
  }
}
