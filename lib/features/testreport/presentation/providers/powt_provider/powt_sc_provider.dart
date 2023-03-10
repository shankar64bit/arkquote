// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt/powt_sc_model.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/Power_transformer/powt_sc_local_datasource.dart';

class Powtsc_Provider extends ChangeNotifier {
  List<PowtscModel> _powtsc_loacaldataList = [];
  List<PowtscModel> get powtsc_loacaldataList => _powtsc_loacaldataList;

  List<PowtscModel> _powtsc_trNoIDList = [];
  List<PowtscModel> get powtsc_trNoIDList => _powtsc_trNoIDList;

  List<PowtscModel> _powtsc_serialNoList = [];
  List<PowtscModel> get powtsc_serialNoList => _powtsc_serialNoList;

  PowtscModel _powtsc_Model;
  PowtscModel get powtsc_Model => _powtsc_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowtscBytrNoID(int trNo) async {
    _powtsc_trNoIDList = await sl<PowtscLocalDatasourceImpl>()
        .getPowtscTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowtscserialNo(String sNo) async {
    _powtsc_serialNoList = await sl<PowtscLocalDatasourceImpl>()
        .getPowtscSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowtscById(int id) async {
    _powtsc_Model = await sl<PowtscLocalDatasourceImpl>()
        .getPowtsc_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowtsc(PowtscModel powtsctolocal) async {
    await sl<PowtscLocalDatasourceImpl>()
        .localPowtsc(powtsctolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowtsc(int id) async {
    await sl<PowtscLocalDatasourceImpl>()
        .deletePowtscById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowtsc(PowtscModel powtsctoupdate, int id) async {
    await sl<PowtscLocalDatasourceImpl>()
        .updatePowtsc(powtsctoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowtscEquipmentList() async {
    _powtsc_loacaldataList = await sl<PowtscLocalDatasourceImpl>()
        .getpowtscEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
