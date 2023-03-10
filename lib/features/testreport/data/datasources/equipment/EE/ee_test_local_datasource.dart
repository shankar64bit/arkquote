import 'dart:math';

import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/EE/ee_test_model.dart';

import '../../../../../../injection_container.dart';
import '../../test_report_local_datasource.dart';

abstract class EETestLocalDatasource {
  Future<List<EETestModel>> getEETestByTrNo(int trNo);
  Future<EETestModel> getEETestById(int id);
  Future<void> localEETest(EETestModel eeTestToLocal);
  Future<void> updateEETest(EETestModel eeTestToUpdate, int id);
  Future<int> deleteEETestById(int id);
  Future<List<EETestModel>> getEETestByLocNo(int locNo);
  Future<List<EETestModel>> getEETestEquipmentList();
  // Future<List<EETestModel>> getTestedById(int id);
}

@DataClassName('EETestLocalData')
class EETestLocalDatasourceImpl extends Table implements EETestLocalDatasource {
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
  TextColumn get eeName => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get locNo => integer()();
  @required
  RealColumn get resistanceValue => real()();

  @override
  Future<EETestModel> getEETestById(int id) async {
    EETestLocalData tEETestData =
        await sl<AppDatabase>().getEETestLocalDataWithId(id);

    EETestModel tEETestModel = EETestModel(
      databaseID: tEETestData.databaseID,
      id: tEETestData.id,
      resistanceValue: tEETestData.resistanceValue,
      eeName: tEETestData.eeName,
      trNo: tEETestData.trNo,
      locNo: tEETestData.locNo,
      EquipmentType: tEETestData.EquipmentType,
      lastUpdated: tEETestData.lastUpdated,
    );

    return tEETestModel;
  }

  @override
  Future<List<EETestModel>> getEETestByTrNo(int trNo) async {
    final tEETestData =
        await sl<AppDatabase>().getEETestLocalDataWithTrNo(trNo);
    List<EETestModel> tEETestModel = List<EETestModel>.empty(growable: true);

    for (var element in tEETestData) {
      tEETestModel.add(EETestModel(
        id: element.id,
        databaseID: element.databaseID,
        resistanceValue: element.resistanceValue,
        locNo: element.locNo,
        trNo: element.trNo,
        eeName: element.eeName,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tEETestModel;
  }

  @override
  Future<List<EETestModel>> getEETestEquipmentList() async {
    final tEETestData = await sl<AppDatabase>().getEETestEquipmentList();
    List<EETestModel> tEETestModel = List<EETestModel>.empty(growable: true);
    for (var element in tEETestData) {
      tEETestModel.add(EETestModel(
        id: element.id,
        resistanceValue: element.resistanceValue,
        locNo: element.locNo,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        eeName: element.eeName,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tEETestModel;
  }

  @override
  Future<List<EETestModel>> getEETestByLocNo(int locNo) async {
    final tEETestData =
        await sl<AppDatabase>().getEETestLocalDataWithLocNo(locNo);
    List<EETestModel> tEETestModel = List<EETestModel>.empty(growable: true);
    for (var element in tEETestData) {
      tEETestModel.add(EETestModel(
        id: element.id,
        resistanceValue: element.resistanceValue,
        locNo: element.locNo,
        trNo: element.trNo,
        databaseID: element.databaseID,
        eeName: element.eeName,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tEETestModel;
  }

  @override
  Future<int> localEETest(EETestModel eeTestToLocal) {
    return (sl<AppDatabase>().createEETest(eeTestToLocal));
  }

  @override
  Future<void> updateEETest(EETestModel eeTestToUpdate, int id) async {
    sl<AppDatabase>().updateEETest(eeTestToUpdate, id);
  }

  @override
  Future<int> deleteEETestById(int id) {
    return (sl<AppDatabase>().deleteEETestById(id));
  }
}
