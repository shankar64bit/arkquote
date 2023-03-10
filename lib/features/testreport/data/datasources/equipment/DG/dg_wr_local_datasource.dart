import 'dart:math';

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/DG/dg_wr_test_model.dart';
import '../../test_report_local_datasource.dart';

abstract class DgWrLocalDatasource {
  Future<List<DgWrTestModel>> getDgWrByTrNo(int trNo);
  Future<DgWrTestModel> getDgWrById(int id);
  Future<void> localDgWr(DgWrTestModel dgWrToLocal);
  Future<void> updateDgWr(DgWrTestModel dgWrToUpdate, int id);
  Future<int> deleteDgWrById(int id);
  Future<List<DgWrTestModel>> getDgWrBySerialNo(String serialNo);
  Future<List<DgWrTestModel>> getDgWrEquipmentList();
  // Future<List<DgWrTestModel>> getTestedById(int id);
}

@DataClassName('DgWrLocalData')
class DgWrLocalDatasourceImpl extends Table implements DgWrLocalDatasource {
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
  RealColumn get uv => real()();
  @required
  RealColumn get vw => real()();
  @required
  RealColumn get wu => real()();

  // @override
  Future<DgWrTestModel> getDgWrById(int id) async {
    DgWrLocalData tDgWrData =
        await sl<AppDatabase>().getDgWrLocalDataWithId(id);

    DgWrTestModel tDgWrTestModel = DgWrTestModel(
      databaseID: tDgWrData.databaseID,
      id: tDgWrData.id,
      uv: tDgWrData.uv,
      vw: tDgWrData.vw,
      wu: tDgWrData.wu,
      trNo: tDgWrData.trNo,
      serialNo: tDgWrData.serialNo,
      EquipmentType: tDgWrData.EquipmentType,
      lastUpdated: tDgWrData.lastUpdated,
    );

    return tDgWrTestModel;
  }

  @override
  Future<List<DgWrTestModel>> getDgWrByTrNo(int trNo) async {
    final tDgWrData = await sl<AppDatabase>().getDgWrLocalDataWithTrNo(trNo);
    List<DgWrTestModel> tDgWrTestModel =
        List<DgWrTestModel>.empty(growable: true);

    for (var element in tDgWrData) {
      tDgWrTestModel.add(DgWrTestModel(
        id: element.id,
        databaseID: element.databaseID,
        uv: element.uv,
        vw: element.vw,
        wu: element.wu,
        trNo: element.trNo,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tDgWrTestModel;
  }

  @override
  Future<List<DgWrTestModel>> getDgWrEquipmentList() async {
    final tDgWrData = await sl<AppDatabase>().getDgWrEquipmentList();
    List<DgWrTestModel> tDgWrTestModel =
        List<DgWrTestModel>.empty(growable: true);
    for (var element in tDgWrData) {
      tDgWrTestModel.add(DgWrTestModel(
        id: element.id,
        uv: element.uv,
        vw: element.vw,
        wu: element.wu,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tDgWrTestModel;
  }

  @override
  Future<List<DgWrTestModel>> getDgWrBySerialNo(String serialNo) async {
    final tDgWrData =
        await sl<AppDatabase>().getDgWrLocalDataWithSerialNo(serialNo);
    List<DgWrTestModel> tDgWrTestModel =
        List<DgWrTestModel>.empty(growable: true);
    for (var element in tDgWrData) {
      tDgWrTestModel.add(DgWrTestModel(
        id: element.id,
        uv: element.uv,
        vw: element.vw,
        wu: element.wu,
        trNo: element.trNo,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tDgWrTestModel;
  }

  @override
  Future<int> localDgWr(DgWrTestModel dgWrToLocal) {
    return (sl<AppDatabase>().createDgWr(dgWrToLocal));
  }

  @override
  Future<void> updateDgWr(DgWrTestModel dgWrToUpdate, int id) async {
    sl<AppDatabase>().updateDgWr(dgWrToUpdate, id);
  }

  @override
  Future<int> deleteDgWrById(int id) {
    return (sl<AppDatabase>().deleteDgWrById(id));
  }
}
