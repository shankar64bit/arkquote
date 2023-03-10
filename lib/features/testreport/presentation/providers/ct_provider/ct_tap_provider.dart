// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/CT/ct_tap_local_datasource.dart';
import '../../../data/models/equipment/CT/ct_tap_model.dart';

class CT_tap_Provider extends ChangeNotifier {
  List<CT_tap_Model> _ct_tap_loacaldataList = [];
  List<CT_tap_Model> get ct_tap_loacaldataList => _ct_tap_loacaldataList;

  List<CT_tap_Model> _ct_tap_ctNoIDList = [];
  List<CT_tap_Model> get ct_tap_ctNoIDList => _ct_tap_ctNoIDList;

  CT_tap_Model _ct_tap_Model;
  CT_tap_Model get ct_tap_Model => _ct_tap_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getCTtapByctNoID(int ctNo) async {
    _ct_tap_ctNoIDList = await sl<CT_tap_LocalDatasourceImpl>()
        .getCTtapctNoID(ctNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getCT_tap_ById(int id) async {
    _ct_tap_Model = await sl<CT_tap_LocalDatasourceImpl>()
        .getCT_tap_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addCT_tap(CT_tap_Model CT_taptoLocal) async {
    await sl<CT_tap_LocalDatasourceImpl>()
        .localCT_tap(CT_taptoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteCT_tap(int id) async {
    await sl<CT_tap_LocalDatasourceImpl>()
        .deleteCT_tapById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateCT_tap(CT_tap_Model ct_tap_update, int id) async {
    await sl<CT_tap_LocalDatasourceImpl>()
        .updateCT_tap(ct_tap_update, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
