import 'package:flutter/material.dart';

class permenentmakeup extends StatefulWidget {
  const permenentmakeup({super.key});

  @override
  State<permenentmakeup> createState() => _permenentmakeupState();
}

class _permenentmakeupState extends State<permenentmakeup> {
  @override
  Widget build(BuildContext context) {
    return Material(child: Scaffold(appBar: AppBar(title: Text('Permenent Makeup'),),
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(width: 360,
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [

                      Container(
                        width: double.infinity,
                        height: 170,
                        clipBehavior: Clip.antiAlias,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(17),
                            topLeft: Radius.circular(17),
                          ),// Adjust the radius as needed
                        ),

                        child: Image.asset('images/pm1.jpeg',
                          fit: BoxFit.cover,),
                      ),

                      SizedBox(height: 10,),
                      Align(alignment: Alignment.topLeft,
                        child: Text(
                          ' Permenent Eyeliner',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Align(alignment: Alignment.topLeft,
                        child: Text(
                          ' Starting From ₹4999',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(

                              fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10,),


                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(width: 360,
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [

                      Container(
                        width: double.infinity,
                        height: 170,
                        clipBehavior: Clip.antiAlias,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(17),
                            topLeft: Radius.circular(17),
                          ),// Adjust the radius as needed
                        ),

                        child: Image.asset('images/perlip.jpeg',
                          fit: BoxFit.cover,),
                      ),

                      SizedBox(height: 10,),
                      Align(alignment: Alignment.topLeft,
                        child: Text(
                          ' Permenent Lipstic',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Align(alignment: Alignment.topLeft,
                        child: Text(
                          ' Starting From ₹4999',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(

                              fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10,),


                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(width: 360,
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [

                      Container(
                        width: double.infinity,
                        height: 170,
                        clipBehavior: Clip.antiAlias,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(17),
                            topLeft: Radius.circular(17),
                          ),// Adjust the radius as needed
                        ),

                        child: Image.asset('images/eb.jpeg',
                          fit: BoxFit.cover,),
                      ),

                      SizedBox(height: 10,),
                      Align(alignment: Alignment.topLeft,
                        child: Text(
                          ' Permenent Eyebrow',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Align(alignment: Alignment.topLeft,
                        child: Text(
                          ' Starting From ₹4999',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(

                              fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10,),


                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),



            ],
          ),
        ),
      ),

      ),);
  }
}
