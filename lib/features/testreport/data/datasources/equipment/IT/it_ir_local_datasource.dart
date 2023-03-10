// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/IT/it_ir_model.dart';
import '../../test_report_local_datasource.dart';
// import '../../../../../../injection_container.dart';
// import '../../test_report_local_datasource.dart';

abstract class ItIrLocalDatasource {
  Future<List<ItIrTestModel>> getItIrByTrNo(int trNo);
  Future<ItIrTestModel> getItIrById(int id);
  Future<int> localItIr(ItIrTestModel itIrTestModel);
  Future<void> updateItIr(ItIrTestModel itIrToUpdate, int id);
  Future<int> deleteItIrById(int id);
  Future<List<ItIrTestModel>> getItIrBySerialNo(String serialNo);
  Future<List<ItIrTestModel>> getItIrEquipmentList();
}

@DataClassName('ItIrLocalData')
class ItIrLocalDatasourceImpl extends Table implements ItIrLocalDatasource {
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
  RealColumn get hvE_60 => real()();
  @required
  RealColumn get hvE_600 => real()();
  @required
  RealColumn get hvLv1_60 => real()();
  @required
  RealColumn get hvLv1_600 => real()();
  @required
  RealColumn get hvLv2_60 => real()();
  @required
  RealColumn get hvLv2_600 => real()();
  @required
  RealColumn get hvLv3_60 => real()();
  @required
  RealColumn get hvLv3_600 => real()();
  @required
  RealColumn get hvLv4_60 => real()();
  @required
  RealColumn get hvLv4_600 => real()();
  @required
  RealColumn get lv1E => real()();
  @required
  RealColumn get lv2E => real()();
  @required
  RealColumn get lv3E => real()();
  @required
  RealColumn get lv4E => real()();
  @required
  RealColumn get lv1Lv2 => real()();
  @required
  RealColumn get lv1Lv3 => real()();
  @required
  RealColumn get lv1Lv4 => real()();
  @required
  RealColumn get lv2Lv3 => real()();
  @required
  RealColumn get lv2Lv4 => real()();
  @required
  RealColumn get lv3Lv4 => real()();
  @required
  RealColumn get lv4Lv1 => real()();

  @override
  Future<ItIrTestModel> getItIrById(int id) async {
    ItIrLocalData tItIrLocalData =
        await sl<AppDatabase>().getItIrLocalDataWithId(id);
    ItIrTestModel tItIRModel = ItIrTestModel(
      id: tItIrLocalData.id,
      databaseID: tItIrLocalData.databaseID,
      trNo: tItIrLocalData.trNo,
      serialNo: tItIrLocalData.serialNo,
      equipmentUsed: tItIrLocalData.equipmentUsed,
      updateDate: tItIrLocalData.updateDate,
      hvE_60: tItIrLocalData.hvE_60,
      hvE_600: tItIrLocalData.hvE_600,
      hvLv1_60: tItIrLocalData.hvLv1_60,
      hvLv1_600: tItIrLocalData.hvLv1_600,
      hvLv2_60: tItIrLocalData.hvLv2_60,
      hvLv2_600: tItIrLocalData.hvLv2_600,
      hvLv3_60: tItIrLocalData.hvLv3_60,
      hvLv3_600: tItIrLocalData.hvLv3_600,
      hvLv4_60: tItIrLocalData.hvLv4_60,
      hvLv4_600: tItIrLocalData.hvLv4_600,
      lv1E: tItIrLocalData.lv1E,
      lv2E: tItIrLocalData.lv2E,
      lv3E: tItIrLocalData.lv3E,
      lv4E: tItIrLocalData.lv4E,
      lv1Lv2: tItIrLocalData.lv1Lv2,
      lv1Lv3: tItIrLocalData.lv1Lv3,
      lv1Lv4: tItIrLocalData.lv1Lv4,
      lv2Lv3: tItIrLocalData.lv2Lv3,
      lv2Lv4: tItIrLocalData.lv2Lv4,
      lv3Lv4: tItIrLocalData.lv3Lv4,
      lv4Lv1: tItIrLocalData.lv4Lv1,
    );
    return tItIRModel;
  }

  @override
  Future<int> localItIr(ItIrTestModel itIrTestModel) {
    return (sl<AppDatabase>().createItIr(itIrTestModel));
  }

  @override
  Future<void> updateItIr(ItIrTestModel itIrToUpdate, int id) async {
    sl<AppDatabase>().updateItIr(itIrToUpdate, id);
  }

  @override
  Future<int> deleteItIrById(int id) {
    return (sl<AppDatabase>().deleteItIrById(id));
  }

