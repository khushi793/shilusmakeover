import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shilus_makeover/rejectbooking.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'acceptbooking.dart';

class viewbooking extends StatefulWidget {
  @override
  _viewbookingState createState() => _viewbookingState();
}

class _viewbookingState extends State<viewbooking> {

  dynamic appointmentData = [ ] ;

  void initState() {
    // TODO: implement initState
    super.initState();
    SendRequest();
  }

  Future<void> SendRequest() async {
    String ApiAddress =
        "https://theeasylearnacademy.com/saloon/get_admin_appointment.php";
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
      print('it is actual data************************************');
      print(data[0]['data']);
      setState(() {
        appointmentData = data[0]['data'];
      });
    }
  }


  Future<void> SendRequestAccept(id) async {
    String ApiAddress =
        "https://theeasylearnacademy.com/saloon/accept_appointment.php?appointmentid=${id}";
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
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => acceptbooking()));
    }
  }


  Future<void> SendRequestReject(id) async {
    String ApiAddress =
        "https://theeasylearnacademy.com/saloon/reject_appointment.php?appointmentid=${id}";
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
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => rejectbooking()));
    }
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('View Appointment Bookings'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.builder(itemBuilder: (context,index){
              return SizedBox(
                height: 150,
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage('https://theeasylearnacademy.com/saloon/images/'+appointmentData[index]['service_photo']), // Replace with actual image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                appointmentData[index]['service_name'],
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Row(children: [
                                Icon(Icons.calendar_today, size: 16),
                                SizedBox(width: 5),
                                Text(appointmentData[index]['appointment_date'],),
                              ],),
                              SizedBox(width: 10),
                              Row(children: [
                                Icon(Icons.verified_user, size: 16),
                                SizedBox(width: 5),
                                Text(appointmentData[index]['username'],),],),

                            ],
                          ),
                        ),
                        if (true)
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  SendRequestAccept( appointmentData[index]['id'],);
                                },
                                child: Text('Accept'),
                              ),
                              SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: (){
                                  SendRequestReject( appointmentData[index]['id'],);
                                },
                                child: Text('Reject'),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              );
            } , itemCount: appointmentData.length,),
          ),
        ),
      ),
    );
  }
}

class PendingAppointments extends StatefulWidget {
  @override
  _PendingAppointmentsState createState() => _PendingAppointmentsState();
}

class _PendingAppointmentsState extends State<PendingAppointments> {
  List<Appointment> pendingAppointments = [
    Appointment(packageName: 'Bridemakeover', price: 100, date: '10th April, 2024', time: '10:00 AM', duration: '1 hour'),
    // Add more pending appointments here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pendingAppointments.length,
      itemBuilder: (context, index) {
        return AppointmentCard(
          appointment: pendingAppointments[index],
          onAccept: () {
            // Move appointment to Accepted/Rejected screen
            setState(() {
              acceptedAppointments.add(pendingAppointments[index]);
              pendingAppointments.removeAt(index);
            });
          },
          onReject: () {
            // Reject appointment logic
            // Here, you can implement logic to reject the appointment
            // For simplicity, I'm just removing it from the list
            setState(() {
              pendingAppointments.removeAt(index);
            });
          },
        );
      },
    );
  }
}

class AcceptedRejectedAppointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 0,
      itemBuilder: (context, index) {
        return ;
      },
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  AppointmentCard({required this.appointment, this.onAccept, this.onReject});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('images/dhara.png'), // Replace with actual image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment.packageName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Row(children: [
                    Icon(Icons.calendar_today, size: 16),
                    SizedBox(width: 5),
                    Text(appointment.date),],),
                  SizedBox(width: 10),
                  Row(children: [
                    Icon(Icons.access_time, size: 16),
                    SizedBox(width: 5),
                    Text(appointment.time),],),
                  SizedBox(height: 8),
                  Text(
                    'Duration: ${appointment.duration}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Price: \$${appointment.price.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            if (onAccept != null && onReject != null)
              Column(
                children: [
                  ElevatedButton(
                    onPressed: onAccept,
                    child: Text('Accept'),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: onReject,
                    child: Text('Reject'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class Appointment {
  final String packageName;
  final double price;
  final String date;
  final String time;
  final String duration;

  Appointment({required this.packageName, required this.price, required this.date, required this.time, required this.duration});
}

List<Appointment> acceptedAppointments = [];

void main() {
  runApp(viewbooking());
}
