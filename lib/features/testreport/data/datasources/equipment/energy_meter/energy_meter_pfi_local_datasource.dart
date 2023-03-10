import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/energy_meter/energy_meter_Pfi_test.dart';

abstract class EnergyMeterPfiLocalDatasource {
  Future<List<EnergyMeterPfiTestModel>> getEnergyMeterPfiByTrNo(int trNo);
  Future<List<EnergyMeterPfiTestModel>> getEMPFIEquipmentLists();
  Future<List<EnergyMeterPfiTestModel>> getEnergyMeterPfiBySerialNo(
      String serilNo);
  Future<EnergyMeterPfiTestModel> getEnergyMeterPfiById(int id);
  Future<void> localEnergyMeterPfi(EnergyMeterPfiTestModel empfitolocal);
  Future<void> updateEnergyMeterPfi(
      EnergyMeterPfiTestModel empfitoupdate, int id);
  Future<int> deleteEnergyMeterPfiById(int id);
}

@DataClassName('EnergyMeterPfiLocalData')
class EnergyMeterPfiLocalDatasourceImpl extends Table
    implements EnergyMeterPfiLocalDatasource {
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
  Future<int> deleteEnergyMeterPfiById(int id) {
    return (sl<AppDatabase>().deleteEnergyMeterPfiById(id));
  }

  @override
  Future<EnergyMeterPfiTestModel> getEnergyMeterPfiById(int id) async {
    EnergyMeterPfiLocalData tEnergyMeterPfiData =
        await sl<AppDatabase>().getEnergyMeterPfiLocalDataWithId(id);

    EnergyMeterPfiTestModel tEnergyMeterPfiTestModel = EnergyMeterPfiTestModel(
        id: tEnergyMeterPfiData.id,
        databaseID: tEnergyMeterPfiData.databaseID,
        rr: tEnergyMeterPfiData.rr,
        ra: tEnergyMeterPfiData.ra,
        yr: tEnergyMeterPfiData.yr,
        ya: tEnergyMeterPfiData.ya,
        br: tEnergyMeterPfiData.br,
        ba: tEnergyMeterPfiData.ba,
        trNo: tEnergyMeterPfiData.trNo,
        serialNo: tEnergyMeterPfiData.serialNo,
        EquipmentType: tEnergyMeterPfiData.EquipmentType,
        updateDate: tEnergyMeterPfiData.lastUpdated);

    return tEnergyMeterPfiTestModel;
  }

  @override
  Future<List<EnergyMeterPfiTestModel>> getEnergyMeterPfiByTrNo(
      int trNo) async {
    final tEnergyMeterPfiData =
        await sl<AppDatabase>().getEnergyMeterPfiLocalDataWithTrNo(trNo);
    List<EnergyMeterPfiTestModel> tEnergyMeterPfiTestModel =
        List<EnergyMeterPfiTestModel>.empty(growable: true);
    for (var element in tEnergyMeterPfiData) {
      tEnergyMeterPfiTestModel.add(EnergyMeterPfiTestModel(
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
    return tEnergyMeterPfiTestModel;
  }

  @override
  Future<int> localEnergyMeterPfi(EnergyMeterPfiTestModel empfitolocal) {
    return (sl<AppDatabase>().createEnergyMeterPfi(empfitolocal));
  }

  @override
  Future<void> updateEnergyMeterPfi(
      EnergyMeterPfiTestModel empfitoupdate, int id) async {
    sl<AppDatabase>().updateEnergyMeterPfi(empfitoupdate, id);
  }

  @override
  Future<List<EnergyMeterPfiTestModel>> getEnergyMeterPfiBySerialNo(
      String serialNO) async {
    final tEnergyMeterPfiData = await sl<AppDatabase>()
        .getEnergyMeterPfiLocalDataWithSerialNo(serialNO);
    List<EnergyMeterPfiTestModel> tEnergyMeterPfiTestModel =
        List<EnergyMeterPfiTestModel>.empty(growable: true);
    for (var element in tEnergyMeterPfiData) {
      tEnergyMeterPfiTestModel.add(EnergyMeterPfiTestModel(
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
    return tEnergyMeterPfiTestModel;
  }

  @override
  Future<List<EnergyMeterPfiTestModel>> getEMPFIEquipmentLists() async {
    final tempfiData = await sl<AppDatabase>().getEMPFIEquipmentListwithAll();
    List<EnergyMeterPfiTestModel> tempfiTestModel =
        List<EnergyMeterPfiTestModel>.empty(growable: true);
    for (var element in tempfiData) {
      tempfiTestModel.add(EnergyMeterPfiTestModel(
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
    return tempfiTestModel;
  }
}
