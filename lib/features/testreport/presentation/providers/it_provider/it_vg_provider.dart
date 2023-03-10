// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/IT/it_vg_local_datasource.dart';
import '../../../data/models/equipment/IT/it_vg_model.dart';

class ItVgProvider extends ChangeNotifier {
  List<ItVgTestModel> _itVgTrNoList = [];
  List<ItVgTestModel> get itVgTrNoList => _itVgTrNoList;
  List<ItVgTestModel> _itVgSerialNoList = [];
  List<ItVgTestModel> get itVgSerialNoList => _itVgSerialNoList;
  List<ItVgTestModel> _itVgEquipmentList = [];
  List<ItVgTestModel> get itVgEquipmentList => _itVgEquipmentList;
  ItVgTestModel _itVgModel;
  ItVgTestModel get itVgModel => _itVgModel;

  String _error = 'ErroR';
  String get error => _error;

  void getItVgByTrNo(int trNo) async {
    _itVgTrNoList = await sl<ItVgLocalDatasourceImpl>()
        .getItVgByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getItVgBySerialNo(String serialNo) async {
    _itVgSerialNoList = await sl<ItVgLocalDatasourceImpl>()
        .getItVgBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getItVgByID(int id) async {
    _itVgModel = await sl<ItVgLocalDatasourceImpl>()
        .getItVgById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addItVg(ItVgTestModel itVgTestModel) async {
    await sl<ItVgLocalDatasourceImpl>()
        .localItVg(itVgTestModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteItVg(int id) async {
    await sl<ItVgLocalDatasourceImpl>()
        .deleteItVgById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateItVg(ItVgTestModel itVgToUpdate, int id) async {
    await sl<ItVgLocalDatasourceImpl>()
        .updateItVg(itVgToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getItVgEquipmentList() async {
    _itVgEquipmentList = await sl<ItVgLocalDatasourceImpl>()
        .getItVgEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
