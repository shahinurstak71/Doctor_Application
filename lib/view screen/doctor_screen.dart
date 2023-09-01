import 'package:doctor_robot/view%20screen/prescription.dart';
import 'package:doctor_robot/view%20screen/test_screen.dart';
import 'package:flutter/material.dart';

class Doctor extends StatefulWidget {
  Doctor({Key? key}) : super(key: key);

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 20),
                  child: Image.asset("assets/doctor.jpg"),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 0.0, bottom: 10),
                  child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Patient Name',
                              hintText: 'Enter Patient Name'
                            ),
                          ),
                ),

                  Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 0.0, bottom: 10),
                  child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Patient Age',
                              hintText: 'Enter Patient Age'
                            ),
                          ),
                ),

                  Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 0.0, bottom: 10),
                  child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Disease Name',
                              hintText: 'Enter Disease Name'
                            ),
                          ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10,),
                  child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              border: Border.all(width: 3,color: Colors.red,),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                             
                          ),

                          
                
                           child: ElevatedButton(
                      onPressed: (){
                        _dialogBuilder(context);
                      },
                       child: Text("submit")
                       ),
                  ),
                )
                
             

              ],
            ),
          )
        ],
      ),
      
    );



    
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Info Collect Form'),
          content:  Column(
            children: [

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 0.0, bottom: 10),
                  child: Column(
                    children: [
                      Text("1. How long is the fever?"),
                      SizedBox(height:2),
                      TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'How long is the fever?',
                                  hintText: 'Enter Days'
                                ),
                              ),
                    ],
                  ),
                ),
                  Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 0.0, bottom: 10),
                  child: Column(
                    children: [
                      Text("2. Do you have a cold or cough?"),
                      SizedBox(height:2),
                      TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Do you have a cold or cough',
                                  hintText: 'Yes or No'
                                ),
                              ),
                    ],
                  ),
                ),

            ],

          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Submit'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> TestScreen()));
              },
            ),
          ],
        );
      },
    );
  }
}
