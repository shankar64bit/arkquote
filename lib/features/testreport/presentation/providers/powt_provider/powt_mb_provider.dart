// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/Power_transformer/powt_mb_local_datasource.dart';
import '../../../data/models/equipment/powt/powt_mb_model.dart';

class Powt_mb_Provider extends ChangeNotifier {
  List<Powt_mb_Model> _powt_mb_loacaldataList = [];
  List<Powt_mb_Model> get powt_mb_loacaldataList => _powt_mb_loacaldataList;

  List<Powt_mb_Model> _powt_mb_trNoIDList = [];
  List<Powt_mb_Model> get powt_mb_trNoIDList => _powt_mb_trNoIDList;

  List<Powt_mb_Model> _powt_mb_serialNoList = [];
  List<Powt_mb_Model> get powt_mb_serialNoList => _powt_mb_serialNoList;

  Powt_mb_Model _powt_mb_Model;
  Powt_mb_Model get powt_mb_Model => _powt_mb_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowt_mbBytrNoID(int trNo) async {
    _powt_mb_trNoIDList = await sl<Powt_mb_LocalDatasourceImpl>()
        .getPowt_mbTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt_mbserialNo(String sNo) async {
    _powt_mb_serialNoList = await sl<Powt_mb_LocalDatasourceImpl>()
        .getPowt_mbSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt_mbById(int id) async {
    _powt_mb_Model = await sl<Powt_mb_LocalDatasourceImpl>()
        .getPowt_mb_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt_mb(Powt_mb_Model powtmbtolocal) async {
    await sl<Powt_mb_LocalDatasourceImpl>()
        .localPowt_mb(powtmbtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt_mb(int id) async {
    await sl<Powt_mb_LocalDatasourceImpl>()
        .deletePowt_mbById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt_mb(Powt_mb_Model powtmbtoupdate, int id) async {
    await sl<Powt_mb_LocalDatasourceImpl>()
        .updatePowt_mb(powtmbtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowtMBEquipmentList() async {
    _powt_mb_loacaldataList = await sl<Powt_mb_LocalDatasourceImpl>()
        .getPowtmbEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
