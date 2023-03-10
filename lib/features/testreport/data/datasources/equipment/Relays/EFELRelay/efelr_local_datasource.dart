import 'package:drift/drift.dart';
import '../../../../../../../injection_container.dart';
import '../../../../models/equipment/Relays/EFELRelay/efelr_model.dart';
import '../../../test_report_local_datasource.dart';

abstract class EfElrLocalDatasource {
  Future<List<EfElrModel>> getEfElrByTrNo(int trNo);
  Future<List<EfElrModel>> getEfElrBySerialNo(String sn);
  Future<List<EfElrModel>> getEFELRLocalDataList();
  Future<EfElrModel> getEfElrById(int id);
  Future<int> localEfElr(EfElrModel arModel, DateTime dateOfTesting);
  Future<void> updateEfElr(EfElrModel arUpdate, int id);
  Future<int> deleteEfElrById(int id);
}

@DataClassName('EfElrLocalData')
class EfElrLocalDatasourceImpl extends Table implements EfElrLocalDatasource {
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
  Future<EfElrModel> getEfElrById(int id) async {
    EfElrLocalData tEfElrData =
        await sl<AppDatabase>().getEfElrLocalDataWithId(id);

    EfElrModel tEfElrModel = EfElrModel(
      id: tEfElrData.id,
      databaseID: tEfElrData.databaseID,
      etype: tEfElrData.etype,
      trNo: tEfElrData.trNo,
      designation: tEfElrData.designation,
      location: tEfElrData.location,
      serialNo: tEfElrData.serialNo,
      panel: tEfElrData.panel,
      make: tEfElrData.make,
      rtype: tEfElrData.rtype,
      auxVoltage: tEfElrData.auxVoltage,
      ctRatio: tEfElrData.ctRatio,
      dateOfTesting: tEfElrData.dateOfTesting,
      updateDate: tEfElrData.updateDate,
      testedBy: tEfElrData.testedBy,
      verifiedBy: tEfElrData.verifiedBy,
      WitnessedBy: tEfElrData.WitnessedBy,
    );

    return tEfElrModel;
  }

  //getCTBySerialNo
  @override
  Future<List<EfElrModel>> getEfElrBySerialNo(String sn) async {
    final tEfElrData =
        await sl<AppDatabase>().getEfElrLocalDataWithSerialNo(sn);

    List<EfElrModel> tEfElrModel = List<EfElrModel>.empty(growable: true);
    for (var element in tEfElrData) {
      tEfElrModel.add(EfElrModel(
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
        ctRatio: element.ctRatio,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return tEfElrModel;
  }

  @override
  Future<List<EfElrModel>> getEfElrByTrNo(int trNo) async {
    final tEfElrData = await sl<AppDatabase>().getEfElrLocalDataWithtrNo(trNo);

    List<EfElrModel> tEfElrModel = List<EfElrModel>.empty(growable: true);
    for (var element in tEfElrData) {
      tEfElrModel.add(EfElrModel(
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
        ctRatio: element.ctRatio,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return tEfElrModel;
  }

  @override
  Future<int> localEfElr(EfElrModel arModel, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createEfElr(arModel, dateOfTesting));
  }

  @override
  Future<void> updateEfElr(EfElrModel arUpdate, int id) async {
    sl<AppDatabase>().updateEfElr(arUpdate, id);
  }

  @override
  Future<int> deleteEfElrById(int id) {
    return (sl<AppDatabase>().deleteEfElrById(id));
  }

  @override
  Future<List<EfElrModel>> getEFELRLocalDataList() async {
    final teferlDataList =
        await sl<AppDatabase>().getEFELRLocalDatadourceImpleList();
    List<EfElrModel> teferlDataModel = List<EfElrModel>.empty(growable: true);

    for (var tEfElrData in teferlDataList) {
      teferlDataModel.add(EfElrModel(
        id: tEfElrData.id,
        databaseID: tEfElrData.databaseID,
        etype: tEfElrData.etype,
        trNo: tEfElrData.trNo,
        designation: tEfElrData.designation,
        location: tEfElrData.location,
        serialNo: tEfElrData.serialNo,
        panel: tEfElrData.panel,
        make: tEfElrData.make,
        rtype: tEfElrData.rtype,
        auxVoltage: tEfElrData.auxVoltage,
        ctRatio: tEfElrData.ctRatio,
        dateOfTesting: tEfElrData.dateOfTesting,
        updateDate: tEfElrData.updateDate,
        testedBy: tEfElrData.testedBy,
        verifiedBy: tEfElrData.verifiedBy,
        WitnessedBy: tEfElrData.WitnessedBy,
      ));
    }
    return teferlDataModel;
  }
}
