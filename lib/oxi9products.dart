import 'package:flutter/material.dart';
import 'package:shilus_makeover/productdetail.dart';
import 'package:shilus_makeover/usercart.dart';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'commonfunction.dart';
import 'dart:convert';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
class Service {
  final String name;
  final String price;
  final String description;
  final String photo;
  final Widget productdetail;
  Service(this.description, this.photo, {required this.name, required this.price, required this.productdetail});
}

class Oxi9Products extends StatefulWidget {
  dynamic subServiceId = 0 ;
  Oxi9Products(service,  {Key? key}){
    subServiceId = service ;
  }

  @override
  State<Oxi9Products> createState() => _Oxi9ProductsState(subServiceId);

}

class _Oxi9ProductsState extends State<Oxi9Products> {
  var services = []; //empty list (array)


  dynamic mainServiceId = 0;

  List<Product> cart = [];

  _Oxi9ProductsState(subServiceId) {
    mainServiceId = subServiceId;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SendRequest();
  }

  Future<void> SendRequest() async
  {
    String ApiAddress = "https://theeasylearnacademy.com/saloon/get_product.php?categoryid=${mainServiceId}";
    print(ApiAddress);
    var response = await http.get(Uri.parse(ApiAddress));
    print(response.body);
    var data = json.decode(response.body);

    print(data);
    String error = data[0]['error'];
    if (error != 'no')
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
            message:
            error
        ),
      );
    else if (data[1]['total'] == 0) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message:
          "no servicee available",
        ),
      );
    }
    else {
      //remove 1st object
      data.removeAt(0);
      data.removeAt(0);
      print('it is actual data');
      print(data[0]['data']);
      setState(() {
        services = data[0]['data'];
      });
    }
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Stack(
        children: [
          GridView.builder(
            itemCount: services.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (BuildContext context, int index) {
              var service = services[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => productdetail(services[index]['id'])),
                  );
                },
                child: Card(
                  elevation: 2,
                  margin: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 100, // Adjust height as needed
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors
                                  .white, // Adjust color as needed
                            ),
                          ),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child:  Image.network(
                                MyCommon.getImageBase() +  service['photo'],
                                height: 140,
                                width: 100,
                              ),
                            ),
                          ),

                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(

                              service['name'],
                              style: TextStyle(

                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '₹ ${service['price']}',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

        ],
      ),
    );
  }

}

class Product {
  final String name;
  final String imageAsset;
  final double price;

  Product({
    required this.name,
    required this.imageAsset,
    required this.price,
  });
}

class CartScreen extends StatelessWidget {
  final List<Product> cart;

  const CartScreen({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cart[index].name),
            subtitle: Text('₹ ${cart[index].price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}