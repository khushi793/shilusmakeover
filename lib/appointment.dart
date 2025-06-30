import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class appointment extends StatefulWidget {
  @override
  _appointmentState createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {
  dynamic appointmentData = [ ] ;
  FlutterSecureStorage storage = FlutterSecureStorage();


  void initState() {
    // TODO: implement initState
    super.initState();
    SendRequest();
  }

  Future<void> SendRequest() async {
    dynamic userid = await storage.read(key: 'userid');
    print("-----------------this is user id ${userid} -------------------- ");
    String ApiAddress =
        "https://theeasylearnacademy.com/saloon/get_appointment.php?userid=" + userid.toString();
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
          message: "no appointment available",
        ),
      );
      appointmentData = [];

    } else {
      //remove 1st object
      data.removeAt(0);
      data.removeAt(0);
      print('it is actual data************************************');
      print(data[0]['data']);
      setState(() {
        appointmentData = data[0]['data'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

          home: Scaffold(
            appBar: AppBar(
              title: Text('Appointment Bookings'),

            ),
            body:SizedBox(
              height: 1000,
              child: appointmentData.isNotEmpty ? ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: NetworkImage('https://theeasylearnacademy.com/saloon/images/' + appointmentData[index]['service_image']), // Replace with actual image
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  appointmentData[index]['service_name'],
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Appointment Date :" + appointmentData[index]['appointment_date'],
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ), // Replace with actual date
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: appointmentData.length,
              ) : Center(
                child: Text("Appointment is empty"),
              ),
            ),

          ));
  }
}


