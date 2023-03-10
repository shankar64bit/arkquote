import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/SC/sc_c_test_model.dart';
import '../../test_report_local_datasource.dart';

abstract class ScCLocalDatasource {
  Future<List<ScCTestModel>> getScCByTrNo(int trNo);
  Future<ScCTestModel> getScCById(int id);
  Future<void> localScC(ScCTestModel scCTestModel);
  Future<void> updateScC(ScCTestModel scCToUpdate, int id);
  Future<int> deleteScCById(int id);
  Future<List<ScCTestModel>> getScCBySerialNo(String serialNo);
  Future<List<ScCTestModel>> getScCEquipmentList();
}

@DataClassName('ScCLocalData')
class ScCLocalDatasourceImpl extends Table implements ScCLocalDatasource {
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
  RealColumn get rA => real()();
  @required
  RealColumn get rB => real()();
  @required
  RealColumn get yA => real()();
  @required
  RealColumn get yB => real()();
  @required
  RealColumn get bA => real()();
  @required
  RealColumn get bB => real()();

  @override
  Future<ScCTestModel> getScCById(int id) async {
    ScCLocalData tScCData = await sl<AppDatabase>().getScCLocalDataWithId(id);

    ScCTestModel tScCTestModel = ScCTestModel(
      databaseID: tScCData.databaseID,
      id: tScCData.id,
      rA: tScCData.rA,
      rB: tScCData.rB,
      yA: tScCData.yA,
      yB: tScCData.yB,
      bA: tScCData.bA,
      bB: tScCData.bB,
      trNo: tScCData.trNo,
      serialNo: tScCData.serialNo,
      EquipmentType: tScCData.EquipmentType,
      lastUpdated: tScCData.lastUpdated,
    );

    return tScCTestModel;
  }

  @override
  Future<List<ScCTestModel>> getScCByTrNo(int trNo) async {
    final tScCData = await sl<AppDatabase>().getScCLocalDataWithTrNo(trNo);
    List<ScCTestModel> tScCTestModel = List<ScCTestModel>.empty(growable: true);

    for (var element in tScCData) {
      tScCTestModel.add(ScCTestModel(
        id: element.id,
        databaseID: element.databaseID,
        rA: element.rA,
        rB: element.rB,
        yA: element.yA,
        yB: element.yB,
        bA: element.bA,
        bB: element.bB,
        trNo: element.trNo,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tScCTestModel;
  }

  @override
  Future<List<ScCTestModel>> getScCEquipmentList() async {
    final tScCData = await sl<AppDatabase>().getScCEquipmentList();
    List<ScCTestModel> tScCTestModel = List<ScCTestModel>.empty(growable: true);
    for (var element in tScCData) {
      tScCTestModel.add(ScCTestModel(
        id: element.id,
        rA: element.rA,
        rB: element.rB,
        yA: element.yA,
        yB: element.yB,
        bA: element.bA,
        bB: element.bB,
        EquipmentType: element.EquipmentType,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        trNo: element.trNo,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tScCTestModel;
  }

  @override
  Future<List<ScCTestModel>> getScCBySerialNo(String serialNo) async {
    final tScCData =
        await sl<AppDatabase>().getScCLocalDataWithSerialNo(serialNo);
    List<ScCTestModel> tScCTestModel = List<ScCTestModel>.empty(growable: true);
    for (var element in tScCData) {
      tScCTestModel.add(ScCTestModel(
        id: element.id,
        rA: element.rA,
        rB: element.rB,
        yA: element.yA,
        yB: element.yB,
        bA: element.bA,
        bB: element.bB,
        trNo: element.trNo,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        EquipmentType: element.EquipmentType,
        lastUpdated: element.lastUpdated,
      ));
    }
    return tScCTestModel;
  }

  @override
  Future<int> localScC(ScCTestModel scCTestModel) {
    return (sl<AppDatabase>().createScC(scCTestModel));
  }

  @override
  Future<void> updateScC(ScCTestModel scCToUpdate, int id) async {
    sl<AppDatabase>().updateScC(scCToUpdate, id);
  }

  @override
  Future<int> deleteScCById(int id) {
    return (sl<AppDatabase>().deleteScCById(id));
  }
}
