// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/IT/it_r_local_datasource.dart';
import '../../../data/models/equipment/IT/it_r_model.dart';

class ItRProvider extends ChangeNotifier {
  List<ItRTestModel> _itRTrNoList = [];
  List<ItRTestModel> get itRTrNoList => _itRTrNoList;
  List<ItRTestModel> _itRSerialNoList = [];
  List<ItRTestModel> get itRSerialNoList => _itRSerialNoList;
  List<ItRTestModel> _itREquipmentList = [];
  List<ItRTestModel> get itREquipmentList => _itREquipmentList;
  ItRTestModel _itRModel;
  ItRTestModel get itRModel => _itRModel;

  String _error = 'ErroR';
  String get error => _error;

  void getItRByTrNo(int trNo) async {
    _itRTrNoList = await sl<ItRLocalDatasourceImpl>()
        .getItRByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getItRBySerialNo(String serialNo) async {
    _itRSerialNoList = await sl<ItRLocalDatasourceImpl>()
        .getItRBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getItRByID(int id) async {
    _itRModel = await sl<ItRLocalDatasourceImpl>()
        .getItRById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addItR(ItRTestModel itRTestModel) async {
    await sl<ItRLocalDatasourceImpl>()
        .localItR(itRTestModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteItR(int id) async {
    await sl<ItRLocalDatasourceImpl>()
        .deleteItRById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateItR(ItRTestModel itRToUpdate, int id) async {
    await sl<ItRLocalDatasourceImpl>()
        .updateItR(itRToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  // void getItREquipmentList() async {
  //   await sl<AppDatabase>().getItREquipmentList().onError((error, stackTrace) {
  //     error = error.toString();
  //   });
  //   notifyListeners();
  // }

  void getItREquipmentList() async {
    _itREquipmentList = await sl<ItRLocalDatasourceImpl>()
        .getItREquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
