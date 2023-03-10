import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_model.dart';

import '../../../../../../injection_container.dart';

abstract class AcbLocalDatasource {
  Future<List<AcbModel>> getAcbByTrNo(int trNo);
  Future<AcbModel> getAcbById(int id);
  Future<int> localAcb(
      AcbModel acbToLocal, DateTime dateOfTesting, DateTime dueDateOfTesting);
  Future<void> updateAcb(AcbModel acbToUpdate, int id);
  Future<int> deleteAcbById(int id);
  Future<List<AcbModel>> getAcbLocalDataList();
}

@DataClassName('AcbLocalData')
class AcbLocalDatasourceImpl extends Table implements AcbLocalDatasource {
  @required
  DateTimeColumn get lastUpdated =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @required
  RealColumn get motorVoltage => real()();
  @required
  RealColumn get closeCoilTripVolt => real()();

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
  TextColumn get make => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get type => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get ratedSystemVoltage => integer()();
  @required
  IntColumn get ratedSystemCurrent => integer()();
  @required
  IntColumn get yom => integer()();
  @required
  IntColumn get noOfPoles => integer()();
  @required
  IntColumn get iecStandard => integer()();
  @required
  IntColumn get trNo => integer()();
  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds
  @required
  DateTimeColumn get dateOfTesting =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @required
  DateTimeColumn get dueDateOfTesting =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<int> deleteAcbById(int id) {
    return (sl<AppDatabase>().deleteAcbById(id));
  }

  @override
  Future<AcbModel> getAcbById(int id) async {
    AcbLocalData tAcbData = await sl<AppDatabase>().getAcbLocalDataWithId(id);

    AcbModel tAcbModel = AcbModel(
      etype: tAcbData.etype,
      databaseID: tAcbData.databaseID,
      designation: tAcbData.designation,
      location: tAcbData.location,
      panel: tAcbData.panel,
      make: tAcbData.make,
      type: tAcbData.type,
      serialNo: tAcbData.serialNo,
      ratedSystemVoltage: tAcbData.ratedSystemVoltage,
      ratedSystemCurrent: tAcbData.ratedSystemCurrent,
      yom: tAcbData.yom,
      noOfPoles: tAcbData.noOfPoles,
      iecStandard: tAcbData.iecStandard,
      trNo: tAcbData.trNo,
      dateOfTesting: tAcbData.dateOfTesting,
      dueDateOfTesting: tAcbData.dueDateOfTesting,
      id: tAcbData.id,
      TestedBy: tAcbData.TestedBy,
      VerifiedBy: tAcbData.VerifiedBy,
      WitnessedBy: tAcbData.WitnessedBy,
      lastUpdated: tAcbData.lastUpdated,
      motorVoltage: tAcbData.motorVoltage,
      closeCoilTripVolt: tAcbData.closeCoilTripVolt,
    );

    return tAcbModel;
  }

  @override
  Future<List<AcbModel>> getAcbByTrNo(int trNo) async {
    final tAcbData = await sl<AppDatabase>().getAcbLocalDataWithtrNo(trNo);
    List<AcbModel> tAcbModel = List<AcbModel>.empty(growable: true);

    for (var element in tAcbData) {
      tAcbModel.add(AcbModel(
        id: element.id,
        databaseID: element.databaseID,
        etype: element.etype,
        designation: element.designation,
        location: element.location,
        panel: element.panel,
        make: element.make,
        type: element.type,
        serialNo: element.serialNo,
        ratedSystemVoltage: element.ratedSystemVoltage,
        ratedSystemCurrent: element.ratedSystemCurrent,
        yom: element.yom,
        noOfPoles: element.noOfPoles,
        iecStandard: element.iecStandard,
        trNo: element.trNo,
        dateOfTesting: element.dateOfTesting,
        dueDateOfTesting: element.dueDateOfTesting,
        TestedBy: element.TestedBy,
        VerifiedBy: element.VerifiedBy,
        WitnessedBy: element.WitnessedBy,
        lastUpdated: element.lastUpdated,
        motorVoltage: element.motorVoltage,
        closeCoilTripVolt: element.closeCoilTripVolt,
      ));
    }

    return tAcbModel;
  }

  @override
  Future<int> localAcb(
      AcbModel acbModel, DateTime dateOfTesting, DateTime dueDateOfTesting) {
    return (sl<AppDatabase>()
        .createAcb(acbModel, dateOfTesting, dueDateOfTesting));
  }

  @override
  Future<void> updateAcb(AcbModel acbToUpdate, int id) async {
    sl<AppDatabase>().updateAcb(acbToUpdate, id);
  }

  @override
  Future<List<AcbModel>> getAcbLocalDataList() async {
    final tacbDataList =
        await sl<AppDatabase>().getAcbLocalDatadourceImpleList();
    List<AcbModel> tacbDataModel = List<AcbModel>.empty(growable: true);

    for (var listEle in tacbDataList) {
      tacbDataModel.add(AcbModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        TestedBy: listEle.TestedBy,
        VerifiedBy: listEle.VerifiedBy,
        WitnessedBy: listEle.WitnessedBy,
        dateOfTesting: listEle.dateOfTesting,
        designation: listEle.designation,
        dueDateOfTesting: listEle.dueDateOfTesting,
        etype: listEle.etype,
        iecStandard: listEle.iecStandard,
        location: listEle.location,
        make: listEle.make,
        noOfPoles: listEle.noOfPoles,
        panel: listEle.panel,
        ratedSystemCurrent: listEle.ratedSystemCurrent,
        ratedSystemVoltage: listEle.ratedSystemVoltage,
        serialNo: listEle.serialNo,
        trNo: listEle.trNo,
        type: listEle.type,
        yom: listEle.yom,
        lastUpdated: listEle.lastUpdated,
        motorVoltage: listEle.motorVoltage,
        closeCoilTripVolt: listEle.closeCoilTripVolt,
      ));
    }
    return tacbDataModel;
  }
}
