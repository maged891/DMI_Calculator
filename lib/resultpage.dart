import 'package:dmiapplication/inputresult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constraints.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';
class resultpage extends StatefulWidget {
  static String id ='resultpage';
  final double bmi;
  resultpage([this.bmi ]);

  @override
  _resultpageState createState() => _resultpageState();
}

class _resultpageState extends State<resultpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafcolor,
      appBar: AppBar(
        backgroundColor: scafcolor,
        title: Text('DMI Calculator'),
        centerTitle: true ,
      ),
      body: Column(
        children: [
          Text('Your Result', style: TextStyle(color:Colors.white,fontSize: 30 , fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              height: 400,
                width: 1000,
                decoration: BoxDecoration(color: inactive ,borderRadius: BorderRadius.circular(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Text('Normal' ,style: TextStyle(fontSize:40,color: Colors.amber , fontWeight: FontWeight.bold),),
            Text(widget.bmi.toString() , style: TextStyle(fontSize: 20,color: Colors.white),),
                Text("You have anormal body" , style: TextStyle(fontSize: 20,color: Colors.white),)
              ],
            )

            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,inputpage.id);
            },
            child: Container(
              height: 100,
              width:700,
              decoration: BoxDecoration(color: Colors.pink ,borderRadius:BorderRadius.circular(30)),
              child: Center(child: Text('Re Calculate BMI ' , style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
            ),
          )
        ],

      ),

    );
  }
}
