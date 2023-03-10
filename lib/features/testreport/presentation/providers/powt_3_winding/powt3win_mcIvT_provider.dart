// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/powt_3_winding/powt3win_mcIvT_local_datasource.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_mcIvT_model.dart';

class Powt3winmcIvTProvider extends ChangeNotifier {
  List<Powt3winmcIvTModel> _powt3winmcIvTloacaldataList = [];
  List<Powt3winmcIvTModel> get powt3winmcIvTloacaldataList =>
      _powt3winmcIvTloacaldataList;

  List<Powt3winmcIvTModel> _powt3winmcIvTtrNoIDList = [];
  List<Powt3winmcIvTModel> get powt3winmcIvTtrNoIDList =>
      _powt3winmcIvTtrNoIDList;

  List<Powt3winmcIvTModel> _powt3winmcIvTserialNoList = [];
  List<Powt3winmcIvTModel> get powt3winmcIvTserialNoList =>
      _powt3winmcIvTserialNoList;

  Powt3winmcIvTModel _powt3winmcIvTModel;
  Powt3winmcIvTModel get powt3winmcIvTModel => _powt3winmcIvTModel;

  String _error = 'ErroR';
  String get error => _error;

  void getPowt3winmcIvTBytrNoID(int trNo) async {
    _powt3winmcIvTtrNoIDList = await sl<Powt3winmcIvTLocalDatasourceImpl>()
        .getPowt3winmcIvTTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winmcIvTserialNo(String sNo) async {
    _powt3winmcIvTserialNoList = await sl<Powt3winmcIvTLocalDatasourceImpl>()
        .getPowt3winmcIvTSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winmcIvTById(int id) async {
    _powt3winmcIvTModel = await sl<Powt3winmcIvTLocalDatasourceImpl>()
        .getPowt3winmcIvTById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt3winmcIvT(Powt3winmcIvTModel p3wmcIvttolocal) async {
    await sl<Powt3winmcIvTLocalDatasourceImpl>()
        .localPowt3winmcIvT(p3wmcIvttolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt3winmcIvT(int id) async {
    await sl<Powt3winmcIvTLocalDatasourceImpl>()
        .deletePowt3winmcIvTById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt3winmcIvT(Powt3winmcIvTModel p3wmcIvttoupdate, int id) async {
    await sl<Powt3winmcIvTLocalDatasourceImpl>()
        .updatePowt3winmcIvT(p3wmcIvttoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winmcIvtEquipmentList() async {
    _powt3winmcIvTloacaldataList = await sl<Powt3winmcIvTLocalDatasourceImpl>()
        .getpowt3winmcIvtEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
