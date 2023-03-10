import 'dart:math';
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/power_cable/pc_ir_test_model.dart';
import '../../test_report_local_datasource.dart';

abstract class PcIrLocalDatasource {
  Future<List<PcIrTestModel>> getPcIrByTrNo(int trNo);
  Future<PcIrTestModel> getPcIrById(int id);
  Future<void> localPcIr(PcIrTestModel pcirtolocal);
  Future<void> updatePcIr(PcIrTestModel pcirtoupdate, int id);
  Future<int> deletePcIrById(int id);
  Future<List<PcIrTestModel>> getPcIrByPcRefId(int pcRefId);
  Future<List<PcIrTestModel>> getPcIrEquipmentList();
  Future<List<PcIrTestModel>> getTestedById(int id);
}

@DataClassName('PcIrLocalData')
class PcIrLocalDatasourceImpl extends Table implements PcIrLocalDatasource {
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
  IntColumn get pcRefId => integer()();

  @required
  RealColumn get rA => real()();
  @required
  RealColumn get yA => real()();
  @required
  RealColumn get bA => real()();
  @required
  RealColumn get rB => real()();
  @required
  RealColumn get yB => real()();
  @required
  RealColumn get bB => real()();
  @required
  RealColumn get ryA => real()();
  @required
  RealColumn get ybA => real()();
  @required
  RealColumn get brA => real()();
  @required
  RealColumn get ryB => real()();
  @required
  RealColumn get ybB => real()();
  @required
  RealColumn get brB => real()();

  @override
  Future<PcIrTestModel> getPcIrById(int id) async {
    PcIrLocalData tPcIrData =
        await sl<AppDatabase>().getPcIrLocalDataWithId(id);

    PcIrTestModel tPcIrTestModel = PcIrTestModel(
      databaseID: tPcIrData.databaseID,
      id: tPcIrData.id,
      rA: tPcIrData.rA,
      rB: tPcIrData.rB,
      yA: tPcIrData.yA,
      yB: tPcIrData.yB,
      bA: tPcIrData.bA,
      bB: tPcIrData.bB,
      ryA: tPcIrData.ryA,
      ryB: tPcIrData.ryB,
      ybA: tPcIrData.ybA,
      ybB: tPcIrData.ybB,
      brA: tPcIrData.brA,
      brB: tPcIrData.brB,
      trNo: tPcIrData.trNo,
      pcRefId: tPcIrData.pcRefId,
      EquipmentType: tPcIrData.EquipmentType,
      lastUpdated: tPcIrData.lastUpdated,
    );

    return tPcIrTestModel;
  }

  @override
  Future<List<PcIrTestModel>> getPcIrByTrNo(int trNo) async {
    final tPcIrData = await sl<AppDatabase>().getPcIrLocalDataWithTrNo(trNo);
    List<PcIrTestModel> tPcIrTestModel =
        List<PcIrTestModel>.empty(growable: true);

    for (var element in tPcIrData) {
      tPcIrTestModel.add(PcIrTestModel(
        id: element.id,
        databaseID: element.databaseID,
        rA: element.rA,
        rB: element.rB,
        yA: element.yA,
        yB: element.yB,
        bA: element.bA,
        bB: element.bB,
        ryA: element.ryA,
        ryB: element.ryB,
        ybA: element.ybA,
        ybB: element.ybB,
        brA: element.brA,
        brB: element.brB,
        trNo: element.trNo,
        pcRefId: element.pcRefId,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tPcIrTestModel;
  }

  @override
  Future<List<PcIrTestModel>> getPcIrEquipmentList() async {
    final tPcIrData = await sl<AppDatabase>().getPcIrEquipmentList();
    List<PcIrTestModel> tPcIrTestModel =
        List<PcIrTestModel>.empty(growable: true);
    for (var element in tPcIrData) {
      tPcIrTestModel.add(PcIrTestModel(
        id: element.id,
        rA: element.rA,
        rB: element.rB,
        yA: element.yA,
        yB: element.yB,
        bA: element.bA,
        bB: element.bB,
        ryA: element.ryA,
        ryB: element.ryB,
        ybA: element.ybA,
        ybB: element.ybB,
        brA: element.brA,
        brB: element.brB,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        pcRefId: element.pcRefId,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tPcIrTestModel;
  }

  @override
  Future<List<PcIrTestModel>> getPcIrByPcRefId(int pcRefId) async {
    final tPcIrData =
        await sl<AppDatabase>().getPcIrLocalDataWithPcRefId(pcRefId);
    List<PcIrTestModel> tPcIrTestModel =
        List<PcIrTestModel>.empty(growable: true);
    for (var element in tPcIrData) {
      tPcIrTestModel.add(PcIrTestModel(
        id: element.id,
        rA: element.rA,
        rB: element.rB,
        yA: element.yA,
        yB: element.yB,
        bA: element.bA,
        bB: element.bB,
        ryA: element.ryA,
        ryB: element.ryB,
        ybA: element.ybA,
        ybB: element.ybB,
        brA: element.brA,
        brB: element.brB,
        trNo: element.trNo,
        databaseID: element.databaseID,
        pcRefId: element.pcRefId,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tPcIrTestModel;
  }

  @override
  Future<int> localPcIr(PcIrTestModel pcirtolocal) {
    return (sl<AppDatabase>().createPcIr(pcirtolocal));
  }

  @override
  Future<void> updatePcIr(PcIrTestModel pcirtoupdate, int id) async {
    sl<AppDatabase>().updatePcIr(pcirtoupdate, id);
  }

  @override
  Future<int> deletePcIrById(int id) {
    return (sl<AppDatabase>().deletePcIrById(id));
  }

  @override
  Future<List<PcIrTestModel>> getTestedById(int id) {
    // TODO: implement getTestedById
    throw UnimplementedError();
  }
}
