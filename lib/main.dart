import 'package:dmiapplication/inputresult.dart';
import 'package:dmiapplication/resultpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constraints.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main(){
  runApp(dmi_application());
}

class dmi_application extends StatefulWidget {
  static String id ='mainpage';

  @override
  _dmi_applicationState createState() => _dmi_applicationState();
}
// ignore: camel_case_types
class _dmi_applicationState extends State<dmi_application> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'inputpage',
      routes: {

        inputpage.id: (context) => inputpage(),
        resultpage.id: (context) => resultpage(),

      },


    );
  }
}




