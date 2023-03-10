// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/powt_3_winding/powt3win_tsc_local_datasource.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_tsc_model.dart';

class Powt3wintscProvider extends ChangeNotifier {
  List<Powt3wintscModel> _powt3wintsc_loacaldataList = [];
  List<Powt3wintscModel> get powt3wintsc_loacaldataList =>
      _powt3wintsc_loacaldataList;

  List<Powt3wintscModel> _powt3wintsc_trNoIDList = [];
  List<Powt3wintscModel> get powt3wintsc_trNoIDList => _powt3wintsc_trNoIDList;

  List<Powt3wintscModel> _powt3wintsc_serialNoList = [];
  List<Powt3wintscModel> get powt3wintsc_serialNoList =>
      _powt3wintsc_serialNoList;

  Powt3wintscModel _powt3wintsc_Model;
  Powt3wintscModel get powt3wintsc_Model => _powt3wintsc_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowt3wintscBytrNoID(int trNo) async {
    _powt3wintsc_trNoIDList = await sl<Powt3wintscLocalDatasourceImpl>()
        .getPowt3wintscTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3wintscserialNo(String sNo) async {
    _powt3wintsc_serialNoList = await sl<Powt3wintscLocalDatasourceImpl>()
        .getPowt3wintscSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3wintscById(int id) async {
    _powt3wintsc_Model = await sl<Powt3wintscLocalDatasourceImpl>()
        .getPowt3wintsc_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt3wintsc(Powt3wintscModel p3wtsctolocal) async {
    await sl<Powt3wintscLocalDatasourceImpl>()
        .localPowt3wintsc(p3wtsctolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt3wintsc(int id) async {
    await sl<Powt3wintscLocalDatasourceImpl>()
        .deletePowt3wintscById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt3wintsc(Powt3wintscModel p3wtsctoupdate, int id) async {
    await sl<Powt3wintscLocalDatasourceImpl>()
        .updatePowt3wintsc(p3wtsctoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3wintscEquipmentList() async {
    _powt3wintsc_loacaldataList = await sl<Powt3wintscLocalDatasourceImpl>()
        .getPowt3wintscEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
