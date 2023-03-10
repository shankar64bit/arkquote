// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/power_cable/pc_local_datasource.dart';
import '../../../data/models/equipment/power_cable/pc_model.dart';

class PcProvider extends ChangeNotifier {
  List<PcModel> _pcTrnoList = [];
  List<PcModel> get pcTrnoList => _pcTrnoList;
  List<PcModel> _pclocaldataList = [];
  List<PcModel> get pclocaldataList => _pclocaldataList;
  PcModel _pcModel;
  PcModel get pcModel => _pcModel;

  String _error = 'ErroR';
  String get error => _error;

  void getPcByTrNo(int trNo) async {
    _pcTrnoList = await sl<PcLocalDatasourceImpl>()
        .getPcByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPcByID(int id) async {
    _pcModel = await sl<PcLocalDatasourceImpl>()
        .getPcById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPc(PcModel pctolocal, DateTime dateOfTesting) async {
    await sl<PcLocalDatasourceImpl>()
        .localPc(pctolocal, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePc(int id) async {
    await sl<PcLocalDatasourceImpl>()
        .deletePcById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePc(PcModel pctoupdate, int id) async {
    await sl<PcLocalDatasourceImpl>()
        .updatePc(pctoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPCLocalData() async {
    _pclocaldataList = await sl<PcLocalDatasourceImpl>()
        .getPcLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
