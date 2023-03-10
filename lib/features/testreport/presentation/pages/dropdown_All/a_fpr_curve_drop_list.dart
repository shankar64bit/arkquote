import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

String selectedFprCurveType;

class fprCurveType_drop_lits extends StatefulWidget
    with GetItStatefulWidgetMixin {
  @override
  _fprCurveType_drop_litsState createState() => _fprCurveType_drop_litsState();

  // ignore: non_constant_identifier_names
  get_etype() {
    return selectedFprCurveType;
  }

  get_etype_Default_value() {
    return selectedFprCurveType = null;
  }
}

// ignore: camel_case_types
class _fprCurveType_drop_litsState extends State<fprCurveType_drop_lits> {
  @override
  Widget build(BuildContext context) {
    List<KeyValueModel> dataOffprCurveType = [
      KeyValueModel(key: 'IEC Normal Inverse', value: "IEC Normal Inverse"),
      KeyValueModel(key: 'IEC Very Inverse', value: "IEC Very Inverse"),
      KeyValueModel(
          key: 'IEC Extremely Inverse', value: "IEC Extremely Inverse"),
      KeyValueModel(
          key: 'IEC Long Time Inverse', value: "IEC Long Time Inverse")
    ];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          DropdownButton<String>(
              items: dataOffprCurveType
                  .map((data) => DropdownMenuItem<String>(
                        child: Text(data.value.toString()),
                        value: data.key,
                      ))
                  .toList(),
              onChanged: (value) {
                // setState(() => _selectedValue = value);
                setState(() {
                  selectedFprCurveType = value;
                });
              },
              hint: Text('Select >  Curve type  ')),
          Text('Type : ' + selectedFprCurveType.toString()),
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
