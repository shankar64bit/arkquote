import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

int selectedKeyPT;

class ptnameplate_kv extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  _ptnameplate_kvState createState() => _ptnameplate_kvState();

  // ignore: non_constant_identifier_names
  getRSVforPT() {
    return selectedKeyPT;
  }

  getRSVtoPTDefaultValue() {
    return selectedKeyPT = null;
  }
}

// ignore: camel_case_types
class _ptnameplate_kvState extends State<ptnameplate_kv> {
  @override
  Widget build(BuildContext context) {
    List<KeyValueModel> datasvcb = [
      KeyValueModel(key: 415, value: "415"),
      KeyValueModel(key: 11, value: "11"),
      KeyValueModel(key: 33, value: "33"),
      KeyValueModel(key: 66, value: "66"),
      KeyValueModel(key: 110, value: "110"),
      KeyValueModel(key: 132, value: "132"),
      KeyValueModel(key: 220, value: "220"),
      KeyValueModel(key: 400, value: "400"),
      KeyValueModel(key: 765, value: "765"),
    ];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          DropdownButton<String>(
              items: datasvcb
                  .map((data) => DropdownMenuItem<String>(
                        child: Text(data.key.toString() + ' kv/v'),
                        value: data.value,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedKeyPT = int.parse(value);
                });
              },
              hint: Text('Select >  Ratio (primary) ')),
          Text('Ratio (primary) : ' + selectedKeyPT.toString() + ' kv/v'),
          Divider(height: 25),
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
