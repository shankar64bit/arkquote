import 'package:drift/drift.dart';
import '../../../../models/equipment/Relays/AuxiliaryRelay/AR_model.dart';
import '../../../../../../../injection_container.dart';
import '../../../test_report_local_datasource.dart';
// import '../../../../models/equipment/Relays/AR/AR_model.dart';
// import '../../../test_report_local_datasource.dart';
// import '../../../models/equipment/AT/AT_model.dart';
// import '../../test_report_local_datasource.dart';

abstract class ARLocalDatasource {
  Future<List<ARModel>> getARByTrNo(int trNo);
  Future<List<ARModel>> getARBySerialNo(String sn);
  Future<List<ARModel>> getARLocalDataList();
  Future<ARModel> getARById(int id);
  Future<int> localAR(ARModel artolocal, DateTime dateOfTesting);
  Future<void> updateAR(ARModel artoupdate, int id);
  Future<int> deleteARById(int id);
  // Future<List> getARLocalDataList();
}

@DataClassName('ARLocalData')
class ARLocalDatasourceImpl extends Table implements ARLocalDatasource {
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
  TextColumn get panel => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get make => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get rtype => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get auxVoltage => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get noOfCoil => integer()();
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
  Future<ARModel> getARById(int id) async {
    ARLocalData tARData = await sl<AppDatabase>().getARLocalDataWithId(id);

    ARModel tARModel = ARModel(
      id: tARData.id,
      databaseID: tARData.databaseID,
      etype: tARData.etype,
      trNo: tARData.trNo,
      designation: tARData.designation,
      location: tARData.location,
      noOfCoil: tARData.noOfCoil,
      panel: tARData.panel,
      make: tARData.make,
      rtype: tARData.rtype,
      auxVoltage: tARData.auxVoltage,
      dateOfTesting: tARData.dateOfTesting,
      updateDate: tARData.updateDate,
      testedBy: tARData.testedBy,
      verifiedBy: tARData.verifiedBy,
      WitnessedBy: tARData.WitnessedBy,
    );

    return tARModel;
  }

  //getCTBySerialNo
  @override
  Future<List<ARModel>> getARBySerialNo(String sn) async {
    final tARData = await sl<AppDatabase>().getARLocalDataWithSerialNo(sn);

    List<ARModel> tARModel = List<ARModel>.empty(growable: true);
    for (var element in tARData) {
      tARModel.add(ARModel(
        id: element.id,
        databaseID: element.databaseID,
        etype: element.etype,
        trNo: element.trNo,
        designation: element.designation,
        location: element.location,
        noOfCoil: element.noOfCoil,
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
    return tARModel;
  }

  @override
  Future<List<ARModel>> getARByTrNo(int trNo) async {
    final tARData = await sl<AppDatabase>().getARLocalDataWithtrNo(trNo);

    List<ARModel> tARModel = List<ARModel>.empty(growable: true);
    for (var element in tARData) {
      tARModel.add(ARModel(
        id: element.id,
        databaseID: element.databaseID,
        etype: element.etype,
        trNo: element.trNo,
        designation: element.designation,
        location: element.location,
        noOfCoil: element.noOfCoil,
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
    return tARModel;
  }

  @override
  Future<int> localAR(ARModel artolocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createAR(artolocal, dateOfTesting));
  }

  @override
  Future<void> updateAR(ARModel artoupdate, int id) async {
    sl<AppDatabase>().updateAR(artoupdate, id);
  }

  @override
  Future<int> deleteARById(int id) {
    return (sl<AppDatabase>().deleteARById(id));
  }

  @override
  Future<List<ARModel>> getARLocalDataList() async {
    final tIsoDataList = await sl<AppDatabase>().getARfromLocalDataList();
    List<ARModel> tIsoDataModel = List<ARModel>.empty(growable: true);

    for (var listEle in tIsoDataList) {
      tIsoDataModel.add(ARModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        etype: listEle.etype,
        trNo: listEle.trNo,
        designation: listEle.designation,
        location: listEle.location,
        noOfCoil: listEle.noOfCoil,
        make: listEle.make,
        rtype: listEle.rtype,
        auxVoltage: listEle.auxVoltage,
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
