// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/Power_transformer/powt_mc_local_datasource.dart';
import '../../../data/models/equipment/powt/powt_mc_model.dart';

class Powt_mc_Provider extends ChangeNotifier {
  List<Powt_mc_Model> _powt_mc_loacaldataList = [];
  List<Powt_mc_Model> get powt_mc_loacaldataList => _powt_mc_loacaldataList;

  List<Powt_mc_Model> _powt_mc_trNoIDList = [];
  List<Powt_mc_Model> get powt_mc_trNoIDList => _powt_mc_trNoIDList;

  List<Powt_mc_Model> _powt_mc_serialNoList = [];
  List<Powt_mc_Model> get powt_mc_serialNoList => _powt_mc_serialNoList;

  Powt_mc_Model _powt_mc_Model;
  Powt_mc_Model get powt_mc_Model => _powt_mc_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowt_mcBytrNoID(int trNo) async {
    _powt_mc_trNoIDList = await sl<Powt_mc_LocalDatasourceImpl>()
        .getPowt_mcTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt_mcserialNo(String sNo) async {
    _powt_mc_serialNoList = await sl<Powt_mc_LocalDatasourceImpl>()
        .getPowt_mcSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt_mcById(int id) async {
    _powt_mc_Model = await sl<Powt_mc_LocalDatasourceImpl>()
        .getPowt_mc_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt_mc(Powt_mc_Model powtmctolocal) async {
    await sl<Powt_mc_LocalDatasourceImpl>()
        .localPowt_mc(powtmctolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt_mc(int id) async {
    await sl<Powt_mc_LocalDatasourceImpl>()
        .deletePowt_mcById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt_mc(Powt_mc_Model powtmctoupdate, int id) async {
    await sl<Powt_mc_LocalDatasourceImpl>()
        .updatePowt_mc(powtmctoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowt_mcEquipmentList() async {
    _powt_mc_loacaldataList = await sl<Powt_mc_LocalDatasourceImpl>()
        .getPowtmcEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
