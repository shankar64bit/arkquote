import 'dart:math';
import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/busbar/bb_hv_test_model.dart';
import '../../test_report_local_datasource.dart';

abstract class BbHvLocalDatasource {
  Future<List<BbHvTestModel>> getBbHvByTrNo(int trNo);
  Future<BbHvTestModel> getBbHvById(int id);
  Future<void> localBbHv(BbHvTestModel bbHvToLocal);
  Future<void> updateBbHv(BbHvTestModel bbHvToUpdate, int id);
  Future<int> deleteBbHvById(int id);
  Future<List<BbHvTestModel>> getBbHvByBbRefId(int bbRefId);
  Future<List<BbHvTestModel>> getBbHvEquipmentList();
  // Future<List<BbHvTestModel>> getTestedById(int id);
}

@DataClassName('BbHvLocalData')
class BbHvLocalDatasourceImpl extends Table implements BbHvLocalDatasource {
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
  Future<BbHvTestModel> getBbHvById(int id) async {
    BbHvLocalData tBbHvData =
        await sl<AppDatabase>().getBbHvLocalDataWithId(id);

    BbHvTestModel tBbHvTestModel = BbHvTestModel(
      databaseID: tBbHvData.databaseID,
      id: tBbHvData.id,
      r: tBbHvData.r,
      y: tBbHvData.y,
      b: tBbHvData.b,
      n: tBbHvData.n,
      trNo: tBbHvData.trNo,
      bbRefId: tBbHvData.bbRefId,
      EquipmentType: tBbHvData.EquipmentType,
      lastUpdated: tBbHvData.lastUpdated,
    );

    return tBbHvTestModel;
  }

  @override
  Future<List<BbHvTestModel>> getBbHvByTrNo(int trNo) async {
    final tBbHvData = await sl<AppDatabase>().getBbHvLocalDataWithTrNo(trNo);
    List<BbHvTestModel> tBbHvTestModel =
        List<BbHvTestModel>.empty(growable: true);

    for (var element in tBbHvData) {
      tBbHvTestModel.add(BbHvTestModel(
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
    return tBbHvTestModel;
  }

  @override
  Future<List<BbHvTestModel>> getBbHvEquipmentList() async {
    final tBbHvData = await sl<AppDatabase>().getBbHvEquipmentList();
    List<BbHvTestModel> tBbHvTestModel =
        List<BbHvTestModel>.empty(growable: true);
    for (var element in tBbHvData) {
      tBbHvTestModel.add(BbHvTestModel(
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
    return tBbHvTestModel;
  }

  @override
  Future<List<BbHvTestModel>> getBbHvByBbRefId(int bbRefId) async {
    final tBbHvData =
        await sl<AppDatabase>().getBbHvLocalDataWithBbRefId(bbRefId);
    List<BbHvTestModel> tBbHvTestModel =
        List<BbHvTestModel>.empty(growable: true);
    for (var element in tBbHvData) {
      tBbHvTestModel.add(BbHvTestModel(
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
    return tBbHvTestModel;
  }

  @override
  Future<int> localBbHv(BbHvTestModel bbHvToLocal) {
    return (sl<AppDatabase>().createBbHv(bbHvToLocal));
  }

  @override
  Future<void> updateBbHv(BbHvTestModel bbHvToUpdate, int id) async {
    sl<AppDatabase>().updateBbHv(bbHvToUpdate, id);
  }

  @override
  Future<int> deleteBbHvById(int id) {
    return (sl<AppDatabase>().deleteBbHvById(id));
  }
}
