// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/Power_transformer/powt_bNamePlate_local_datasource.dart';
import '../../../data/models/equipment/powt/powt_bNamePlate_model.dart';

class PowtbNamePlateProvider extends ChangeNotifier {
  List<PowtbNamePlateModel> _powtbNamePlate_loacaldataList = [];
  List<PowtbNamePlateModel> get powtbNamePlate_loacaldataList =>
      _powtbNamePlate_loacaldataList;

  List<PowtbNamePlateModel> _powtbNamePlate_trNoIDList = [];
  List<PowtbNamePlateModel> get powtbNamePlate_trNoIDList =>
      _powtbNamePlate_trNoIDList;

  List<PowtbNamePlateModel> _powtbNamePlate_serialNoList = [];
  List<PowtbNamePlateModel> get powtbNamePlate_serialNoList =>
      _powtbNamePlate_serialNoList;

  PowtbNamePlateModel _powtbNamePlate_Model;
  PowtbNamePlateModel get powtbNamePlate_Model => _powtbNamePlate_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowtbNamePLateBytrNoID(int trNo) async {
    _powtbNamePlate_trNoIDList = await sl<PowtbNamePlateLocalDatasourceImpl>()
        .getPowtbNamePlateTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowtbNamePlateserialNo(String serialNo) async {
    _powtbNamePlate_serialNoList = await sl<PowtbNamePlateLocalDatasourceImpl>()
        .getPowtbNamePlateSerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowtbNamePlateById(int id) async {
    _powtbNamePlate_Model = await sl<PowtbNamePlateLocalDatasourceImpl>()
        .getPowtbNamePlate_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowtwrHv(PowtbNamePlateModel powtbnameplatetolocal) async {
    await sl<PowtbNamePlateLocalDatasourceImpl>()
        .localPowtbNamePlate(powtbnameplatetolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowtbNamePlate(int id) async {
    await sl<PowtbNamePlateLocalDatasourceImpl>()
        .deletePowtbNamePlateById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowtbNamePlate(
      PowtbNamePlateModel powtbnameplatetoupdate, int id) async {
    await sl<PowtbNamePlateLocalDatasourceImpl>()
        .updatePowtbNamePlate(powtbnameplatetoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowtbNameplateEquipmentList() async {
    _powtbNamePlate_loacaldataList =
        await sl<PowtbNamePlateLocalDatasourceImpl>()
            .getPowtbnameplateEquipmentLists()
            .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
