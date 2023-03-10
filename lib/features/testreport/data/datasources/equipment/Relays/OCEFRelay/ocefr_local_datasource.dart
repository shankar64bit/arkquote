import 'package:drift/drift.dart';
import '../../../../../../../injection_container.dart';
import '../../../../models/equipment/Relays/OCEFRelay/ocefr_model.dart';
import '../../../test_report_local_datasource.dart';

abstract class OcEfrLocalDatasource {
  Future<List<OcEfrModel>> getOcEfrByTrNo(int trNo);
  Future<List<OcEfrModel>> getOcEfrBySerialNo(String sn);
  Future<List<OcEfrModel>> getOcEfrLocalDataList();
  Future<OcEfrModel> getOcEfrById(int id);
  Future<int> localOcEfr(OcEfrModel arModel, DateTime dateOfTesting);
  Future<void> updateOcEfr(OcEfrModel arUpdate, int id);
  Future<int> deleteOcEfrById(int id);
}

@DataClassName('OcEfrLocalData')
class OcEfrLocalDatasourceImpl extends Table implements OcEfrLocalDatasource {
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
  TextColumn get serialNo_Rph => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get serialNo_Yph => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get serialNo_Bph => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get panel => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get make => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get rtype => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get auxVoltage => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get ctRatio => text().withLength(min: 1, max: 50)();

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
  Future<OcEfrModel> getOcEfrById(int id) async {
    OcEfrLocalData tOcEfrData =
        await sl<AppDatabase>().getOcEfrLocalDataWithId(id);

    OcEfrModel tOcEfrModel = OcEfrModel(
      id: tOcEfrData.id,
      databaseID: tOcEfrData.databaseID,
      etype: tOcEfrData.etype,
      trNo: tOcEfrData.trNo,
      designation: tOcEfrData.designation,
      location: tOcEfrData.location,
      serialNo_Rph: tOcEfrData.serialNo_Rph,
      serialNo_Yph: tOcEfrData.serialNo_Yph,
      serialNo_Bph: tOcEfrData.serialNo_Bph,
      panel: tOcEfrData.panel,
      make: tOcEfrData.make,
      rtype: tOcEfrData.rtype,
      auxVoltage: tOcEfrData.auxVoltage,
      ctRatio: tOcEfrData.ctRatio,
      dateOfTesting: tOcEfrData.dateOfTesting,
      updateDate: tOcEfrData.updateDate,
      testedBy: tOcEfrData.testedBy,
      verifiedBy: tOcEfrData.verifiedBy,
      WitnessedBy: tOcEfrData.WitnessedBy,
    );

    return tOcEfrModel;
  }

  //getCTBySerialNo
  @override
  Future<List<OcEfrModel>> getOcEfrBySerialNo(String sn) async {
    final tOcEfrData =
        await sl<AppDatabase>().getOcEfrLocalDataWithSerialNo(sn);

    List<OcEfrModel> tOcEfrModel = List<OcEfrModel>.empty(growable: true);
    for (var element in tOcEfrData) {
      tOcEfrModel.add(OcEfrModel(
        id: element.id,
        databaseID: element.databaseID,
        etype: element.etype,
        trNo: element.trNo,
        designation: element.designation,
        location: element.location,
        serialNo_Rph: element.serialNo_Rph,
        serialNo_Yph: element.serialNo_Yph,
        serialNo_Bph: element.serialNo_Bph,
        make: element.make,
        rtype: element.rtype,
        auxVoltage: element.auxVoltage,
        ctRatio: element.ctRatio,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return tOcEfrModel;
  }

  @override
  Future<List<OcEfrModel>> getOcEfrByTrNo(int trNo) async {
    final tOcEfrData = await sl<AppDatabase>().getOcEfrLocalDataWithtrNo(trNo);

    List<OcEfrModel> tOcEfrModel = List<OcEfrModel>.empty(growable: true);
    for (var element in tOcEfrData) {
      tOcEfrModel.add(OcEfrModel(
        id: element.id,
        databaseID: element.databaseID,
        etype: element.etype,
        trNo: element.trNo,
        designation: element.designation,
        location: element.location,
        serialNo_Rph: element.serialNo_Rph,
        serialNo_Yph: element.serialNo_Yph,
        serialNo_Bph: element.serialNo_Bph,
        make: element.make,
        rtype: element.rtype,
        auxVoltage: element.auxVoltage,
        ctRatio: element.ctRatio,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return tOcEfrModel;
  }

  @override
  Future<int> localOcEfr(OcEfrModel arModel, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createOcEfr(arModel, dateOfTesting));
  }

  @override
  Future<void> updateOcEfr(OcEfrModel arUpdate, int id) async {
    sl<AppDatabase>().updateOcEfr(arUpdate, id);
  }

  @override
  Future<int> deleteOcEfrById(int id) {
    return (sl<AppDatabase>().deleteOcEfrById(id));
  }

  //getOcEfrLocalDataList
  @override
  Future<List<OcEfrModel>> getOcEfrLocalDataList() async {
    final tocefrDataList =
        await sl<AppDatabase>().getOcEfrLocalDatadourceImpleList();
    List<OcEfrModel> tocefrDataModel = List<OcEfrModel>.empty(growable: true);

    for (var tOcEfrData in tocefrDataList) {
      tocefrDataModel.add(OcEfrModel(
        id: tOcEfrData.id,
        databaseID: tOcEfrData.databaseID,
        etype: tOcEfrData.etype,
        trNo: tOcEfrData.trNo,
        designation: tOcEfrData.designation,
        location: tOcEfrData.location,
        serialNo_Rph: tOcEfrData.serialNo_Rph,
        serialNo_Yph: tOcEfrData.serialNo_Yph,
        serialNo_Bph: tOcEfrData.serialNo_Bph,
        panel: tOcEfrData.panel,
        make: tOcEfrData.make,
        rtype: tOcEfrData.rtype,
        auxVoltage: tOcEfrData.auxVoltage,
        ctRatio: tOcEfrData.ctRatio,
        dateOfTesting: tOcEfrData.dateOfTesting,
        updateDate: tOcEfrData.updateDate,
        testedBy: tOcEfrData.testedBy,
        verifiedBy: tOcEfrData.verifiedBy,
        WitnessedBy: tOcEfrData.WitnessedBy,
      ));
    }
    return tocefrDataModel;
  }
}
