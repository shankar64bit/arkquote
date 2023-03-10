// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/energy_meter/energy_meter_local_datasource.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_model.dart';

class EnergyMeterProvider extends ChangeNotifier {
  List<EnergyMeterModel> _energymeterTrnoList = [];
  List<EnergyMeterModel> get energymeterTrnoList => _energymeterTrnoList;
  List<EnergyMeterModel> _emloacaldataList = [];
  List<EnergyMeterModel> get emloacaldataList => _emloacaldataList;
  EnergyMeterModel _energymeterModel;
  EnergyMeterModel get energymeterModel => _energymeterModel;

  String _error = 'ErroR';
  String get error => _error;

  void getEnergyMeterByTrNo(int trNo) async {
    _energymeterTrnoList = await sl<EnergyMeterLocalDatasourceImpl>()
        .getEnergyMeterByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEnergyMeterByID(int id) async {
    _energymeterModel = await sl<EnergyMeterLocalDatasourceImpl>()
        .getEnergyMeterById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addEnergyMeter(
      EnergyMeterModel emtolocal, DateTime dateOfTesting) async {
    await sl<EnergyMeterLocalDatasourceImpl>()
        .localEnergyMeter(emtolocal, dateOfTesting)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteEnergyMeter(int id) async {
    await sl<EnergyMeterLocalDatasourceImpl>()
        .deleteEnergyMeterById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateEnergyMeter(EnergyMeterModel emtoupdate, int id) async {
    await sl<EnergyMeterLocalDatasourceImpl>()
        .updateEnergyMeter(emtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getEMLocalData() async {
    _emloacaldataList = await sl<EnergyMeterLocalDatasourceImpl>()
        .getEMLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
