// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/OCEFRelay/ocefr_local_datasource.dart';
import '../../../../data/models/equipment/Relays/OCEFRelay/ocefr_model.dart';

class OcEfrProvider extends ChangeNotifier {
  List<OcEfrModel> _ocefrTrnoList = [];
  List<OcEfrModel> get ocefrTrnoList => _ocefrTrnoList;
  List<OcEfrModel> _ocefrlocaldataList = [];
  List<OcEfrModel> get ocefrlocaldataList => _ocefrlocaldataList;
  List<OcEfrModel> _ocefrSerialNoList = [];
  List<OcEfrModel> get ocefrSerialNoList => _ocefrSerialNoList;
  OcEfrModel _ocefrModel;
  OcEfrModel get ocefrModel => _ocefrModel;

  String _error = 'ErroR';
  String get error => _error;

  void getOcEfrByTrNo(int trNo) async {
    _ocefrTrnoList = await sl<OcEfrLocalDatasourceImpl>()
        .getOcEfrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getOcEfrBySerialNo(String sn) async {
    _ocefrSerialNoList = await sl<OcEfrLocalDatasourceImpl>()
        .getOcEfrBySerialNo(sn)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getOcEfrByID(int id) async {
    _ocefrModel = await sl<OcEfrLocalDatasourceImpl>()
        .getOcEfrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addOcEfr(OcEfrModel ocefrModel, DateTime dateOfTesting) async {
    await sl<OcEfrLocalDatasourceImpl>()
        .localOcEfr(ocefrModel, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteOcEfr(int id) async {
    await sl<OcEfrLocalDatasourceImpl>()
        .deleteOcEfrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateOcEfr(OcEfrModel ocefrUpdate, int id) async {
    await sl<OcEfrLocalDatasourceImpl>()
        .updateOcEfr(ocefrUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getOcEfrLocalData() async {
    _ocefrlocaldataList = await sl<OcEfrLocalDatasourceImpl>()
        .getOcEfrLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
