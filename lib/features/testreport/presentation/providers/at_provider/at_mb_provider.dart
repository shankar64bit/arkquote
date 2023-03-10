// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/Auxiliary_transformer/at_mb_local_datasource.dart';
import '../../../data/models/equipment/AT/AT_mb_model.dart';

class AT_mb_Provider extends ChangeNotifier {
  List<AT_mb_Model> _at_mb_loacaldataList = [];
  List<AT_mb_Model> get at_mb_loacaldataList => _at_mb_loacaldataList;

  List<AT_mb_Model> _at_mb_trNoIDList = [];
  List<AT_mb_Model> get at_mb_trNoIDList => _at_mb_trNoIDList;

  List<AT_mb_Model> _at_mb_serialNoList = [];
  List<AT_mb_Model> get at_mb_serialNoList => _at_mb_serialNoList;

  AT_mb_Model _at_mb_Model;
  AT_mb_Model get at_mb_Model => _at_mb_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getAT_mbBytrNoID(int trNo) async {
    _at_mb_trNoIDList = await sl<AT_mb_LocalDatasourceImpl>()
        .getAT_mbTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getAT_mbserialNo(String sNo) async {
    _at_mb_serialNoList = await sl<AT_mb_LocalDatasourceImpl>()
        .getAT_mbSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getAT_mbById(int id) async {
    _at_mb_Model = await sl<AT_mb_LocalDatasourceImpl>()
        .getAT_mb_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addATmb(AT_mb_Model atmbtolocal) async {
    await sl<AT_mb_LocalDatasourceImpl>()
        .localAT_mb(atmbtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteAT_mb(int id) async {
    await sl<AT_mb_LocalDatasourceImpl>()
        .deleteAT_mbById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateATmb(AT_mb_Model atmbtoupdate, int id) async {
    await sl<AT_mb_LocalDatasourceImpl>()
        .updateAT_mb(atmbtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getATmbEquipmentList() async {
    _at_mb_loacaldataList = await sl<AT_mb_LocalDatasourceImpl>()
        .getATmbEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
