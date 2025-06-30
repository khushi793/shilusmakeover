import 'package:flutter/material.dart';



class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contact Us'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  'images/contact.png',
                  width: 200,
                ),
              ),
              Card(
                color: Color(0xFF825ab2),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    ContactCard(
                      icon: Icons.phone, // Change this to the actual path of your phone image
                      text: '9825746719',
                    ),
                    SizedBox(height: 15,),
                    ContactCard(
                      icon: Icons.email,
                      text: 'shilpadevani@gmail.com',
                    ),
                    SizedBox(height: 15,),
                    ContactCard(
                      imagePath: 'images/instagram.png', // Change this to the actual path of your phone image
                      text: '@shilus_makeover',
                    ),
                    SizedBox(height: 15,),
                    ContactCard(
                      imagePath: 'images/instagram.png', // Change this to the actual path of your phone image
                      text: '@shin_me_up',
                    ),
                    SizedBox(height: 15,),
                    ContactCard(
                      imagePath: 'images/salon.png',// Change this to the actual path of your phone image
                      text: '  80-A , DevrajNagar-1,\n  Ghogha Jakatnaka,\n  Bhavnagar-364001',
                    ),
                    SizedBox(height: 15,),
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

class ContactCard extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final String text;

  ContactCard({this.icon, this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null) // If imagePath is provided, display image
              Image.asset(
                imagePath!,
                width: 24,
                height: 24,
              ),
            if (icon != null) // If icon is provided, display icon
              Icon(
                icon,
                color: Color(0xFF6148D5),
              ),
            SizedBox(width: 10.0),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
