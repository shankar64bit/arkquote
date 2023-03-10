// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import '../../../../../injection_container.dart';
import '../../../data/datasources/equipment/Power_transformer/powt_td_local_datasource.dart';
import '../../../data/models/equipment/powt/powt_td_model.dart';

class PowttdProvider extends ChangeNotifier {
  List<PowttdModel> _powttd_serialNoList = [];
  List<PowttdModel> get powttd_serialNoList => _powttd_serialNoList;

  List<PowttdModel> _powttd_localdataList = [];
  List<PowttdModel> get powttd_localdataList => _powttd_localdataList;

  PowttdModel _powttd_Model;
  PowttdModel get powttd_Model => _powttd_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowttdById(int id) async {
    _powttd_Model = await sl<PowttdLocalDatasourceImpl>()
        .getPowttdById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowttdBySerialNo(String serialNo) async {
    _powttd_serialNoList = await sl<PowttdLocalDatasourceImpl>()
        .getPowttdSerialNo(serialNo)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowttd(PowttdModel powttdtolocal) async {
    await sl<PowttdLocalDatasourceImpl>()
        .localPowttd(powttdtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowttd(int id) async {
    await sl<PowttdLocalDatasourceImpl>()
        .deletePowttdById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowttd(PowttdModel powttdtoupdate, int id) async {
    await sl<PowttdLocalDatasourceImpl>()
        .updatePowttd(powttdtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowttdEquipmentList() async {
    _powttd_localdataList = await sl<PowttdLocalDatasourceImpl>()
        .getPowttdEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
