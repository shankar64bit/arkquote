// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/EFELRelay/efelr_pac_local_datasource.dart';
import '../../../../data/models/equipment/Relays/EFELRelay/efelr_pac_model.dart';

class EfElrPacProvider extends ChangeNotifier {
  List<EfElrPacModel> _efelrPac_loacaldataList = [];
  List<EfElrPacModel> get efelrPac_loacaldataList => _efelrPac_loacaldataList;

  List<EfElrPacModel> _efelrPac_trNoIDList = [];
  List<EfElrPacModel> get efelrPac_trNoIDList => _efelrPac_trNoIDList;

  List<EfElrPacModel> _efelrPac_serialNoList = [];
  List<EfElrPacModel> get efelrPac_serialNoList => _efelrPac_serialNoList;

  EfElrPacModel _efelrPac_Model;
  EfElrPacModel get efelrPac_Model => _efelrPac_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getEfElrPactrNoID(int trNo) async {
    _efelrPac_trNoIDList = await sl<EfElrPacLocalDatasourceImpl>()
        .getEfElrPacTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEfElrPacserialNo(String sNo) async {
    _efelrPac_serialNoList = await sl<EfElrPacLocalDatasourceImpl>()
        .getEfElrPacSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEfElrPacById(int id) async {
    _efelrPac_Model = await sl<EfElrPacLocalDatasourceImpl>()
        .getEfElrPacById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addEfElrPac(EfElrPacModel efelrPactoLocal) async {
    await sl<EfElrPacLocalDatasourceImpl>()
        .localEfElrPac(efelrPactoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteEfElrPac(int id) async {
    await sl<EfElrPacLocalDatasourceImpl>()
        .deleteEfElrPacById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateEfElrPac(EfElrPacModel efelrPacUpdate, int id) async {
    await sl<EfElrPacLocalDatasourceImpl>()
        .updateEfElrPac(efelrPacUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getEfElrPacEquipmentList() async {
    _efelrPac_loacaldataList = await sl<EfElrPacLocalDatasourceImpl>()
        .getEfElrPacEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
