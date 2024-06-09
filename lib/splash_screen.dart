import 'dart:async';

import 'package:bmi_apps/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreen() ;

}
class _SplashScreen extends State<SplashScreen> {

  // here we apply splash screen logic
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4) , () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "BMI"))) ;
    }) ;
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Container(
         height: double.infinity,
         width: double.infinity,
         color:Colors.amber.shade50 ,
         child: Center(
             child: Container(
                 height: 200,
                 width: 200,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(100),
                   boxShadow:[BoxShadow(color: Colors.red , blurRadius: 50)]
                 ),
                 child: Image.asset("assets/images/bmi.png"))),
       ),
     ),
   ) ;
  }

}