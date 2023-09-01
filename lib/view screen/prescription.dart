import 'package:flutter/material.dart';

class Prescription extends StatefulWidget {
  Prescription({Key? key}) : super(key: key);

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                 Text("1+1+1"),
                 Text("Note: After eating"),
               ],
             ),

               Column(
               children: [
                 Text("2.  Serjel"),
                 Text("1+0+1"),
                 Text("Note: Before eating"),
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