import 'package:drift/drift.dart';
import '../../../../../../../injection_container.dart';
import '../../../../models/equipment/Relays/TRelay/tr_model.dart';
import '../../../test_report_local_datasource.dart';

abstract class TrLocalDatasource {
  Future<List<TrModel>> getTrByTrNo(int trNo);
  Future<List<TrModel>> getTrBySerialNo(String sn);
  Future<List<TrModel>> getTrLocalDataList();
  Future<TrModel> getTrById(int id);
  Future<int> localTr(TrModel arModel, DateTime dateOfTesting);
  Future<void> updateTr(TrModel arUpdate, int id);
  Future<int> deleteTrById(int id);
  // Future<List> getTrLocalDataList();
}

@DataClassName('TrLocalData')
class TrLocalDatasourceImpl extends Table implements TrLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  TextColumn get etype => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get designation => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get location => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get panel => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get make => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get rtype => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get auxVoltage => text().withLength(min: 1, max: 50)();

  @required
  DateTimeColumn get dateOfTesting =>
      dateTime().withDefault(Constant(DateTime.now()))();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();
  @required
  TextColumn get testedBy => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get verifiedBy => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get WitnessedBy => text().withLength(min: 1, max: 50)();

  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds

  @override
  Future<TrModel> getTrById(int id) async {
    TrLocalData tTrData = await sl<AppDatabase>().getTrLocalDataWithId(id);

    TrModel tTrModel = TrModel(
      id: tTrData.id,
      databaseID: tTrData.databaseID,
      etype: tTrData.etype,
      trNo: tTrData.trNo,
      designation: tTrData.designation,
      location: tTrData.location,
      serialNo: tTrData.serialNo,
      panel: tTrData.panel,
      make: tTrData.make,
      rtype: tTrData.rtype,
      auxVoltage: tTrData.auxVoltage,
      dateOfTesting: tTrData.dateOfTesting,
      updateDate: tTrData.updateDate,
      testedBy: tTrData.testedBy,
      verifiedBy: tTrData.verifiedBy,
      WitnessedBy: tTrData.WitnessedBy,
    );

    return tTrModel;
  }

  //getCTBySerialNo
  @override
  Future<List<TrModel>> getTrBySerialNo(String sn) async {
    final tTrData = await sl<AppDatabase>().getTrLocalDataWithSerialNo(sn);

    List<TrModel> tTrModel = List<TrModel>.empty(growable: true);
    for (var element in tTrData) {
      tTrModel.add(TrModel(
        id: element.id,
        databaseID: element.databaseID,
        etype: element.etype,
        trNo: element.trNo,
        designation: element.designation,
        location: element.location,
        serialNo: element.serialNo,
        make: element.make,
        rtype: element.rtype,
        auxVoltage: element.auxVoltage,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return tTrModel;
  }

  @override
  Future<List<TrModel>> getTrByTrNo(int trNo) async {
    final tTrData = await sl<AppDatabase>().getTrLocalDataWithtrNo(trNo);

    List<TrModel> tTrModel = List<TrModel>.empty(growable: true);
    for (var element in tTrData) {
      tTrModel.add(TrModel(
        id: element.id,
        databaseID: element.databaseID,
        etype: element.etype,
        trNo: element.trNo,
        designation: element.designation,
        location: element.location,
        serialNo: element.serialNo,
        make: element.make,
        rtype: element.rtype,
        auxVoltage: element.auxVoltage,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return tTrModel;
  }

  @override
  Future<int> localTr(TrModel arModel, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createTr(arModel, dateOfTesting));
  }

  @override
  Future<void> updateTr(TrModel arUpdate, int id) async {
    sl<AppDatabase>().updateTr(arUpdate, id);
  }

  @override
  Future<int> deleteTrById(int id) {
    return (sl<AppDatabase>().deleteTrById(id));
  }

  @override
  Future<List<TrModel>> getTrLocalDataList() async {
    final tTrDataList = await sl<AppDatabase>().getTrLocalDatadourceImpleList();
    List<TrModel> tTrDataModel = List<TrModel>.empty(growable: true);

    for (var tTrData in tTrDataList) {
      tTrDataModel.add(TrModel(
        id: tTrData.id,
        databaseID: tTrData.databaseID,
        etype: tTrData.etype,
        trNo: tTrData.trNo,
        designation: tTrData.designation,
        location: tTrData.location,
        serialNo: tTrData.serialNo,
        panel: tTrData.panel,
        make: tTrData.make,
        rtype: tTrData.rtype,
        auxVoltage: tTrData.auxVoltage,
        dateOfTesting: tTrData.dateOfTesting,
        updateDate: tTrData.updateDate,
        testedBy: tTrData.testedBy,
        verifiedBy: tTrData.verifiedBy,
        WitnessedBy: tTrData.WitnessedBy,
      ));
    }
    return tTrDataModel;
  }
}
