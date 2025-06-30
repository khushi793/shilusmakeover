import 'package:flutter/material.dart';
import 'package:shilus_makeover/packagedetail.dart';
import 'package:shilus_makeover/permenentmakeup.dart';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'commonfunction.dart';
import 'dart:convert';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'makeup1.dart';

class Service {
  final String name;
  final int scid;
  final int id;
  final String description;
  final String photo;
  final Widget makeup1;
  Service(
      this.description, this.photo, this.scid, this.id, {required this.name, required this.makeup1});
}

class makeup extends StatefulWidget {
  dynamic subServiceId = 0;
  makeup(service1, {Key? key}) : super(key: key) {
    subServiceId = service1;
  }

  @override
  State<makeup> createState() => _makeupState(subServiceId);
}

class _makeupState extends State<makeup> {
  var services = []; //empty list (array)

  dynamic mainServiceId = 0;
  _makeupState(subServiceId) {
    mainServiceId = subServiceId;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SendRequest();
  }

  Future<void> SendRequest() async {
    String ApiAddress =
        "https://theeasylearnacademy.com/saloon/get_saloon_service.php?service_category_id=${mainServiceId}";
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
      print('it is actual data');
      print("*88888888888888888888888%*****************************");
      print(data[0]['data']);
      setState(() {
        services = data[0]['data'];
      });
    }
  }

  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Service Detail'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.2,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return SizedBox(
                    width: 360,
                    child: InkWell(
                      onTap:(){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => packagedetail(services[index]['id']),
                        ));

                      } ,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            Flexible(
                              child: Container(
                                width: double.infinity,
                                height: 180,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(17),
                                    topLeft: Radius.circular(17),
                                  ), // Adjust the radius as needed
                                ),
                                child: Image.network(
                                  MyCommon.getImageBase() + services[index]['photo'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                services[index]['name'],
                                textDirection: TextDirection.ltr,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Divider(
                              height: 20,
                              color: Colors.grey,
                              thickness: 3,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      services[index]['description'],
                                      overflow: TextOverflow.ellipsis, // or TextOverflow.clip
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 17,
                                ),
                                ImageIcon(
                                  AssetImage("images/icon.png"),
                                  color: Colors.deepPurpleAccent,
                                  size: 26,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),

                      ),
                    ),
                  );
                },
                childCount: services.length,
              ),
            ),
          ],
        ),

      ),
    );
  }
}