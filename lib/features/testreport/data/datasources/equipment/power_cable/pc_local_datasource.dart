import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/power_cable/pc_model.dart';

abstract class PcLocalDatasource {
  Future<List<PcModel>> getPcByTrNo(int trNo);
  Future<PcModel> getPcById(int id);
  Future<List<PcModel>> getPcLocalDataList();
  Future<int> localPc(PcModel pctolocal, DateTime dateOfTesting);
  Future<void> updatePc(PcModel pctoupdate, int id);
  Future<int> deletePcById(int id);
}

@DataClassName('PcLocalData')
class PcLocalDatasourceImpl extends Table implements PcLocalDatasource {
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
  TextColumn get make => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get size => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get length => text().withLength(min: 1, max: 50)();

  @required
  IntColumn get trNo => integer()();
  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds
  @required
  DateTimeColumn get dateOfTesting =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<int> deletePcById(int id) {
    return (sl<AppDatabase>().deletePcById(id));
  }

  @override
  Future<PcModel> getPcById(int id) async {
    PcLocalData tPcData = await sl<AppDatabase>().getPcLocalDataWithId(id);

    PcModel tPcModel = PcModel(
      etype: tPcData.etype,
      databaseID: tPcData.databaseID,
      designation: tPcData.designation,
      location: tPcData.location,
      rating: tPcData.rating,
      make: tPcData.make,
      panel: tPcData.panel,
      size: tPcData.size,
      length: tPcData.length,
      trNo: tPcData.trNo,
      dateOfTesting: tPcData.dateOfTesting,
      id: tPcData.id,
      TestedBy: tPcData.TestedBy,
      VerifiedBy: tPcData.VerifiedBy,
      WitnessedBy: tPcData.WitnessedBy,
      lastUpdated: tPcData.lastUpdated,
    );

    return tPcModel;
  }

  @override
  Future<List<PcModel>> getPcByTrNo(int trNo) async {
    final tPcData = await sl<AppDatabase>().getPcLocalDataWithtrNo(trNo);

    List<PcModel> tPcModel = List<PcModel>.empty(growable: true);
    for (var element in tPcData) {
      tPcModel.add(PcModel(
        etype: element.etype,
        databaseID: element.databaseID,
        designation: element.designation,
        location: element.location,
        rating: element.rating,
        make: element.make,
        panel: element.panel,
        size: element.size,
        length: element.length,
        trNo: element.trNo,
        dateOfTesting: element.dateOfTesting,
        id: element.id,
        TestedBy: element.TestedBy,
        VerifiedBy: element.VerifiedBy,
        WitnessedBy: element.WitnessedBy,
        lastUpdated: element.lastUpdated,
      ));
    }

    return tPcModel;
  }

  @override
  Future<int> localPc(PcModel pctolocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createPc(pctolocal, dateOfTesting));
  }

  @override
  Future<void> updatePc(PcModel pctoupdate, int id) async {
    sl<AppDatabase>().updatePc(pctoupdate, id);
  }

  @override
  Future<List<PcModel>> getPcLocalDataList() async {
    final tPcDataList = await sl<AppDatabase>().getPcLocalDataList();
    List<PcModel> tPcDataModel = List<PcModel>.empty(growable: true);

    for (var listEle in tPcDataList) {
      tPcDataModel.add(PcModel(
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
        panel: listEle.panel,
        trNo: listEle.trNo,
        size: listEle.size,
        length: listEle.length,
        lastUpdated: listEle.lastUpdated,
      ));
    }
    return tPcDataModel;
  }
}
