// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/AuxiliaryRelay/AR_pudo_local_datasource.dart';
import '../../../../data/models/equipment/Relays/AuxiliaryRelay/AR_pudo_model.dart';
// import '../../../../data/datasources/equipment/Relays/FPrelay/FPR_currentMgmt_local_datasource.dart';
// import '../../../../data/models/equipment/Relays/FPrelay/FPR_currentMgmt_model.dart';

class ARpudoProvider extends ChangeNotifier {
  List<ARpudoModel> _arpudo_loacaldataList = [];
  List<ARpudoModel> get arpudo_loacaldataList => _arpudo_loacaldataList;

  List<ARpudoModel> _arpudo_trNoIDList = [];
  List<ARpudoModel> get arpudo_trNoIDList => _arpudo_trNoIDList;

  List<ARpudoModel> _arpudo_serialNoList = [];
  List<ARpudoModel> get arpudo_serialNoList => _arpudo_serialNoList;

  ARpudoModel _arpudo_Model;
  ARpudoModel get arpudo_Model => _arpudo_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getARpudotrNoID(int trNo) async {
    _arpudo_trNoIDList = await sl<ARpudoLocalDatasourceImpl>()
        .getARpudoTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getARpudoserialNo(String sNo) async {
    _arpudo_serialNoList = await sl<ARpudoLocalDatasourceImpl>()
        .getARpudoSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getARpudoById(int id) async {
    _arpudo_Model = await sl<ARpudoLocalDatasourceImpl>()
        .getARpudoById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addARpudo(ARpudoModel arpudotoLocal) async {
    await sl<ARpudoLocalDatasourceImpl>()
        .localARpudo(arpudotoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteARpudo(int id) async {
    await sl<ARpudoLocalDatasourceImpl>()
        .deleteARpudoById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateARpudo(ARpudoModel arpudoUpdate, int id) async {
    await sl<ARpudoLocalDatasourceImpl>()
        .updateARpudo(arpudoUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getARpudoEquipmentList() async {
    _arpudo_loacaldataList = await sl<ARpudoLocalDatasourceImpl>()
        .getARpudoEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
