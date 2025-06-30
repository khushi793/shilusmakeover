import 'package:flutter/material.dart';

class adminhome extends StatefulWidget {
  const adminhome({super.key});

  @override
  State<adminhome> createState() => _adminhomeState();
}

class _adminhomeState extends State<adminhome> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(appBar: AppBar(title: Text('Admin HomeScreen'),),
        body: Column(
          children: [
            Text('shilus Makeover')
          ],
        ),  
      
      ),
    );
  }
}
