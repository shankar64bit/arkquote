import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/DG/dg_model.dart';

abstract class DgLocalDatasource {
  Future<List<DgModel>> getDgByTrNo(int trNo);
  Future<List<DgModel>> getDgLocalDataList();
  Future<DgModel> getDgById(int id);
  Future<int> localDg(DgModel dgModel, DateTime dateOfTesting);
  Future<void> updateDg(DgModel dgToUpdate, int id);
  Future<int> deleteDgById(int id);
}

@DataClassName('DgLocalData')
class DgLocalDatasourceImpl extends Table implements DgLocalDatasource {
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
  TextColumn get design => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get location => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get rating => integer()();
  @required
  IntColumn get voltage => integer()();
  @required
  RealColumn get powerFactor => real()();
  @required
  IntColumn get speed => integer()();
  @required
  TextColumn get model => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get make => text().withLength(min: 1, max: 50)();

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

  // @override
  Future<int> deleteDgById(int id) {
    return (sl<AppDatabase>().deleteDgById(id));
  }

  @override
  Future<DgModel> getDgById(int id) async {
    DgLocalData tDgData = await sl<AppDatabase>().getDgLocalDataWithId(id);

    DgModel tDgModel = DgModel(
      etype: tDgData.etype,
      databaseID: tDgData.databaseID,
      design: tDgData.design,
      location: tDgData.location,
      rating: tDgData.rating,
      make: tDgData.make,
      model: tDgData.model,
      speed: tDgData.speed,
      voltage: tDgData.voltage,
      powerFactor: tDgData.powerFactor,
      serialNo: tDgData.serialNo,
      yom: tDgData.yom,
      trNo: tDgData.trNo,
      dateOfTesting: tDgData.dateOfTesting,
      id: tDgData.id,
      TestedBy: tDgData.TestedBy,
      VerifiedBy: tDgData.VerifiedBy,
      WitnessedBy: tDgData.WitnessedBy,
      updateDate: tDgData.lastUpdated,
    );

    return tDgModel;
  }

  @override
  Future<List<DgModel>> getDgByTrNo(int trNo) async {
    final tDgData = await sl<AppDatabase>().getDgLocalDataWithtrNo(trNo);

    List<DgModel> tDgModel = List<DgModel>.empty(growable: true);
    for (var element in tDgData) {
      tDgModel.add(DgModel(
        etype: element.etype,
        databaseID: element.databaseID,
        design: element.design,
        location: element.location,
        rating: element.rating,
        make: element.make,
        model: element.model,
        speed: element.speed,
        voltage: element.voltage,
        powerFactor: element.powerFactor,
        serialNo: element.serialNo,
        yom: element.yom,
        trNo: element.trNo,
        dateOfTesting: element.dateOfTesting,
        id: element.id,
        TestedBy: element.TestedBy,
        VerifiedBy: element.VerifiedBy,
        WitnessedBy: element.WitnessedBy,
        updateDate: element.lastUpdated,
      ));
    }

    return tDgModel;
  }

  @override
  Future<int> localDg(DgModel dgToLocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createDg(dgToLocal, dateOfTesting));
  }

  @override
  Future<void> updateDg(DgModel dgToUpdate, int id) async {
    sl<AppDatabase>().updateDg(dgToUpdate, id);
  }

  @override
  Future<List<DgModel>> getDgLocalDataList() async {
    final tDgDataList = await sl<AppDatabase>().getDgLocalDataList();
    List<DgModel> tDgDataModel = List<DgModel>.empty(growable: true);

    for (var listEle in tDgDataList) {
      tDgDataModel.add(DgModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        TestedBy: listEle.TestedBy,
        VerifiedBy: listEle.VerifiedBy,
        WitnessedBy: listEle.WitnessedBy,
        dateOfTesting: listEle.dateOfTesting,
        design: listEle.design,
        etype: listEle.etype,
        location: listEle.location,
        make: listEle.make,
        rating: listEle.rating,
        model: listEle.model,
        speed: listEle.speed,
        voltage: listEle.voltage,
        powerFactor: listEle.powerFactor,
        serialNo: listEle.serialNo,
        trNo: listEle.trNo,
        yom: listEle.yom,
        updateDate: listEle.lastUpdated,
      ));
    }
    return tDgDataModel;
  }
}
