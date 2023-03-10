import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/energy_meter/energy_meter_ci_test.dart';

abstract class EnergyMeterCiLocalDatasource {
  Future<List<EnergyMeterCiTestModel>> getEnergyMeterCiByTrNo(int trNo);
  Future<List<EnergyMeterCiTestModel>> getEMciEquipmentLists();
  Future<List<EnergyMeterCiTestModel>> getEnergyMeterCiBySerialNo(
      String serilNo);
  Future<EnergyMeterCiTestModel> getEnergyMeterCiById(int id);
  Future<void> localEnergyMeterCi(EnergyMeterCiTestModel emcitolocal);
  Future<void> updateEnergyMeterCi(EnergyMeterCiTestModel emcitoupdate, int id);
  Future<int> deleteEnergyMeterCiById(int id);
}

@DataClassName('EnergyMeterCiLocalData')
class EnergyMeterCiLocalDatasourceImpl extends Table
    implements EnergyMeterCiLocalDatasource {
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
  Future<int> deleteEnergyMeterCiById(int id) {
    return (sl<AppDatabase>().deleteEnergyMeterCiById(id));
  }

  @override
  Future<EnergyMeterCiTestModel> getEnergyMeterCiById(int id) async {
    EnergyMeterCiLocalData tEnergyMeterCiData =
        await sl<AppDatabase>().getEnergyMeterCiLocalDataWithId(id);

    EnergyMeterCiTestModel tEnergyMeterCiTestModel = EnergyMeterCiTestModel(
        id: tEnergyMeterCiData.id,
        databaseID: tEnergyMeterCiData.databaseID,
        rr: tEnergyMeterCiData.rr,
        ra: tEnergyMeterCiData.ra,
        yr: tEnergyMeterCiData.yr,
        ya: tEnergyMeterCiData.ya,
        br: tEnergyMeterCiData.br,
        ba: tEnergyMeterCiData.ba,
        trNo: tEnergyMeterCiData.trNo,
        serialNo: tEnergyMeterCiData.serialNo,
        EquipmentType: tEnergyMeterCiData.EquipmentType,
        updateDate: tEnergyMeterCiData.lastUpdated);

    return tEnergyMeterCiTestModel;
  }

  @override
  Future<List<EnergyMeterCiTestModel>> getEnergyMeterCiByTrNo(int trNo) async {
    final tEnergyMeterCiData =
        await sl<AppDatabase>().getEnergyMeterCiLocalDataWithTrNo(trNo);
    List<EnergyMeterCiTestModel> tEnergyMeterCiTestModel =
        List<EnergyMeterCiTestModel>.empty(growable: true);
    for (var element in tEnergyMeterCiData) {
      tEnergyMeterCiTestModel.add(EnergyMeterCiTestModel(
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
    return tEnergyMeterCiTestModel;
  }

  @override
  Future<int> localEnergyMeterCi(EnergyMeterCiTestModel emcitolocal) {
    return (sl<AppDatabase>().createEnergyMeterCi(emcitolocal));
  }

  @override
  Future<void> updateEnergyMeterCi(
      EnergyMeterCiTestModel emcitoupdate, int id) async {
    sl<AppDatabase>().updateEnergyMeterCi(emcitoupdate, id);
  }

  @override
  Future<List<EnergyMeterCiTestModel>> getEnergyMeterCiBySerialNo(
      String serialNO) async {
    final tEnergyMeterCiData =
        await sl<AppDatabase>().getEnergyMeterCiLocalDataWithSerialNo(serialNO);
    List<EnergyMeterCiTestModel> tEnergyMeterCiTestModel =
        List<EnergyMeterCiTestModel>.empty(growable: true);
    for (var element in tEnergyMeterCiData) {
      tEnergyMeterCiTestModel.add(EnergyMeterCiTestModel(
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
    return tEnergyMeterCiTestModel;
  }

  @override
  Future<List<EnergyMeterCiTestModel>> getEMciEquipmentLists() async {
    final tEMciData = await sl<AppDatabase>().getEMciEquipmentListwithAll();
    List<EnergyMeterCiTestModel> tEMciTestModel =
        List<EnergyMeterCiTestModel>.empty(growable: true);
    for (var element in tEMciData) {
      tEMciTestModel.add(EnergyMeterCiTestModel(
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
    return tEMciTestModel;
  }
}
