// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/LA/la_local_datasource.dart';
import '../../../data/models/equipment/LA/la_model.dart';

class LaProvider extends ChangeNotifier {
  List<LaModel> _laTrnoList = [];
  List<LaModel> get laTrnoList => _laTrnoList;
  List<LaModel> _lalocaldataList = [];
  List<LaModel> get lalocaldataList => _lalocaldataList;
  LaModel _laModel;
  LaModel get laModel => _laModel;

  String _error = 'ErroR';
  String get error => _error;

  void getLaByTrNo(int trNo) async {
    _laTrnoList = await sl<LaLocalDatasourceImpl>()
        .getLaByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getLaByID(int id) async {
    _laModel = await sl<LaLocalDatasourceImpl>()
        .getLaById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addLa(LaModel latolocal, DateTime dateOfTesting) async {
    await sl<LaLocalDatasourceImpl>()
        .localLa(latolocal, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteLa(int id) async {
    await sl<LaLocalDatasourceImpl>()
        .deleteLaById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateLa(LaModel latoupdate, int id) async {
    await sl<LaLocalDatasourceImpl>()
        .updateLa(latoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getLALocalData() async {
    _lalocaldataList = await sl<LaLocalDatasourceImpl>()
        .getLaLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
