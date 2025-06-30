import 'package:flutter/material.dart';
import 'package:shilus_makeover/contactus.dart';

class expert extends StatefulWidget {
  const expert({super.key});

  @override
  State<expert> createState() => _expertState();
}

class _expertState extends State<expert> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Experts Of Shilus Makeover')),
      body: Column(
        children: [
          Container(
            height: 90,
            child: Card(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 39,
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage:
                      AssetImage('images/shilpa.jpg'),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      children: [
                        Text('Shilpa Devani',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text(' Makeup And Hairstyle Artist',style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
            height: 90,
            child: Card(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 39,
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage:
                      AssetImage('images/l2.jpg'),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      children: [
                        Text('Lency Devani',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text(' Nailart And Hairstyle Artist',style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Navigate to user cart screen and pass the product data
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>ContactUsScreen(),
              ),
            );
          },
          label: Text('Need Help? Contact Us'),
          icon: Icon(Icons.phone),
          backgroundColor: Colors.deepPurpleAccent[50],
        ),


        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
