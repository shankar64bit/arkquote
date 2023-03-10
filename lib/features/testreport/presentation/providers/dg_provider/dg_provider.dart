// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/DG/dg_local_datasource.dart';
import '../../../data/models/equipment/DG/dg_model.dart';

class DgProvider extends ChangeNotifier {
  List<DgModel> _dgTrnoList = [];
  List<DgModel> get dgTrnoList => _dgTrnoList;
  List<DgModel> _dglocaldataList = [];
  List<DgModel> get dglocaldataList => _dglocaldataList;
  DgModel _dgModel;
  DgModel get dgModel => _dgModel;

  String _error = 'ErroR';
  String get error => _error;

  void getDgByTrNo(int trNo) async {
    _dgTrnoList = await sl<DgLocalDatasourceImpl>()
        .getDgByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getDgByID(int id) async {
    _dgModel = await sl<DgLocalDatasourceImpl>()
        .getDgById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addDg(DgModel dgModel, DateTime dateOfTesting) async {
    await sl<DgLocalDatasourceImpl>()
        .localDg(dgModel, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteDg(int id) async {
    await sl<DgLocalDatasourceImpl>()
        .deleteDgById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateDg(DgModel dgToUpdate, int id) async {
    await sl<DgLocalDatasourceImpl>()
        .updateDg(dgToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getDgLocalData() async {
    _dglocaldataList = await sl<DgLocalDatasourceImpl>()
        .getDgLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
