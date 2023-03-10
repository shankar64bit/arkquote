// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/powt_3_winding/powt3win_schvlv_local_datasource.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_schvlv_model.dart';

class Powt3winschvlvProvider extends ChangeNotifier {
  List<Powt3winschvlvModel> _powt3winschvlvloacaldataList = [];
  List<Powt3winschvlvModel> get powt3winschvlvloacaldataList =>
      _powt3winschvlvloacaldataList;

  List<Powt3winschvlvModel> _powt3winschvlvtrNoIDList = [];
  List<Powt3winschvlvModel> get powt3winschvlvtrNoIDList =>
      _powt3winschvlvtrNoIDList;

  List<Powt3winschvlvModel> _powt3winschvlvserialNoList = [];
  List<Powt3winschvlvModel> get powt3winschvlvserialNoList =>
      _powt3winschvlvserialNoList;

  Powt3winschvlvModel _powt3winschvlvModel;
  Powt3winschvlvModel get powt3winschvlvModel => _powt3winschvlvModel;

  String _error = 'ErroR';
  String get error => _error;

  void getPowt3winschvlvBytrNoID(int trNo) async {
    _powt3winschvlvtrNoIDList = await sl<Powt3winschvlvLocalDatasourceImpl>()
        .getPowt3winschvlvTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winschvlvserialNo(String sNo) async {
    _powt3winschvlvserialNoList = await sl<Powt3winschvlvLocalDatasourceImpl>()
        .getPowt3winschvlvSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winschvlvById(int id) async {
    _powt3winschvlvModel = await sl<Powt3winschvlvLocalDatasourceImpl>()
        .getPowt3winschvlvById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt3winschvlv(Powt3winschvlvModel p3wschvlvtolocal) async {
    await sl<Powt3winschvlvLocalDatasourceImpl>()
        .localPowt3winschvlv(p3wschvlvtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt3winschvlv(int id) async {
    await sl<Powt3winschvlvLocalDatasourceImpl>()
        .deletePowt3winschvlvById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt3winschvlv(
      Powt3winschvlvModel p3wschvlvtoupdate, int id) async {
    await sl<Powt3winschvlvLocalDatasourceImpl>()
        .updatePowt3winschvlv(p3wschvlvtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winschvlvEquipmentList() async {
    _powt3winschvlvloacaldataList =
        await sl<Powt3winschvlvLocalDatasourceImpl>()
            .getpowt3winschvlvEquipmentLists()
            .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
