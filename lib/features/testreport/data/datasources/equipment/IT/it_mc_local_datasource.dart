// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/IT/it_mc_model.dart';
import '../../test_report_local_datasource.dart';
// import '../../../../../../injection_container.dart';
// import '../../test_report_local_datasource.dart';

abstract class ItMcLocalDatasource {
  Future<List<ItMcTestModel>> getItMcByTrNo(int trNo);
  Future<ItMcTestModel> getItMcById(int id);
  Future<int> localItMc(ItMcTestModel itMcTestModel);
  Future<void> updateItMc(ItMcTestModel itMcToUpdate, int id);
  Future<int> deleteItMcById(int id);
  Future<List<ItMcTestModel>> getItMcBySerialNo(String serialNo);
  Future<List<ItMcTestModel>> getItMcEquipmentList();
}

@DataClassName('ItMcLocalData')
class ItMcLocalDatasourceImpl extends Table implements ItMcLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();
  @required
  RealColumn get uv => real()();
  @required
  RealColumn get vw => real()();
  @required
  RealColumn get wu => real()();
  @required
  RealColumn get u => real()();
  @required
  RealColumn get v => real()();
  @required
  RealColumn get w => real()();
  @required
  TextColumn get tapPosition => text().withLength(min: 1, max: 50)();

  @override
  Future<ItMcTestModel> getItMcById(int id) async {
    ItMcLocalData tItMcLocalData =
        await sl<AppDatabase>().getItMcLocalDataWithId(id);
    ItMcTestModel tItMcModel = ItMcTestModel(
      id: tItMcLocalData.id,
      databaseID: tItMcLocalData.databaseID,
      trNo: tItMcLocalData.trNo,
      serialNo: tItMcLocalData.serialNo,
      equipmentUsed: tItMcLocalData.equipmentUsed,
      updateDate: tItMcLocalData.updateDate,
      uv: tItMcLocalData.uv,
      vw: tItMcLocalData.vw,
      wu: tItMcLocalData.wu,
      u: tItMcLocalData.u,
      v: tItMcLocalData.v,
      w: tItMcLocalData.w,
      tapPosition: tItMcLocalData.tapPosition,
    );
    return tItMcModel;
  }

  @override
  Future<int> localItMc(ItMcTestModel itMcTestModel) {
    return (sl<AppDatabase>().createItMc(itMcTestModel));
  }

  @override
  Future<void> updateItMc(ItMcTestModel itMcToUpdate, int id) async {
    sl<AppDatabase>().updateItMc(itMcToUpdate, id);
  }

  @override
  Future<int> deleteItMcById(int id) {
    return (sl<AppDatabase>().deleteItMcById(id));
  }

  @override
  Future<List<ItMcTestModel>> getItMcBySerialNo(String serialNo) async {
    final tItMcdata =
        await sl<AppDatabase>().getItMcLocalDataWithSerialNo(serialNo);

    List<ItMcTestModel> tItMcModel = List<ItMcTestModel>.empty(growable: true);
    for (var listEle in tItMcdata) {
      tItMcModel.add(ItMcTestModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        uv: listEle.uv,
        vw: listEle.vw,
        wu: listEle.wu,
        u: listEle.u,
        v: listEle.v,
        w: listEle.w,
        tapPosition: listEle.tapPosition,
      ));
    }
    return tItMcModel;
  }

  @override
  Future<List<ItMcTestModel>> getItMcByTrNo(int trNo) async {
    final tItMcData = await sl<AppDatabase>().getItMcLocalDataWithTrNo(trNo);
    List<ItMcTestModel> tItMcTestModel =
        List<ItMcTestModel>.empty(growable: true);

    for (var element in tItMcData) {
      tItMcTestModel.add(ItMcTestModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        equipmentUsed: element.equipmentUsed,
        updateDate: element.updateDate,
        uv: element.uv,
        vw: element.vw,
        wu: element.wu,
        u: element.u,
        v: element.v,
        w: element.w,
        tapPosition: element.tapPosition,
      ));
    }
    return tItMcTestModel;
  }

  @override
  Future<List<ItMcTestModel>> getItMcEquipmentList() async {
    final tItMcData = await sl<AppDatabase>().getItMcEquipmentListAll();
    List<ItMcTestModel> tItMcTestModel =
        List<ItMcTestModel>.empty(growable: true);
    for (var element in tItMcData) {
      tItMcTestModel.add(ItMcTestModel(
        id: element.id,
        uv: element.uv,
        vw: element.vw,
        wu: element.wu,
        u: element.u,
        v: element.v,
        w: element.w,
        tapPosition: element.tapPosition,
        equipmentUsed: element.equipmentUsed,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        updateDate: element.updateDate,
      ));
    }
    return tItMcTestModel;
  }
}
