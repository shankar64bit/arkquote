// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/EE/ee_local_datasource.dart';
import '../../../data/models/equipment/EE/ee_model.dart';

class EEProvider extends ChangeNotifier {
  List<EEModel> _eeTrnoList = [];
  List<EEModel> get eeTrnoList => _eeTrnoList;
  List<EEModel> _eelocaldataList = [];
  List<EEModel> get eelocaldataList => _eelocaldataList;
  EEModel _eeModel;
  EEModel get eeModel => _eeModel;

  String _error = 'ErroR';
  String get error => _error;

  void getEEByTrNo(int trNo) async {
    _eeTrnoList = await sl<EELocalDatasourceImpl>()
        .getEEByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEEByID(int id) async {
    _eeModel = await sl<EELocalDatasourceImpl>()
        .getEEById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addEE(EEModel eetolocal, DateTime dateOfTesting) async {
    await sl<EELocalDatasourceImpl>()
        .localEE(eetolocal, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteEE(int id) async {
    await sl<EELocalDatasourceImpl>()
        .deleteEEById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateEE(EEModel eetoupdate, int id) async {
    await sl<EELocalDatasourceImpl>()
        .updateEE(eetoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getEELocalData() async {
    _eelocaldataList = await sl<EELocalDatasourceImpl>()
        .getEELocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
