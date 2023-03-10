// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/VoltageRelay/vr_pac_local_datasource.dart';
import '../../../../data/models/equipment/Relays/VoltageRelay/vr_pac_model.dart';

class VrPacProvider extends ChangeNotifier {
  List<VrPacModel> _vrPac_loacaldataList = [];
  List<VrPacModel> get vrPac_loacaldataList => _vrPac_loacaldataList;

  List<VrPacModel> _vrPac_trNoIDList = [];
  List<VrPacModel> get vrPac_trNoIDList => _vrPac_trNoIDList;

  List<VrPacModel> _vrPac_serialNoList = [];
  List<VrPacModel> get vrPac_serialNoList => _vrPac_serialNoList;

  VrPacModel _vrPac_Model;
  VrPacModel get vrPac_Model => _vrPac_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getVrPactrNoID(int trNo) async {
    _vrPac_trNoIDList = await sl<VrPacLocalDatasourceImpl>()
        .getVrPacTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getVrPacserialNo(String sNo) async {
    _vrPac_serialNoList = await sl<VrPacLocalDatasourceImpl>()
        .getVrPacSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getVrPacById(int id) async {
    _vrPac_Model = await sl<VrPacLocalDatasourceImpl>()
        .getVrPacById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addVrPac(VrPacModel efelrModel) async {
    await sl<VrPacLocalDatasourceImpl>()
        .localVrPac(efelrModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteVrPac(int id) async {
    await sl<VrPacLocalDatasourceImpl>()
        .deleteVrPacById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateVrPac(VrPacModel efelrUpdate, int id) async {
    await sl<VrPacLocalDatasourceImpl>()
        .updateVrPac(efelrUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getVrPacEquipmentList() async {
    _vrPac_loacaldataList = await sl<VrPacLocalDatasourceImpl>()
        .getVrPacEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
