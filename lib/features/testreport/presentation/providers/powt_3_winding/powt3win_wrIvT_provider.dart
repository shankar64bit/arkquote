// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/powt_3_winding/powt3win_wrIvT_local_datasource.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_wrIvT_model.dart';

class Powt3winwrIvTProvider extends ChangeNotifier {
  List<Powt3winwrIvTModel> _powt3winwrIvT_loacaldataList = [];
  List<Powt3winwrIvTModel> get powt3winwrIvT_loacaldataList =>
      _powt3winwrIvT_loacaldataList;

  List<Powt3winwrIvTModel> _powt3winwrIvT_trNoIDList = [];
  List<Powt3winwrIvTModel> get powt3winwrIvT_trNoIDList =>
      _powt3winwrIvT_trNoIDList;

  List<Powt3winwrIvTModel> _powt3winwrIvT_serialNoList = [];
  List<Powt3winwrIvTModel> get powt3winwrIvT_serialNoList =>
      _powt3winwrIvT_serialNoList;

  Powt3winwrIvTModel _powt3winwrIvT_Model;
  Powt3winwrIvTModel get powt3winwrIvT_Model => _powt3winwrIvT_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowt3winwrIvTBytrNoID(int trNo) async {
    _powt3winwrIvT_trNoIDList = await sl<Powt3winwrIvTLocalDatasourceImpl>()
        .getPowt3winwrIvTTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winwrIvTserialNo(String sNo) async {
    _powt3winwrIvT_serialNoList = await sl<Powt3winwrIvTLocalDatasourceImpl>()
        .getPowt3winwrIvTSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winwrIvTById(int id) async {
    _powt3winwrIvT_Model = await sl<Powt3winwrIvTLocalDatasourceImpl>()
        .getPowt3winwrIvT_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt3winwrIvT(Powt3winwrIvTModel p3wwrIvittolocal) async {
    await sl<Powt3winwrIvTLocalDatasourceImpl>()
        .localPowt3winwrIvT(p3wwrIvittolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt3winwrIvT(int id) async {
    await sl<Powt3winwrIvTLocalDatasourceImpl>()
        .deletePowt3winwrIvTById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt3winwrIvT(
      Powt3winwrIvTModel p3wwrIvittoupdate, int id) async {
    await sl<Powt3winwrIvTLocalDatasourceImpl>()
        .updatePowt3winwrIvT(p3wwrIvittoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winwrIvtEquipmentList() async {
    _powt3winwrIvT_loacaldataList = await sl<Powt3winwrIvTLocalDatasourceImpl>()
        .getPowt3winwrIvtEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
