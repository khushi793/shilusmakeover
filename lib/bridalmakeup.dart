import 'package:flutter/material.dart';
import 'package:shilus_makeover/packagedetail.dart';

class bridalmakeup extends StatefulWidget {
  const bridalmakeup({super.key});

  @override
  State<bridalmakeup> createState() => _bridalmakeupState();
}

class _bridalmakeupState extends State<bridalmakeup> {
  @override
  Widget build(BuildContext context) {
    return Material(color: Colors.white,
      child: Scaffold(
        appBar: AppBar(title: Text('Packages Of Bridal Makeup:'),),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap:(){ Navigator.push(context,MaterialPageRoute(builder: (context) => packagedetail(1)),);},

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

                            child: Image.asset('images/b5.jpg',
                              fit: BoxFit.cover,),
                          ),

                          SizedBox(height: 10,),
                          Align(alignment: Alignment.topLeft,
                            child: Text(
                              ' Silver Package',
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
          
                          child: Image.asset('images/ab1.jpg',
                            fit: BoxFit.fitWidth,),
                        ),
          
                        SizedBox(height: 10,),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            ' Gold Package',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            ' Starting From ₹9999',
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
          
                          child: Image.asset('images/b15.png',
                            fit: BoxFit.fitWidth,),
                        ),
          
                        SizedBox(height: 10,),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            ' Platinum Package',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            ' Starting From ₹14999',
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
          
                          child: Image.asset('images/bride1.jpg',
                            fit: BoxFit.fitWidth,),
                        ),
          
                        SizedBox(height: 10,),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            '  Diamond Package',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            ' Starting From ₹19999',
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
          
                          child: Image.asset('images/b25.jpg',
                            fit: BoxFit.cover,),
                        ),
          
                        SizedBox(height: 10,),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            '  Elite Package',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            '  Starting From ₹24999',
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
          
                          child: Image.asset('images/b30.png',
                            fit: BoxFit.fitWidth,),
                        ),
          
                        SizedBox(height: 10,),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            '  Prestige Package',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            '  Starting From ₹29999',
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
          
                          child: Image.asset('images/b35.png',
                            fit: BoxFit.fitWidth,),
                        ),
          
                        SizedBox(height: 10,),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            '  Premier Package',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            '  Starting From ₹34999',
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
          
                          child: Image.asset('images/b40.jpg',
                            fit: BoxFit.fitWidth,),
                        ),
          
                        SizedBox(height: 10,),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            '  Ultimate Package',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            '  Starting From ₹39999',
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
          
                          child: Image.asset('images/b50.jpg',
                            fit: BoxFit.fitWidth,),
                        ),
          
                        SizedBox(height: 10,),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            ' Supreme Package',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Align(alignment: Alignment.topLeft,
                          child: Text(
                            ' Starting From ₹49999',
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
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
