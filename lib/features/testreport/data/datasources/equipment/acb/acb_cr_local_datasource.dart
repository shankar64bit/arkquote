import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/acb/acb_cr_test_model.dart';

abstract class AcbCRLocalDatasource {
  Future<List<AcbCRTestModel>> getAcbCRByTrNo(int trNo);
  Future<List<AcbCRTestModel>> getAcbCRBySerialNo(String serialNo);
  Future<List<AcbCRTestModel>> getAcbCrEquipmentLists();
  Future<AcbCRTestModel> getAcbCRById(int id);
  Future<void> localAcbCR(AcbCRTestModel acbCRtoLocal);
  Future<void> updateAcbCR(AcbCRTestModel acbCRToUpdate, int id);
  Future<int> deleteAcbCRById(int id);
}

@DataClassName('AcbCRLocalData')
class AcbCRLocalDatasourceImpl extends Table implements AcbCRLocalDatasource {
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
  RealColumn get motorCoil => real()();
  @required
  RealColumn get closeCoil => real()();
  @required
  RealColumn get tripCoil => real()();
  @required
  DateTimeColumn get lastUpdated =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<int> deleteAcbCRById(int id) {
    return (sl<AppDatabase>().deleteAcbCRById(id));
  }

  @override
  Future<AcbCRTestModel> getAcbCRById(int id) async {
    AcbCRLocalData tAcbCRData =
        await sl<AppDatabase>().getAcbCRLocalDataWithId(id);

    AcbCRTestModel tAcbCRTestModel = AcbCRTestModel(
      id: tAcbCRData.id,
      databaseID: tAcbCRData.databaseID,
      trNo: tAcbCRData.trNo,
      serialNo: tAcbCRData.serialNo,
      lastUpdated: tAcbCRData.lastUpdated,
      closeCoil: tAcbCRData.closeCoil,
      motorCoil: tAcbCRData.motorCoil,
      tripCoil: tAcbCRData.tripCoil,
      EquipmentType: tAcbCRData.EquipmentType,
    );

    return tAcbCRTestModel;
  }

  @override
  Future<List<AcbCRTestModel>> getAcbCRByTrNo(int trNo) async {
    final tAcbCRData = await sl<AppDatabase>().getAcbCRLocalDataWithTrNo(trNo);
    List<AcbCRTestModel> tAcbCRTestModel =
        List<AcbCRTestModel>.empty(growable: true);
    for (var element in tAcbCRData) {
      tAcbCRTestModel.add(AcbCRTestModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        lastUpdated: element.lastUpdated,
        closeCoil: element.closeCoil,
        motorCoil: element.motorCoil,
        tripCoil: element.tripCoil,
        EquipmentType: element.EquipmentType,
      ));
    }
    return tAcbCRTestModel;
  }

  @override
  Future<int> localAcbCR(AcbCRTestModel acbCRtoLocal) {
    return (sl<AppDatabase>().createAcbCR(acbCRtoLocal));
  }

  @override
  Future<void> updateAcbCR(AcbCRTestModel acbCRToUpdate, int id) async {
    sl<AppDatabase>().updateAcbCR(acbCRToUpdate, id);
  }

  @override
  Future<List<AcbCRTestModel>> getAcbCRBySerialNo(String serialNo) async {
    final tAcbCRData =
        await sl<AppDatabase>().getAcbCRLocalDataWithSerialNo(serialNo);
    List<AcbCRTestModel> tAcbCRTestModel =
        List<AcbCRTestModel>.empty(growable: true);
    for (var element in tAcbCRData) {
      tAcbCRTestModel.add(AcbCRTestModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        lastUpdated: element.lastUpdated,
        closeCoil: element.closeCoil,
        motorCoil: element.motorCoil,
        tripCoil: element.tripCoil,
        EquipmentType: element.EquipmentType,
      ));
    }
    return tAcbCRTestModel;
  }

  @override
  Future<List<AcbCRTestModel>> getAcbCrEquipmentLists() async {
    final tAcbCrData = await sl<AppDatabase>().getAcbCrEquipmentListwithAll();
    List<AcbCRTestModel> tAcbCrTestModel =
        List<AcbCRTestModel>.empty(growable: true);
    for (var element in tAcbCrData) {
      tAcbCrTestModel.add(AcbCRTestModel(
        id: element.id,
        closeCoil: element.closeCoil,
        motorCoil: element.motorCoil,
        tripCoil: element.tripCoil,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tAcbCrTestModel;
  }
}
