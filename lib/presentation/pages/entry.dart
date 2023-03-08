// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:quotesummeryapp/presentation/widgets/customTextFormField.dart';
// import 'package:quotesummeryapp/presentation/widgets/datepicker.dart';

// // the formkey used to validate the forms with key
// final _formKey = GlobalKey<FormState>();

// class Entry extends StatelessWidget {
//   final TextEditingController _nOcontroller = TextEditingController();
//   final TextEditingController _clienTcontroller = TextEditingController();
//   final TextEditingController _quotecontroller = TextEditingController();
//   final TextEditingController _addessTcontroller = TextEditingController();
//   final TextEditingController _dateofTestController = TextEditingController();
//   DateTime _dateOfTest;

//   @override
//   Widget build(BuildContext context) {
//     var mob = Text('Quote Client Details', style: TextStyle(fontSize: 17));
//     var desk = Text('Quote Client Details', style: TextStyle(fontSize: 20));
//     // var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
//     // var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
//     return Scaffold(
//       appBar: AppBar(
//         title: LayoutBuilder(builder: (context, constraints) {
//           if (constraints.maxWidth > 400) {
//             return desk;
//           } else {
//             return mob;
//           }
//         }),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () async {
//               // if (!_formKey.currentState.validate()) {
//               //   print('Incomplete Validation - ERROR');
//               // } else if (_formKey.currentState.validate()) {
//               //   print('Form Validation Success [No error validation found-OK]');

//               //   // ---------------------------------------------------

//               //   //  var reportToLocal = (
//               //   //   client: _clienTcontroller.text,
//               //   //   customer: _customeRcontroller.text,
//               //   //   project: _projecTcontroller.text,
//               //   //   trNo: int.parse(_nOcontroller.text),
//               //   //   testDate: _dateOfTest,
//               //   //   databaseID: 0,
//               //   //   // updateDate: _dateOfTest,
//               //   // );

//               //   // getX((TestReportsProvider x) => x.addReport(reportToLocal));
//               //   // watchOnly((TestReportsProvider x) => {});
//               //   // print('storing into local database');
//               //   // print(reportToLocal);

//               // Navigator.push(context);

//               Navigator.pushNamed(context, '/');
//             },
//             icon: const Icon(Icons.save),
//           )
//         ],
//       ),
//       body: ListView(children: [
//         Center(
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                     child: ConstrainedBox(
//                         constraints:
//                             BoxConstraints(minHeight: 0, maxWidth: 700),
//                         child: Add_Report_Page(context)),
//                   ),
//                 ]),
//           ),
//         ),
//       ]),
//     );
//   }

//   Form Add_Report_Page(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: LayoutBuilder(builder: (context, constraints) {
//         ///////////////////////DESKTOP//////////////////////////
//         if (constraints.maxWidth > 400) {
//           return Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // const Padding(
//                 //   padding: EdgeInsets.all(8.0),
//                 //   child: Text(
//                 //     'Client Report Details',
//                 //     style: TextStyle(
//                 //         fontWeight: FontWeight.bold,
//                 //         letterSpacing: 1,
//                 //         fontSize: 20),
//                 //   ),
//                 // ),
//                 // Card(
//                 //   elevation: 5,
//                 //   color: Colors.white,
//                 //   child: Padding(
//                 //     padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
//                 //     child: Column(
//                 //       children: [
//                 //         simplifiedForPC('Test Report No', _nOcontroller),
//                 //         simplifiedForPC('Client', _clienTcontroller),
//                 //         Padding(
//                 //           padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
//                 //           child: CustomTextFormField(
//                 //             controller: _customeRcontroller,
//                 //             hintText: 'Customer (optional)',
//                 //           ),
//                 //         ),
//                 //         simplifiedForPC('Project', _projecTcontroller),
//                 //         Padding(
//                 //           padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
//                 //           child: CustomDatePickerFormField(
//                 //             _dateofTestController,
//                 //             'Date of Testing',
//                 //             (() {
//                 //               pickDateOfTest(context);
//                 //             }),
//                 //           ),
//                 //         ),
//                 //         Padding(
//                 //           padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
//                 //           child: employer_permission(),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//               ],
//             ),
//           );
//         } else {
//           ///////////////////////////////////////MOBILE//////////////////////////////
//           return Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'Quote Client Details',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1,
//                         fontSize: 20),
//                   ),
//                 ),
//                 Card(
//                   elevation: 5,
//                   color: Colors.white,
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                           child: CustomTextFormField(
//                             controller: _quotecontroller,
//                             hintText: 'Quote Name',
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                           child: CustomTextFormField(
//                             controller: _clienTcontroller,
//                             hintText: 'Client Name',
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                           child: CustomTextFormField(
//                             controller: _addessTcontroller,
//                             hintText: 'Address',
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                           child: CustomDatePickerFormField(
//                             _dateofTestController,
//                             'Date of Testing',
//                             (() {
//                               pickDateOfTest(context);
//                             }),
//                           ),
//                         ),
//                         SizedBox(height: 10.0),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }

//   Future<void> pickDateOfTest(BuildContext context) async {
//     final initialDate = DateTime.now();
//     final newDate = await showDatePicker(
//         context: context,
//         initialDate: _dateOfTest ?? initialDate,
//         firstDate: DateTime(DateTime.now().year - 100),
//         lastDate: DateTime(DateTime.now().year + 3),
//         builder: (context, child) => Theme(
//               data: ThemeData().copyWith(
//                 colorScheme: const ColorScheme.light(
//                   // primary: Colors.pink,
//                   primary: Color.fromARGB(255, 119, 11, 11),
//                   onPrimary: Colors.white,
//                   onSurface: Colors.black,
//                 ),
//                 dialogBackgroundColor: Colors.white,
//               ),
//               child: child ?? const Text(''),
//             ));

//     if (newDate == null) {
//       return;
//     }
//     _dateOfTest = newDate;
//     String dot = DateFormat('dd/MM/yyyy').format(newDate);
//     _dateofTestController.text = dot;
//   }
// }
