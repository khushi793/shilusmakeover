import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class refer extends StatefulWidget {
  const refer({super.key});

  @override
  State<refer> createState() => _referState();
}

class _referState extends State<refer> {
  @override
  Widget build(BuildContext context) {
    return Material(

      child: Scaffold(
        appBar: AppBar(title: Text('Reffer'),),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text(
                'Continued Booking Discount:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Get a discount on your bookings for each consecutive booking you make with us.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Assured Gift on First Booking:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Receive a special gift when you make your first booking with us.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 130),
              Image.asset(
                'images/shillulogoblack.png', // Replace with your image asset
                height: 190,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );

  }
}
// TODO Implement this library.