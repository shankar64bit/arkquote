// ignore_for_file: missing_return, non_constant_identifier_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/inventory_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/models/inventory_model.dart';
import '../../../../../injection_container.dart';

class InventoryProvider extends ChangeNotifier {
  List<InventoryModel> _inventoryIdList = [];
  List<InventoryModel> get inventoryIdList => _inventoryIdList;

  List<InventoryModel> _equipmentTypeList = [];
  List<InventoryModel> get equipmentTypeList => _equipmentTypeList;

  InventoryModel _inventoryModel;
  InventoryModel get inventoryModel => _inventoryModel;

  String _error = 'ErroR';
  String get error => _error;

  Future<InventoryModel> getInventoryById(String barcode) async {
    _inventoryModel =
        await sl<InventorytocalDatasourceImpl>().getInventoryById(barcode)
            // ignore: missing_return
            .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void FutureGetEquipmentLocalDataList() async {
    _equipmentTypeList =
        await sl<InventorytocalDatasourceImpl>().getEquipmentLocalDataList()
            // ignore: missing_return
            .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void AddInventory(InventoryModel inventorymodel) async {
    await sl<InventorytocalDatasourceImpl>().localInventory(inventorymodel)
        // ignore: missing_return
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
