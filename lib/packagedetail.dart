import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shilus_makeover/appointment.dart';
import 'package:shilus_makeover/first.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:http/http.dart' as http;

import 'commonfunction.dart';

class packagedetail extends StatefulWidget {
  dynamic id = 0 ;
  packagedetail(service ) {
      id = service ;
  }

  @override
  State<packagedetail> createState() => _packagedetailState(id);
}

class _packagedetailState extends State<packagedetail> {
  dynamic packageid = 0 ;
  _packagedetailState(id){
    packageid = id;
    print("---------------------------------------------");
    print(packageid);
  }
  dynamic pickedDataOrg = 0 ;
  dynamic pickedTimeOrg = 0 ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SendRequest();
  }

  dynamic packages = [ ];


  Future<void> SendRequest() async {
    String ApiAddress =
        "https://theeasylearnacademy.com/saloon/get_saloon_service_product.php?category_service_id=${packageid}";
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
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
          message: error,
        ),
      );
    else if (data[1]['total'] == 0) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "no servicee available",
        ),
      );
    } else {
      //remove 1st object
      data.removeAt(0);
      data.removeAt(0);
      print('it is actual data ---------------------------------------------');
      print(data[0]['data']);
      setState(() {
        packages = data[0]['data'][0];
      });
    }
  }

  FlutterSecureStorage storage = FlutterSecureStorage();

  Future<void> SendRequestAppointment(pickedTimeOrg,pickedDateOrd) async {
    dynamic userid = await storage.read(key: 'userid');
    print("-----------------this is user id ${userid} -------------------- ");
    String ApiAddress =
        "https://theeasylearnacademy.com/saloon/insert_appointment.php";
    print(ApiAddress);
    var url = Uri.parse(ApiAddress);
    Map<String, Object> form = new Map();
    form['appointment_date'] = pickedDateOrd.toString();
    form['appointment_time'] = pickedTimeOrg.toString();
    form['userid'] = userid.toString();
    form['serviceid'] = packageid.toString();
    form['status'] = 0.toString();
    print("888888888888888888888888");
    print(form);
    var response = await http.post(url, body: form);
    print(response.statusCode);
    print("-------------------------------------------------------------------------------");
    print(response.body);
    print(response.body);
    var data = json.decode(response.body);
    print(data);
    String error = data[0]['error'];
    if (error != 'no')
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: error,
        ),
      );
    else if (data[1]['total'] == 0) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "no servicee available",
        ),
      );
    } else {
      //remove 1st object
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => appointment()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Package Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                'https://theeasylearnacademy.com/saloon/images/${packages['photo'].toString()}',
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20.0),
              Container(
                color: Color(0xFFECCFD1),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Price: Starting From ₹${packages['price'].toString()}',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Duration: ${packages['duration'].toString()}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Contains:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                color: Color(0xFFE3F4F4),
                child: Column(
                  children: [
                    SizedBox(height: 8.0),
                    Align(alignment: Alignment.topLeft,
                      child: Text(
                        '${packages['contain'].toString()}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Details:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 8.0),
                    Text(
                      '${packages['detail'].toString()}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                  // Add your bottom sheet content here
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                    // width: 70,
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text('Select Date'),
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        // Do something with the picked date
                        pickedDataOrg = pickedDate ;
                        print("Selected date: $pickedDate");
                      }
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time),
                    title: Text('Select Time'),
                    onTap: () async {
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (pickedTime != null) {
                        // Do something with the picked time
                        pickedTimeOrg = pickedTime;
                        print("Selected time: $pickedTime");
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                   // width: 70,
                  ), // Add some spacing between the pickers and the button
                  SizedBox(height: 40,width: 120,
                    child: MaterialButton(
                      onPressed: () {
                        // Action to perform when the button is pressed
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.info(
                            message:
                            "Booked successfully",
                          ),
                        );
                        SendRequestAppointment(pickedTimeOrg,pickedDataOrg);
                      },
                      color: Colors.redAccent[100],
                      textColor: Colors.white,
                      child: Text('Book'),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                    // width: 70,
                  ),
                ],
              ));
            },
          );
        },
        label: Text('   Book'),
        icon: Icon(Icons.calendar_today),
        backgroundColor: Color(0xFFECCFD1),
      ),
    );
  }
}

