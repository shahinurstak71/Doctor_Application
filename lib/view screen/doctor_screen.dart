import 'package:doctor_robot/core/services/api_services.dart';
import 'package:doctor_robot/view%20screen/prescription.dart';
import 'package:doctor_robot/view%20screen/test_screen.dart';
import 'package:flutter/material.dart';

class Doctor extends StatefulWidget {
  Doctor({Key? key}) : super(key: key);

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  String option = "no";
  List<String> allDisease = [];
  bool isLoading = true;
  String? _selectedItem;
  int? _selectedId;
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ApiServices.getDisease().then((value) {
      print(value!.data);
      for (var data in value.data!) {
        print('Name ${data.diseaseName}');
        setState(() {
          allDisease.add(data.diseaseName!);
          _selectedItem = value.data!.first.diseaseName;
          _selectedId = value.data!.first.id;
          isLoading = false;
        });
        print('Data is $allDisease');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_selectedId);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, bottom: 10, right: 20),
                  child: Image.asset("assets/doctor.jpg"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 0.0, bottom: 10),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Patient Name',
                        hintText: 'Enter Patient Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 0.0, bottom: 10),
                  child: TextFormField(
                    controller: _ageController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Patient Age',
                        hintText: 'Enter Patient Age'),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: isLoading
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10,
                                  width: 10,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Loading Disease'),
                              ],
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Disease'),
                              DropdownButton<String>(
                                value: _selectedItem,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedItem = newValue;
                                  });
                                },
                                items: allDisease.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                ),
                // isLoading
                //     ? const Center(
                //         child: CircularProgressIndicator(),
                //       )
                //     : Padding(
                //         padding: const EdgeInsets.only(
                //             left: 10, right: 10, top: 0.0, bottom: 10),
                //         child: TextFormField(
                //           decoration: const InputDecoration(
                //               border: OutlineInputBorder(),
                //               labelText: 'Disease Name',
                //               hintText: 'Enter Disease Name'),
                //         ),
                //       ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        border: Border.all(
                          width: 3,
                          color: Colors.red,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: ElevatedButton(
                        onPressed: () {
                          final id = ApiServices.storePatient(
                            _selectedItem == 'Fever' ? 1 : 2,
                            _nameController.text.isEmpty
                                ? 'NULL'
                                : _nameController.text,
                            _ageController.text.isEmpty
                                ? 1
                                : int.parse(
                                    _ageController.text,
                                  ),
                          ).then((value) {

                          });
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Info Collect Form'),
                                content: FutureBuilder(
                                    future: ApiServices.showFormQue(
                                        _selectedItem == 'Fever' ? '1' : '2'),
                                    builder: (_, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      } else {
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            primary: false,
                                            itemCount:
                                            snapshot.data!.data!.length,
                                            itemBuilder: (_, index) {
                                              final data =
                                              snapshot.data!.data![index];
                                              return snapshot
                                                  .data!.data!.isEmpty
                                                  ? const Text(
                                                  'Please click submit to continue')
                                                  : Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  if (data.type ==
                                                      'yes_no')
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .only(
                                                          top:
                                                          10.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(data
                                                              .question!),
                                                          // Row(
                                                          //   children: [
                                                          //     Row(
                                                          //       children: [
                                                          //         Radio(value: Select.no, groupValue: _select, onChanged: (select){
                                                          //           _select = select!;
                                                          //           setState(() {
                                                          //
                                                          //           });
                                                          //         }),
                                                          //         const Text('No'),
                                                          //       ],
                                                          //     ),
                                                          //     Row(
                                                          //       children: [
                                                          //         Radio(value: Select.yes, groupValue: _select, onChanged: (select){
                                                          //           _select = select!;
                                                          //           setState(() {
                                                          //
                                                          //           });
                                                          //         }),
                                                          //         const Text('Yes'),
                                                          //       ],
                                                          //     )
                                                          //   ],
                                                          // ),
                                                          RadioListTile(
                                                            title:
                                                            const Text(
                                                                "No"),
                                                            value: "no",
                                                            groupValue:
                                                            option,
                                                            onChanged:
                                                                (value) {
                                                              setState(
                                                                      () {
                                                                    option =
                                                                        value.toString();
                                                                  });
                                                            },
                                                          ),
                                                          RadioListTile(
                                                            title: const Text(
                                                                "Yes"),
                                                            value:
                                                            "yes",
                                                            groupValue:
                                                            option,
                                                            onChanged:
                                                                (value) {
                                                              setState(
                                                                      () {
                                                                    option =
                                                                        value.toString();
                                                                  });
                                                            },
                                                          ),
                                                          // Expanded(
                                                          //   child: DropdownButton(items: const [
                                                          //     DropdownMenuItem(child: Text('Yes')),
                                                          //     DropdownMenuItem(child: Text('No')),
                                                          //   ], onChanged: (value){
                                                          //
                                                          //   }),
                                                          // )
                                                        ],
                                                      ),
                                                    )
                                                  else
                                                    TextFormField(
                                                      decoration:
                                                      InputDecoration(
                                                        border:
                                                        const OutlineInputBorder(),
                                                        labelText: data
                                                            .question,
                                                        hintText: data
                                                            .question,
                                                      ),
                                                    ),
                                                ],
                                              );
                                            });
                                      }
                                    }),
                                // content: Column(
                                //   children: [
                                //     Padding(
                                //       padding: const EdgeInsets.only(
                                //           left: 10, right: 10, top: 0.0, bottom: 10),
                                //       child: Column(
                                //         children: [
                                //           Text("1. How long is the fever?"),
                                //           SizedBox(height: 2),
                                //           TextFormField(
                                //             decoration: const InputDecoration(
                                //                 border: OutlineInputBorder(),
                                //                 labelText: 'How long is the fever?',
                                //                 hintText: 'Enter Days'),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     Padding(
                                //       padding: const EdgeInsets.only(
                                //           left: 10, right: 10, top: 0.0, bottom: 10),
                                //       child: Column(
                                //         children: [
                                //           Text("2. Do you have a cold or cough?"),
                                //           SizedBox(height: 2),
                                //           TextFormField(
                                //             decoration: const InputDecoration(
                                //                 border: OutlineInputBorder(),
                                //                 labelText: 'Do you have a cold or cough',
                                //                 hintText: 'Yes or No'),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    child: const Text('Back'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    child: const Text('Submit'),
                                    onPressed: () {
                                      // _selectedItem == 'Fever' ? '1' : '2'

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TestScreen()));
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                          // _dialogBuilder(
                          //     context, _selectedItem == 'Fever' ? '1' : '2');
                        },
                        child: Text("Submit")),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

