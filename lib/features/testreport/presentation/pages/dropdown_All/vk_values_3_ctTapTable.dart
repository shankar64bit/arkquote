import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

double selectedvk;

class vk_value_drop extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  _vk_value_dropState createState() => _vk_value_dropState();

  // ignore: non_constant_identifier_names
  get_vk_value() {
    return selectedvk;
  }

  get_vk_value_Default_value() {
    return selectedvk = null;
  }
}

// ignore: camel_case_types
class _vk_value_dropState extends State<vk_value_drop> {
  @override
  Widget build(BuildContext context) {
    List<KeyValueModel> dataOfNoOfPoles = [
      KeyValueModel(key: 1, value: "1.0"),
      KeyValueModel(key: 2, value: "0.5"),
      KeyValueModel(key: 4, value: "0.25"),
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
                        child: Text('vk/' + data.key.toString()),
                        value: data.value,
                      ))
                  .toList(),
              onChanged: (value) {
                // setState(() => _selectedValue = value);
                setState(() {
                  selectedvk = double.parse(value);
                  print(selectedvk);
                });
              },
              hint: Text('Select >   VK ')),
          Text('vk : ' + selectedvk.toString()),
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
