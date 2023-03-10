import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

String selectedValueLocation;
var selectedControllerlocation = TextEditingController();

class Location_dropDown extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  State<Location_dropDown> createState() => _Location_dropDownState();

  get_selectedValueLocation() {
    return selectedControllerlocation.text;
  }

  get_selectedValueLocation_Default_value() {
    return selectedControllerlocation.text = null;
  }
}

List<String> locationYardList = ['switchyard', 'powerplant', 'georeopol'];

class _Location_dropDownState extends State<Location_dropDown> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          DropDownField(
            controller: selectedControllerlocation,
            hintText: 'Location',
            enabled: true,
            strict: false,
            items: locationYardList,
            onValueChanged: (value) {
              setState(() {
                selectedControllerlocation = value;
              });
            },
          ),
          Divider(height: 20, color: Colors.grey[50]),
        ],
      ),
    );
  }
}
