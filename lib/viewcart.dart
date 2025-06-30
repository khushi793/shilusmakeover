import 'package:flutter/material.dart';

class vieworder extends StatefulWidget {
  @override
  _vieworderState createState() => _vieworderState();
}

class _vieworderState extends State<vieworder> {
  @override
  Widget build(BuildContext context) {
    // Manually add the image URL, product name, and product price here
    String imageUrl = 'https://example.com/image.jpg';
    String productName = 'Product Name';
    double productPrice = 180.0;

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Text('View Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          //margin: EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child:Row(
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
                Text(
                  'productName',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
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
        ),
      ),
    );
  }
}
