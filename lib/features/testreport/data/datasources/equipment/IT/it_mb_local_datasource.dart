// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/IT/it_mb_model.dart';
import '../../test_report_local_datasource.dart';
// import '../../../../../../injection_container.dart';
// import '../../test_report_local_datasource.dart';

abstract class ItMbLocalDatasource {
  Future<List<ItMbTestModel>> getItMbByTrNo(int trNo);
  Future<ItMbTestModel> getItMbById(int id);
  Future<int> localItMb(ItMbTestModel itMbTestModel);
  Future<void> updateItMb(ItMbTestModel itMbToUpdate, int id);
  Future<int> deleteItMbById(int id);
  Future<List<ItMbTestModel>> getItMbBySerialNo(String serialNo);
  Future<List<ItMbTestModel>> getItMbEquipmentList();
}

@DataClassName('ItMbLocalData')
class ItMbLocalDatasourceImpl extends Table implements ItMbLocalDatasource {
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
  RealColumn get r_hv_uv => real()();
  @required
  RealColumn get r_hv_vw => real()();
  @required
  RealColumn get r_hv_wu => real()();
  @required
  RealColumn get r_lv1_uv => real()();
  @required
  RealColumn get r_lv1_vw => real()();
  @required
  RealColumn get r_lv1_wu => real()();
  @required
  RealColumn get r_lv2_uv => real()();
  @required
  RealColumn get r_lv2_vw => real()();
  @required
  RealColumn get r_lv2_wu => real()();
  @required
  RealColumn get r_lv3_uv => real()();
  @required
  RealColumn get r_lv3_vw => real()();
  @required
  RealColumn get r_lv3_wu => real()();
  @required
  RealColumn get r_lv4_uv => real()();
  @required
  RealColumn get r_lv4_vw => real()();
  @required
  RealColumn get r_lv4_wu => real()();

  @required
  RealColumn get y_hv_uv => real()();
  @required
  RealColumn get y_hv_vw => real()();
  @required
  RealColumn get y_hv_wu => real()();
  @required
  RealColumn get y_lv1_uv => real()();
  @required
  RealColumn get y_lv1_vw => real()();
  @required
  RealColumn get y_lv1_wu => real()();
  @required
  RealColumn get y_lv2_uv => real()();
  @required
  RealColumn get y_lv2_vw => real()();
  @required
  RealColumn get y_lv2_wu => real()();
  @required
  RealColumn get y_lv3_uv => real()();
  @required
  RealColumn get y_lv3_vw => real()();
  @required
  RealColumn get y_lv3_wu => real()();
  @required
  RealColumn get y_lv4_uv => real()();
  @required
  RealColumn get y_lv4_vw => real()();
  @required
  RealColumn get y_lv4_wu => real()();

  @required
  RealColumn get b_hv_uv => real()();
  @required
  RealColumn get b_hv_vw => real()();
  @required
  RealColumn get b_hv_wu => real()();
  @required
  RealColumn get b_lv1_uv => real()();
  @required
  RealColumn get b_lv1_vw => real()();
  @required
  RealColumn get b_lv1_wu => real()();
  @required
  RealColumn get b_lv2_uv => real()();
  @required
  RealColumn get b_lv2_vw => real()();
  @required
  RealColumn get b_lv2_wu => real()();
  @required
  RealColumn get b_lv3_uv => real()();
  @required
  RealColumn get b_lv3_vw => real()();
  @required
  RealColumn get b_lv3_wu => real()();
  @required
  RealColumn get b_lv4_uv => real()();
  @required
  RealColumn get b_lv4_vw => real()();
  @required
  RealColumn get b_lv4_wu => real()();

