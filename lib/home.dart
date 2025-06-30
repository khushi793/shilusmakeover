import 'package:carousel_slider/carousel_slider.dart';
import 'package:shilus_makeover/changepassword.dart';
import 'package:shilus_makeover/contactus.dart';
import 'package:shilus_makeover/loginsignup.dart';
import 'package:shilus_makeover/oxi9products.dart';
import 'package:shilus_makeover/privacypolicy.dart';
import 'package:shilus_makeover/refer_screen.dart';
import 'package:shilus_makeover/tutorials.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:shilus_makeover/makeup.dart';
import 'bridalmakeup.dart';
import 'package:http/http.dart' as http;
import 'commonfunction.dart';
import 'dart:convert';
import 'package:overlay_support/overlay_support.dart';

class Service {
  final String image;
  final String title;
  final Widget detailPage;
  Service({required this.image, required this.title, required this.detailPage});
}

class Service1 {
  final int id;
  final String title;
  final String photo;
  Service1({required this.photo, required this.id, required this.title});
}

class home extends StatefulWidget {
  const home({Key? key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _current = 0;
  final List<String> images = [
    'images/dhara.png',
    'images/diya.jpg',
    'images/b15.jpg',
    'images/b25.jpg',
    'images/b50.jpg',
    'images/b30.jpg',
    'images/b40.jpg',
    'images/lena.jpg',
  ];
  var services = []; //empty list (array)
  var services1 = []; //empty list (array)
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SendRequest();
    SendRequestservice();

  }
  Future<void> SendRequestservice() async {
    String ApiAddress =
        "http://www.theeasylearnacademy.com/saloon/get_saloon_service_category.php";
    print(ApiAddress);
    var response = await http.get(Uri.parse(ApiAddress));
    print(response.body);
    var data = json.decode(response.body);
    print('+++++++++++++++++++++++++++++++++++++');
    print(data);
    String error = data[0]['error'];
    if (error != 'no')
      print(error);
    else if (data[1]['total'] == 0) {
      print('no service available');
    } else {
      //remove 1st object
      data.removeAt(0);
      data.removeAt(0);
      print('it is actual data');
      print(data[0]['data']);
      setState(() {
        services1 = data[0]['data'];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: CustomDrawer(), // Use your unique drawer widget here
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            CarouselSlider(
              items: images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 15 / 10,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                int index = entry.key;
                return Container(
                  width: 10.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Colors.deepPurpleAccent
                        : Colors.grey,
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '  Services:',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(width: 650,height: 110,
              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: services1.length,
                itemBuilder: (context, index) {
                  var service1 = services1[index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print(service1['id']);
                         // print('hello');

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => makeup(service1['id'])),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          width: 78, // Make sure to adjust the width to maintain the radius
                          height: 78, // Make sure to adjust the height to maintain the radius
                          child: ClipOval(
                            child: Container(
                              width: 76, // Adjusted width to accommodate the padding
                              height: 76, // Adjusted height to accommodate the padding
                              padding: EdgeInsets.all(1), // Padding to create the inner circle
                              color: Colors.white, // Color of the inner circle
                              child: ClipOval(
                                child: Image.network(
                                  MyCommon.getImageBase() + service1['photo'],
                                  height: 140,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 7,
                      ),
                      Center(
                        child: Text(service1['title']),
                      ),

                    ],
                  );
                },
              ),
            ),
            Divider(
              height: 55,
              color: Colors.grey,
              thickness: 3,
              indent: 8,
              endIndent: 8,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '  OXI9 Products:',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                )),
            SizedBox(height: 15,),
            Container(
              height: 200, // Adjust the height according to your needs
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        var service = services[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  print(service['id']);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Oxi9Products(service['id'])),
                                  );
                                },
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                  child: Image.network(
                                    MyCommon.getImageBase() + service['photo'],
                                    height: 140,
                                    width: 100,
                                    fit: BoxFit.cover, // Change the fit to cover
                                  ),
                                ),
                              ),

                              Center(
                                child: Text(
                                  service['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        );
                      },
                      childCount: services.length,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
              thickness: 3,
              indent: 8,
              endIndent: 8,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '  Tutorials:',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                )),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => tutorials()),
                );
              },
              child: Container(
                child: Image.asset('images/tuto.gif',
                    height: 200, width: 380, fit: BoxFit.fill),
              ),
            ),
            Divider(
              height: 55,
              color: Colors.grey,
              thickness: 3,
              indent: 8,
              endIndent: 8,
            ),
          ]),
        ),
      ),
    );
  }


  Future<void> SendRequest() async {
    String ApiAddress =
        "http://www.theeasylearnacademy.com/saloon/get_category.php";
    // "http://www.theeasylearnacademy.com/saloon/get_product.php?categoryid=${mainServiceId}";

    print(ApiAddress);
    var response = await http.get(Uri.parse(ApiAddress));
    print(response.body);
    var data = json.decode(response.body);
    print(data);
    String error = data[0]['error'];
    if (error != 'no')
      print(error); //t
    else if (data[1]['total'] == 0) {
      print('no service available'); //t
    } else {
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
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFBEADFA), Color(0xFF6148D5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Image.asset('images/shillulogoblack.png', height: 120),
            ),
          ),
          SizedBox(height: 15),
          ListTile(
            leading: Icon(
              Icons.card_giftcard,
              color: Color(0xFF6148D5),
            ),
            title: Text(
              'Loyalty Bonus',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => refer()),
              ); // Navigate to loyalty bonus
            },
          ),
          ListTile(
            leading: Icon(
              Icons.key_outlined,
              color: Color(0xFF6148D5),
            ),
            title: Text(
              'Change Password',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => changepassword()),
              );
              // Navigate to profile
            },
          ),
          ListTile(
            leading: Icon(
              Icons.headset_mic_outlined,
              color: Color(0xFF6148D5),
            ),
            title: Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactUsScreen()),
              );
              // Navigate to customer support
            },
          ),
          ListTile(
            leading: Icon(
              Icons.privacy_tip_outlined,
              color: Color(0xFF6148D5),
            ),
            title: Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
              );
              // Navigate to privacy policy
            },
          ),




          ListTile(
            leading: Icon(
              Icons.logout,
              color: Color(0xFF6148D5),
            ),
            title: Text(
              'Log Out',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => loginsignup()),
              );
              // Log out functionality
            },
          ),
        ],
      ),
    );
  }
}