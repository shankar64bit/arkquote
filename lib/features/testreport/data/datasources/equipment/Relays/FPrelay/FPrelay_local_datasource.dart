import 'package:drift/drift.dart';

import '../../../../../../../injection_container.dart';
import '../../../../models/equipment/Relays/FPrelay/FPrelay_model.dart';
import '../../../test_report_local_datasource.dart';
// import '../../../models/equipment/AT/AT_model.dart';
// import '../../test_report_local_datasource.dart';

abstract class FPrelayLocalDatasource {
  Future<List<FPrelayModel>> getFPrelayByTrNo(int trNo);
  Future<List<FPrelayModel>> getFPrelayBySerialNo(String sn);
  Future<List<FPrelayModel>> getFPrelayLocalDataList();
  Future<FPrelayModel> getFPrelayById(int id);
  Future<int> localFPrelay(FPrelayModel fprtolocal, DateTime dateOfTesting);
  Future<void> updateFPrelay(FPrelayModel fprtoupdate, int id);
  Future<int> deleteFPrelayById(int id);
  // Future<List> getFPrelayLocalDataList();
}

@DataClassName('FPrelayLocalData')
class FPrelayLocalDatasourceImpl extends Table
    implements FPrelayLocalDatasource {
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
  IntColumn get ctRatioPri => integer()();
  @required
  IntColumn get ctRatioSec => integer()();
  @required
  IntColumn get ptRatio => integer()();
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
  Future<FPrelayModel> getFPrelayById(int id) async {
    FPrelayLocalData tFPrelayData =
        await sl<AppDatabase>().getFPrelayLocalDataWithId(id);

    FPrelayModel tFPrelayModel = FPrelayModel(
      id: tFPrelayData.id,
      databaseID: tFPrelayData.databaseID,
      etype: tFPrelayData.etype,
      trNo: tFPrelayData.trNo,
      designation: tFPrelayData.designation,
      location: tFPrelayData.location,
      serialNo: tFPrelayData.serialNo,
      panel: tFPrelayData.panel,
      make: tFPrelayData.make,
      rtype: tFPrelayData.rtype,
      auxVoltage: tFPrelayData.auxVoltage,
      ctRatioPri: tFPrelayData.ctRatioPri,
      ctRatioSec: tFPrelayData.ctRatioSec,
      ptRatio: tFPrelayData.ptRatio,
      dateOfTesting: tFPrelayData.dateOfTesting,
      updateDate: tFPrelayData.updateDate,
      testedBy: tFPrelayData.testedBy,
      verifiedBy: tFPrelayData.verifiedBy,
      WitnessedBy: tFPrelayData.WitnessedBy,
    );

    return tFPrelayModel;
  }

  //getCTBySerialNo
  @override
  Future<List<FPrelayModel>> getFPrelayBySerialNo(String sn) async {
    final tFPrelayData =
        await sl<AppDatabase>().getFPrelayLocalDataWithSerialNo(sn);

    List<FPrelayModel> tfprelayModel = List<FPrelayModel>.empty(growable: true);
    for (var element in tFPrelayData) {
      tfprelayModel.add(FPrelayModel(
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
        ctRatioPri: element.ctRatioPri,
        ctRatioSec: element.ctRatioSec,
        ptRatio: element.ptRatio,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return tfprelayModel;
  }

  @override
  Future<List<FPrelayModel>> getFPrelayByTrNo(int trNo) async {
    final tFPrelayData =
        await sl<AppDatabase>().getFPrelayLocalDataWithtrNo(trNo);

    List<FPrelayModel> tfprelayModel = List<FPrelayModel>.empty(growable: true);
    for (var element in tFPrelayData) {
      tfprelayModel.add(FPrelayModel(
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
        ctRatioPri: element.ctRatioPri,
        ctRatioSec: element.ctRatioSec,
        ptRatio: element.ptRatio,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return tfprelayModel;
  }

  @override
  Future<int> localFPrelay(FPrelayModel fprtolocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createFPrelay(fprtolocal, dateOfTesting));
  }

  @override
  Future<void> updateFPrelay(FPrelayModel fprtoupdate, int id) async {
    sl<AppDatabase>().updateFPrelay(fprtoupdate, id);
  }

  @override
  Future<int> deleteFPrelayById(int id) {
    return (sl<AppDatabase>().deleteFPrelayById(id));
  }

  @override
  Future<List<FPrelayModel>> getFPrelayLocalDataList() async {
    final tIsoDataList = await sl<AppDatabase>().getFPrelayfromLocalDataList();
    List<FPrelayModel> tIsoDataModel = List<FPrelayModel>.empty(growable: true);

    for (var listEle in tIsoDataList) {
      tIsoDataModel.add(FPrelayModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        etype: listEle.etype,
        trNo: listEle.trNo,
        designation: listEle.designation,
        location: listEle.location,
        serialNo: listEle.serialNo,
        make: listEle.make,
        rtype: listEle.rtype,
        auxVoltage: listEle.auxVoltage,
        ctRatioPri: listEle.ctRatioPri,
        ctRatioSec: listEle.ctRatioSec,
        ptRatio: listEle.ptRatio,
        dateOfTesting: listEle.dateOfTesting,
        updateDate: listEle.updateDate,
        testedBy: listEle.testedBy,
        verifiedBy: listEle.verifiedBy,
        WitnessedBy: listEle.WitnessedBy,
        panel: listEle.panel,
      ));
    }
    return tIsoDataModel;
  }
}
