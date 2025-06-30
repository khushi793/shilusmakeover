import 'package:flutter/material.dart';
import 'package:shilus_makeover/first.dart';
import 'package:shilus_makeover/payment.dart';
import 'loginsignup.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: loginsignup(),),
    );
  }
}

void main() {
  runApp(const MyApp());
}

