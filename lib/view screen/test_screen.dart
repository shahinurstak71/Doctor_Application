import 'package:doctor_robot/view%20screen/demo_screen.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text("Shahinur"),
              Text("Please do these tests"),

              Column(
                children: [


                  ElevatedButton(
                    onPressed: (){
                      CBC(context);
                    }, 
                    child: Text("1. CBC with ESR"),
                    ),

                     ElevatedButton(
                    onPressed:(){}, 
                    child: Text("2. Urine R/E"),
                    ),
                     ElevatedButton(
                    onPressed: (){}, 
                    child: Text("3. Creatinine"),
                    ),
                     ElevatedButton(
                    onPressed: (){}, 
                    child: Text("4. RBS"),
                    ),
                     ElevatedButton(
                    onPressed: (){}, 
                    child:  Text("5. SGPT"),
                    ),
                     ElevatedButton(
                    onPressed: (){}, 
                    child: Text("6. NSI|AG for Dengue"),
                    ),




                ],
              ),


               Padding(
                 padding: const EdgeInsets.all(20.0),
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
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> DemoPrescription() ));
                          
                        },
                         child: Text("submit")
                         ),
                    ),
               ),
            
           
         









              
            ],
          ),
        ),
      ),
    );
  }



  Future<void> CBC(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Info Collect Form'),
          content:  SingleChildScrollView(
            child: Column(
              children: [
          
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 0.0, bottom: 10),
                    child: Column(
                      children: [
                        Text("1. Haemoglobin"),
                        SizedBox(height:2),
                        TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter result',
                                    hintText: 'Enter result'
                                  ),
                                ),
                      ],
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 0.0, bottom: 10),
                    child: Column(
                      children: [
                        Text("2. ESR"),
                        SizedBox(height:2),
                        TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter result',
                                    hintText: 'Enter result'
                                  ),
                                ),
                      ],
                    ),
                  ),
          
          
          
                        Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 0.0, bottom: 10),
                    child: Column(
                      children: [
                        Text("3. Total count of WBC"),
                        SizedBox(height:2),
                        TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter result',
                                    hintText: 'Enter result'
                                  ),
                                ),
                      ],
                    ),
                  ),
          
          
                        Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 0.0, bottom: 10),
                    child: Column(
                      children: [
                        Text("4. Polymorphs"),
                        SizedBox(height:2),
                        TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter result%',
                                    hintText: 'Enter result%'
                                  ),
                                ),
                      ],
                    ),
                  ),      Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 0.0, bottom: 10),
                    child: Column(
                      children: [
                        Text("5. Lymphocytes"),
                        SizedBox(height:2),
                        TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                       labelText: 'Enter result%',
                                    hintText: 'Enter result%'
                                  ),
                                ),
                      ],
                    ),
                  ),      Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 0.0, bottom: 10),
                    child: Column(
                      children: [
                        Text("6. Monocytes"),
                        SizedBox(height:2),
                        TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                       labelText: 'Enter result%',
                                    hintText: 'Enter result%'
                                  ),
                                ),
                      ],
                    ),
                  ),      Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 0.0, bottom: 10),
                    child: Column(
                      children: [
                        Text("7. Eosinophil"),
                        SizedBox(height:2),
                        TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                       labelText: 'Enter result%',
                                    hintText: 'Enter result%'
                                  ),
                                ),
                      ],
                    ),
                  ),      Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 0.0, bottom: 10),
                    child: Column(
                      children: [
                        Text("8. Basophils"),
                        SizedBox(height:2),
                        TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                      labelText: 'Enter result%',
                                    hintText: 'Enter result%'
                                  ),
                                ),
                      ],
                    ),
                  ),
          
          
          
          
          
          
          
          
          
              ],
          
            ),
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