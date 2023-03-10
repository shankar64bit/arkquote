import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

String selectedmake;
var selectedcontrollermake = TextEditingController();

class make_drop_lits extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  _make_drop_litsState createState() => _make_drop_litsState();

  get_Make() {
    return selectedcontrollermake.text;
  }

  get_Make_Default_value() {
    return selectedcontrollermake.text = null;
  }
}

List<String> locationYardList = ['Siemens'];

class _make_drop_litsState extends State<make_drop_lits> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Divider(height: 10, color: Colors.grey[50]),
          DropDownField(
            controller: selectedcontrollermake,
            hintText: 'make',
            enabled: true,
            strict: false,
            items: locationYardList,
            onValueChanged: (value) {
              setState(() {
                selectedcontrollermake = value;
              });
            },
          ),
          Divider(height: 10, color: Colors.grey[50]),
        ],
      ),
    );
  }
}




// class KeyValueModel {
//   String key;
//   String value;
//   KeyValueModel({this.key, this.value});
// }

// class make_drop_lits extends StatefulWidget with GetItStatefulWidgetMixin {
//   @override
//   _make_drop_litsState createState() => _make_drop_litsState();

//   // ignore: non_constant_identifier_names
//   get_Make() {
//     return selectedNoofPoles;
//   }

//   get_Make_Default_value() {
//     return selectedNoofPoles = null;
//   }
// }

// // ignore: camel_case_types
// class _make_drop_litsState extends State<make_drop_lits> {
//   @override
//   Widget build(BuildContext context) {
//     List<KeyValueModel> dataOfNoOfPoles = [
//       KeyValueModel(key: 'Siemens', value: "Siemens"),
//     ];

//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           Divider(height: 30, thickness: 1, color: Colors.black),
//           DropdownButton<String>(
//               items: dataOfNoOfPoles
//                   .map((data) => DropdownMenuItem<String>(
//                         child: Text('Make ' + data.key.toString()),
//                         value: data.value,
//                       ))
//                   .toList(),
//               onChanged: (value) {
//                 // setState(() => _selectedValue = value);
//                 setState(() {
//                   selectedNoofPoles = value;
//                 });
//               },
//               hint: Text('Select >  Make  ')),
//           Text('Make : ' + selectedNoofPoles.toString()),
//           //Divider(height: 30, thickness: 1.1, color: Colors.black),
//         ],
//       ),
//     );
//   }
// }



