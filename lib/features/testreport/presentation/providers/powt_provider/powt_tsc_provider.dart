// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/Power_transformer/powt_tsc_local_datasource.dart';
import '../../../data/models/equipment/powt/powt_tsc_model.dart';

class PowttscProvider extends ChangeNotifier {
  List<PowttscModel> _powttsc_loacaldataList = [];
  List<PowttscModel> get powttsc_loacaldataList => _powttsc_loacaldataList;

  List<PowttscModel> _powttsc_trNoIDList = [];
  List<PowttscModel> get powttsc_trNoIDList => _powttsc_trNoIDList;

  List<PowttscModel> _powttsc_serialNoList = [];
  List<PowttscModel> get powttsc_serialNoList => _powttsc_serialNoList;

  PowttscModel _powttsc_Model;
  PowttscModel get powttsc_Model => _powttsc_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowttscBytrNoID(int trNo) async {
    _powttsc_trNoIDList = await sl<PowttscLocalDatasourceImpl>()
        .getPowttscTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowttscserialNo(String sNo) async {
    _powttsc_serialNoList = await sl<PowttscLocalDatasourceImpl>()
        .getPowttscSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowttscById(int id) async {
    _powttsc_Model = await sl<PowttscLocalDatasourceImpl>()
        .getPowttsc_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowttsc(PowttscModel powttsctolocal) async {
    await sl<PowttscLocalDatasourceImpl>()
        .localPowttsc(powttsctolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowttsc(int id) async {
    await sl<PowttscLocalDatasourceImpl>()
        .deletePowttscById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowttsc(PowttscModel powttsctoupdate, int id) async {
    await sl<PowttscLocalDatasourceImpl>()
        .updatePowttsc(powttsctoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowttscEquipmentList() async {
    _powttsc_loacaldataList = await sl<PowttscLocalDatasourceImpl>()
        .getPowttscEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
