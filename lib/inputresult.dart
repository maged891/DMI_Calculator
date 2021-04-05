
import 'dart:math';

import 'package:dmiapplication/resultpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constraints.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';

class inputpage extends StatefulWidget {
  static String id ='inputpage';

  @override
  _inputpageState createState() => _inputpageState();
}
Gender g;
double height = 100;
int age = 12;
double weight = 70;


class _inputpageState extends State<inputpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: scafcolor,
      appBar: AppBar(
        backgroundColor: scafcolor,
        title: Text('DMI calculator'),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                g = Gender.Male;
                              });
                            },
                            child: GenderContainer(
                              g: g,
                              name: 'Male',
                              color: g == Gender.Male ? active : inactive,
                              icon: FontAwesomeIcons.mars,
                            )),
                      )),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                g = Gender.Female;
                              });
                            },
                            child: GenderContainer(
                              g: g,
                              name: 'Female',
                              color: g == Gender.Female ? active : inactive,
                              icon: FontAwesomeIcons.venus,
                            )),
                      )),
                ],
              ),
              Container(
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                    color: active, borderRadius: BorderRadius.circular(50)),
                child: Column(
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    Text(
                      height.toStringAsFixed(1),
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    Text(
                      '150.0 cm',
                      style: TextStyle(color: Colors.white),
                    ),

                    Slider(value:height,max: 250,min: 50,activeColor: Colors.pink,inactiveColor: Colors.grey,

                      onChanged:(value) {

                        setState(() {
                          height=value;

                        });

                      },
                    )

                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildContainer('age',age,(){
                        setState(() {
                         age++;
                        });
                      },(){
                        setState(() {
                       age>1?   age-- :null;
                        });
                      }),

                    ),

                  ),

                  Expanded(

                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: Container(
                        height: 100,

                        decoration: BoxDecoration(color: active,borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('weight',style: TextStyle(fontSize: 25, color: Colors.white,)),
                            Text(weight.toString(), style: TextStyle(fontSize: 20, color: Colors.white)
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                GestureDetector(

                                  onTap: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child:Icon(Icons.add_circle),
                                ),
                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  child:Icon(Icons.remove_circle),
                                ),
                              ],)
                          ],

                        ),



                      ),



                    ),

                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                  onTap:(){

                      Navigator.push(context,MaterialPageRoute(builder:(context)=>resultpage(calculate() )));

    },
                    child: Container(
                        height: 45,
                        width: 600,
                        decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(50)),
                        child:Center(
                              child: Text('Calculate BMI',style: TextStyle(fontSize: 50,),)),),
                  )

                ],

              )
            ],
          )),

    );
  }
}
Container buildContainer(String name,int variable,Function add , Function substract) {
  return Container(
    height: 100,
    decoration: BoxDecoration(
        color: active, borderRadius: BorderRadius.circular(50)),
    child: Column(children: [
      Text(name, style: TextStyle(fontSize: 25, color: Colors.white,)),
      Text(variable.toString(),
          style: TextStyle(fontSize: 20, color: Colors.white)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(

            onTap: add,
            child: Icon(Icons.add_circle),
          ),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: substract,
            child: Icon(Icons.remove_circle),
          ),
        ],)
    ]
    ),

  );
}
class GenderContainer extends StatelessWidget {
  String name;
  IconData icon;
  Gender g;
  Color color;

  GenderContainer({this.name, this.g, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}


enum Gender { Male, Female }

double calculate(){
  double bmi = weight / pow(height / 100, 2) ;
  return bmi;
}

