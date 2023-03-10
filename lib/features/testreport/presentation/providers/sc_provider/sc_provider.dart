// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/SC/sc_local_datasource.dart';
import '../../../data/models/equipment/SC/sc_model.dart';

class ScProvider extends ChangeNotifier {
  List<ScModel> _scTrnoList = [];
  List<ScModel> get scTrnoList => _scTrnoList;
  List<ScModel> _sclocaldataList = [];
  List<ScModel> get sclocaldataList => _sclocaldataList;
  ScModel _scModel;
  ScModel get scModel => _scModel;

  String _error = 'ErroR';
  String get error => _error;

  void getScByTrNo(int trNo) async {
    _scTrnoList = await sl<ScLocalDatasourceImpl>()
        .getScByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getScByID(int id) async {
    _scModel = await sl<ScLocalDatasourceImpl>()
        .getScById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addSc(ScModel sctolocal, DateTime dateOfTesting) async {
    await sl<ScLocalDatasourceImpl>()
        .localSc(sctolocal, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteSc(int id) async {
    await sl<ScLocalDatasourceImpl>()
        .deleteScById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateSc(ScModel sctoupdate, int id) async {
    await sl<ScLocalDatasourceImpl>()
        .updateSc(sctoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getScLocalData() async {
    _sclocaldataList = await sl<ScLocalDatasourceImpl>()
        .getScLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
