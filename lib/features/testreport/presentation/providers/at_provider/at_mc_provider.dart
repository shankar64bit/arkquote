// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/Auxiliary_transformer/at_mc_local_datasource.dart';
import '../../../data/models/equipment/AT/AT_mc_model.dart';

class AT_mc_Provider extends ChangeNotifier {
  List<AT_mc_Model> _at_mc_loacaldataList = [];
  List<AT_mc_Model> get at_mc_loacaldataList => _at_mc_loacaldataList;

  List<AT_mc_Model> _at_mc_trNoIDList = [];
  List<AT_mc_Model> get at_mc_trNoIDList => _at_mc_trNoIDList;

  List<AT_mc_Model> _at_mc_serialNoList = [];
  List<AT_mc_Model> get at_mc_serialNoList => _at_mc_serialNoList;

  AT_mc_Model _at_mc_Model;
  AT_mc_Model get at_mc_Model => _at_mc_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getAT_mcBytrNoID(int trNo) async {
    _at_mc_trNoIDList = await sl<AT_mc_LocalDatasourceImpl>()
        .getAT_mcTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getAT_mcserialNo(String sNo) async {
    _at_mc_serialNoList = await sl<AT_mc_LocalDatasourceImpl>()
        .getAT_mcSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getAT_mcById(int id) async {
    _at_mc_Model = await sl<AT_mc_LocalDatasourceImpl>()
        .getAT_mc_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addAT_mc(AT_mc_Model atmctolocal) async {
    await sl<AT_mc_LocalDatasourceImpl>()
        .localAT_mc(atmctolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteAT_mc(int id) async {
    await sl<AT_mc_LocalDatasourceImpl>()
        .deleteAT_mcById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateAT_mc(AT_mc_Model atmctoupdate, int id) async {
    await sl<AT_mc_LocalDatasourceImpl>()
        .updateAT_mc(atmctoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getATmcEquipmentList() async {
    _at_mc_loacaldataList = await sl<AT_mc_LocalDatasourceImpl>()
        .getATmcEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
