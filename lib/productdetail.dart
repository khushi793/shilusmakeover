import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shilus_makeover/payment.dart';
import 'package:shilus_makeover/usercart.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class productdetail extends StatefulWidget {
  final dynamic productId;

  productdetail(this.productId);

  @override
  _productdetailState createState() => _productdetailState();
}

class _productdetailState extends State<productdetail> {
  dynamic productData = [];

  @override
  void initState() {
    super.initState();
    sendRequest(widget.productId);
  }

  Future<void> sendRequest(productId) async {
    String apiAddress =
        "https://theeasylearnacademy.com/saloon/get_product.php?productid=${productId}";
    print(apiAddress);
    var response = await http.get(Uri.parse(apiAddress));
    print(response.body);
    var data = json.decode(response.body);
    print(data);
    String error = data[0]['error'];
    //remove 1st object
    data.removeAt(0);
    data.removeAt(0);
    print('it is actual data');
    print(data[0]['data']);
    setState(() {
      productData = data[0]['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Detail'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [

                Color(0xFF434343),
                Color(0xFF434343),
                Color(0xFF434343),
                //
                Color(0xFF000000)],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Photo
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: NetworkImage('https://theeasylearnacademy.com/saloon/images/${productData[0]['photo']}'), // Assuming 'images/oil.jpg' is the correct asset path
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Product Name
                  Text(
                    '${productData[0]['name']}',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Product Price
                  Text(
                    '\₹' +productData[0]['price'], // Replace with actual price
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.greenAccent,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Product Description
                  Text(
                    '${productData[0]['description']}',// Replace with actual description
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Navigate to user cart screen and pass the product data
               Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>PrivacyPolicyScreen(),
            ),
          );
          },
          label: Text('Shop Now'),
          icon: Icon(Icons.shopping_bag),
          backgroundColor: Colors.greenAccent,
        ),


        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
