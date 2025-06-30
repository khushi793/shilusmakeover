import 'package:flutter/material.dart';
import 'package:shilus_makeover/acceptbooking.dart';
import 'package:shilus_makeover/adminhome.dart';
import 'package:shilus_makeover/rejectbooking.dart';
import 'package:shilus_makeover/viewbooking.dart';
import 'package:shilus_makeover/viewchat.dart';
import 'package:shilus_makeover/viewcart.dart';

class adminfirst extends StatefulWidget {
  const adminfirst({super.key});

  @override
  State<adminfirst> createState() => _adminfirstState();
}

class _adminfirstState extends State<adminfirst> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [

         viewbooking(),
        acceptbooking(),
          rejectbooking(),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.black,// Setting icon color to black
        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_added),
            label: 'Accepted Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_remove_rounded),
            label: 'Rejected Booking',
          ),

        ],
      ),
    );
  }
}
