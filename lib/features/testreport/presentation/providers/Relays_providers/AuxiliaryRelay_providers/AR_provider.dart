// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../../data/datasources/equipment/Relays/AuxiliaryRelay/AR_local_datasource.dart';
import '../../../../data/models/equipment/Relays/AuxiliaryRelay/AR_model.dart';

class ARProvider extends ChangeNotifier {
  List<ARModel> _arTrnoList = [];
  List<ARModel> get arTrnoList => _arTrnoList;
  List<ARModel> _arLocaldataList = [];
  List<ARModel> get arLocaldataList => _arLocaldataList;
  List<ARModel> _arSerialNoList = [];
  List<ARModel> get arSerialNoList => _arSerialNoList;
  ARModel _arModel;
  ARModel get arModel => _arModel;

  String _error = 'ErroR';
  String get error => _error;

  void getARByTrNo(int trNo) async {
    _arTrnoList = await sl<ARLocalDatasourceImpl>()
        .getARByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getARBySerialNo(String sn) async {
    _arSerialNoList = await sl<ARLocalDatasourceImpl>()
        .getARBySerialNo(sn)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getARByID(int id) async {
    _arModel = await sl<ARLocalDatasourceImpl>()
        .getARById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addAR(ARModel artolocal, DateTime dateOfTesting) async {
    await sl<ARLocalDatasourceImpl>()
        .localAR(artolocal, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteAR(int id) async {
    await sl<ARLocalDatasourceImpl>()
        .deleteARById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateAR(ARModel artoupdate, int id) async {
    await sl<ARLocalDatasourceImpl>()
        .updateAR(artoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getARLocalData() async {
    _arLocaldataList = await sl<ARLocalDatasourceImpl>()
        .getARLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
