// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/Power_transformer/powt_local_datasource.dart';
import '../../../data/models/equipment/powt/powt_model.dart';

class PowtProvider extends ChangeNotifier {
  List<PowtModel> _powtTrnoList = [];
  List<PowtModel> get powtTrnoList => _powtTrnoList;
  List<PowtModel> _powtlocaldataList = [];
  List<PowtModel> get powtlocaldataList => _powtlocaldataList;
  List<PowtModel> _powtSerialNoList = [];
  List<PowtModel> get powtSerialNoList => _powtSerialNoList;
  PowtModel _powtModel;
  PowtModel get powtModel => _powtModel;

  String _error = 'ErroR';
  String get error => _error;

  void getPowtByTrNo(int trNo) async {
    _powtTrnoList = await sl<PowtLocalDatasourceImpl>()
        .getPowtByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowtBySerialNo(String sn) async {
    _powtSerialNoList = await sl<PowtLocalDatasourceImpl>()
        .getPowtBySerialNo(sn)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowtByID(int id) async {
    _powtModel = await sl<PowtLocalDatasourceImpl>()
        .getPowtById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt(PowtModel powttolocal, DateTime dateOfTesting) async {
    await sl<PowtLocalDatasourceImpl>()
        .localPowt(powttolocal, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt(int id) async {
    await sl<PowtLocalDatasourceImpl>()
        .deletePowtById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt(PowtModel powttoupdate, int id) async {
    await sl<PowtLocalDatasourceImpl>()
        .updatePowt(powttoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowtLocalData() async {
    _powtlocaldataList = await sl<PowtLocalDatasourceImpl>()
        .getPowtLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
