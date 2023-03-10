// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/powt_3_winding/powt3win_local_datasource.dart';
import '../../../data/models/equipment/powt_3_winding/powt3winding_model.dart';

class Powt3WindingProvider extends ChangeNotifier {
  List<Powt3WindingModel> _powt3WindingTrnoList = [];
  List<Powt3WindingModel> get powt3WindingTrnoList => _powt3WindingTrnoList;
  List<Powt3WindingModel> _powt3WindinglocaldataList = [];
  List<Powt3WindingModel> get powt3WindinglocaldataList =>
      _powt3WindinglocaldataList;
  List<Powt3WindingModel> _powt3WindingSerialNoList = [];
  List<Powt3WindingModel> get powt3WindingSerialNoList =>
      _powt3WindingSerialNoList;
  Powt3WindingModel _powt3WindingModel;
  Powt3WindingModel get powt3WindingModel => _powt3WindingModel;

  String _error = 'ErroR';
  String get error => _error;

  void getPowt3WindingByTrNo(int trNo) async {
    _powt3WindingTrnoList = await sl<Powt3WindingLocalDatasourceImpl>()
        .getPowt3WindingByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3WindingBySerialNo(String sn) async {
    _powt3WindingSerialNoList = await sl<Powt3WindingLocalDatasourceImpl>()
        .getPowt3WindingBySerialNo(sn)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3WindingByID(int id) async {
    _powt3WindingModel = await sl<Powt3WindingLocalDatasourceImpl>()
        .getPowt3WindingById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt3Winding(
      Powt3WindingModel p3wtolocal, DateTime dateOfTesting) async {
    await sl<Powt3WindingLocalDatasourceImpl>()
        .localPowt3Winding(p3wtolocal, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt3Winding(int id) async {
    await sl<Powt3WindingLocalDatasourceImpl>()
        .deletePowt3WindingById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt3Winding(Powt3WindingModel p3wtoupdate, int id) async {
    await sl<Powt3WindingLocalDatasourceImpl>()
        .updatePowt3Winding(p3wtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3WindingLocalData() async {
    _powt3WindinglocaldataList = await sl<Powt3WindingLocalDatasourceImpl>()
        .getPowt3WindingLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
