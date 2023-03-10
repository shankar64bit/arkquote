import 'package:drift/drift.dart';
import '../../../../../../../injection_container.dart';
import '../../../../models/equipment/Relays/VoltageRelay/vr_model.dart';
import '../../../test_report_local_datasource.dart';

abstract class VrLocalDatasource {
  Future<List<VrModel>> getVrByTrNo(int trNo);
  Future<List<VrModel>> getVrBySerialNo(String sn);
  Future<List<VrModel>> getVrLocalDataList();
  Future<VrModel> getVrById(int id);
  Future<int> localVr(VrModel arModel, DateTime dateOfTesting);
  Future<void> updateVr(VrModel arUpdate, int id);
  Future<int> deleteVrById(int id);
}

@DataClassName('VrLocalData')
class VrLocalDatasourceImpl extends Table implements VrLocalDatasource {
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
  TextColumn get ptRatio => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get Vn => text().withLength(min: 1, max: 50)();

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
  Future<VrModel> getVrById(int id) async {
    VrLocalData tVrData = await sl<AppDatabase>().getVrLocalDataWithId(id);

    VrModel tVrModel = VrModel(
      id: tVrData.id,
      databaseID: tVrData.databaseID,
      etype: tVrData.etype,
      trNo: tVrData.trNo,
      designation: tVrData.designation,
      location: tVrData.location,
      serialNo: tVrData.serialNo,
      panel: tVrData.panel,
      make: tVrData.make,
      rtype: tVrData.rtype,
      auxVoltage: tVrData.auxVoltage,
      ptRatio: tVrData.ptRatio,
      Vn: tVrData.Vn,
      dateOfTesting: tVrData.dateOfTesting,
      updateDate: tVrData.updateDate,
      testedBy: tVrData.testedBy,
      verifiedBy: tVrData.verifiedBy,
      WitnessedBy: tVrData.WitnessedBy,
    );

    return tVrModel;
  }

  //getCTBySerialNo
  @override
  Future<List<VrModel>> getVrBySerialNo(String sn) async {
    final tVrData = await sl<AppDatabase>().getVrLocalDataWithSerialNo(sn);

    List<VrModel> tVrModel = List<VrModel>.empty(growable: true);
    for (var element in tVrData) {
      tVrModel.add(VrModel(
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
        ptRatio: element.ptRatio,
        Vn: element.Vn,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return tVrModel;
  }

  @override
  Future<List<VrModel>> getVrByTrNo(int trNo) async {
    final tVrData = await sl<AppDatabase>().getVrLocalDataWithtrNo(trNo);

    List<VrModel> tVrModel = List<VrModel>.empty(growable: true);
    for (var element in tVrData) {
      tVrModel.add(VrModel(
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
        ptRatio: element.ptRatio,
        Vn: element.Vn,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return tVrModel;
  }

  @override
  Future<int> localVr(VrModel arModel, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createVr(arModel, dateOfTesting));
  }

  @override
  Future<void> updateVr(VrModel arUpdate, int id) async {
    sl<AppDatabase>().updateVr(arUpdate, id);
  }

  @override
  Future<int> deleteVrById(int id) {
    return (sl<AppDatabase>().deleteVrById(id));
  }

  //getVrLocalDataList
  @override
  Future<List<VrModel>> getVrLocalDataList() async {
    final tVrDataList = await sl<AppDatabase>().getVrLocalDatadourceImpleList();
    List<VrModel> tVrDataModel = List<VrModel>.empty(growable: true);

    for (var tVrData in tVrDataList) {
      tVrDataModel.add(VrModel(
        id: tVrData.id,
        databaseID: tVrData.databaseID,
        etype: tVrData.etype,
        trNo: tVrData.trNo,
        designation: tVrData.designation,
        location: tVrData.location,
        serialNo: tVrData.serialNo,
        panel: tVrData.panel,
        make: tVrData.make,
        rtype: tVrData.rtype,
        auxVoltage: tVrData.auxVoltage,
        ptRatio: tVrData.ptRatio,
        Vn: tVrData.Vn,
        dateOfTesting: tVrData.dateOfTesting,
        updateDate: tVrData.updateDate,
        testedBy: tVrData.testedBy,
        verifiedBy: tVrData.verifiedBy,
        WitnessedBy: tVrData.WitnessedBy,
      ));
    }
    return tVrDataModel;
  }
}