  @override
  Future<ItMbTestModel> getItMbById(int id) async {
    ItMbLocalData tItMbLocalData =
        await sl<AppDatabase>().getItMbLocalDataWithId(id);
    ItMbTestModel tItMbModel = ItMbTestModel(
      id: tItMbLocalData.id,
      databaseID: tItMbLocalData.databaseID,
      trNo: tItMbLocalData.trNo,
      serialNo: tItMbLocalData.serialNo,
      equipmentUsed: tItMbLocalData.equipmentUsed,
      updateDate: tItMbLocalData.updateDate,
      r_hv_uv: tItMbLocalData.r_hv_uv,
      r_hv_vw: tItMbLocalData.r_hv_vw,
      r_hv_wu: tItMbLocalData.r_hv_wu,
      r_lv1_uv: tItMbLocalData.r_lv1_uv,
      r_lv1_vw: tItMbLocalData.r_lv1_vw,
      r_lv1_wu: tItMbLocalData.r_lv1_wu,
      r_lv2_uv: tItMbLocalData.r_lv2_uv,
      r_lv2_vw: tItMbLocalData.r_lv2_vw,
      r_lv2_wu: tItMbLocalData.r_lv2_wu,
      r_lv3_uv: tItMbLocalData.r_lv3_uv,
      r_lv3_vw: tItMbLocalData.r_lv3_vw,
      r_lv3_wu: tItMbLocalData.r_lv3_wu,
      r_lv4_uv: tItMbLocalData.r_lv4_uv,
      r_lv4_vw: tItMbLocalData.r_lv4_vw,
      r_lv4_wu: tItMbLocalData.r_lv4_wu,
      y_hv_uv: tItMbLocalData.y_hv_uv,
      y_hv_vw: tItMbLocalData.y_hv_vw,
      y_hv_wu: tItMbLocalData.y_hv_wu,
      y_lv1_uv: tItMbLocalData.y_lv1_uv,
      y_lv1_vw: tItMbLocalData.y_lv1_vw,
      y_lv1_wu: tItMbLocalData.y_lv1_wu,
      y_lv2_uv: tItMbLocalData.y_lv2_uv,
      y_lv2_vw: tItMbLocalData.y_lv2_vw,
      y_lv2_wu: tItMbLocalData.y_lv2_wu,
      y_lv3_uv: tItMbLocalData.y_lv3_uv,
      y_lv3_vw: tItMbLocalData.y_lv3_vw,
      y_lv3_wu: tItMbLocalData.y_lv3_wu,
      y_lv4_uv: tItMbLocalData.y_lv4_uv,
      y_lv4_vw: tItMbLocalData.y_lv4_vw,
      y_lv4_wu: tItMbLocalData.y_lv4_wu,
      b_hv_uv: tItMbLocalData.b_hv_uv,
      b_hv_vw: tItMbLocalData.b_hv_vw,
      b_hv_wu: tItMbLocalData.b_hv_wu,
      b_lv1_uv: tItMbLocalData.b_lv1_uv,
      b_lv1_vw: tItMbLocalData.b_lv1_vw,
      b_lv1_wu: tItMbLocalData.b_lv1_wu,
      b_lv2_uv: tItMbLocalData.b_lv2_uv,
      b_lv2_vw: tItMbLocalData.b_lv2_vw,
      b_lv2_wu: tItMbLocalData.b_lv2_wu,
      b_lv3_uv: tItMbLocalData.b_lv3_uv,
      b_lv3_vw: tItMbLocalData.b_lv3_vw,
      b_lv3_wu: tItMbLocalData.b_lv3_wu,
      b_lv4_uv: tItMbLocalData.b_lv4_uv,
      b_lv4_vw: tItMbLocalData.b_lv4_vw,
      b_lv4_wu: tItMbLocalData.b_lv4_wu,
    );
    return tItMbModel;
  }

  @override
  Future<int> localItMb(ItMbTestModel itMbTestModel) {
    return (sl<AppDatabase>().createItMb(itMbTestModel));
  }

  @override
  Future<void> updateItMb(ItMbTestModel itMbToUpdate, int id) async {
    sl<AppDatabase>().updateItMb(itMbToUpdate, id);
  }

  @override
  Future<int> deleteItMbById(int id) {
    return (sl<AppDatabase>().deleteItMbById(id));
  }

