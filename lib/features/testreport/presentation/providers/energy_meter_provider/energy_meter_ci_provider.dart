import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/energy_meter/energy_meter_ci_local_datasource.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_ci_test.dart';

class EnergyMeterCiProvider extends ChangeNotifier {
  List<EnergyMeterCiTestModel> _energymeterCiTrNoList = [];
  List<EnergyMeterCiTestModel> get energymeterCiTrNoList =>
      _energymeterCiTrNoList;
  List<EnergyMeterCiTestModel> _energymeterCiSerialNoList = [];
  List<EnergyMeterCiTestModel> get energymeterCiSerialNoList =>
      _energymeterCiSerialNoList;
  List<EnergyMeterCiTestModel> _energymeterCiEquipmentList = [];
  List<EnergyMeterCiTestModel> get energymeterCiEquipmentList =>
      _energymeterCiEquipmentList;
  EnergyMeterCiTestModel _energymeterCiModel;
  EnergyMeterCiTestModel get energymeterCiModel => _energymeterCiModel;

  String _error = 'ErroR';
  String get error => _error;

  void getEnergyMeterCiByTrNo(int trNo) async {
    _energymeterCiTrNoList = await sl<EnergyMeterCiLocalDatasourceImpl>()
        .getEnergyMeterCiByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterCiBySerialNo(String serialNo) async {
    _energymeterCiSerialNoList = await sl<EnergyMeterCiLocalDatasourceImpl>()
        .getEnergyMeterCiBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterCiByID(int id) async {
    _energymeterCiModel = await sl<EnergyMeterCiLocalDatasourceImpl>()
        .getEnergyMeterCiById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addEnergyMeterCi(EnergyMeterCiTestModel emcitolocal) async {
    await sl<EnergyMeterCiLocalDatasourceImpl>()
        .localEnergyMeterCi(emcitolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteEnergyMeterCi(int id) async {
    await sl<EnergyMeterCiLocalDatasourceImpl>()
        .deleteEnergyMeterCiById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateEnergyMeterCi(
      EnergyMeterCiTestModel emcitoupdate, int id) async {
    await sl<EnergyMeterCiLocalDatasourceImpl>()
        .updateEnergyMeterCi(emcitoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterCIEquipmentList() async {
    _energymeterCiEquipmentList = await sl<EnergyMeterCiLocalDatasourceImpl>()
        .getEMciEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
