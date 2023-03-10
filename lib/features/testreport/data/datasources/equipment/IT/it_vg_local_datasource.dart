// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/IT/it_vg_model.dart';
import '../../test_report_local_datasource.dart';
// import '../../../../../../injection_container.dart';
// import '../../test_report_local_datasource.dart';

abstract class ItVgLocalDatasource {
  Future<List<ItVgTestModel>> getItVgByTrNo(int trNo);
  Future<ItVgTestModel> getItVgById(int id);
  Future<int> localItVg(ItVgTestModel itVgTestModel);
  Future<void> updateItVg(ItVgTestModel itVgToUpdate, int id);
  Future<int> deleteItVgById(int id);
  Future<List<ItVgTestModel>> getItVgBySerialNo(String serialNo);
  Future<List<ItVgTestModel>> getItVgEquipmentList();
}

@DataClassName('ItVgLocalData')
class ItVgLocalDatasourceImpl extends Table implements ItVgLocalDatasource {
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
  RealColumn get lv1_v1 => real()();
  @required
  RealColumn get lv1_v2 => real()();
  @required
  RealColumn get lv1_v3 => real()();
  @required
  RealColumn get lv1_v4 => real()();
  @required
  RealColumn get lv2_v1 => real()();
  @required
  RealColumn get lv2_v2 => real()();
  @required
  RealColumn get lv2_v3 => real()();
  @required
  RealColumn get lv2_v4 => real()();

  @required
  RealColumn get lv3_v1 => real()();
  @required
  RealColumn get lv3_v2 => real()();
  @required
  RealColumn get lv3_v3 => real()();
  @required
  RealColumn get lv3_v4 => real()();

  @required
  RealColumn get lv4_v1 => real()();
  @required
  RealColumn get lv4_v2 => real()();
  @required
  RealColumn get lv4_v3 => real()();
  @required
  RealColumn get lv4_v4 => real()();

  @override
  Future<ItVgTestModel> getItVgById(int id) async {
    ItVgLocalData tItVgLocalData =
        await sl<AppDatabase>().getItVgLocalDataWithId(id);
    ItVgTestModel tItVgModel = ItVgTestModel(
      id: tItVgLocalData.id,
      databaseID: tItVgLocalData.databaseID,
      trNo: tItVgLocalData.trNo,
      serialNo: tItVgLocalData.serialNo,
      equipmentUsed: tItVgLocalData.equipmentUsed,
      updateDate: tItVgLocalData.updateDate,
      lv1_v1: tItVgLocalData.lv1_v1,
      lv1_v2: tItVgLocalData.lv1_v2,
      lv1_v3: tItVgLocalData.lv1_v3,
      lv1_v4: tItVgLocalData.lv1_v4,
      lv2_v1: tItVgLocalData.lv2_v1,
      lv2_v2: tItVgLocalData.lv2_v2,
      lv2_v3: tItVgLocalData.lv2_v3,
      lv2_v4: tItVgLocalData.lv2_v4,
      lv3_v1: tItVgLocalData.lv3_v1,
      lv3_v2: tItVgLocalData.lv3_v2,
      lv3_v3: tItVgLocalData.lv3_v3,
      lv3_v4: tItVgLocalData.lv3_v4,
      lv4_v1: tItVgLocalData.lv4_v1,
      lv4_v2: tItVgLocalData.lv4_v2,
      lv4_v3: tItVgLocalData.lv4_v3,
      lv4_v4: tItVgLocalData.lv4_v4,
    );
    return tItVgModel;
  }

  @override
  Future<int> localItVg(ItVgTestModel itVgTestModel) {
    return (sl<AppDatabase>().createItVg(itVgTestModel));
  }

  @override
  Future<void> updateItVg(ItVgTestModel itVgToUpdate, int id) async {
    sl<AppDatabase>().updateItVg(itVgToUpdate, id);
  }

