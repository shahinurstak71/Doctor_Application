import 'package:flutter/material.dart';

class DemoPrescription extends StatefulWidget {
  DemoPrescription({Key? key}) : super(key: key);

  @override
  State<DemoPrescription> createState() => _DemoPrescriptionState();
}

class _DemoPrescriptionState extends State<DemoPrescription> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, bottom: 60, right: 20),
          child: Column(
            children: [
             Column(
               children: [
                 Text("Misti Konna"),
                  Text("Your Prescription Below:"),
               ],
             ),
////// Re-create logic need here///////////
             SizedBox(height:30),
             Column(
               children: [
                 Text("1.  NAPA"),
                 Text("2+2+2"),
                 Text("Note: After eating 7 days"),
               ],
             ),

               Column(
               children: [
                 Text("2.  Serjel"),
                 Text("1+0+1"),
                 Text("Note: Before eating 1 months"),
               ],
             ),


              Column(
               children: [
                 Text("2.  Cefim-3 Do (400mg)"),
                 Text("1+0+1"),
                 Text("Note: After eating 7 days"),
               ],
             ),
             SizedBox(height: 100,),

          Text("Best of luck")




            ],
              
          ),
        ),
      ),
    );
  }
}