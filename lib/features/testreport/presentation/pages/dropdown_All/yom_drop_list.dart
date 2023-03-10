import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

int selectedYOM;

class yom_drop extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  _yom_dropState createState() => _yom_dropState();

  // ignore: non_constant_identifier_names
  get_YOM() {
    return selectedYOM;
  }

  get_YOM_Default_value() {
    return selectedYOM = null;
  }
}

// ignore: camel_case_types
class _yom_dropState extends State<yom_drop> {
  @override
  Widget build(BuildContext context) {
    List<KeyValueModel> dataOfNoOfPoles = [
      KeyValueModel(key: 2000, value: "2000"),
      KeyValueModel(key: 2001, value: "2001"),
      KeyValueModel(key: 2002, value: "2002"),
      KeyValueModel(key: 2003, value: "2003"),
      KeyValueModel(key: 2004, value: "2004"),
      KeyValueModel(key: 2005, value: "2005"),
      KeyValueModel(key: 2006, value: "2006"),
      KeyValueModel(key: 2007, value: "2007"),
      KeyValueModel(key: 2008, value: "2008"),
      KeyValueModel(key: 2009, value: "2009"),
      KeyValueModel(key: 2010, value: "2010"),
      KeyValueModel(key: 2011, value: "2011"),
      KeyValueModel(key: 2012, value: "2012"),
      KeyValueModel(key: 2013, value: "2013"),
      KeyValueModel(key: 2014, value: "2014"),
      KeyValueModel(key: 2015, value: "2015"),
      KeyValueModel(key: 2016, value: "2016"),
      KeyValueModel(key: 2017, value: "2017"),
      KeyValueModel(key: 2018, value: "2018"),
      KeyValueModel(key: 2019, value: "2019"),
      KeyValueModel(key: 2020, value: "2020"),
      KeyValueModel(key: 2021, value: "2021"),
      KeyValueModel(key: 2022, value: "2022"),
      KeyValueModel(key: 2023, value: "2023"),
    ];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Divider(height: 20, thickness: 1, color: Colors.black),
          DropdownButton<String>(
            items: dataOfNoOfPoles
                .map((data) => DropdownMenuItem<String>(
                      child: Text('Year Of Manufacture ' + data.key.toString()),
                      value: data.value,
                    ))
                .toList(),
            onChanged: (value) {
              // setState(() => _selectedValue = value);
              setState(() {
                selectedYOM = int.parse(value);
              });
            },
            hint: Text('Select >   Year Of Manufacture '),
          ),
          Text('Year Of Manufacture : ' + selectedYOM.toString()),
          Divider(height: 40, thickness: 1.1, color: Colors.black),
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
