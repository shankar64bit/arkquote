import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/energy_meter/energy_meter_ap_local_datasource.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_ap_test.dart';

class EnergyMeterApProvider extends ChangeNotifier {
  List<EnergyMeterApTestModel> _energymeterApTrNoList = [];
  List<EnergyMeterApTestModel> get energymeterApTrNoList =>
      _energymeterApTrNoList;
  List<EnergyMeterApTestModel> _energymeterApSerialNoList = [];
  List<EnergyMeterApTestModel> get energymeterApSerialNoList =>
      _energymeterApSerialNoList;
  List<EnergyMeterApTestModel> _energymeterApEquipmentList = [];
  List<EnergyMeterApTestModel> get energymeterApEquipmentList =>
      _energymeterApEquipmentList;
  EnergyMeterApTestModel _energymeterApModel;
  EnergyMeterApTestModel get energymeterApModel => _energymeterApModel;

  String _error = 'ErroR';
  String get error => _error;

  void getEnergyMeterApByTrNo(int trNo) async {
    _energymeterApTrNoList = await sl<EnergyMeterApLocalDatasourceImpl>()
        .getEnergyMeterApByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterApBySerialNo(String serialNo) async {
    _energymeterApSerialNoList = await sl<EnergyMeterApLocalDatasourceImpl>()
        .getEnergyMeterApBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterApByID(int id) async {
    _energymeterApModel = await sl<EnergyMeterApLocalDatasourceImpl>()
        .getEnergyMeterApById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addEnergyMeterAp(EnergyMeterApTestModel emaptolocal) async {
    await sl<EnergyMeterApLocalDatasourceImpl>()
        .localEnergyMeterAp(emaptolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteEnergyMeterAp(int id) async {
    await sl<EnergyMeterApLocalDatasourceImpl>()
        .deleteEnergyMeterApById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateEnergyMeterAp(EnergyMeterApTestModel emaptoupdate, int id) async {
    await sl<EnergyMeterApLocalDatasourceImpl>()
        .updateEnergyMeterAp(emaptoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterAPEquipmentList() async {
    _energymeterApEquipmentList = await sl<EnergyMeterApLocalDatasourceImpl>()
        .getEMAPEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
