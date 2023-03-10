import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

String selectedEfEleType;

class efeletype_drop_lits extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  _efeletype_drop_litsState createState() => _efeletype_drop_litsState();

  // ignore: non_constant_identifier_names
  get_etype() {
    return selectedEfEleType;
  }

  get_etype_Default_value() {
    return selectedEfEleType = null;
  }
}

// ignore: camel_case_types
class _efeletype_drop_litsState extends State<efeletype_drop_lits> {
  @override
  Widget build(BuildContext context) {
    List<KeyValueModel> dataOfEfEleType = [
      KeyValueModel(key: 'efri', value: "Earth Fault Relay(Instantaneous)"),
      KeyValueModel(key: 'efrinv', value: "Earth Fault Relay(Inverse)"),
      KeyValueModel(
          key: 'efrinvl', value: "Earth Fault Relay (Inverse Only low set)"),
      KeyValueModel(key: 'elr', value: "Earth Leakage Relay"),
      KeyValueModel(key: 'efrr', value: "Restricated Earth Fault Relay"),
      KeyValueModel(key: 'efrs', value: "Sensitive Earth Fault Relay"),
    ];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          DropdownButton<String>(
              items: dataOfEfEleType
                  .map((data) => DropdownMenuItem<String>(
                        child: Text(data.value.toString()),
                        value: data.key,
                      ))
                  .toList(),
              onChanged: (value) {
                // setState(() => _selectedValue = value);
                setState(() {
                  selectedEfEleType = value;
                });
              },
              hint: Text('Select > Earth Fault type  ')),
          Text('Type : ' + selectedEfEleType.toString()),
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
