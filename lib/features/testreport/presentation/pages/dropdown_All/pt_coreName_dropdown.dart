import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

String selectedcoreName;

class core_Name_drop extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  _core_Name_dropState createState() => _core_Name_dropState();

  // ignore: non_constant_identifier_names
  get_CoreName() {
    return selectedcoreName;
  }

  get_CoreName_Default_value() {
    return selectedcoreName = null;
  }
}

// ignore: camel_case_types
class _core_Name_dropState extends State<core_Name_drop> {
  @override
  Widget build(BuildContext context) {
    List<KeyValueModel> dataOfNoOfPoles = [
      KeyValueModel(key: '1a-1n', value: '1a-1n'),
      KeyValueModel(key: '2a-2n', value: '2a-2n'),
      KeyValueModel(key: '3a-3n', value: '3a-3n'),
    ];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          DropdownButton<String>(
              items: dataOfNoOfPoles
                  .map((data) => DropdownMenuItem<String>(
                        child: Text(data.key.toString()),
                        value: data.value,
                      ))
                  .toList(),
              onChanged: (value) {
                // setState(() => _selectedValue = value);
                setState(() {
                  selectedcoreName = value;
                  print(selectedcoreName);
                });
              },
              hint: Text('Select >  coreName  ')),
          Text('coreName : ' + selectedcoreName.toString()),
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
