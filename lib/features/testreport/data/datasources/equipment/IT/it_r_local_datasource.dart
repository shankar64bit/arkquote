// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/IT/it_r_model.dart';
import '../../test_report_local_datasource.dart';
// import '../../../../../../injection_container.dart';
// import '../../test_report_local_datasource.dart';

abstract class ItRLocalDatasource {
  Future<List<ItRTestModel>> getItRByTrNo(int trNo);
  Future<ItRTestModel> getItRById(int id);
  Future<int> localItR(ItRTestModel itRTestModel);
  Future<void> updateItR(ItRTestModel itRToUpdate, int id);
  Future<int> deleteItRById(int id);
  Future<List<ItRTestModel>> getItRBySerialNo(String serialNo);
  Future<List<ItRTestModel>> getItREquipmentList();
}

@DataClassName('ItRLocalData')
class ItRLocalDatasourceImpl extends Table implements ItRLocalDatasource {
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
  TextColumn get tapPosition => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get hv_uv => real()();
  @required
  RealColumn get hv_vw => real()();
  @required
  RealColumn get hv_wu => real()();
  @required
  RealColumn get lv1_uv => real()();
  @required
  RealColumn get lv1_vw => real()();
  @required
  RealColumn get lv1_wu => real()();
  @required
  RealColumn get lv2_uv => real()();
  @required
  RealColumn get lv2_vw => real()();
  @required
  RealColumn get lv2_wu => real()();
  @required
  RealColumn get lv3_uv => real()();
  @required
  RealColumn get lv3_vw => real()();
  @required
  RealColumn get lv3_wu => real()();
  @required
  RealColumn get lv4_uv => real()();
  @required
  RealColumn get lv4_vw => real()();
  @required
  RealColumn get lv4_wu => real()();

  @override
  Future<ItRTestModel> getItRById(int id) async {
    ItRLocalData tItRLocalData =
        await sl<AppDatabase>().getItRLocalDataWithId(id);
    ItRTestModel tItRModel = ItRTestModel(
      id: tItRLocalData.id,
      databaseID: tItRLocalData.databaseID,
      trNo: tItRLocalData.trNo,
      serialNo: tItRLocalData.serialNo,
      equipmentUsed: tItRLocalData.equipmentUsed,
      updateDate: tItRLocalData.updateDate,
      tapPosition: tItRLocalData.tapPosition,
      hv_uv: tItRLocalData.hv_uv,
      hv_vw: tItRLocalData.hv_vw,
      hv_wu: tItRLocalData.hv_wu,
      lv1_uv: tItRLocalData.lv1_uv,
      lv1_vw: tItRLocalData.lv1_vw,
      lv1_wu: tItRLocalData.lv1_wu,
      lv2_uv: tItRLocalData.lv2_uv,
      lv2_vw: tItRLocalData.lv2_vw,
      lv2_wu: tItRLocalData.lv2_wu,
      lv3_uv: tItRLocalData.lv3_uv,
      lv3_vw: tItRLocalData.lv3_vw,
      lv3_wu: tItRLocalData.lv3_wu,
      lv4_uv: tItRLocalData.lv4_uv,
      lv4_vw: tItRLocalData.lv4_vw,
      lv4_wu: tItRLocalData.lv4_wu,
    );
    return tItRModel;
  }

  @override
  Future<int> localItR(ItRTestModel itRTestModel) {
    return (sl<AppDatabase>().createItR(itRTestModel));
  }

  @override
  Future<void> updateItR(ItRTestModel itRToUpdate, int id) async {
    sl<AppDatabase>().updateItR(itRToUpdate, id);
  }

  @override
  Future<int> deleteItRById(int id) {
    return (sl<AppDatabase>().deleteItRById(id));
  }

  @override
  Future<List<ItRTestModel>> getItRBySerialNo(String serialNo) async {
    final tItRdata =
        await sl<AppDatabase>().getItRLocalDataWithSerialNo(serialNo);

    List<ItRTestModel> tItRModel = List<ItRTestModel>.empty(growable: true);
    for (var listEle in tItRdata) {
      tItRModel.add(ItRTestModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        tapPosition: listEle.tapPosition,
        hv_uv: listEle.hv_uv,
        hv_vw: listEle.hv_vw,
        hv_wu: listEle.hv_wu,
        lv1_uv: listEle.lv1_uv,
        lv1_vw: listEle.lv1_vw,
        lv1_wu: listEle.lv1_wu,
        lv2_uv: listEle.lv2_uv,
        lv2_vw: listEle.lv2_vw,
        lv2_wu: listEle.lv2_wu,
        lv3_uv: listEle.lv3_uv,
        lv3_vw: listEle.lv3_vw,
        lv3_wu: listEle.lv3_wu,
        lv4_uv: listEle.lv4_uv,
        lv4_vw: listEle.lv4_vw,
        lv4_wu: listEle.lv4_wu,
      ));
    }
    return tItRModel;
  }

  @override
  Future<List<ItRTestModel>> getItRByTrNo(int trNo) async {
    final tItRData = await sl<AppDatabase>().getItRLocalDataWithTrNo(trNo);
    List<ItRTestModel> tItRTestModel = List<ItRTestModel>.empty(growable: true);

    for (var element in tItRData) {
      tItRTestModel.add(ItRTestModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        equipmentUsed: element.equipmentUsed,
        updateDate: element.updateDate,
        tapPosition: element.tapPosition,
        hv_uv: element.hv_uv,
        hv_vw: element.hv_vw,
        hv_wu: element.hv_wu,
        lv1_uv: element.lv1_uv,
        lv1_vw: element.lv1_vw,
        lv1_wu: element.lv1_wu,
        lv2_uv: element.lv2_uv,
        lv2_vw: element.lv2_vw,
        lv2_wu: element.lv2_wu,
        lv3_uv: element.lv3_uv,
        lv3_vw: element.lv3_vw,
        lv3_wu: element.lv3_wu,
        lv4_uv: element.lv4_uv,
        lv4_vw: element.lv4_vw,
        lv4_wu: element.lv4_wu,
      ));
    }
    return tItRTestModel;
  }

  @override
  Future<List<ItRTestModel>> getItREquipmentList() async {
    final tItRData = await sl<AppDatabase>().getItREquipmentListAll();
    List<ItRTestModel> tItRTestModel = List<ItRTestModel>.empty(growable: true);
    for (var element in tItRData) {
      tItRTestModel.add(ItRTestModel(
        id: element.id,
        tapPosition: element.tapPosition,
        equipmentUsed: element.equipmentUsed,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        updateDate: element.updateDate,
        hv_uv: element.hv_uv,
        hv_vw: element.hv_vw,
        hv_wu: element.hv_wu,
        lv1_uv: element.lv1_uv,
        lv1_vw: element.lv1_vw,
        lv1_wu: element.lv1_wu,
        lv2_uv: element.lv2_uv,
        lv2_vw: element.lv2_vw,
        lv2_wu: element.lv2_wu,
        lv3_uv: element.lv3_uv,
        lv3_vw: element.lv3_vw,
        lv3_wu: element.lv3_wu,
        lv4_uv: element.lv4_uv,
        lv4_vw: element.lv4_vw,
        lv4_wu: element.lv4_wu,
      ));
    }
    return tItRTestModel;
  }
}
