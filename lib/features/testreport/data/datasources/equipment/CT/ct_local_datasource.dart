import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/CT/ct_model.dart';
import '../../../../../../injection_container.dart';
import '../../test_report_local_datasource.dart';

abstract class CTLocalDatasource {
  Future<List<CTModel>> getCTByTrNo(int trNo);
  Future<List<CTModel>> getCTBySerialNo(String sn);
  Future<List<CTModel>> getCTLocalDataList();
  Future<CTModel> getCTById(int id);
  Future<int> localCT(CTModel cttolocal, DateTime dateOfTesting);
  Future<void> updateCT(CTModel cttoupdate, int id);
  Future<int> deleteCTById(int id);
  // Future<List> getCTLocalDataList();
}

@DataClassName('CTLocalData')
class CTLocalDatasourceImpl extends Table implements CTLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  TextColumn get etype => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get trNo => integer()();
  @required
  RealColumn get vk => real()();
  @required
  TextColumn get designation => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get location => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get make => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get panel => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get serialNo_Rph => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get serialNo_Yph => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get serialNo_Bph => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get pRatio => integer()();
  @required
  IntColumn get sRatio => integer()();
  @required
  IntColumn get ratedVoltage => integer()();
  @required
  IntColumn get noOfCores => integer()();
  @required
  IntColumn get noOfTaps => integer()();
  @required
  TextColumn get connectedTap => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get yom => integer()();
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
  Future<CTModel> getCTById(int id) async {
    CTLocalData tCTData = await sl<AppDatabase>().getCTLocalDataWithId(id);

    CTModel tCTModel = CTModel(
      WitnessedBy: tCTData.WitnessedBy,
      dateOfTesting: tCTData.dateOfTesting,
      designation: tCTData.designation,
      etype: tCTData.etype,
      location: tCTData.location,
      make: tCTData.make,
      noOfCores: tCTData.noOfCores,
      noOfTaps: tCTData.noOfTaps,
      pRatio: tCTData.pRatio,
      panel: tCTData.panel,
      ratedVoltage: tCTData.ratedVoltage,
      sRatio: tCTData.sRatio,
      serialNo_Bph: tCTData.serialNo_Bph,
      serialNo_Rph: tCTData.serialNo_Rph,
      serialNo_Yph: tCTData.serialNo_Yph,
      testedBy: tCTData.testedBy,
      trNo: tCTData.trNo,
      updateDate: tCTData.updateDate,
      verifiedBy: tCTData.verifiedBy,
      yom: tCTData.yom,
      id: tCTData.id,
      databaseID: tCTData.databaseID,
      connectedTap: tCTData.connectedTap,
      vk: tCTData.vk,
    );

    return tCTModel;
  }

  //getCTBySerialNo
  @override
  Future<List<CTModel>> getCTBySerialNo(String sn) async {
    final tCTData = await sl<AppDatabase>().getCTLocalDataWithSerialNo(sn);

    List<CTModel> tctModel = List<CTModel>.empty(growable: true);
    for (var element in tCTData) {
      tctModel.add(CTModel(
        WitnessedBy: element.WitnessedBy,
        dateOfTesting: element.dateOfTesting,
        designation: element.designation,
        etype: element.etype,
        location: element.location,
        make: element.make,
        noOfCores: element.noOfCores,
        noOfTaps: element.noOfTaps,
        pRatio: element.pRatio,
        panel: element.panel,
        ratedVoltage: element.ratedVoltage,
        sRatio: element.sRatio,
        serialNo_Bph: element.serialNo_Bph,
        serialNo_Rph: element.serialNo_Rph,
        serialNo_Yph: element.serialNo_Yph,
        testedBy: element.testedBy,
        trNo: element.trNo,
        updateDate: element.updateDate,
        verifiedBy: element.verifiedBy,
        yom: element.yom,
        databaseID: element.databaseID,
        id: element.id,
        connectedTap: element.connectedTap,
        vk: element.vk,
      ));
    }
    return tctModel;
  }

  @override
  Future<List<CTModel>> getCTByTrNo(int trNo) async {
    final tCTData = await sl<AppDatabase>().getCTLocalDataWithtrNo(trNo);

    List<CTModel> tctModel = List<CTModel>.empty(growable: true);
    for (var element in tCTData) {
      tctModel.add(CTModel(
        WitnessedBy: element.WitnessedBy,
        dateOfTesting: element.dateOfTesting,
        designation: element.designation,
        etype: element.etype,
        location: element.location,
        make: element.make,
        noOfCores: element.noOfCores,
        noOfTaps: element.noOfTaps,
        pRatio: element.pRatio,
        panel: element.panel,
        ratedVoltage: element.ratedVoltage,
        sRatio: element.sRatio,
        serialNo_Bph: element.serialNo_Bph,
        serialNo_Rph: element.serialNo_Rph,
        serialNo_Yph: element.serialNo_Yph,
        testedBy: element.testedBy,
        trNo: element.trNo,
        updateDate: element.updateDate,
        verifiedBy: element.verifiedBy,
        yom: element.yom,
        databaseID: element.databaseID,
        id: element.id,
        connectedTap: element.connectedTap,
        vk: element.vk,
      ));
    }
    return tctModel;
  }

  @override
  Future<int> localCT(CTModel cttolocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createCT(cttolocal, dateOfTesting));
  }

  @override
  Future<void> updateCT(CTModel cttoupdate, int id) async {
    sl<AppDatabase>().updateCT(cttoupdate, id);
  }

  @override
  Future<int> deleteCTById(int id) {
    return (sl<AppDatabase>().deleteCTById(id));
  }

  @override
  Future<List<CTModel>> getCTLocalDataList() async {
    final tctDataList = await sl<AppDatabase>().getCTLocalDatadourceImpleList();
    List<CTModel> tctDataModel = List<CTModel>.empty(growable: true);

    for (var listEle in tctDataList) {
      tctDataModel.add(CTModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        WitnessedBy: listEle.WitnessedBy,
        dateOfTesting: listEle.dateOfTesting,
        designation: listEle.designation,
        etype: listEle.etype,
        location: listEle.location,
        make: listEle.make,
        noOfCores: listEle.noOfCores,
        noOfTaps: listEle.noOfTaps,
        pRatio: listEle.pRatio,
        panel: listEle.panel,
        ratedVoltage: listEle.ratedVoltage,
        sRatio: listEle.sRatio,
        serialNo_Bph: listEle.serialNo_Bph,
        serialNo_Rph: listEle.serialNo_Rph,
        serialNo_Yph: listEle.serialNo_Yph,
        testedBy: listEle.testedBy,
        trNo: listEle.trNo,
        updateDate: listEle.updateDate,
        verifiedBy: listEle.verifiedBy,
        yom: listEle.yom,
        connectedTap: listEle.connectedTap,
        vk: listEle.vk,
      ));
    }
    return tctDataModel;
  }
}
