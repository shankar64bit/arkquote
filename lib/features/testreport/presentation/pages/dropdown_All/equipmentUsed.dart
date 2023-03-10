// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../../injection_container.dart';
import '../../../data/datasources/inventory_remote_database.dart';
import '../../providers/equipment_acb_provider/inventory_provider.dart';

String selectedValueForEquipmentUse;

class EquipmentTypeList extends StatefulWidget {
  @override
  _EquipmentTypeListState createState() => _EquipmentTypeListState();

  getEquipmentuse() {
    return selectedValueForEquipmentUse;
  }

  getEquipUsetoDefaultValue() {
    return selectedValueForEquipmentUse = null;
  }
}

class _EquipmentTypeListState extends State<EquipmentTypeList> {
  @override
  Widget build(BuildContext context) {
    // sl<InventoryRemoteDatasourceImpl>().getNewEquipments();
    // sl<InventoryProvider>().FutureGetEquipmentLocalDataList();
    final equipments = sl<InventoryProvider>().equipmentTypeList;
    List<KeyValueModel> equipmentUseList = [];

    var getelekey = equipmentUseList.map((data) => data.key);
    var getelemvalue = equipmentUseList.map((data) => data.value);

    for (var each in equipments) {
      // print(each);
      var id = each.barcode;
      var name = each.barcode;
      var Enames = each.type;

      if (getelekey.contains(id)) {
        //print('Equipment Already Existed in Equipment list');
      } else {
        equipmentUseList
            .add(KeyValueModel(key: id, value: name, Ename: Enames));
        //print('added into the List of Inventory Equipment');
      }
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          DropdownButton<String>(
              items: equipmentUseList
                  .map((data) => DropdownMenuItem<String>(
                        child: Text(data.key.toString() + ' ' + data.Ename),
                        value: data.value.toString(),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedValueForEquipmentUse = value);
              },
              hint: const Text('Select > Equipment Uses List')),
          Text('Equipment Used : ' + selectedValueForEquipmentUse.toString()),
          Divider(height: 5, color: Colors.white, thickness: 0)
        ],
      ),
    );
  }
}

class KeyValueModel {
  String key;
  String value;
  String Ename;
  KeyValueModel({this.key, this.value, this.Ename});
}
