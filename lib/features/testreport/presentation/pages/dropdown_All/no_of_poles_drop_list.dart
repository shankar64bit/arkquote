import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

int selectedNoofPoles;

class no_of_poles_drop extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  _no_of_poles_dropState createState() => _no_of_poles_dropState();

  // ignore: non_constant_identifier_names
  get_No_Of_Poles() {
    return selectedNoofPoles;
  }

  get_No_Of_Poles_Default_value() {
    return selectedNoofPoles = null;
  }
}

// ignore: camel_case_types
class _no_of_poles_dropState extends State<no_of_poles_drop> {
  @override
  Widget build(BuildContext context) {
    List<KeyValueModel> dataOfNoOfPoles = [
      KeyValueModel(key: 3, value: "3"),
      KeyValueModel(key: 4, value: "4"),
    ];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Divider(height: 20, thickness: 1, color: Colors.black),
          DropdownButton<String>(
              items: dataOfNoOfPoles
                  .map((data) => DropdownMenuItem<String>(
                        child: Text('No of poles ' + data.key.toString()),
                        value: data.value,
                      ))
                  .toList(),
              onChanged: (value) {
                // setState(() => _selectedValue = value);
                setState(() {
                  selectedNoofPoles = int.parse(value);
                });
              },
              hint: Text('Select >   No Of Poles ')),
          Text('No of poles : ' + selectedNoofPoles.toString()),
          //Divider(height: 30, thickness: 1.1, color: Colors.black),
        ],
      ),
    );
  }
}

class KeyValueModel {
  int key;
  String value;
  KeyValueModel({this.key, this.value});
}
