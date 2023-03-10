import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/EE/ee_model.dart';

abstract class EELocalDatasource {
  Future<List<EEModel>> getEEByTrNo(int trNo);
  Future<EEModel> getEEById(int id);
  Future<int> localEE(EEModel eetolocal, DateTime dateOfTesting);
  Future<void> updateEE(EEModel eetoupdate, int id);
  Future<int> deleteEEById(int id);
  Future<List> getEELocalDataList();
}

@DataClassName('EELocalData')
class EELocalDatasourceImpl extends Table implements EELocalDatasource {
  @required
  DateTimeColumn get lastUpdated =>
      dateTime().withDefault(Constant(DateTime.now()))();
  @required
  TextColumn get TestedBy => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get VerifiedBy => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get WitnessedBy => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get databaseID => integer()();
  // autoIncrement automatically sets this to be the primary key
  @required
  IntColumn get id => integer().autoIncrement()();
  // If the length constraint is not fulfilled, the Task will not
  // be inserted into the database and an exception will be thrown.
  @required
  TextColumn get etype => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get trNo => integer()();
  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds
  @required
  DateTimeColumn get dateOfTesting =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<int> deleteEEById(int id) {
    return (sl<AppDatabase>().deleteEEById(id));
  }

  @override
  Future<EEModel> getEEById(int id) async {
    EELocalData tEEData = await sl<AppDatabase>().getEELocalDataWithId(id);

    EEModel tEEModel = EEModel(
      etype: tEEData.etype,
      databaseID: tEEData.databaseID,
      trNo: tEEData.trNo,
      dateOfTesting: tEEData.dateOfTesting,
      id: tEEData.id,
      TestedBy: tEEData.TestedBy,
      VerifiedBy: tEEData.VerifiedBy,
      WitnessedBy: tEEData.WitnessedBy,
      lastUpdated: tEEData.lastUpdated,
    );

    return tEEModel;
  }

  @override
  Future<List<EEModel>> getEEByTrNo(int trNo) async {
    final tEEData = await sl<AppDatabase>().getEELocalDataWithtrNo(trNo);

    List<EEModel> tEEModel = List<EEModel>.empty(growable: true);
    for (var element in tEEData) {
      tEEModel.add(EEModel(
        etype: element.etype,
        databaseID: element.databaseID,
        trNo: element.trNo,
        dateOfTesting: element.dateOfTesting,
        id: element.id,
        TestedBy: element.TestedBy,
        VerifiedBy: element.VerifiedBy,
        WitnessedBy: element.WitnessedBy,
        lastUpdated: element.lastUpdated,
      ));
    }

    return tEEModel;
  }

  @override
  Future<int> localEE(EEModel eetolocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createEE(eetolocal, dateOfTesting));
  }

  @override
  Future<void> updateEE(EEModel eetoupdate, int id) async {
    sl<AppDatabase>().updateEE(eetoupdate, id);
  }

  @override
  Future<List<EEModel>> getEELocalDataList() async {
    final tEEDataList = await sl<AppDatabase>().getEELocalDataList();
    List<EEModel> tEEDataModel = List<EEModel>.empty(growable: true);

    for (var listEle in tEEDataList) {
      tEEDataModel.add(EEModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        TestedBy: listEle.TestedBy,
        VerifiedBy: listEle.VerifiedBy,
        WitnessedBy: listEle.WitnessedBy,
        dateOfTesting: listEle.dateOfTesting,
        etype: listEle.etype,
        trNo: listEle.trNo,
        lastUpdated: listEle.lastUpdated,
      ));
    }
    return tEEDataModel;
  }
}
