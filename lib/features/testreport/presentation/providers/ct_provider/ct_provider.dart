// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/CT/ct_model.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/CT/ct_local_datasource.dart';

class CTProvider extends ChangeNotifier {
  List<CTModel> _ctTrnoList = [];
  List<CTModel> get ctTrnoList => _ctTrnoList;
  List<CTModel> _ctlocaldataist = [];
  List<CTModel> get ctlocaldataist => _ctlocaldataist;
  List<CTModel> _ctSerialNoList = [];
  List<CTModel> get ctSerialNoList => _ctSerialNoList;
  CTModel _ctModel;
  CTModel get ctModel => _ctModel;

  String _error = 'ErroR';
  String get error => _error;

  void getCTByTrNo(int trNo) async {
    _ctTrnoList = await sl<CTLocalDatasourceImpl>()
        .getCTByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getCTBySerialNo(String sn) async {
    _ctSerialNoList = await sl<CTLocalDatasourceImpl>()
        .getCTBySerialNo(sn)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getCTByID(int id) async {
    _ctModel = await sl<CTLocalDatasourceImpl>()
        .getCTById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addCT(CTModel cttolocal, DateTime dateOfTesting) async {
    await sl<CTLocalDatasourceImpl>()
        .localCT(cttolocal, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteCT(int id) async {
    await sl<CTLocalDatasourceImpl>()
        .deleteCTById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateCT(CTModel cttoupdate, int id) async {
    await sl<CTLocalDatasourceImpl>()
        .updateCT(cttoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getCTLocalData() async {
    _ctlocaldataist = await sl<CTLocalDatasourceImpl>()
        .getCTLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
