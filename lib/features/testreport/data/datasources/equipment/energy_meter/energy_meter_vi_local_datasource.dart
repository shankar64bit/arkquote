import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/energy_meter/energy_meter_vi_test_model.dart';

abstract class EnergyMeterViLocalDatasource {
  Future<List<EnergyMeterViTestModel>> getEnergyMeterViByTrNo(int trNo);
  Future<List<EnergyMeterViTestModel>> getEnergyMeterEquipmentLists();
  Future<List<EnergyMeterViTestModel>> getEnergyMeterViBySerialNo(
      String serilNo);
  Future<EnergyMeterViTestModel> getEnergyMeterViById(int id);
  Future<void> localEnergyMeterVi(EnergyMeterViTestModel emvitolocal);
  Future<void> updateEnergyMeterVi(EnergyMeterViTestModel emvitoupdate, int id);
  Future<int> deleteEnergyMeterViById(int id);
}

@DataClassName('EnergyMeterViLocalData')
class EnergyMeterViLocalDatasourceImpl extends Table
    implements EnergyMeterViLocalDatasource {
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
  Future<int> deleteEnergyMeterViById(int id) {
    return (sl<AppDatabase>().deleteEnergyMeterViById(id));
  }

  @override
  Future<EnergyMeterViTestModel> getEnergyMeterViById(int id) async {
    EnergyMeterViLocalData tEnergyMeterViData =
        await sl<AppDatabase>().getEnergyMeterViLocalDataWithId(id);

    EnergyMeterViTestModel tEnergyMeterViTestModel = EnergyMeterViTestModel(
        id: tEnergyMeterViData.id,
        databaseID: tEnergyMeterViData.databaseID,
        rr: tEnergyMeterViData.rr,
        ra: tEnergyMeterViData.ra,
        yr: tEnergyMeterViData.yr,
        ya: tEnergyMeterViData.ya,
        br: tEnergyMeterViData.br,
        ba: tEnergyMeterViData.ba,
        trNo: tEnergyMeterViData.trNo,
        serialNo: tEnergyMeterViData.serialNo,
        EquipmentType: tEnergyMeterViData.EquipmentType,
        updateDate: tEnergyMeterViData.lastUpdated);

    return tEnergyMeterViTestModel;
  }

  @override
  Future<List<EnergyMeterViTestModel>> getEnergyMeterViByTrNo(int trNo) async {
    final tEnergyMeterViData =
        await sl<AppDatabase>().getEnergyMeterViLocalDataWithTrNo(trNo);
    List<EnergyMeterViTestModel> tEnergyMeterViTestModel =
        List<EnergyMeterViTestModel>.empty(growable: true);
    for (var element in tEnergyMeterViData) {
      tEnergyMeterViTestModel.add(EnergyMeterViTestModel(
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
    return tEnergyMeterViTestModel;
  }

  @override
  Future<int> localEnergyMeterVi(EnergyMeterViTestModel emvitolocal) {
    return (sl<AppDatabase>().createEnergyMeterVi(emvitolocal));
  }

  @override
  Future<void> updateEnergyMeterVi(
      EnergyMeterViTestModel emvitoupdate, int id) async {
    sl<AppDatabase>().updateEnergyMeterVi(emvitoupdate, id);
  }

  @override
  Future<List<EnergyMeterViTestModel>> getEnergyMeterViBySerialNo(
      String serialNO) async {
    final tEnergyMeterViData =
        await sl<AppDatabase>().getEnergyMeterViLocalDataWithSerialNo(serialNO);
    List<EnergyMeterViTestModel> tEnergyMeterViTestModel =
        List<EnergyMeterViTestModel>.empty(growable: true);
    for (var element in tEnergyMeterViData) {
      tEnergyMeterViTestModel.add(EnergyMeterViTestModel(
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
    return tEnergyMeterViTestModel;
  }

  @override
  Future<List<EnergyMeterViTestModel>> getEnergyMeterEquipmentLists() async {
    final tEMData =
        await sl<AppDatabase>().getEnergyMeterEquipmentListwithAll();
    List<EnergyMeterViTestModel> tEMTestModel =
        List<EnergyMeterViTestModel>.empty(growable: true);
    for (var element in tEMData) {
      tEMTestModel.add(EnergyMeterViTestModel(
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
    return tEMTestModel;
  }
}
