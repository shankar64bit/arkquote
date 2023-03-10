// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/FPrelay/FPR_overcurrent_local_datasource.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_overcurrent_model.dart';

class FPRovercurrentProvider extends ChangeNotifier {
  List<FPRovercurrentModel> _fprovercurrent_loacaldataList = [];
  List<FPRovercurrentModel> get fprovercurrent_loacaldataList =>
      _fprovercurrent_loacaldataList;

  List<FPRovercurrentModel> _fprovercurrent_trNoIDList = [];
  List<FPRovercurrentModel> get fprovercurrent_trNoIDList =>
      _fprovercurrent_trNoIDList;

  List<FPRovercurrentModel> _fprovercurrent_serialNoList = [];
  List<FPRovercurrentModel> get fprovercurrent_serialNoList =>
      _fprovercurrent_serialNoList;

  FPRovercurrentModel _fprovercurrent_Model;
  FPRovercurrentModel get fprovercurrent_Model => _fprovercurrent_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getFPRovercurrenttrNoID(int trNo) async {
    _fprovercurrent_trNoIDList = await sl<FPRovercurrentLocalDatasourceImpl>()
        .getFPRovercurrentTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRovercurrentserialNo(String sNo) async {
    _fprovercurrent_serialNoList = await sl<FPRovercurrentLocalDatasourceImpl>()
        .getFPRovercurrentSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRovercurrentById(int id) async {
    _fprovercurrent_Model = await sl<FPRovercurrentLocalDatasourceImpl>()
        .getFPRovercurrentById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addFPRovercurrent(FPRovercurrentModel fprovercurrenttoLocal) async {
    await sl<FPRovercurrentLocalDatasourceImpl>()
        .localFPRovercurrent(fprovercurrenttoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteFPRovercurrent(int id) async {
    await sl<FPRovercurrentLocalDatasourceImpl>()
        .deleteFPRovercurrentById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateFPRovercurrent(
      FPRovercurrentModel fprovercurrentUpdate, int id) async {
    await sl<FPRovercurrentLocalDatasourceImpl>()
        .updateFPRovercurrent(fprovercurrentUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getFPRovercurrEquipmentList() async {
    _fprovercurrent_loacaldataList =
        await sl<FPRovercurrentLocalDatasourceImpl>()
            .getFPRovercurrEquipmentLists()
            .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
