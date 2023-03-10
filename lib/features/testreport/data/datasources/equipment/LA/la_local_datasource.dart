import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/LA/la_model.dart';
import '../../test_report_local_datasource.dart';

abstract class LaLocalDatasource {
  Future<List<LaModel>> getLaByTrNo(int trNo);
  Future<LaModel> getLaById(int id);
  Future<int> localLa(LaModel latolocal, DateTime dateOfTesting);
  Future<void> updateLa(LaModel latoupdate, int id);
  Future<int> deleteLaById(int id);
  Future<List<LaModel>> getLaLocalDataList();
}

@DataClassName('LaLocalData')
class LaLocalDatasourceImpl extends Table implements LaLocalDatasource {
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
  TextColumn get rating => text().withLength(min: 1, max: 50)();
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
  Future<int> deleteLaById(int id) {
    return (sl<AppDatabase>().deleteLaById(id));
  }

  @override
  Future<LaModel> getLaById(int id) async {
    LaLocalData tLaData = await sl<AppDatabase>().getLaLocalDataWithId(id);

    LaModel tLaModel = LaModel(
      etype: tLaData.etype,
      databaseID: tLaData.databaseID,
      designation: tLaData.designation,
      location: tLaData.location,
      rating: tLaData.rating,
      make: tLaData.make,
      equipType: tLaData.EquipmentType,
      serialNo: tLaData.serialNo,
      yom: tLaData.yom,
      trNo: tLaData.trNo,
      dateOfTesting: tLaData.dateOfTesting,
      id: tLaData.id,
      TestedBy: tLaData.TestedBy,
      VerifiedBy: tLaData.VerifiedBy,
      WitnessedBy: tLaData.WitnessedBy,
      lastUpdated: tLaData.lastUpdated,
    );

    return tLaModel;
  }

  @override
  Future<List<LaModel>> getLaByTrNo(int trNo) async {
    final tLaData = await sl<AppDatabase>().getLaLocalDataWithtrNo(trNo);

    List<LaModel> tLaModel = List<LaModel>.empty(growable: true);
    for (var element in tLaData) {
      tLaModel.add(LaModel(
        etype: element.etype,
        databaseID: element.databaseID,
        designation: element.designation,
        location: element.location,
        rating: element.rating,
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

    return tLaModel;
  }

  @override
  Future<int> localLa(LaModel latolocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createLa(latolocal, dateOfTesting));
  }

  @override
  Future<void> updateLa(LaModel latoupdate, int id) async {
    sl<AppDatabase>().updateLa(latoupdate, id);
  }

  @override
  Future<List<LaModel>> getLaLocalDataList() async {
    final tLaDataList = await sl<AppDatabase>().getLaLocalDataList();
    List<LaModel> tLaDataModel = List<LaModel>.empty(growable: true);

    for (var listEle in tLaDataList) {
      tLaDataModel.add(LaModel(
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
        rating: listEle.rating,
        serialNo: listEle.serialNo,
        trNo: listEle.trNo,
        equipType: listEle.EquipmentType,
        yom: listEle.yom,
        lastUpdated: listEle.lastUpdated,
      ));
    }
    return tLaDataModel;
  }
}
