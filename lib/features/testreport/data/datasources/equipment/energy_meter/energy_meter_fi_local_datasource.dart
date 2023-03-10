import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/energy_meter/energy_meter_Fi_test.dart';

abstract class EnergyMeterFiLocalDatasource {
  Future<List<EnergyMeterFiTestModel>> getEnergyMeterFiByTrNo(int trNo);
  Future<List<EnergyMeterFiTestModel>> getEMfiEquipmentLists();
  Future<List<EnergyMeterFiTestModel>> getEnergyMeterFiBySerialNo(
      String serilNo);
  Future<EnergyMeterFiTestModel> getEnergyMeterFiById(int id);
  Future<void> localEnergyMeterFi(EnergyMeterFiTestModel energyMeterFiToLocal);
  Future<void> updateEnergyMeterFi(
      EnergyMeterFiTestModel energyMeterFiToUpdate, int id);
  Future<int> deleteEnergyMeterFiById(int id);
}

@DataClassName('EnergyMeterFiLocalData')
class EnergyMeterFiLocalDatasourceImpl extends Table
    implements EnergyMeterFiLocalDatasource {
  @required
  DateTimeColumn get lastUpdated =>
      dateTime().withDefault(Constant(DateTime.now()))();
  @required
  TextColumn get EquipmentType => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();

  @required
  RealColumn get yr => real()();
  @required
  RealColumn get ya => real()();
  @required
  RealColumn get br => real()();
  @required
  RealColumn get ba => real()();
  @required
  RealColumn get rr => real()();
  @required
  RealColumn get ra => real()();

  @override
  Future<int> deleteEnergyMeterFiById(int id) {
    return (sl<AppDatabase>().deleteEnergyMeterFiById(id));
  }

  @override
  Future<EnergyMeterFiTestModel> getEnergyMeterFiById(int id) async {
    EnergyMeterFiLocalData tEnergyMeterFiData =
        await sl<AppDatabase>().getEnergyMeterFiLocalDataWithId(id);

    EnergyMeterFiTestModel tEnergyMeterFiTestModel = EnergyMeterFiTestModel(
      id: tEnergyMeterFiData.id,
      databaseID: tEnergyMeterFiData.databaseID,
      rr: tEnergyMeterFiData.rr,
      ra: tEnergyMeterFiData.ra,
      yr: tEnergyMeterFiData.yr,
      ya: tEnergyMeterFiData.ya,
      br: tEnergyMeterFiData.br,
      ba: tEnergyMeterFiData.ba,
      trNo: tEnergyMeterFiData.trNo,
      serialNo: tEnergyMeterFiData.serialNo,
      EquipmentType: tEnergyMeterFiData.EquipmentType,
      updateDate: tEnergyMeterFiData.lastUpdated,
    );

    return tEnergyMeterFiTestModel;
  }

  @override
  Future<List<EnergyMeterFiTestModel>> getEnergyMeterFiByTrNo(int trNo) async {
    final tEnergyMeterFiData =
        await sl<AppDatabase>().getEnergyMeterFiLocalDataWithTrNo(trNo);
    List<EnergyMeterFiTestModel> tEnergyMeterFiTestModel =
        List<EnergyMeterFiTestModel>.empty(growable: true);
    for (var element in tEnergyMeterFiData) {
      tEnergyMeterFiTestModel.add(EnergyMeterFiTestModel(
          id: element.id,
          databaseID: element.databaseID,
          rr: element.rr,
          ra: element.ra,
          yr: element.yr,
          ya: element.ya,
          br: element.br,
          ba: element.ba,
          trNo: element.trNo,
          serialNo: element.serialNo,
          EquipmentType: element.EquipmentType,
          updateDate: element.lastUpdated));
    }
    return tEnergyMeterFiTestModel;
  }

  @override
  Future<int> localEnergyMeterFi(EnergyMeterFiTestModel energyMeterFiToLocal) {
    return (sl<AppDatabase>().createEnergyMeterFi(energyMeterFiToLocal));
  }

  @override
  Future<void> updateEnergyMeterFi(
      EnergyMeterFiTestModel EnergyMeterFiToUpdate, int id) async {
    sl<AppDatabase>().updateEnergyMeterFi(EnergyMeterFiToUpdate, id);
  }

  @override
  Future<List<EnergyMeterFiTestModel>> getEnergyMeterFiBySerialNo(
      String serialNO) async {
    final tEnergyMeterFiData =
        await sl<AppDatabase>().getEnergyMeterFiLocalDataWithSerialNo(serialNO);
    List<EnergyMeterFiTestModel> tEnergyMeterFiTestModel =
        List<EnergyMeterFiTestModel>.empty(growable: true);
    for (var element in tEnergyMeterFiData) {
      tEnergyMeterFiTestModel.add(EnergyMeterFiTestModel(
        id: element.id,
        databaseID: element.databaseID,
        rr: element.rr,
        ra: element.ra,
        yr: element.yr,
        ya: element.ya,
        br: element.br,
        ba: element.ba,
        trNo: element.trNo,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
      ));
    }
    return tEnergyMeterFiTestModel;
  }

  @override
  Future<List<EnergyMeterFiTestModel>> getEMfiEquipmentLists() async {
    final temfiData = await sl<AppDatabase>().getEMfiEquipmentListwithAll();
    List<EnergyMeterFiTestModel> temfiTestModel =
        List<EnergyMeterFiTestModel>.empty(growable: true);
    for (var element in temfiData) {
      temfiTestModel.add(EnergyMeterFiTestModel(
        id: element.id,
        databaseID: element.databaseID,
        rr: element.rr,
        ra: element.ra,
        yr: element.yr,
        ya: element.ya,
        br: element.br,
        ba: element.ba,
        trNo: element.trNo,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        updateDate: element.lastUpdated,
      ));
    }
    return temfiTestModel;
  }
}
