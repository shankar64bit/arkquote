import 'dart:math';
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/busbar/bb_cr_test_model.dart';
import '../../test_report_local_datasource.dart';

abstract class BbCrLocalDatasource {
  Future<List<BbCrTestModel>> getBbCrByTrNo(int trNo);
  Future<BbCrTestModel> getBbCrById(int id);
  Future<void> localBbCr(BbCrTestModel bbCrToLocal);
  Future<void> updateBbCr(BbCrTestModel bbCrToUpdate, int id);
  Future<int> deleteBbCrById(int id);
  Future<List<BbCrTestModel>> getBbCrByBbRefId(int bbRefId);
  Future<List<BbCrTestModel>> getBbCrEquipmentList();
  // Future<List<BbCrTestModel>> getTestedById(int id);
}

@DataClassName('BbCrLocalData')
class BbCrLocalDatasourceImpl extends Table implements BbCrLocalDatasource {
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
  IntColumn get bbRefId => integer()();
  @required
  RealColumn get r => real()();
  @required
  RealColumn get y => real()();
  @required
  RealColumn get b => real()();
  @required
  RealColumn get n => real()();

  @override
  Future<BbCrTestModel> getBbCrById(int id) async {
    BbCrLocalData tBbCrData =
        await sl<AppDatabase>().getBbCrLocalDataWithId(id);

    BbCrTestModel tBbCrTestModel = BbCrTestModel(
      databaseID: tBbCrData.databaseID,
      id: tBbCrData.id,
      r: tBbCrData.r,
      y: tBbCrData.y,
      b: tBbCrData.b,
      n: tBbCrData.n,
      trNo: tBbCrData.trNo,
      bbRefId: tBbCrData.bbRefId,
      EquipmentType: tBbCrData.EquipmentType,
      lastUpdated: tBbCrData.lastUpdated,
    );

    return tBbCrTestModel;
  }

  @override
  Future<List<BbCrTestModel>> getBbCrByTrNo(int trNo) async {
    final tBbCrData = await sl<AppDatabase>().getBbCrLocalDataWithTrNo(trNo);
    List<BbCrTestModel> tBbCrTestModel =
        List<BbCrTestModel>.empty(growable: true);

    for (var element in tBbCrData) {
      tBbCrTestModel.add(BbCrTestModel(
        id: element.id,
        databaseID: element.databaseID,
        r: element.r,
        y: element.y,
        b: element.b,
        n: element.n,
        trNo: element.trNo,
        bbRefId: element.bbRefId,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tBbCrTestModel;
  }

  @override
  Future<List<BbCrTestModel>> getBbCrEquipmentList() async {
    final tBbCrData = await sl<AppDatabase>().getBbCrEquipmentList();
    List<BbCrTestModel> tBbCrTestModel =
        List<BbCrTestModel>.empty(growable: true);
    for (var element in tBbCrData) {
      tBbCrTestModel.add(BbCrTestModel(
        id: element.id,
        r: element.r,
        y: element.y,
        b: element.b,
        n: element.n,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        bbRefId: element.bbRefId,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tBbCrTestModel;
  }

  @override
  Future<List<BbCrTestModel>> getBbCrByBbRefId(int bbRefId) async {
    final tBbCrData =
        await sl<AppDatabase>().getBbCrLocalDataWithBbRefId(bbRefId);
    List<BbCrTestModel> tBbCrTestModel =
        List<BbCrTestModel>.empty(growable: true);
    for (var element in tBbCrData) {
      tBbCrTestModel.add(BbCrTestModel(
        id: element.id,
        r: element.r,
        y: element.y,
        b: element.b,
        n: element.n,
        trNo: element.trNo,
        databaseID: element.databaseID,
        bbRefId: element.bbRefId,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tBbCrTestModel;
  }

  @override
  Future<int> localBbCr(BbCrTestModel bbCrToLocal) {
    return (sl<AppDatabase>().createBbCr(bbCrToLocal));
  }

  @override
  Future<void> updateBbCr(BbCrTestModel bbCrToUpdate, int id) async {
    sl<AppDatabase>().updateBbCr(bbCrToUpdate, id);
  }

  @override
  Future<int> deleteBbCrById(int id) {
    return (sl<AppDatabase>().deleteBbCrById(id));
  }
}
