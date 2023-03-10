// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/EE/ee_loc_local_datasource.dart';
import '../../../data/models/equipment/EE/eeLoc.dart';

class EE_loc_Provider extends ChangeNotifier {
  List<EELocModel> _ee_loc_loacaldataList = [];
  List<EELocModel> get ee_loc_loacaldataList => _ee_loc_loacaldataList;

  List<EELocModel> _ee_loc_eeNoIDList = [];
  List<EELocModel> get ee_loc_eeNoIDList => _ee_loc_eeNoIDList;

  EELocModel _ee_loc_Model;
  EELocModel get ee_loc_Model => _ee_loc_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getEELocByEENoID(int eeNo) async {
    _ee_loc_eeNoIDList = await sl<EE_Loc_LocalDatasourceImpl>()
        .getEELocEENoID(eeNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEELocById(int id) async {
    _ee_loc_Model = await sl<EE_Loc_LocalDatasourceImpl>()
        .getEE_Loc_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addEELoc(EELocModel eeLoctoLocal) async {
    await sl<EE_Loc_LocalDatasourceImpl>()
        .localEE_Loc(eeLoctoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteEELoc(int id) async {
    await sl<EE_Loc_LocalDatasourceImpl>()
        .deleteEE_LocById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateEELoc(EELocModel ee_loc_Model, int id) async {
    await sl<EE_Loc_LocalDatasourceImpl>()
        .updateEE_Loc(ee_loc_Model, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getEElocLocalDataEquipmentList() async {
    _ee_loc_loacaldataList = await sl<EE_Loc_LocalDatasourceImpl>()
        .getEElocEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
