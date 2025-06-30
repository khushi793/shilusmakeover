import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'commonfunction.dart';
import 'dart:convert';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Service {
  final String image;
  final String title;
  final Widget detailPage;
  Service({required this.image, required this.title, required this.detailPage});
}

class tutorials extends StatefulWidget {
  const tutorials({super.key});

  @override
  State<tutorials> createState() => _tutorialsState();
}

class _tutorialsState extends State<tutorials> {
  var services = []; //empty list (array)
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SendRequest();
  }

  Future<void> SendRequest() async {
    String ApiAddress =
        "http://www.theeasylearnacademy.com/saloon/get_tutorial.php";
    print(ApiAddress);
    var response = await http.get(Uri.parse(ApiAddress));
    print(response.body);
    var data = json.decode(response.body);
    print('+++++++++++++++++++++++++++++++++++++');
    print(data);
    String error = data[0]['error'];
    if (error != 'no')
      print(error);
    else if (data[1]['total'] == 0) {
      print('no service available');
    } else {
      //remove 1st object
      data.removeAt(0);
      data.removeAt(0);
      print('it is actual data');
      print(data[0]['data']);
      setState(() {
        services = data[0]['data'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tutorials'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.6,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 201,
                          width: 350,
                          child: YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: services[index]['video_url'],
                              flags: YoutubePlayerFlags(
                                autoPlay: false,
                              ),
                            ),
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.amber,
                            progressColors: ProgressBarColors(
                              playedColor: Colors.amber,
                              handleColor: Colors.amberAccent,
                            ),
                          ),
                        ),
                        SizedBox(height: 1),
                      ],
                    ),
                  );
                },
                  childCount:services.length, // Assuming you want only one video
              ),
            ),
          ],
        ),
      ),
    );
  }
}
