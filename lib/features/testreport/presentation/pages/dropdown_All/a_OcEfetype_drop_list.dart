import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

String selectedOcEfeType;

class ocefetype_drop_lits extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  _ocefetype_drop_litsState createState() => _ocefetype_drop_litsState();

  // ignore: non_constant_identifier_names
  get_etype() {
    return selectedOcEfeType;
  }

  get_etype_Default_value() {
    return selectedOcEfeType = null;
  }
}

// ignore: camel_case_types
class _ocefetype_drop_litsState extends State<ocefetype_drop_lits> {
  @override
  Widget build(BuildContext context) {
    List<KeyValueModel> dataOfOcEfeType = [
      KeyValueModel(key: 'ocri', value: "Overcurrent Relay(Instantaneous)"),
      KeyValueModel(key: 'ocrinv', value: "Overcurrent Relay(Inverse)"),
      KeyValueModel(
          key: 'ocrinvl', value: "Overcurrent Relay(Inverse Only low set)"),
      KeyValueModel(
          key: 'ocefri',
          value: "Overcurrent & Earth Fault Relay(Instantaneous)"),
      KeyValueModel(
          key: 'ocefrinv', value: "Overcurrent &Earth Fault Relay (Inverse)"),
      KeyValueModel(
          key: 'ocefrinvl',
          value: "Overcurrent & Earth Fault Relay(Inverse low set)"),
    ];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          DropdownButton<String>(
              items: dataOfOcEfeType
                  .map((data) => DropdownMenuItem<String>(
                        child: Text(data.value.toString()),
                        value: data.key,
                      ))
                  .toList(),
              onChanged: (value) {
                // setState(() => _selectedValue = value);
                setState(() {
                  selectedOcEfeType = value;
                });
              },
              hint: Text('Select > Equipment type  ')),
          Text('Type : ' + selectedOcEfeType.toString()),
          //Divider(height: 30, thickness: 1.1, color: Colors.black),
        ],
      ),
    );
  }
}

class KeyValueModel {
  String key;
  String value;
  KeyValueModel({this.key, this.value});
}
