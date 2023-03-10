import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../widgets/custom_text_form_field.dart';

String selectedvectorGroup;
var dispTrue = false;

class ItvectorGroup extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  _ItvectorGroupState createState() => _ItvectorGroupState();

  // ignore: non_constant_identifier_names
  get_vector() {
    return selectedvectorGroup;
  }

  get_vector_Default_value() {
    return selectedvectorGroup = null;
  }
}

// ignore: camel_case_types
class _ItvectorGroupState extends State<ItvectorGroup> {
  @override
  Widget build(BuildContext context) {
    List<KeyValueModel> dataOfNoOfPoles = [
      KeyValueModel(key: 'Dd0/Dd0', value: "Dd0/Dd0"),
      KeyValueModel(key: 'Dd6/Dd6', value: "Dd6/Dd6"),
      KeyValueModel(key: 'Yd1d1', value: "Yd1d1"),
      KeyValueModel(key: 'Yd11d11', value: "Yd11d11"),
      KeyValueModel(key: 'Dd0/Dd0/Dd0/Dd0', value: "Dd0/Dd0/Dd0/Dd0"),
      KeyValueModel(key: 'Dd6/Dd6/Dd6/Dd6', value: "Dd6/Dd6/Dd6/Dd6"),
      KeyValueModel(key: 'Yd1Yd1Yd1Yd1', value: "Yd1Yd1Yd1Yd1"),
      KeyValueModel(key: 'Yd11Yd11Yd11Yd11', value: "Yd11Yd11Yd11Yd11"),
    ];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Divider(height: 10, thickness: 1, color: Colors.black),
          DropdownButton<String>(
              items: dataOfNoOfPoles
                  .map((data) => DropdownMenuItem<String>(
                        child: Text('Vector Group ' + data.key.toString()),
                        value: data.value,
                      ))
                  .toList(),
              onChanged: (value) {
                // setState(() => _selectedValue = value);
                setState(() {
                  selectedvectorGroup = value;
                  dispTrue = true;
                });
              },
              hint: Text('Select >  VectorGroup  ')),
          Text('VectorGroup : ' + selectedvectorGroup.toString()),
          Divider(height: 10, color: Colors.white),
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
