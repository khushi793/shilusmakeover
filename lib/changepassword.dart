import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'loginsignup.dart';
class changepassword extends StatefulWidget {
  const changepassword({super.key});

  @override
  State<changepassword> createState() => _changepasswordState();
}

class _changepasswordState extends State<changepassword> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Scaffold(
          resizeToAvoidBottomInset: false,

          body:   Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            color: Color(0xFFEEEFF3),
            child: Stack(
                children:[
                  Positioned(
                    top: -55,
                    left: -40,
                    //right: -50,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          border:Border.all(color: Color(0xFFBEADFA),width: 3),
                          // color: Color(0xFFEEEFF3),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -125,
                    right: -95,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: Container(
                        height: 350,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Color(0xFF9c73e0),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 75,
                    left: 60,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          // border:Border.all(color: Color(0xFF825ab2),width: 2),
                          color: Color(0xFFBEADFA),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    left: -20,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFF825ab2),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    right: -50,
                    child: Card(
                      elevation: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: Container(
                        height: 230,
                        width: 230,
                        decoration: BoxDecoration(
                          color: Color(0xFFBEADFA),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Change Password',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'Old Password',
                                  icon: Icon(Icons.lock_open_outlined),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'New Password',
                                  icon: Icon(Icons.lock_person),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'Confirm New Password',
                                  icon: Icon(Icons.lock),
                                ),
                              ),

                              SizedBox(height: 25.0),
                              ElevatedButton(
                                onPressed: () {
                                  showTopSnackBar(
                                    Overlay.of(context),
                                    CustomSnackBar.error(
                                      message:
                                      "oops, something went wrong, please contact administrator...",
                                    ),
                                  );
                                  // Handle forgot password logic
                                  print('Forgot Password pressed');
                                },
                                child: Text('Confirm',style: TextStyle(fontSize: 17),),
                                style: ElevatedButton.styleFrom(

                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  primary:  Color(0xFFBEADFA),
                                  minimumSize: Size(470, 50),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(context, PageTransition(child: loginsignup(), type: PageTransitionType.fade));

                                    },
                                    child: Text('Back to Login',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    style: TextButton.styleFrom(
                                      primary: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ]
            ),
          ),
        ));
  }
}
