// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/CT/ct_core_local_datasource.dart';
import '../../../data/models/equipment/CT/ct_core_model.dart';

class CT_core_Provider extends ChangeNotifier {
  List<CT_core_Model> _ct_core_loacaldataList = [];
  List<CT_core_Model> get ct_core_loacaldataList => _ct_core_loacaldataList;

  List<CT_core_Model> _ct_core_ctNoIDList = [];
  List<CT_core_Model> get ct_core_ctNoIDList => _ct_core_ctNoIDList;

  CT_core_Model _ct_core_Model;
  CT_core_Model get ct_core_Model => _ct_core_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getCTcoreByctNoID(int ctNo) async {
    _ct_core_ctNoIDList = await sl<CT_core_LocalDatasourceImpl>()
        .getCTcorectNoID(ctNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getCT_core_ById(int id) async {
    _ct_core_Model = await sl<CT_core_LocalDatasourceImpl>()
        .getCT_core_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addCT_core(CT_core_Model ctcoretolocal) async {
    await sl<CT_core_LocalDatasourceImpl>()
        .localCT_core(ctcoretolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteCT_core(int id) async {
    await sl<CT_core_LocalDatasourceImpl>()
        .deleteCT_coreById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateCT_core(CT_core_Model ctcoretoupdate, int id) async {
    await sl<CT_core_LocalDatasourceImpl>()
        .updateCT_core(ctcoretoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getCTcoreEquipmentList() async {
    _ct_core_loacaldataList = await sl<CT_core_LocalDatasourceImpl>()
        .getctcoreEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
