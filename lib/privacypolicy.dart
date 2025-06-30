import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';



class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
              'https://www.freeprivacypolicy.com/live/92ddde72-d9a5-4443-9837-a05cbd379024'),
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
