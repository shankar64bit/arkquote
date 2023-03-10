// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/busbar/bb_local_datasource.dart';
import '../../../data/models/equipment/busbar/bb_model.dart';

class BbProvider extends ChangeNotifier {
  List<BbModel> _bbTrnoList = [];
  List<BbModel> get bbTrnoList => _bbTrnoList;
  List<BbModel> _bblocaldataList = [];
  List<BbModel> get bblocaldataList => _bblocaldataList;
  BbModel _bbModel;
  BbModel get bbModel => _bbModel;

  String _error = 'ErroR';
  String get error => _error;

  void getBbByTrNo(int trNo) async {
    _bbTrnoList = await sl<BbLocalDatasourceImpl>()
        .getBbByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getBbByID(int id) async {
    _bbModel = await sl<BbLocalDatasourceImpl>()
        .getBbById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addBb(BbModel bbtolocal, DateTime dateOfTesting) async {
    await sl<BbLocalDatasourceImpl>()
        .localBb(bbtolocal, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteBb(int id) async {
    await sl<BbLocalDatasourceImpl>()
        .deleteBbById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateBb(BbModel bbtoupdate, int id) async {
    await sl<BbLocalDatasourceImpl>()
        .updateBb(bbtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getBBLocalData() async {
    _bblocaldataList = await sl<BbLocalDatasourceImpl>()
        .getbbLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
