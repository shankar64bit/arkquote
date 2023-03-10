import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/energy_meter/energy_meter_pfi_local_datasource.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_Pfi_test.dart';

class EnergyMeterPfiProvider extends ChangeNotifier {
  List<EnergyMeterPfiTestModel> _energymeterPfiTrNoList = [];
  List<EnergyMeterPfiTestModel> get energymeterPfiTrNoList =>
      _energymeterPfiTrNoList;
  List<EnergyMeterPfiTestModel> _energymeterPfiSerialNoList = [];
  List<EnergyMeterPfiTestModel> get energymeterPfiSerialNoList =>
      _energymeterPfiSerialNoList;
  List<EnergyMeterPfiTestModel> _energymeterPfiEquipmentList = [];
  List<EnergyMeterPfiTestModel> get energymeterPfiEquipmentList =>
      _energymeterPfiEquipmentList;
  EnergyMeterPfiTestModel _energymeterPfiModel;
  EnergyMeterPfiTestModel get energymeterPfiModel => _energymeterPfiModel;

  String _error = 'ErroR';
  String get error => _error;

  void getEnergyMeterPfiByTrNo(int trNo) async {
    _energymeterPfiTrNoList = await sl<EnergyMeterPfiLocalDatasourceImpl>()
        .getEnergyMeterPfiByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterPfiBySerialNo(String serialNo) async {
    _energymeterPfiSerialNoList = await sl<EnergyMeterPfiLocalDatasourceImpl>()
        .getEnergyMeterPfiBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterPfiByID(int id) async {
    _energymeterPfiModel = await sl<EnergyMeterPfiLocalDatasourceImpl>()
        .getEnergyMeterPfiById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addEnergyMeterPfi(EnergyMeterPfiTestModel empfitolocal) async {
    await sl<EnergyMeterPfiLocalDatasourceImpl>()
        .localEnergyMeterPfi(empfitolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteEnergyMeterPfi(int id) async {
    await sl<EnergyMeterPfiLocalDatasourceImpl>()
        .deleteEnergyMeterPfiById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateEnergyMeterPfi(
      EnergyMeterPfiTestModel empfitoupdate, int id) async {
    await sl<EnergyMeterPfiLocalDatasourceImpl>()
        .updateEnergyMeterPfi(empfitoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterPFIEquipmentList() async {
    _energymeterPfiEquipmentList = await sl<EnergyMeterPfiLocalDatasourceImpl>()
        .getEMPFIEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
