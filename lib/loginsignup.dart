import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shilus_makeover/adminlogin.dart';
import 'package:shilus_makeover/common_code.dart';
import 'package:shilus_makeover/first.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'changepassword.dart';
import 'dart:async';
import 'forgotpassword.dart';
import 'package:flutter/animation.dart';
import 'package:http/http.dart' as http;
import 'commonfunction.dart';
import 'dart:convert';
class loginsignup extends StatefulWidget {
  const loginsignup({super.key});

  @override
  State<loginsignup> createState() => _loginsignupState();
}

class _loginsignupState extends State<loginsignup> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }



  @override
  Widget build(BuildContext context) {
    return MediaQuery( // Wrap with MediaQuery
      data: MediaQuery.of(context).copyWith(
        viewInsets: EdgeInsets.zero, // Reset viewInsets
      ),
      child: Material(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body:  SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFEEEFF3),
              child: Stack(
                children: [
                  Stack(
                    children: [

                      Positioned(
                        top: -30,
                        left: -28,
                        child: Card(
                          elevation: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Color(0xFF825ab2),
                              borderRadius: BorderRadius.circular(1000),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -135,
                        right: -85,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          child: Container(
                            height: 380,
                            width: 380,
                            decoration: BoxDecoration(
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
                      Positioned(
                        bottom: 50,
                        left: 100,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFBEADFA),
                            borderRadius: BorderRadius.circular(1000),
                          ),
                        ),
                      ),

                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(60.0),
                            child:
                            Image.asset('images/shillulogoblack.png', height: 110),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 70, bottom: 0),
                            child: Container(
                              height: 50,

                              child: TabBar(
                                isScrollable: true,
                                controller: _tabController,
                                tabs: [
                                  Text(
                                    'Login',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    'Signup',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(height: 10,),
                          Expanded(
                            flex: 2,
                            child: TabBarView(
                              // dragStartBehavior: DragStartBehavior.start,
                              //mouseCursor: SystemMouseCursors.noDrop,
                              // physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                              controller: _tabController,
                              children: [
                                LoginCard(),
                                SignupCard(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Align(alignment: Alignment.topRight,
                          child: PopupMenuButton<String>(
                            onSelected: (String result) {
                              if (result == 'Admin Login') {
                                // Navigate to Admin Login page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => adminlogin()),
                                );
                              }
                            },
                            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'Admin Login',
                                height: 35,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    children: [
                                      Icon(Icons.admin_panel_settings, color: Colors.black),
                                      SizedBox(width: 10),
                                      Text(
                                        'Admin Login',
                                        style: TextStyle(color: Colors.black, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Your existing layout code...
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>(); // GlobalKey for form validation
  FlutterSecureStorage storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 60,
              width: 340,
              child: Card(
                elevation: 5,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.mail),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value ?? '';
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 60,
              width: 340,
              child: Card(
                elevation: 5,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    password = value ?? '';
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 176),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => forgotpassword()),
                  );
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: 280,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 7,
                  backgroundColor: Color(0xFF9c71e0),
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    SendRequest(context);
                  }
                },
                child: Text(
                  'LOG IN',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> SendRequest(BuildContext context) async {
    String ApiAddress = MyCommon.getBase() + "user_login.php";
    var url = Uri.parse(ApiAddress);
    //api call
    try {
      // email,password(required)
      Map<String, Object> form = new Map();
      form['email'] = email;
      form['password'] = password;
      var response = await http.post(url, body: form);
      print(response.statusCode);
      print(response.body);
      //convert response into json format
      try {
        var data = json.decode(response.body);
        print(data);
        /*[{"error":"Input is missing "}]
             */

        String error = data[0]['error'];

        if (error != 'no') //yes there is an error
            {
          print("erorrororo");
        } else {
          String success = data[1]['success'];
          print(data[1]['success']);
          String message = data[2]['userid'];

          if (success == 'yes') {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                message:
                "Welcome To The Shilu's Makeover.Have a nice day",
              ),
            );
            //store id of the user into storage so that it can be used in future
            storage.write(key: 'userid', value: data[2]['userid']);
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => first()));
          }
        }
      } catch (error) {
        showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message:
              "oops, something went wrong, please contact administrator...",
            ));
        print(error);
        print(
            "oops, something went wrong, please contact administrator...");
      }
    } catch (error) {
      showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message:
            "Internet is not available (networking error)",
          ));

      print(error);
    }
  }
}



class SignupCard extends StatefulWidget {
  const SignupCard({Key? key}) : super(key: key);

  @override
  State<SignupCard> createState() => _SignupCardState();
}

class _SignupCardState extends State<SignupCard> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String email = '';
  String name = '';
  String password = '';
  String confirmPassword = '';
  final _formKey = GlobalKey<FormState>();
  FlutterSecureStorage storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 60,
              width: 340,
              child: Card(
                elevation: 5,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.mail),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value ?? '';
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 60,
              width: 340,
              child: Card(
                elevation: 5,
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value ?? '';
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 60,
              width: 340,
              child: Card(
                elevation: 5,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock_open),
                    labelText: 'Password ',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    password = value ?? '';
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 60,
              width: 340,
              child: Card(
                elevation: 5,
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Confirm Password ',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    confirmPassword = value ?? '';
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: 280,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 7,
                  backgroundColor: Color(0xFF9c71e0),
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print(email + " " + password + " " + confirmPassword + " " + name);
                    String apiAddress = MyCommon.getBase() + "insert_user.php";
                    print(apiAddress);
                    Map<String, Object> form = new Map();
                    form['email'] = email;
                    form['password'] = password;
                    form['mobile'] = '123123';
                    form['name'] = name;
                    //api calling
                    try {
                      var response = await http.post(Uri.parse(apiAddress), body: form);
                      //convert response into json
                      try {
                        print(response.body);
                        var data = json.decode(response.body);
                        print(data);
                        /*
        1) [{"error":"input is missing"}]
        2) [{"error":"no"},{"success":"yes"},{"message":"registered successfully"}]
        3) [{"error":"no"},{"success":"no"},{"message":"email or mobile is already registered with us"}]
       */
                        if (data is List && data.isNotEmpty) {
                          var success = data[1]['success'];
                          if (success == 'yes') {
                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.info(
                                message:
                                "Now please Login",
                              ),
                            );
                          }
                        }
                      } catch (error) {
                        // toast("oops, something went wrong, please contact administrator...");
                        print(error);
                      }
                    } catch (error) {
                      print("Error decoding JSON: $error");
                      // toast("oops, something went wrong, please contact administrator...");
                    }
                  }
                },
                child: Text('SIGN UP', style: TextStyle(fontSize: 18),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}