  @override
  Future<List<ItMbTestModel>> getItMbBySerialNo(String serialNo) async {
    final tItMbdata =
        await sl<AppDatabase>().getItMbLocalDataWithSerialNo(serialNo);

    List<ItMbTestModel> tItMbModel = List<ItMbTestModel>.empty(growable: true);
    for (var listEle in tItMbdata) {
      tItMbModel.add(ItMbTestModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        r_hv_uv: listEle.r_hv_uv,
        r_hv_vw: listEle.r_hv_vw,
        r_hv_wu: listEle.r_hv_wu,
        r_lv1_uv: listEle.r_lv1_uv,
        r_lv1_vw: listEle.r_lv1_vw,
        r_lv1_wu: listEle.r_lv1_wu,
        r_lv2_uv: listEle.r_lv2_uv,
        r_lv2_vw: listEle.r_lv2_vw,
        r_lv2_wu: listEle.r_lv2_wu,
        r_lv3_uv: listEle.r_lv3_uv,
        r_lv3_vw: listEle.r_lv3_vw,
        r_lv3_wu: listEle.r_lv3_wu,
        r_lv4_uv: listEle.r_lv4_uv,
        r_lv4_vw: listEle.r_lv4_vw,
        r_lv4_wu: listEle.r_lv4_wu,
        y_hv_uv: listEle.y_hv_uv,
        y_hv_vw: listEle.y_hv_vw,
        y_hv_wu: listEle.y_hv_wu,
        y_lv1_uv: listEle.y_lv1_uv,
        y_lv1_vw: listEle.y_lv1_vw,
        y_lv1_wu: listEle.y_lv1_wu,
        y_lv2_uv: listEle.y_lv2_uv,
        y_lv2_vw: listEle.y_lv2_vw,
        y_lv2_wu: listEle.y_lv2_wu,
        y_lv3_uv: listEle.y_lv3_uv,
        y_lv3_vw: listEle.y_lv3_vw,
        y_lv3_wu: listEle.y_lv3_wu,
        y_lv4_uv: listEle.y_lv4_uv,
        y_lv4_vw: listEle.y_lv4_vw,
        y_lv4_wu: listEle.y_lv4_wu,
        b_hv_uv: listEle.b_hv_uv,
        b_hv_vw: listEle.b_hv_vw,
        b_hv_wu: listEle.b_hv_wu,
        b_lv1_uv: listEle.b_lv1_uv,
        b_lv1_vw: listEle.b_lv1_vw,
        b_lv1_wu: listEle.b_lv1_wu,
        b_lv2_uv: listEle.b_lv2_uv,
        b_lv2_vw: listEle.b_lv2_vw,
        b_lv2_wu: listEle.b_lv2_wu,
        b_lv3_uv: listEle.b_lv3_uv,
        b_lv3_vw: listEle.b_lv3_vw,
        b_lv3_wu: listEle.b_lv3_wu,
        b_lv4_uv: listEle.b_lv4_uv,
        b_lv4_vw: listEle.b_lv4_vw,
        b_lv4_wu: listEle.b_lv4_wu,
      ));
    }
    return tItMbModel;
  }

  @override
  Future<List<ItMbTestModel>> getItMbByTrNo(int trNo) async {
    final tItMbData = await sl<AppDatabase>().getItMbLocalDataWithTrNo(trNo);
    List<ItMbTestModel> tItMbTestModel =
        List<ItMbTestModel>.empty(growable: true);

    for (var element in tItMbData) {
      tItMbTestModel.add(ItMbTestModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        equipmentUsed: element.equipmentUsed,
        updateDate: element.updateDate,
        r_hv_uv: element.r_hv_uv,
        r_hv_vw: element.r_hv_vw,
        r_hv_wu: element.r_hv_wu,
        r_lv1_uv: element.r_lv1_uv,
        r_lv1_vw: element.r_lv1_vw,
        r_lv1_wu: element.r_lv1_wu,
        r_lv2_uv: element.r_lv2_uv,
        r_lv2_vw: element.r_lv2_vw,
        r_lv2_wu: element.r_lv2_wu,
        r_lv3_uv: element.r_lv3_uv,
        r_lv3_vw: element.r_lv3_vw,
        r_lv3_wu: element.r_lv3_wu,
        r_lv4_uv: element.r_lv4_uv,
        r_lv4_vw: element.r_lv4_vw,
        r_lv4_wu: element.r_lv4_wu,
        y_hv_uv: element.y_hv_uv,
        y_hv_vw: element.y_hv_vw,
        y_hv_wu: element.y_hv_wu,
        y_lv1_uv: element.y_lv1_uv,
        y_lv1_vw: element.y_lv1_vw,
        y_lv1_wu: element.y_lv1_wu,
        y_lv2_uv: element.y_lv2_uv,
        y_lv2_vw: element.y_lv2_vw,
        y_lv2_wu: element.y_lv2_wu,
        y_lv3_uv: element.y_lv3_uv,
        y_lv3_vw: element.y_lv3_vw,
        y_lv3_wu: element.y_lv3_wu,
        y_lv4_uv: element.y_lv4_uv,
        y_lv4_vw: element.y_lv4_vw,
        y_lv4_wu: element.y_lv4_wu,
        b_hv_uv: element.b_hv_uv,
        b_hv_vw: element.b_hv_vw,
        b_hv_wu: element.b_hv_wu,
        b_lv1_uv: element.b_lv1_uv,
        b_lv1_vw: element.b_lv1_vw,
        b_lv1_wu: element.b_lv1_wu,
        b_lv2_uv: element.b_lv2_uv,
        b_lv2_vw: element.b_lv2_vw,
        b_lv2_wu: element.b_lv2_wu,
        b_lv3_uv: element.b_lv3_uv,
        b_lv3_vw: element.b_lv3_vw,
        b_lv3_wu: element.b_lv3_wu,
        b_lv4_uv: element.b_lv4_uv,
        b_lv4_vw: element.b_lv4_vw,
        b_lv4_wu: element.b_lv4_wu,
      ));
    }
    return tItMbTestModel;
  }

  @override
  Future<List<ItMbTestModel>> getItMbEquipmentList() async {
    final tItMbData = await sl<AppDatabase>().getItMbEquipmentListALL();
    List<ItMbTestModel> tItMbTestModel =
        List<ItMbTestModel>.empty(growable: true);
    for (var element in tItMbData) {
      tItMbTestModel.add(ItMbTestModel(
        id: element.id,
        equipmentUsed: element.equipmentUsed,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        updateDate: element.updateDate,
        r_hv_uv: element.r_hv_uv,
        r_hv_vw: element.r_hv_vw,
        r_hv_wu: element.r_hv_wu,
        r_lv1_uv: element.r_lv1_uv,
        r_lv1_vw: element.r_lv1_vw,
        r_lv1_wu: element.r_lv1_wu,
        r_lv2_uv: element.r_lv2_uv,
        r_lv2_vw: element.r_lv2_vw,
        r_lv2_wu: element.r_lv2_wu,
        r_lv3_uv: element.r_lv3_uv,
        r_lv3_vw: element.r_lv3_vw,
        r_lv3_wu: element.r_lv3_wu,
        r_lv4_uv: element.r_lv4_uv,
        r_lv4_vw: element.r_lv4_vw,
        r_lv4_wu: element.r_lv4_wu,
        y_hv_uv: element.y_hv_uv,
        y_hv_vw: element.y_hv_vw,
        y_hv_wu: element.y_hv_wu,
        y_lv1_uv: element.y_lv1_uv,
        y_lv1_vw: element.y_lv1_vw,
        y_lv1_wu: element.y_lv1_wu,
        y_lv2_uv: element.y_lv2_uv,
        y_lv2_vw: element.y_lv2_vw,
        y_lv2_wu: element.y_lv2_wu,
        y_lv3_uv: element.y_lv3_uv,
        y_lv3_vw: element.y_lv3_vw,
        y_lv3_wu: element.y_lv3_wu,
        y_lv4_uv: element.y_lv4_uv,
        y_lv4_vw: element.y_lv4_vw,
        y_lv4_wu: element.y_lv4_wu,
        b_hv_uv: element.b_hv_uv,
        b_hv_vw: element.b_hv_vw,
        b_hv_wu: element.b_hv_wu,
        b_lv1_uv: element.b_lv1_uv,
        b_lv1_vw: element.b_lv1_vw,
        b_lv1_wu: element.b_lv1_wu,
        b_lv2_uv: element.b_lv2_uv,
        b_lv2_vw: element.b_lv2_vw,
        b_lv2_wu: element.b_lv2_wu,
        b_lv3_uv: element.b_lv3_uv,
        b_lv3_vw: element.b_lv3_vw,
        b_lv3_wu: element.b_lv3_wu,
        b_lv4_uv: element.b_lv4_uv,
        b_lv4_vw: element.b_lv4_vw,
        b_lv4_wu: element.b_lv4_wu,
      ));
    }
    return tItMbTestModel;
  }
}
