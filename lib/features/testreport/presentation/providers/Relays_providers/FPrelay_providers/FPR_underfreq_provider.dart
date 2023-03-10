// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../../data/datasources/equipment/Relays/FPrelay/FPR_underfreq_local_datasource.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_underfreq_model.dart';

class FPRunderfreqProvider extends ChangeNotifier {
  List<FPRunderfreqModel> _fprunderfreq_loacaldataList = [];
  List<FPRunderfreqModel> get fprunderfreq_loacaldataList =>
      _fprunderfreq_loacaldataList;

  List<FPRunderfreqModel> _fprunderfreq_trNoIDList = [];
  List<FPRunderfreqModel> get fprunderfreq_trNoIDList =>
      _fprunderfreq_trNoIDList;

  List<FPRunderfreqModel> _fprunderfreq_serialNoList = [];
  List<FPRunderfreqModel> get fprunderfreq_serialNoList =>
      _fprunderfreq_serialNoList;

  FPRunderfreqModel _fprunderfreq_Model;
  FPRunderfreqModel get fprunderfreq_Model => _fprunderfreq_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getFPRunderfreqtrNoID(int trNo) async {
    _fprunderfreq_trNoIDList = await sl<FPRunderfreqLocalDatasourceImpl>()
        .getFPRunderfreqTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRunderfreqserialNo(String sNo) async {
    _fprunderfreq_serialNoList = await sl<FPRunderfreqLocalDatasourceImpl>()
        .getFPRunderfreqSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRunderfreqById(int id) async {
    _fprunderfreq_Model = await sl<FPRunderfreqLocalDatasourceImpl>()
        .getFPRunderfreqById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addFPRunderfreq(FPRunderfreqModel fprunderfreqtoLocal) async {
    await sl<FPRunderfreqLocalDatasourceImpl>()
        .localFPRunderfreq(fprunderfreqtoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteFPRunderfreq(int id) async {
    await sl<FPRunderfreqLocalDatasourceImpl>()
        .deleteFPRunderfreqById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateFPRunderfreq(FPRunderfreqModel fprunderfreqUpdate, int id) async {
    await sl<FPRunderfreqLocalDatasourceImpl>()
        .updateFPRunderfreq(fprunderfreqUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getFPRunderfreqEquipmentList() async {
    _fprunderfreq_loacaldataList = await sl<FPRunderfreqLocalDatasourceImpl>()
        .getFPRunderfreqEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
