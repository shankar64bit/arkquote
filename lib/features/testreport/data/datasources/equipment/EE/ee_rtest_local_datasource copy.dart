import 'dart:math';
import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/EE/ee_r_test_model.dart';
import '../../test_report_local_datasource.dart';

abstract class EERTestLocalDatasource {
  Future<List<EERTestModel>> getEERTestByTrNo(int trNo);
  Future<EERTestModel> getEERTestById(int id);
  Future<void> localEERTest(EERTestModel eeLoctoLocal);
  Future<void> updateEERTest(EERTestModel eeLoctoUpdate, int id);
  Future<int> deleteEERTestById(int id);
  Future<List<EERTestModel>> getEERTestByLocNo(int locNo);
  Future<List<EERTestModel>> getEERTestEquipmentList();
  // Future<List<EERTestModel>> getTestedById(int id);
}

@DataClassName('EERTestLocalData')
class EERTestLocalDatasourceImpl extends Table
    implements EERTestLocalDatasource {
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
  RealColumn get resistanceValue_BR => real()();
  @required
  RealColumn get resistanceValue_AR => real()();

  @override
  Future<EERTestModel> getEERTestById(int id) async {
    EERTestLocalData tEERTestData =
        await sl<AppDatabase>().getEERTestLocalDataWithId(id);

    EERTestModel tEERTestModel = EERTestModel(
      databaseID: tEERTestData.databaseID,
      id: tEERTestData.id,
      resistanceValue_BR: tEERTestData.resistanceValue_BR,
      resistanceValue_AR: tEERTestData.resistanceValue_AR,
      eeName: tEERTestData.eeName,
      trNo: tEERTestData.trNo,
      locNo: tEERTestData.locNo,
      EquipmentType: tEERTestData.EquipmentType,
      lastUpdated: tEERTestData.lastUpdated,
    );

    return tEERTestModel;
  }

  @override
  Future<List<EERTestModel>> getEERTestByTrNo(int trNo) async {
    final tEERTestData =
        await sl<AppDatabase>().getEERTestLocalDataWithTrNo(trNo);
    List<EERTestModel> tEERTestModel = List<EERTestModel>.empty(growable: true);

    for (var element in tEERTestData) {
      tEERTestModel.add(EERTestModel(
        id: element.id,
        databaseID: element.databaseID,
        resistanceValue_AR: element.resistanceValue_AR,
        resistanceValue_BR: element.resistanceValue_BR,
        locNo: element.locNo,
        trNo: element.trNo,
        eeName: element.eeName,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tEERTestModel;
  }

  @override
  Future<List<EERTestModel>> getEERTestEquipmentList() async {
    final tEERTestData = await sl<AppDatabase>().getEERTestEquipmentList();
    List<EERTestModel> tEERTestModel = List<EERTestModel>.empty(growable: true);
    for (var element in tEERTestData) {
      tEERTestModel.add(EERTestModel(
        id: element.id,
        resistanceValue_AR: element.resistanceValue_AR,
        resistanceValue_BR: element.resistanceValue_BR,
        locNo: element.locNo,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        eeName: element.eeName,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tEERTestModel;
  }

  @override
  Future<List<EERTestModel>> getEERTestByLocNo(int locNo) async {
    final tEERTestData =
        await sl<AppDatabase>().getEERTestLocalDataWithLocNo(locNo);
    List<EERTestModel> tEERTestModel = List<EERTestModel>.empty(growable: true);
    for (var element in tEERTestData) {
      tEERTestModel.add(EERTestModel(
        id: element.id,
        resistanceValue_AR: element.resistanceValue_AR,
        resistanceValue_BR: element.resistanceValue_BR,
        locNo: element.locNo,
        trNo: element.trNo,
        databaseID: element.databaseID,
        eeName: element.eeName,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tEERTestModel;
  }

  @override
  Future<int> localEERTest(EERTestModel eeLoctoLocal) {
    return (sl<AppDatabase>().createEERTest(eeLoctoLocal));
  }

  @override
  Future<void> updateEERTest(EERTestModel eeLoctoUpdate, int id) async {
    sl<AppDatabase>().updateEERTest(eeLoctoUpdate, id);
  }

  @override
  Future<int> deleteEERTestById(int id) {
    return (sl<AppDatabase>().deleteEERTestById(id));
  }

  // @override
  // Future<List<EERTestModel>> getTestedById(int id) {
  //   // TODO: implement getTestedById
  //   throw UnimplementedError();
  // }
}