// Future<void> _dialogBuilder(BuildContext context, String id) {
//   return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Info Collect Form'),
//           content: FutureBuilder(
//               future: ApiServices.showFormQue(id),
//               builder: (_, snapshot) {
//                 if(snapshot.connectionState == ConnectionState.waiting){
//                   return const CircularProgressIndicator();
//                 } else {
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     primary: false,
//                     itemCount: snapshot.data!.data!.length,
//                       itemBuilder: (_, index){
//                     final data = snapshot.data!.data![index];
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         if (data.type == 'yes_no') Padding(
//                           padding: const EdgeInsets.only(top: 10.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(data.question!),
//                               // Expanded(
//                               //   child: DropdownButton(items: const [
//                               //     DropdownMenuItem(child: Text('Yes')),
//                               //     DropdownMenuItem(child: Text('No')),
//                               //   ], onChanged: (value){
//                               //
//                               //   }),
//                               // )
//                             ],
//                           ),
//                         ) else TextFormField(
//                           decoration: InputDecoration(
//                             border: const OutlineInputBorder(),
//                             labelText: data.question,
//                             hintText: data.question,
//                           ),
//                         ),
//                       ],
//                     );
//                   });
//                 }
//               }),
//           // content: Column(
//           //   children: [
//           //     Padding(
//           //       padding: const EdgeInsets.only(
//           //           left: 10, right: 10, top: 0.0, bottom: 10),
//           //       child: Column(
//           //         children: [
//           //           Text("1. How long is the fever?"),
//           //           SizedBox(height: 2),
//           //           TextFormField(
//           //             decoration: const InputDecoration(
//           //                 border: OutlineInputBorder(),
//           //                 labelText: 'How long is the fever?',
//           //                 hintText: 'Enter Days'),
//           //           ),
//           //         ],
//           //       ),
//           //     ),
//           //     Padding(
//           //       padding: const EdgeInsets.only(
//           //           left: 10, right: 10, top: 0.0, bottom: 10),
//           //       child: Column(
//           //         children: [
//           //           Text("2. Do you have a cold or cough?"),
//           //           SizedBox(height: 2),
//           //           TextFormField(
//           //             decoration: const InputDecoration(
//           //                 border: OutlineInputBorder(),
//           //                 labelText: 'Do you have a cold or cough',
//           //                 hintText: 'Yes or No'),
//           //           ),
//           //         ],
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           actions: <Widget>[
//             TextButton(
//               style: TextButton.styleFrom(
//                 textStyle: Theme.of(context).textTheme.labelLarge,
//               ),
//               child: const Text('Back'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               style: TextButton.styleFrom(
//                 textStyle: Theme.of(context).textTheme.labelLarge,
//               ),
//               child: const Text('Submit'),
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => TestScreen()));
//               },
//             ),
//           ],
//         );
//       },
//     );
// }
}
