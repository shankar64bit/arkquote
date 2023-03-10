import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

String selectedvectorGroup2typePOWT3WIN;

class vectorGroup2typePOWT3W extends StatefulWidget
    with GetItStatefulWidgetMixin {
  @override
  _vectorGroup2typePOWT3WState createState() => _vectorGroup2typePOWT3WState();

  // ignore: non_constant_identifier_names
  get_vector() {
    return selectedvectorGroup2typePOWT3WIN;
  }

  get_vector_Default_value() {
    return selectedvectorGroup2typePOWT3WIN = null;
  }
}

// ignore: camel_case_types
class _vectorGroup2typePOWT3WState extends State<vectorGroup2typePOWT3W> {
  @override
  Widget build(BuildContext context) {
    List<KeyValueModel> dataOfNoOfPoles = [
      KeyValueModel(key: 'YNa0d11', value: "YNa0d11"),
      KeyValueModel(key: 'YNyn0d11', value: "YNyn0d11"),
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
                  selectedvectorGroup2typePOWT3WIN = value;
                });
              },
              hint: Text('Select >  VectorGroup  ')),
          Text('VectorGroup : ' + selectedvectorGroup2typePOWT3WIN.toString()),
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
