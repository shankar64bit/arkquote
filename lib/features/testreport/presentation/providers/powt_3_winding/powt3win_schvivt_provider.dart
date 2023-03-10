// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/powt_3_winding/powt3win_schvivt_local_datasource.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_schvivt_model.dart';

class Powt3winschvivtProvider extends ChangeNotifier {
  List<Powt3winschvivtModel> _powt3winschvivtloacaldataList = [];
  List<Powt3winschvivtModel> get powt3winschvivtloacaldataList =>
      _powt3winschvivtloacaldataList;

  List<Powt3winschvivtModel> _powt3winschvivttrNoIDList = [];
  List<Powt3winschvivtModel> get powt3winschvivttrNoIDList =>
      _powt3winschvivttrNoIDList;

  List<Powt3winschvivtModel> _powt3winschvivtserialNoList = [];
  List<Powt3winschvivtModel> get powt3winschvivtserialNoList =>
      _powt3winschvivtserialNoList;

  Powt3winschvivtModel _powt3winschvivtModel;
  Powt3winschvivtModel get powt3winschvivtModel => _powt3winschvivtModel;

  String _error = 'ErroR';
  String get error => _error;

  void getPowt3winschvivtBytrNoID(int trNo) async {
    _powt3winschvivttrNoIDList = await sl<Powt3winschvivtLocalDatasourceImpl>()
        .getPowt3winschvivtTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winschvivtserialNo(String sNo) async {
    _powt3winschvivtserialNoList =
        await sl<Powt3winschvivtLocalDatasourceImpl>()
            .getPowt3winschvivtSerialNo(sNo)
            .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winschvivtById(int id) async {
    _powt3winschvivtModel = await sl<Powt3winschvivtLocalDatasourceImpl>()
        .getPowt3winschvivtById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt3winschvivt(Powt3winschvivtModel p3wschvivttolocal) async {
    await sl<Powt3winschvivtLocalDatasourceImpl>()
        .localPowt3winschvivt(p3wschvivttolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt3winschvivt(int id) async {
    await sl<Powt3winschvivtLocalDatasourceImpl>()
        .deletePowt3winschvivtById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt3winschvivt(
      Powt3winschvivtModel p3wschvivttoupdate, int id) async {
    await sl<Powt3winschvivtLocalDatasourceImpl>()
        .updatePowt3winschvivt(p3wschvivttoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winschvivtEquipmentList() async {
    _powt3winschvivtloacaldataList =
        await sl<Powt3winschvivtLocalDatasourceImpl>()
            .getpowt3winschvivtEquipmentLists()
            .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
