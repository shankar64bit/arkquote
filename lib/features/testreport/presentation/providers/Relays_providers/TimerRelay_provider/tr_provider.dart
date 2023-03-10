// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/TimerRelay/tr_local_datasource.dart';
import '../../../../data/models/equipment/Relays/TRelay/tr_model.dart';

class TrProvider extends ChangeNotifier {
  List<TrModel> _trTrnoList = [];
  List<TrModel> get trTrnoList => _trTrnoList;
  List<TrModel> _trlocaldataList = [];
  List<TrModel> get trlocaldataList => _trlocaldataList;
  List<TrModel> _trSerialNoList = [];
  List<TrModel> get trSerialNoList => _trSerialNoList;
  TrModel _trModel;
  TrModel get trModel => _trModel;

  String _error = 'ErroR';
  String get error => _error;

  void getTrByTrNo(int trNo) async {
    _trTrnoList = await sl<TrLocalDatasourceImpl>()
        .getTrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getTrBySerialNo(String sn) async {
    _trSerialNoList = await sl<TrLocalDatasourceImpl>()
        .getTrBySerialNo(sn)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getTrByID(int id) async {
    _trModel = await sl<TrLocalDatasourceImpl>()
        .getTrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addTr(TrModel trModel, DateTime dateOfTesting) async {
    await sl<TrLocalDatasourceImpl>()
        .localTr(trModel, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteTr(int id) async {
    await sl<TrLocalDatasourceImpl>()
        .deleteTrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateTr(TrModel trUpdate, int id) async {
    await sl<TrLocalDatasourceImpl>()
        .updateTr(trUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getTrLocalData() async {
    _trlocaldataList = await sl<TrLocalDatasourceImpl>()
        .getTrLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
