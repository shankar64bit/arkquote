import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/busbar/bb_model.dart';

abstract class BbLocalDatasource {
  Future<List<BbModel>> getBbByTrNo(int trNo);
  Future<BbModel> getBbById(int id);
  Future<int> localBb(BbModel bbtolocal, DateTime dateOfTesting);
  Future<void> updateBb(BbModel bbtoupdate, int id);
  Future<int> deleteBbById(int id);
  Future<List> getbbLocalDataList();
}

@DataClassName('BbLocalData')
class BbLocalDatasourceImpl extends Table implements BbLocalDatasource {
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
  TextColumn get panel => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get rating => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get noOfBar => integer()();

  @required
  IntColumn get trNo => integer()();
  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds
  @required
  DateTimeColumn get dateOfTesting =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<int> deleteBbById(int id) {
    return (sl<AppDatabase>().deleteBbById(id));
  }

  @override
  Future<BbModel> getBbById(int id) async {
    BbLocalData tBbData = await sl<AppDatabase>().getBbLocalDataWithId(id);

    BbModel tBbModel = BbModel(
      etype: tBbData.etype,
      databaseID: tBbData.databaseID,
      designation: tBbData.designation,
      location: tBbData.location,
      rating: tBbData.rating,
      noOfBar: tBbData.noOfBar,
      panel: tBbData.panel,
      trNo: tBbData.trNo,
      dateOfTesting: tBbData.dateOfTesting,
      id: tBbData.id,
      TestedBy: tBbData.TestedBy,
      VerifiedBy: tBbData.VerifiedBy,
      WitnessedBy: tBbData.WitnessedBy,
      lastUpdated: tBbData.lastUpdated,
    );

    return tBbModel;
  }

  @override
  Future<List<BbModel>> getBbByTrNo(int trNo) async {
    final tBbData = await sl<AppDatabase>().getBbLocalDataWithtrNo(trNo);

    List<BbModel> tBbModel = List<BbModel>.empty(growable: true);
    for (var element in tBbData) {
      tBbModel.add(BbModel(
        etype: element.etype,
        databaseID: element.databaseID,
        designation: element.designation,
        location: element.location,
        rating: element.rating,
        panel: element.panel,
        noOfBar: element.noOfBar,
        trNo: element.trNo,
        dateOfTesting: element.dateOfTesting,
        id: element.id,
        TestedBy: element.TestedBy,
        VerifiedBy: element.VerifiedBy,
        WitnessedBy: element.WitnessedBy,
        lastUpdated: element.lastUpdated,
      ));
    }

    return tBbModel;
  }

  @override
  Future<int> localBb(BbModel bbtolocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createBb(bbtolocal, dateOfTesting));
  }

  @override
  Future<void> updateBb(BbModel bbtoupdate, int id) async {
    sl<AppDatabase>().updateBb(bbtoupdate, id);
  }

  @override
  Future<List<BbModel>> getbbLocalDataList() async {
    final tBbDataList = await sl<AppDatabase>().getBbLocalDataList();
    List<BbModel> tBbDataModel = List<BbModel>.empty(growable: true);

    for (var listEle in tBbDataList) {
      tBbDataModel.add(BbModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        TestedBy: listEle.TestedBy,
        VerifiedBy: listEle.VerifiedBy,
        WitnessedBy: listEle.WitnessedBy,
        dateOfTesting: listEle.dateOfTesting,
        designation: listEle.designation,
        etype: listEle.etype,
        location: listEle.location,
        rating: listEle.rating,
        panel: listEle.panel,
        trNo: listEle.trNo,
        noOfBar: listEle.noOfBar,
        lastUpdated: listEle.lastUpdated,
      ));
    }
    return tBbDataModel;
  }
}
