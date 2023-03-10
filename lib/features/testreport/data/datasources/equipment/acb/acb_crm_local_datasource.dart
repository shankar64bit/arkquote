import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/acb/acb_crm_test_model.dart';

abstract class AcbCrmLocalDatasource {
  Future<List<AcbCrmTestModel>> getAcbCrmByTrNo(int trNo);
  Future<List<AcbCrmTestModel>> getAcbCrmBySerialNo(String serialNo);
  Future<AcbCrmTestModel> getAcbCrmById(int id);
  Future<void> localAcbCrm(AcbCrmTestModel acbCrmToLocal);
  Future<void> updateAcbCrm(AcbCrmTestModel acbCrmToUpdate, int id);
  Future<List<AcbCrmTestModel>> getAcbCrmEquipmentLists();
  Future<int> deleteAcbCrmById(int id);
}

@DataClassName('AcbCrmLocalData')
class AcbCrmLocalDatasourceImpl extends Table implements AcbCrmLocalDatasource {
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
  RealColumn get rR => real()();
  @required
  RealColumn get yY => real()();
  @required
  RealColumn get bB => real()();
  @required
  RealColumn get nN => real()();

  @override
  Future<int> deleteAcbCrmById(int id) {
    return (sl<AppDatabase>().deleteAcbCrmById(id));
  }

  @override
  Future<AcbCrmTestModel> getAcbCrmById(int id) async {
    AcbCrmLocalData tAcbCrmData =
        await sl<AppDatabase>().getAcbCrmLocalDataWithId(id);

    AcbCrmTestModel tAcbCrmTestModel = AcbCrmTestModel(
      id: tAcbCrmData.id,
      databaseID: tAcbCrmData.databaseID,
      rR: tAcbCrmData.rR,
      yY: tAcbCrmData.yY,
      bB: tAcbCrmData.bB,
      nN: tAcbCrmData.nN,
      trNo: tAcbCrmData.trNo,
      serialNo: tAcbCrmData.serialNo,
      EquipmentType: tAcbCrmData.EquipmentType,
      lastUpdated: tAcbCrmData.lastUpdated,
    );

    return tAcbCrmTestModel;
  }

  @override
  Future<List<AcbCrmTestModel>> getAcbCrmByTrNo(int trNo) async {
    final tAcbCrmData =
        await sl<AppDatabase>().getAcbCrmLocalDataWithTrNo(trNo);
    List<AcbCrmTestModel> tAcbCrmTestModel =
        List<AcbCrmTestModel>.empty(growable: true);
    for (var element in tAcbCrmData) {
      tAcbCrmTestModel.add(AcbCrmTestModel(
        id: element.id,
        databaseID: element.databaseID,
        rR: element.rR,
        yY: element.yY,
        bB: element.bB,
        nN: element.nN,
        trNo: element.trNo,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tAcbCrmTestModel;
  }

  @override
  Future<List<AcbCrmTestModel>> getAcbCrmEquipmentLists() async {
    final tAcbCrmData = await sl<AppDatabase>().getAcbCrmEquipmentListwithAll();
    List<AcbCrmTestModel> tAcbCrmTestModel =
        List<AcbCrmTestModel>.empty(growable: true);
    for (var element in tAcbCrmData) {
      tAcbCrmTestModel.add(AcbCrmTestModel(
        bB: element.bB,
        id: element.id,
        nN: element.nN,
        rR: element.rR,
        yY: element.yY,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tAcbCrmTestModel;
  }

  @override
  Future<int> localAcbCrm(AcbCrmTestModel acbCrmToLocal) {
    return (sl<AppDatabase>().createAcbCrm(acbCrmToLocal));
  }

  @override
  Future<void> updateAcbCrm(AcbCrmTestModel acbCrmToUpdate, int id) async {
    sl<AppDatabase>().updateAcbCrm(acbCrmToUpdate, id);
  }

  @override
  Future<List<AcbCrmTestModel>> getAcbCrmBySerialNo(String serialNo) async {
    final tAcbCrmData =
        await sl<AppDatabase>().getAcbCrmLocalDataWithSerialNo(serialNo);
    List<AcbCrmTestModel> tAcbCrmTestModel =
        List<AcbCrmTestModel>.empty(growable: true);
    for (var element in tAcbCrmData) {
      tAcbCrmTestModel.add(AcbCrmTestModel(
        id: element.id,
        databaseID: element.databaseID,
        rR: element.rR,
        yY: element.yY,
        bB: element.bB,
        nN: element.nN,
        trNo: element.trNo,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tAcbCrmTestModel;
  }
}