  @override
  Future<List<ItIrTestModel>> getItIrBySerialNo(String serialNo) async {
    final tItIrdata =
        await sl<AppDatabase>().getItIrLocalDataWithSerialNo(serialNo);

    List<ItIrTestModel> tItIrModel = List<ItIrTestModel>.empty(growable: true);
    for (var listEle in tItIrdata) {
      tItIrModel.add(ItIrTestModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        hvE_60: listEle.hvE_60,
        hvE_600: listEle.hvE_600,
        hvLv1_60: listEle.hvLv1_60,
        hvLv1_600: listEle.hvLv1_600,
        hvLv2_60: listEle.hvLv2_60,
        hvLv2_600: listEle.hvLv2_600,
        hvLv3_60: listEle.hvLv3_60,
        hvLv3_600: listEle.hvLv3_600,
        hvLv4_60: listEle.hvLv4_60,
        hvLv4_600: listEle.hvLv4_600,
        lv1E: listEle.lv1E,
        lv2E: listEle.lv2E,
        lv3E: listEle.lv3E,
        lv4E: listEle.lv4E,
        lv1Lv2: listEle.lv1Lv2,
        lv1Lv3: listEle.lv1Lv3,
        lv1Lv4: listEle.lv1Lv4,
        lv2Lv3: listEle.lv2Lv3,
        lv2Lv4: listEle.lv2Lv4,
        lv3Lv4: listEle.lv3Lv4,
        lv4Lv1: listEle.lv4Lv1,
      ));
    }
    return tItIrModel;
  }

  @override
  Future<List<ItIrTestModel>> getItIrByTrNo(int trNo) async {
    final tItIrData = await sl<AppDatabase>().getItIrLocalDataWithTrNo(trNo);
    List<ItIrTestModel> tItIrTestModel =
        List<ItIrTestModel>.empty(growable: true);

    for (var element in tItIrData) {
      tItIrTestModel.add(ItIrTestModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        equipmentUsed: element.equipmentUsed,
        updateDate: element.updateDate,
        hvE_60: element.hvE_60,
        hvE_600: element.hvE_600,
        hvLv1_60: element.hvLv1_60,
        hvLv1_600: element.hvLv1_600,
        hvLv2_60: element.hvLv2_60,
        hvLv2_600: element.hvLv2_600,
        hvLv3_60: element.hvLv3_60,
        hvLv3_600: element.hvLv3_600,
        hvLv4_60: element.hvLv4_60,
        hvLv4_600: element.hvLv4_600,
        lv1E: element.lv1E,
        lv2E: element.lv2E,
        lv3E: element.lv3E,
        lv4E: element.lv4E,
        lv1Lv2: element.lv1Lv2,
        lv1Lv3: element.lv1Lv3,
        lv1Lv4: element.lv1Lv4,
        lv2Lv3: element.lv2Lv3,
        lv2Lv4: element.lv2Lv4,
        lv3Lv4: element.lv3Lv4,
        lv4Lv1: element.lv4Lv1,
      ));
    }
    return tItIrTestModel;
  }

  @override
  Future<List<ItIrTestModel>> getItIrEquipmentList() async {
    final tItIrData = await sl<AppDatabase>().getItIrEquipmentListAll();
    List<ItIrTestModel> tItIrTestModel =
        List<ItIrTestModel>.empty(growable: true);
    for (var element in tItIrData) {
      tItIrTestModel.add(ItIrTestModel(
        id: element.id,
        hvE_60: element.hvE_60,
        hvE_600: element.hvE_600,
        hvLv1_60: element.hvLv1_60,
        hvLv1_600: element.hvLv1_600,
        hvLv2_60: element.hvLv2_60,
        hvLv2_600: element.hvLv2_600,
        hvLv3_60: element.hvLv3_60,
        hvLv3_600: element.hvLv3_600,
        hvLv4_60: element.hvLv4_60,
        hvLv4_600: element.hvLv4_600,
        lv1E: element.lv1E,
        lv2E: element.lv2E,
        lv3E: element.lv3E,
        lv4E: element.lv4E,
        lv1Lv2: element.lv1Lv2,
        lv1Lv3: element.lv1Lv3,
        lv1Lv4: element.lv1Lv4,
        lv2Lv3: element.lv2Lv3,
        lv2Lv4: element.lv2Lv4,
        lv3Lv4: element.lv3Lv4,
        lv4Lv1: element.lv4Lv1,
        equipmentUsed: element.equipmentUsed,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        updateDate: element.updateDate,
      ));
    }
    return tItIrTestModel;
  }
}
