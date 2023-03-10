// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/EFELRelay/efelr_local_datasource.dart';
import '../../../../data/models/equipment/Relays/EFELRelay/efelr_model.dart';

class EfElrProvider extends ChangeNotifier {
  List<EfElrModel> _efelrTrnoList = [];
  List<EfElrModel> get efelrTrnoList => _efelrTrnoList;
  List<EfElrModel> _efelrlocaldataList = [];
  List<EfElrModel> get efelrlocaldataList => _efelrlocaldataList;
  List<EfElrModel> _efelrSerialNoList = [];
  List<EfElrModel> get efelrSerialNoList => _efelrSerialNoList;
  EfElrModel _efelrModel;
  EfElrModel get efelrModel => _efelrModel;

  String _error = 'ErroR';
  String get error => _error;

  void getEfElrByTrNo(int trNo) async {
    _efelrTrnoList = await sl<EfElrLocalDatasourceImpl>()
        .getEfElrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEfElrBySerialNo(String sn) async {
    _efelrSerialNoList = await sl<EfElrLocalDatasourceImpl>()
        .getEfElrBySerialNo(sn)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEfElrByID(int id) async {
    _efelrModel = await sl<EfElrLocalDatasourceImpl>()
        .getEfElrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addEfElr(EfElrModel efelrModel, DateTime dateOfTesting) async {
    await sl<EfElrLocalDatasourceImpl>()
        .localEfElr(efelrModel, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteEfElr(int id) async {
    await sl<EfElrLocalDatasourceImpl>()
        .deleteEfElrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateEfElr(EfElrModel efelrUpdate, int id) async {
    await sl<EfElrLocalDatasourceImpl>()
        .updateEfElr(efelrUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getEFELRLocalData() async {
    _efelrlocaldataList = await sl<EfElrLocalDatasourceImpl>()
        .getEFELRLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
