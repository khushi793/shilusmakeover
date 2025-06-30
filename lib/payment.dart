import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';



class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment '),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
              'https://devarsh2007.github.io/payment/payment_gateway'),
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
