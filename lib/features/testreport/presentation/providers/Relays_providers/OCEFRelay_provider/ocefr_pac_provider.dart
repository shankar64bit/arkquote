// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/OCEFRelay/ocefr_pac_local_datasource.dart';
import '../../../../data/models/equipment/Relays/OCEFRelay/ocefr_pac_model.dart';

class OcEfrPacProvider extends ChangeNotifier {
  List<OcEfrPacModel> _ocefrPac_loacaldataList = [];
  List<OcEfrPacModel> get ocefrPac_loacaldataList => _ocefrPac_loacaldataList;

  List<OcEfrPacModel> _ocefrPac_trNoIDList = [];
  List<OcEfrPacModel> get ocefrPac_trNoIDList => _ocefrPac_trNoIDList;

  List<OcEfrPacModel> _ocefrPac_serialNoList = [];
  List<OcEfrPacModel> get ocefrPac_serialNoList => _ocefrPac_serialNoList;

  OcEfrPacModel _ocefrPac_Model;
  OcEfrPacModel get ocefrPac_Model => _ocefrPac_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getOcEfrPactrNoID(int trNo) async {
    _ocefrPac_trNoIDList = await sl<OcEfrPacLocalDatasourceImpl>()
        .getOcEfrPacTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getOcEfrPacserialNo(String sNo) async {
    _ocefrPac_serialNoList = await sl<OcEfrPacLocalDatasourceImpl>()
        .getOcEfrPacSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getOcEfrPacById(int id) async {
    _ocefrPac_Model = await sl<OcEfrPacLocalDatasourceImpl>()
        .getOcEfrPacById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addOcEfrPac(OcEfrPacModel ocefrPactoLocal) async {
    await sl<OcEfrPacLocalDatasourceImpl>()
        .localOcEfrPac(ocefrPactoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteOcEfrPac(int id) async {
    await sl<OcEfrPacLocalDatasourceImpl>()
        .deleteOcEfrPacById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateOcEfrPac(OcEfrPacModel ocefrPacToUpdate, int id) async {
    await sl<OcEfrPacLocalDatasourceImpl>()
        .updateOcEfrPac(ocefrPacToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getOcEfrPacEquipmentList() async {
    _ocefrPac_loacaldataList = await sl<OcEfrPacLocalDatasourceImpl>()
        .getOcEfrPacEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
