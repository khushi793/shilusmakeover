import 'package:flutter/material.dart';

class checkoutscreen extends StatefulWidget {
  const checkoutscreen({super.key});

  @override
  State<checkoutscreen> createState() => _checkoutscreenState();
}

class _checkoutscreenState extends State<checkoutscreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Checkout'),
        ),
        body: Center(
          child: Text(' checkout screen here'),
        ),
      ),
    );
  }
}
