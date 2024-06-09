import 'package:bmi_apps/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var weightController = TextEditingController() ;
  var feetController = TextEditingController() ;
  var inchController = TextEditingController() ;
  var result = "" ;
  var resultBmi = "" ;
  var bmiMessage = " " ;
  var bgColor = Colors.amber.shade50 ;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
          color: bgColor,

          child: SingleChildScrollView(
            child: Column(
            children: [
              
              Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: [BoxShadow(color: Colors.deepOrange , blurRadius: 15) ]
                ),
                height: 150,
                  width: 150,
                  child: Image.asset("assets/images/bmi.png")) ,
            
              SizedBox(
                height: 10,
              ) ,
             
            
             Container(
               margin: EdgeInsets.all(12.0),
               width: 400,
               height: 120,

               child: Card(
                 elevation: 15,
                 shadowColor: Colors.deepPurple,
                 color: Colors.orange.shade100,
                 child: Padding(

                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       Text( "$result ", style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold  , color : Colors.red)  ,),
                       Text( "$resultBmi" , style: TextStyle(fontSize: 23 , fontWeight: FontWeight.bold , color: Colors.black)  ,),
                     ],
                   ),
                 )
            
               ),
             ) ,
            
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      elevation: 15,
                      shadowColor: Colors.deepPurple,
            
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [

                            // weight box
                            TextField(
                              controller: weightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13.0) ,
                                  borderSide: BorderSide(color: Colors.green , width: 2)

                                ) ,

                                disabledBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(13.0),
                                  borderSide: BorderSide(color: Colors.green , width: 2)
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange , width: 2) ,
                                  borderRadius: BorderRadius.circular(13)
                                ),
                                label: Text("Enter Weight in kg ") ,
                                prefixIcon: Icon(Icons.line_weight , color: Colors.orange.shade200 , size: 25,)
                              ),

                            ) ,

                            SizedBox(
                              height: 25,
                            ) ,


                            // height box in Feet
                            TextField(
                              controller: feetController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13.0) ,
                                      borderSide: BorderSide(color: Colors.green , width: 2)

                                  ) ,

                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                      borderSide: BorderSide(color: Colors.green , width: 2)
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange , width: 2) ,
                                      borderRadius: BorderRadius.circular(13)
                                  ),
                                  label: Text("Enter Height (in Feet) ") ,
                                  prefixIcon: Icon(Icons.height , color: Colors.orange.shade200 , size: 25,)
                              ),

                            ) ,

                            SizedBox(
                              height: 25,
                            ) ,


                            TextField(
                              controller: inchController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13.0) ,
                                      borderSide: BorderSide(color: Colors.green , width: 2)

                                  ) ,

                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                      borderSide: BorderSide(color: Colors.green , width: 2)
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange , width: 2) ,
                                      borderRadius: BorderRadius.circular(13)
                                  ),
                                  label: Text("Enter Height (in Inch) ") ,
                                  prefixIcon: Icon(Icons.height , color: Colors.orange.shade200 , size: 25,)
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
            
                  SizedBox(
                    height: 20,
                  ) ,
                  
                  Container(
                    margin: EdgeInsets.all(14.0),
                    width: 400,

                      // BMI FINd Button
                      child: FloatingActionButton(onPressed: (){
                        // now here we apply logic , when click on button find BMI

                        var weight = weightController.text.toString() ;
                        var feet = feetController.text.toString() ;
                        var inch = inchController.text.toString() ;



                        if(weight != "" && feet != "" && inch != "") {

                          // here we calculate BMI
                          // perform bmi calculation all value convert into integer
                          var iWeight = double.parse(weight) ;
                          var iFeet = double.parse(feet) ;
                          var iInch = double.parse(inch) ;

                          // here we apply formula

                          var totalInch = (iFeet*12)+iInch ;
                          var totalCm = totalInch * 2.54 ;
                          var totalMeter = totalCm/100 ;

                          var bmi = iWeight/(totalMeter*totalMeter) ;


                          if(bmi > 25 ){
                            bmiMessage = "You are OverWeight  😒😒 " ;
                            bgColor = Colors.orangeAccent;
                          } else if(bmi < 18 ){
                            bmiMessage = "You are UnderWeight 🤔🤔 "   ;
                            bgColor = Colors.redAccent ;
                          } else {
                            bmiMessage = "You are Healthy 💚💚 " ;
                            bgColor = Colors.greenAccent ;
                          }

                          resultBmi = " $bmiMessage \n BMI : ${bmi.toStringAsFixed(2)}" ;
                          setState(() {});

                        }else {
                            result = "Please Fill All information" ;
                          setState(() {

                          });
                        }


                      } ,
                        child: Text("BMI FIND" ,
                          style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30 ),),
                        splashColor: Colors.orange, backgroundColor: Colors.orange.shade100,)
                  )
                ],
              )
            ],
                  ),
          ),

      )
    ) ;
  }
}
