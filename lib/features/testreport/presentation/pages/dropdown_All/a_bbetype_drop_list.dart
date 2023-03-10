import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

String selectedBBeType;

class bbetype_drop_lits extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  _bbetype_drop_litsState createState() => _bbetype_drop_litsState();

  // ignore: non_constant_identifier_names
  get_etype() {
    return selectedBBeType;
  }

  get_etype_Default_value() {
    return selectedBBeType = null;
  }
}

// ignore: camel_case_types
class _bbetype_drop_litsState extends State<bbetype_drop_lits> {
  @override
  Widget build(BuildContext context) {
    List<KeyValueModel> dataOfBBeType = [
      KeyValueModel(key: 'bbh', value: "Busbar with IR and HV Test"),
      KeyValueModel(key: 'bbc', value: "Busbar with IR and CR Test"),
      KeyValueModel(key: 'bbhc', value: "Busbar with IR,HV and CR Test")
    ];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          DropdownButton<String>(
              items: dataOfBBeType
                  .map((data) => DropdownMenuItem<String>(
                        child: Text(data.value.toString()),
                        value: data.key,
                      ))
                  .toList(),
              onChanged: (value) {
                // setState(() => _selectedValue = value);
                setState(() {
                  selectedBBeType = value;
                });
              },
              hint: Text('Select >  Equipment type  ')),
          Text('Type : ' + selectedBBeType.toString()),
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
