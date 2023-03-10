import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/PT/pt_model.dart';

abstract class PTLocalDatasource {
  Future<List<PTModel>> getPTByTrNo(int trNo);
  Future<List<PTModel>> getPTBySerialNo(String sn);
  Future<List<PTModel>> getPTLocalDataList();
  Future<PTModel> getPTById(int id);
  Future<int> localPT(PTModel pttolocal, DateTime dateOfTesting);
  Future<void> updatePT(PTModel pttoupdate, int id);
  Future<int> deletePTById(int id);
}

@DataClassName('PTLocalData')
class PTLocalDatasourceImpl extends Table implements PTLocalDatasource {
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
  TextColumn get make => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get panel => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get serialNo_Rph => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get serialNo_Yph => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get serialNo_Bph => text().withLength(min: 1, max: 50)();
  // @required
  // TextColumn get pRatio => text().withLength(min: 1, max: 50)();
  // @required
  // TextColumn get sRatio => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get pRatio => integer()();
  @required
  IntColumn get sRatio => integer()();
  @required
  IntColumn get ratedVoltage => integer()();
  @required
  IntColumn get noOfCores => integer()();
  // @required
  // IntColumn get noOfTaps => integer()();
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
  // @required
  // TextColumn get connectedTap => text().withLength(min: 1, max: 50)();

  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds

  @override
  Future<PTModel> getPTById(int id) async {
    PTLocalData tPTData = await sl<AppDatabase>().getPTLocalDataWithId(id);

    PTModel tPTModel = PTModel(
      id: tPTData.id,
      databaseID: tPTData.databaseID,
      etype: tPTData.etype,
      trNo: tPTData.trNo,
      yom: tPTData.yom,
      WitnessedBy: tPTData.WitnessedBy,
      dateOfTesting: tPTData.dateOfTesting,
      designation: tPTData.designation,
      location: tPTData.location,
      make: tPTData.make,
      noOfCores: tPTData.noOfCores,
      pRatio: tPTData.pRatio,
      panel: tPTData.panel,
      ratedVoltage: tPTData.ratedVoltage,
      sRatio: tPTData.sRatio,
      serialNo_Bph: tPTData.serialNo_Bph,
      serialNo_Rph: tPTData.serialNo_Rph,
      serialNo_Yph: tPTData.serialNo_Yph,
      testedBy: tPTData.testedBy,
      updateDate: tPTData.updateDate,
      verifiedBy: tPTData.verifiedBy,
    );

    return tPTModel;
  }

  //getCTBySerialNo
  @override
  Future<List<PTModel>> getPTBySerialNo(String sn) async {
    final tPTData = await sl<AppDatabase>().getPTLocalDataWithSerialNo(sn);

    List<PTModel> tptModel = List<PTModel>.empty(growable: true);
    for (var element in tPTData) {
      tptModel.add(PTModel(
        WitnessedBy: element.WitnessedBy,
        dateOfTesting: element.dateOfTesting,
        designation: element.designation,
        etype: element.etype,
        location: element.location,
        make: element.make,
        noOfCores: element.noOfCores,
        // noOfTaps: element.noOfTaps,
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
        // connectedTap: element.connectedTap,
      ));
    }
    return tptModel;
  }

  @override
  Future<List<PTModel>> getPTByTrNo(int trNo) async {
    final tPTData = await sl<AppDatabase>().getPTLocalDataWithtrNo(trNo);

    List<PTModel> tptModel = List<PTModel>.empty(growable: true);
    for (var element in tPTData) {
      tptModel.add(PTModel(
        WitnessedBy: element.WitnessedBy,
        dateOfTesting: element.dateOfTesting,
        designation: element.designation,
        etype: element.etype,
        location: element.location,
        make: element.make,
        noOfCores: element.noOfCores,
        // noOfTaps: element.noOfTaps,
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
        // connectedTap: element.connectedTap,
      ));
    }
    return tptModel;
  }

  @override
  Future<int> localPT(PTModel pttolocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createPT(pttolocal, dateOfTesting));
  }

  @override
  Future<void> updatePT(PTModel pttoupdate, int id) async {
    sl<AppDatabase>().updatePT(pttoupdate, id);
  }

  @override
  Future<int> deletePTById(int id) {
    return (sl<AppDatabase>().deletePTById(id));
  }

  @override
  Future<List<PTModel>> getPTLocalDataList() async {
    final tPTDataList = await sl<AppDatabase>().getPTLocalDataList();
    List<PTModel> tPTDataModel = List<PTModel>.empty(growable: true);

    for (var listEle in tPTDataList) {
      tPTDataModel.add(PTModel(
        WitnessedBy: listEle.WitnessedBy,
        databaseID: listEle.databaseID,
        dateOfTesting: listEle.dateOfTesting,
        designation: listEle.designation,
        etype: listEle.etype,
        id: listEle.id,
        location: listEle.location,
        make: listEle.make,
        noOfCores: listEle.noOfCores,
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
      ));
    }
    return tPTDataModel;
  }
}
