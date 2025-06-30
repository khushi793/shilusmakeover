import 'package:flutter/material.dart';
import 'package:shilus_makeover/appointment.dart';
import 'package:shilus_makeover/cartscreen.dart';
import 'package:shilus_makeover/chat.dart';
import 'package:shilus_makeover/expert.dart';
import 'package:shilus_makeover/home.dart';
import 'package:shilus_makeover/payment.dart';
//import 'package:shilus_makeover/home.dart';
import 'package:shilus_makeover/refer_screen.dart';
import 'package:shilus_makeover/usercart.dart';

class Common {
  static List<BottomNavigationBarItem> getItems() {
    return [
      BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home_filled),
      ),
      BottomNavigationBarItem(
        label: 'Booking',
        icon: Icon(Icons.collections_bookmark),
      ),
      BottomNavigationBarItem(
        label: 'cart',
        icon: Icon(Icons.shopping_cart),
      ),
      BottomNavigationBarItem(
        label: 'chat',
        icon: Icon(Icons.chat),
      ),
      BottomNavigationBarItem(
        label: 'expert',
        icon: Icon(Icons.person),
      )
    ];
  }

  static void onItemSelected(BuildContext context, int index) {
    // Respond to item press.
    print(index);
    if (index == 0)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => home()),
      );
    else if (index == 1)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => appointment()),
      );
    else if (index == 2)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
      );
    else if (index == 3)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => chat()),
      );
    else if (index == 4)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => expert()),
      );
  }
}