  @override
  Future<int> deleteItVgById(int id) {
    return (sl<AppDatabase>().deleteItVgById(id));
  }

  @override
  Future<List<ItVgTestModel>> getItVgBySerialNo(String serialNo) async {
    final tItVgdata =
        await sl<AppDatabase>().getItVgLocalDataWithSerialNo(serialNo);

    List<ItVgTestModel> tItVgModel = List<ItVgTestModel>.empty(growable: true);
    for (var listEle in tItVgdata) {
      tItVgModel.add(ItVgTestModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        lv1_v1: listEle.lv1_v1,
        lv1_v2: listEle.lv1_v2,
        lv1_v3: listEle.lv1_v3,
        lv1_v4: listEle.lv1_v4,
        lv2_v1: listEle.lv2_v1,
        lv2_v2: listEle.lv2_v2,
        lv2_v3: listEle.lv2_v3,
        lv2_v4: listEle.lv2_v4,
        lv3_v1: listEle.lv3_v1,
        lv3_v2: listEle.lv3_v2,
        lv3_v3: listEle.lv3_v3,
        lv3_v4: listEle.lv3_v4,
        lv4_v1: listEle.lv4_v1,
        lv4_v2: listEle.lv4_v2,
        lv4_v3: listEle.lv4_v3,
        lv4_v4: listEle.lv4_v4,
      ));
    }
    return tItVgModel;
  }

  @override
  Future<List<ItVgTestModel>> getItVgByTrNo(int trNo) async {
    final tItVgData = await sl<AppDatabase>().getItVgLocalDataWithTrNo(trNo);
    List<ItVgTestModel> tItVgTestModel =
        List<ItVgTestModel>.empty(growable: true);

    for (var element in tItVgData) {
      tItVgTestModel.add(ItVgTestModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        equipmentUsed: element.equipmentUsed,
        updateDate: element.updateDate,
        lv1_v1: element.lv1_v1,
        lv1_v2: element.lv1_v2,
        lv1_v3: element.lv1_v3,
        lv1_v4: element.lv1_v4,
        lv2_v1: element.lv2_v1,
        lv2_v2: element.lv2_v2,
        lv2_v3: element.lv2_v3,
        lv2_v4: element.lv2_v4,
        lv3_v1: element.lv3_v1,
        lv3_v2: element.lv3_v2,
        lv3_v3: element.lv3_v3,
        lv3_v4: element.lv3_v4,
        lv4_v1: element.lv4_v1,
        lv4_v2: element.lv4_v2,
        lv4_v3: element.lv4_v3,
        lv4_v4: element.lv4_v4,
      ));
    }
    return tItVgTestModel;
  }

  @override
  Future<List<ItVgTestModel>> getItVgEquipmentList() async {
    final tItVgData = await sl<AppDatabase>().getItVgEquipmentListAll();
    List<ItVgTestModel> tItVgTestModel =
        List<ItVgTestModel>.empty(growable: true);
    for (var element in tItVgData) {
      tItVgTestModel.add(ItVgTestModel(
        id: element.id,
        equipmentUsed: element.equipmentUsed,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        updateDate: element.updateDate,
        lv1_v1: element.lv1_v1,
        lv1_v2: element.lv1_v2,
        lv1_v3: element.lv1_v3,
        lv1_v4: element.lv1_v4,
        lv2_v1: element.lv2_v1,
        lv2_v2: element.lv2_v2,
        lv2_v3: element.lv2_v3,
        lv2_v4: element.lv2_v4,
        lv3_v1: element.lv3_v1,
        lv3_v2: element.lv3_v2,
        lv3_v3: element.lv3_v3,
        lv3_v4: element.lv3_v4,
        lv4_v1: element.lv4_v1,
        lv4_v2: element.lv4_v2,
        lv4_v3: element.lv4_v3,
        lv4_v4: element.lv4_v4,
      ));
    }
    return tItVgTestModel;
  }
}
