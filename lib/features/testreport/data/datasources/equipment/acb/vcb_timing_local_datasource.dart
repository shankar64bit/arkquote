import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/acb/vcb_timing_test_model.dart';

abstract class VcbTimingLocalDatasource {
  Future<List<VcbTimingTestModel>> getVcbTimingByTrNo(int trNo);
  Future<List<VcbTimingTestModel>> getVcbTimingSerialNo(String serialNo);
  Future<List<VcbTimingTestModel>> getVcbtimeEquipmentLists();
  Future<VcbTimingTestModel> getVcbTimigById(int id);
  Future<void> localVcbTiming(VcbTimingTestModel vcbTimingToLocal);
  Future<void> updateVcbTiming(VcbTimingTestModel vcbTimingToUpdate, int id);
  Future<int> deleteVcbTimingById(int id);
}

@DataClassName('VcbTimingLocalData')
class VcbTimingLocalDatasourceImpl extends Table
    implements VcbTimingLocalDatasource {
  // @required
  // RealColumn get some_name => real()();
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
  RealColumn get closeR => real()();
  @required
  RealColumn get closeY => real()();
  @required
  RealColumn get closeB => real()();
  @required
  RealColumn get tc1OpenR => real()();
  @required
  RealColumn get tc1OpenY => real()();
  @required
  RealColumn get tc1OpenB => real()();
  @required
  RealColumn get tc1CloseR => real()();
  @required
  RealColumn get tc1CloseY => real()();
  @required
  RealColumn get tc1CloseB => real()();
  @required
  RealColumn get tc2OpenY => real()();
  @required
  RealColumn get tc2OpenR => real()();
  @required
  RealColumn get tc2OpenB => real()();
  @required
  RealColumn get tc2CloseR => real()();
  @required
  RealColumn get tc2CloseY => real()();
  @required
  RealColumn get tc2CloseB => real()();

  @override
  Future<int> deleteVcbTimingById(int id) {
    return (sl<AppDatabase>().deleteVcbTimingById(id));
  }

  @override
  Future<VcbTimingTestModel> getVcbTimigById(int id) async {
    VcbTimingLocalData tVcbTimingData =
        await sl<AppDatabase>().getVcbTimingLocalDataWithId(id);

    VcbTimingTestModel tVcbTimingTestModel = VcbTimingTestModel(
      id: tVcbTimingData.id,
      databaseID: tVcbTimingData.databaseID,
      trNo: tVcbTimingData.trNo,
      serialNo: tVcbTimingData.serialNo,
      closeR: tVcbTimingData.closeR,
      closeY: tVcbTimingData.closeY,
      closeB: tVcbTimingData.closeB,
      tc1OpenR: tVcbTimingData.tc1OpenY,
      tc1OpenY: tVcbTimingData.tc1OpenY,
      tc1OpenB: tVcbTimingData.tc1OpenB,
      tc1CloseR: tVcbTimingData.tc1CloseR,
      tc1CloseY: tVcbTimingData.tc1CloseY,
      tc1CloseB: tVcbTimingData.tc1CloseB,
      tc2OpenR: tVcbTimingData.tc1OpenR,
      tc2OpenY: tVcbTimingData.tc2OpenY,
      tc2OpenB: tVcbTimingData.tc2OpenB,
      tc2CloseR: tVcbTimingData.tc2CloseR,
      tc2CloseY: tVcbTimingData.tc2CloseY,
      tc2CloseB: tVcbTimingData.tc2CloseB,
      EquipmentType: tVcbTimingData.EquipmentType,
      lastUpdated: tVcbTimingData.lastUpdated,
    );

    return tVcbTimingTestModel;
  }

  @override
  Future<List<VcbTimingTestModel>> getVcbTimingByTrNo(int trNo) async {
    final tVcbTimingData =
        await sl<AppDatabase>().getVcbTimingLocalDataWithTrNo(trNo);
    List<VcbTimingTestModel> tVcbTimingTestModel =
        List<VcbTimingTestModel>.empty(growable: true);
    for (var element in tVcbTimingData) {
      tVcbTimingTestModel.add(VcbTimingTestModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        closeR: element.closeR,
        closeY: element.closeY,
        closeB: element.closeB,
        tc1OpenR: element.tc1OpenY,
        tc1OpenY: element.tc1OpenY,
        tc1OpenB: element.tc1OpenB,
        tc1CloseR: element.tc1CloseR,
        tc1CloseY: element.tc1CloseY,
        tc1CloseB: element.tc1CloseB,
        tc2OpenR: element.tc1OpenR,
        tc2OpenY: element.tc2OpenY,
        tc2OpenB: element.tc2OpenB,
        tc2CloseR: element.tc2CloseR,
        tc2CloseY: element.tc2CloseY,
        tc2CloseB: element.tc2CloseB,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tVcbTimingTestModel;
  }

  @override
  Future<List<VcbTimingTestModel>> getVcbTimingSerialNo(String serilNo) async {
    final tVcbTimingData =
        await sl<AppDatabase>().getVcbTimingLocalDataWithSerialNo(serilNo);
    List<VcbTimingTestModel> tVcbTimingTestModel =
        List<VcbTimingTestModel>.empty(growable: true);
    for (var element in tVcbTimingData) {
      tVcbTimingTestModel.add(VcbTimingTestModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        closeR: element.closeR,
        closeY: element.closeY,
        closeB: element.closeB,
        tc1OpenR: element.tc1OpenY,
        tc1OpenY: element.tc1OpenY,
        tc1OpenB: element.tc1OpenB,
        tc1CloseR: element.tc1CloseR,
        tc1CloseY: element.tc1CloseY,
        tc1CloseB: element.tc1CloseB,
        tc2OpenR: element.tc1OpenR,
        tc2OpenY: element.tc2OpenY,
        tc2OpenB: element.tc2OpenB,
        tc2CloseR: element.tc2CloseR,
        tc2CloseY: element.tc2CloseY,
        tc2CloseB: element.tc2CloseB,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tVcbTimingTestModel;
  }

  @override
  Future<void> localVcbTiming(VcbTimingTestModel vcbTimingToLocal) {
    return (sl<AppDatabase>().createVcbTiming(vcbTimingToLocal));
  }

  @override
  Future<void> updateVcbTiming(VcbTimingTestModel vcbTimingToUpdate, int id) {
    return sl<AppDatabase>().updateVcbTiming(vcbTimingToUpdate, id);
  }

  @override
  Future<List<VcbTimingTestModel>> getVcbtimeEquipmentLists() async {
    final tVcbtimeData =
        await sl<AppDatabase>().getVcbtimeEquipmentListwithAll();
    List<VcbTimingTestModel> tVcbtimeTestModel =
        List<VcbTimingTestModel>.empty(growable: true);
    for (var element in tVcbtimeData) {
      tVcbtimeTestModel.add(VcbTimingTestModel(
        id: element.id,
        closeB: element.closeB,
        closeR: element.closeR,
        closeY: element.closeY,
        tc1CloseB: element.tc1CloseB,
        tc1CloseR: element.tc1CloseR,
        tc1CloseY: element.tc1CloseY,
        tc1OpenB: element.tc1OpenB,
        tc1OpenR: element.tc1OpenR,
        tc1OpenY: element.tc1OpenY,
        tc2CloseB: element.tc2CloseB,
        tc2CloseR: element.tc2CloseR,
        tc2CloseY: element.tc2CloseY,
        tc2OpenB: element.tc2OpenB,
        tc2OpenR: element.tc2OpenR,
        tc2OpenY: element.tc2OpenY,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tVcbtimeTestModel;
  }
}
