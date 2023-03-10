import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/isolator/iso_model.dart';

abstract class IsoLocalDatasource {
  Future<List<IsoModel>> getIsoByTrNo(int trNo);
  Future<IsoModel> getIsoById(int id);
  Future<int> localIso(IsoModel isotolocal, DateTime dateOfTesting);
  Future<void> updateIso(IsoModel isotoupdate, int id);
  Future<int> deleteIsoById(int id);
  Future<List> getISOLocalDataList();
}

@DataClassName('IsoLocalData')
class IsoLocalDatasourceImpl extends Table implements IsoLocalDatasource {
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
  Future<int> deleteIsoById(int id) {
    return (sl<AppDatabase>().deleteIsoById(id));
  }

  @override
  Future<IsoModel> getIsoById(int id) async {
    IsoLocalData tIsoData = await sl<AppDatabase>().getIsoLocalDataWithId(id);

    IsoModel tIsoModel = IsoModel(
      etype: tIsoData.etype,
      databaseID: tIsoData.databaseID,
      designation: tIsoData.designation,
      location: tIsoData.location,
      rating: tIsoData.rating,
      make: tIsoData.make,
      equipType: tIsoData.EquipmentType,
      serialNo: tIsoData.serialNo,
      yom: tIsoData.yom,
      trNo: tIsoData.trNo,
      dateOfTesting: tIsoData.dateOfTesting,
      id: tIsoData.id,
      TestedBy: tIsoData.TestedBy,
      VerifiedBy: tIsoData.VerifiedBy,
      WitnessedBy: tIsoData.WitnessedBy,
      lastUpdated: tIsoData.lastUpdated,
    );

    return tIsoModel;
  }

  @override
  Future<List<IsoModel>> getIsoByTrNo(int trNo) async {
    final tIsoData = await sl<AppDatabase>().getIsoLocalDataWithtrNo(trNo);

    List<IsoModel> tIsoModel = List<IsoModel>.empty(growable: true);
    for (var element in tIsoData) {
      tIsoModel.add(IsoModel(
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

    return tIsoModel;
  }

  @override
  Future<int> localIso(IsoModel isotolocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createIso(isotolocal, dateOfTesting));
  }

  @override
  Future<void> updateIso(IsoModel isotoupdate, int id) async {
    sl<AppDatabase>().updateIso(isotoupdate, id);
  }

  @override
  Future<List<IsoModel>> getISOLocalDataList() async {
    final tIsoDataList = await sl<AppDatabase>().getIsoLocalDataList();
    List<IsoModel> tIsoDataModel = List<IsoModel>.empty(growable: true);

    for (var listEle in tIsoDataList) {
      tIsoDataModel.add(IsoModel(
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
    return tIsoDataModel;
  }
}
