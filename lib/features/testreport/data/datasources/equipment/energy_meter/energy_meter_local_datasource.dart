import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/energy_meter/energy_meter_model.dart';
import '../../../../../../injection_container.dart';

abstract class EnergyMeterLocalDatasource {
  Future<List<EnergyMeterModel>> getEnergyMeterByTrNo(int trNo);
  Future<List<EnergyMeterModel>> getEMLocalDataList();
  Future<EnergyMeterModel> getEnergyMeterById(int id);
  Future<int> localEnergyMeter(
      EnergyMeterModel emtolocal, DateTime dateOfTesting);
  Future<void> updateEnergyMeter(EnergyMeterModel emtoupdate, int id);
  Future<int> deleteEnergyMeterById(int id);
}

@DataClassName('EnergyMeterLocalData')
class EnergyMeterLocalDatasourceImpl extends Table
    implements EnergyMeterLocalDatasource {
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
  TextColumn get make => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get ctr => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get ptr => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get voltage => integer()();
  @required
  IntColumn get frequency => integer()();
  @required
  RealColumn get eqClass => real()();
  @required
  IntColumn get trNo => integer()();
  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds
  @required
  DateTimeColumn get dateOfTesting =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<EnergyMeterModel> getEnergyMeterById(int id) async {
    EnergyMeterLocalData tEnergyMeterData =
        await sl<AppDatabase>().getEnergyMeterLocalDataWithId(id);

    EnergyMeterModel tEnergyMeterModel = EnergyMeterModel(
      etype: tEnergyMeterData.etype,
      databaseID: tEnergyMeterData.databaseID,
      designation: tEnergyMeterData.designation,
      location: tEnergyMeterData.location,
      panel: tEnergyMeterData.panel,
      make: tEnergyMeterData.make,
      serialNo: tEnergyMeterData.serialNo,
      voltage: tEnergyMeterData.voltage,
      frequency: tEnergyMeterData.frequency,
      eqClass: tEnergyMeterData.eqClass,
      trNo: tEnergyMeterData.trNo,
      dateOfTesting: tEnergyMeterData.dateOfTesting,
      id: tEnergyMeterData.id,
      TestedBy: tEnergyMeterData.TestedBy,
      VerifiedBy: tEnergyMeterData.VerifiedBy,
      WitnessedBy: tEnergyMeterData.WitnessedBy,
      updateDate: tEnergyMeterData.lastUpdated,
      ctr: tEnergyMeterData.ctr,
      ptr: tEnergyMeterData.ptr,
    );

    return tEnergyMeterModel;
  }

  @override
  Future<List<EnergyMeterModel>> getEnergyMeterByTrNo(int trNo) async {
    final tEnergyMeterData =
        await sl<AppDatabase>().getEnergyMeterLocalDataWithtrNo(trNo);

    List<EnergyMeterModel> tEnergyMeterModel =
        List<EnergyMeterModel>.empty(growable: true);
    for (var element in tEnergyMeterData) {
      tEnergyMeterModel.add(EnergyMeterModel(
        etype: element.etype,
        databaseID: element.databaseID,
        designation: element.designation,
        location: element.location,
        panel: element.panel,
        make: element.make,
        serialNo: element.serialNo,
        voltage: element.voltage,
        frequency: element.frequency,
        eqClass: element.eqClass,
        trNo: element.trNo,
        dateOfTesting: element.dateOfTesting,
        id: element.id,
        TestedBy: element.TestedBy,
        VerifiedBy: element.VerifiedBy,
        WitnessedBy: element.WitnessedBy,
        updateDate: element.lastUpdated,
        ctr: element.ctr,
        ptr: element.ptr,
      ));
    }

    return tEnergyMeterModel;
  }

  @override
  Future<int> localEnergyMeter(
      EnergyMeterModel emtolocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createEnergyMeter(emtolocal, dateOfTesting));
  }

  @override
  Future<void> updateEnergyMeter(EnergyMeterModel emtoupdate, int id) async {
    sl<AppDatabase>().updateEnergyMeter(emtoupdate, id);
  }

  @override
  Future<int> deleteEnergyMeterById(int id) {
    return (sl<AppDatabase>().deleteEnergyMeterById(id));
  }

  @override
  Future<List<EnergyMeterModel>> getEMLocalDataList() async {
    final temDataList = await sl<AppDatabase>().getEMLocalDatadourceImpleList();
    List<EnergyMeterModel> temDataModel =
        List<EnergyMeterModel>.empty(growable: true);

    for (var listEle in temDataList) {
      temDataModel.add(EnergyMeterModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        etype: listEle.etype,
        designation: listEle.designation,
        location: listEle.location,
        panel: listEle.panel,
        make: listEle.make,
        serialNo: listEle.serialNo,
        voltage: listEle.voltage,
        frequency: listEle.frequency,
        eqClass: listEle.eqClass,
        trNo: listEle.trNo,
        dateOfTesting: listEle.dateOfTesting,
        TestedBy: listEle.TestedBy,
        VerifiedBy: listEle.VerifiedBy,
        WitnessedBy: listEle.WitnessedBy,
        updateDate: listEle.lastUpdated,
        ctr: listEle.ctr,
        ptr: listEle.ptr,
      ));
    }
    return temDataModel;
  }
}
