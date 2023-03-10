import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

int selectedKeyvcb;

class vcb_ocb_sfe_RSV extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  _vcb_ocb_sfe_RSVState createState() => _vcb_ocb_sfe_RSVState();

  // ignore: non_constant_identifier_names
  getRSVforVCB_OCB_SFE() {
    return selectedKeyvcb;
  }

  getRSVtoDefaultValue() {
    return selectedKeyvcb = null;
  }
}

// ignore: camel_case_types
class _vcb_ocb_sfe_RSVState extends State<vcb_ocb_sfe_RSV> {
  @override
  Widget build(BuildContext context) {
    List<KeyValueModel> datasvcb = [
      KeyValueModel(key: 11, value: "11"),
      KeyValueModel(key: 33, value: "33"),
      KeyValueModel(key: 66, value: "66"),
      KeyValueModel(key: 110, value: "110"),
      KeyValueModel(key: 132, value: "132"),
      KeyValueModel(key: 220, value: "220"),
      KeyValueModel(key: 400, value: "400"),
    ];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Divider(height: 25, thickness: 1, color: Colors.black),
          DropdownButton<String>(
              items: datasvcb
                  .map((data) => DropdownMenuItem<String>(
                        child: Text(data.key.toString() + ' kv'),
                        value: data.value,
                      ))
                  .toList(),
              onChanged: (value) {
                // setState(() => _selectedValue = value);
                setState(() {
                  selectedKeyvcb = int.parse(value);
                });
              },
              hint: Text('Select >   Rated System Voltage ')),
          Text('Rated System Voltage : ' + selectedKeyvcb.toString() + ' kv'),
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
