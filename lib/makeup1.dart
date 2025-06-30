import 'package:flutter/material.dart';
import 'package:shilus_makeover/bridalmakeup.dart';

class makeup1 extends StatefulWidget {
  const makeup1({super.key});

  @override
  State<makeup1> createState() => _makeup1State();
}

class _makeup1State extends State<makeup1> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(appBar: AppBar(title: Text('Categories of Makeup'),),
      body: SingleChildScrollView(
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

                        child: Image.asset('images/photoshoot.png',
                          fit: BoxFit.fitWidth,),
                      ),

                      SizedBox(height: 10,),
                      Align(alignment: Alignment.topLeft,
                        child: Text(
                          ' Photoshoot Makeup',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Align(alignment: Alignment.topLeft,
                        child: Text(
                          ' Starting From ₹1000',
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

                        child: Image.asset('images/lena.jpg',
                          fit: BoxFit.fitWidth,),
                      ),

                      SizedBox(height: 10,),
                      Align(alignment: Alignment.topLeft,
                        child: Text(
                          ' Birthday Makeup',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Align(alignment: Alignment.topLeft,
                        child: Text(
                          ' Starting From ₹1000',
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

                        child: Image.asset('images/lena1.jpg',
                          fit: BoxFit.cover,),
                      ),

                      SizedBox(height: 10,),
                      Align(alignment: Alignment.topLeft,
                        child: Text(
                          ' Event Makeup',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Align(alignment: Alignment.topLeft,
                        child: Text(
                          ' Starting From ₹2000',
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
              InkWell(
                onTap:(){ Navigator.push(context,MaterialPageRoute(builder: (context) => bridalmakeup()),);},
                child: SizedBox(width: 360,
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

                          child: Image.asset('images/bride1.jpg',
                            fit: BoxFit.fitWidth,),
                        ),

                        SizedBox(height: 10,),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            ' Bridal Makeup',
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
              ),
            ],
          ),
        ),
      ),),
    );
  }
}
