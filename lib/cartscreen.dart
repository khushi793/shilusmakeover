import 'package:flutter/material.dart';

class cartscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Manually add the image URL, product name, and product price here

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Text('Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
       //   margin: EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Product Image
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/oil1.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              SizedBox(width: 10),
              // Product Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'productName',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'price /-',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
