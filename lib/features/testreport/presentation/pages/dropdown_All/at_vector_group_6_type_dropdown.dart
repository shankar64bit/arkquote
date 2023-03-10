import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

String selectedvectorGroup6type;

class vectorGroup6typePOWT extends StatefulWidget
    with GetItStatefulWidgetMixin {
  @override
  _vectorGroup6typePOWTState createState() => _vectorGroup6typePOWTState();

  // ignore: non_constant_identifier_names
  get_vector() {
    return selectedvectorGroup6type;
  }

  get_vector_Default_value() {
    return selectedvectorGroup6type = null;
  }
}

// ignore: camel_case_types
class _vectorGroup6typePOWTState extends State<vectorGroup6typePOWT> {
  @override
  Widget build(BuildContext context) {
    List<KeyValueModel> dataOfNoOfPoles = [
      KeyValueModel(key: 'Dyn1', value: "Dyn1"),
      KeyValueModel(key: 'Dyn11', value: "Dyn11"),
      KeyValueModel(key: 'YNd1', value: "YNd1"),
      KeyValueModel(key: 'YNd11', value: "YNd11"),
      KeyValueModel(key: 'YNyn0', value: "YNyn0"),
      KeyValueModel(key: 'YNyn6', value: "YNyn6"),
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
                  selectedvectorGroup6type = value;
                });
              },
              hint: Text('Select >  VectorGroup  ')),
          Text('VectorGroup : ' + selectedvectorGroup6type.toString()),
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
