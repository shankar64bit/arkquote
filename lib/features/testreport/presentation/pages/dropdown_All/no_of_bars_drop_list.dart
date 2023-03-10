import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

int selectedNoofbars;

class no_of_bars_drop extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  _no_of_bars_dropState createState() => _no_of_bars_dropState();

  // ignore: non_constant_identifier_names
  get_No_Of_bars() {
    return selectedNoofbars;
  }

  get_No_Of_bars_Default_value() {
    return selectedNoofbars = null;
  }
}

// ignore: camel_case_types
class _no_of_bars_dropState extends State<no_of_bars_drop> {
  @override
  Widget build(BuildContext context) {
    List<KeyValueModel> dataOfNoOfbars = [
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
              items: dataOfNoOfbars
                  .map((data) => DropdownMenuItem<String>(
                        child: Text('No of bars ' + data.key.toString()),
                        value: data.value,
                      ))
                  .toList(),
              onChanged: (value) {
                // setState(() => _selectedValue = value);
                setState(() {
                  selectedNoofbars = int.parse(value);
                });
              },
              hint: Text('Select >   No Of bars ')),
          Text('No of bars : ' + selectedNoofbars.toString()),
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
