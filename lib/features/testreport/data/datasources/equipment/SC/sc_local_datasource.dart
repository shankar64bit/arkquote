import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/SC/sc_model.dart';

abstract class ScLocalDatasource {
  Future<List<ScModel>> getScByTrNo(int trNo);
  Future<ScModel> getScById(int id);
  Future<List<ScModel>> getScLocalDataList();
  Future<int> localSc(ScModel sctolocal, DateTime dateOfTesting);
  Future<void> updateSc(ScModel sctoupdate, int id);
  Future<int> deleteScById(int id);
}

@DataClassName('ScLocalData')
class ScLocalDatasourceImpl extends Table implements ScLocalDatasource {
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
  TextColumn get designation => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get location => text().withLength(min: 1, max: 50)();

  @required
  TextColumn get make => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get EquipmentType => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get yom => integer()();

  @required
  IntColumn get trNo => integer()();
  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds
  @required
  DateTimeColumn get dateOfTesting =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<int> deleteScById(int id) {
    return (sl<AppDatabase>().deleteScById(id));
  }

  @override
  Future<ScModel> getScById(int id) async {
    ScLocalData tScData = await sl<AppDatabase>().getScLocalDataWithId(id);

    ScModel tScModel = ScModel(
      etype: tScData.etype,
      databaseID: tScData.databaseID,
      designation: tScData.designation,
      location: tScData.location,
      make: tScData.make,
      equipType: tScData.EquipmentType,
      serialNo: tScData.serialNo,
      yom: tScData.yom,
      trNo: tScData.trNo,
      dateOfTesting: tScData.dateOfTesting,
      id: tScData.id,
      TestedBy: tScData.TestedBy,
      VerifiedBy: tScData.VerifiedBy,
      WitnessedBy: tScData.WitnessedBy,
      lastUpdated: tScData.lastUpdated,
    );

    return tScModel;
  }

  @override
  Future<List<ScModel>> getScByTrNo(int trNo) async {
    final tScData = await sl<AppDatabase>().getScLocalDataWithtrNo(trNo);

    List<ScModel> tScModel = List<ScModel>.empty(growable: true);
    for (var element in tScData) {
      tScModel.add(ScModel(
        etype: element.etype,
        databaseID: element.databaseID,
        designation: element.designation,
        location: element.location,
        make: element.make,
        equipType: element.EquipmentType,
        serialNo: element.serialNo,
        yom: element.yom,
        trNo: element.trNo,
        dateOfTesting: element.dateOfTesting,
        id: element.id,
        TestedBy: element.TestedBy,
        VerifiedBy: element.VerifiedBy,
        WitnessedBy: element.WitnessedBy,
        lastUpdated: element.lastUpdated,
      ));
    }

    return tScModel;
  }

  @override
  Future<int> localSc(ScModel sctolocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createSc(sctolocal, dateOfTesting));
  }

  @override
  Future<void> updateSc(ScModel sctoupdate, int id) async {
    sl<AppDatabase>().updateSc(sctoupdate, id);
  }

  @override
  Future<List<ScModel>> getScLocalDataList() async {
    final tScDataList = await sl<AppDatabase>().getScLocalDataList();
    List<ScModel> tScDataModel = List<ScModel>.empty(growable: true);

    for (var listEle in tScDataList) {
      tScDataModel.add(ScModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        TestedBy: listEle.TestedBy,
        VerifiedBy: listEle.VerifiedBy,
        WitnessedBy: listEle.WitnessedBy,
        dateOfTesting: listEle.dateOfTesting,
        designation: listEle.designation,
        etype: listEle.etype,
        location: listEle.location,
        make: listEle.make,
        serialNo: listEle.serialNo,
        trNo: listEle.trNo,
        equipType: listEle.EquipmentType,
        yom: listEle.yom,
        lastUpdated: listEle.lastUpdated,
      ));
    }
    return tScDataModel;
  }
}
