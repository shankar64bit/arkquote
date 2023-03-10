import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/AT/AT_model.dart';
import '../../test_report_local_datasource.dart';

abstract class ATLocalDatasource {
  Future<List<ATModel>> getATByTrNo(int trNo);
  Future<List<ATModel>> getATBySerialNo(String sn);
  Future<ATModel> getATById(int id);
  Future<int> localAT(ATModel attolocal, DateTime dateOfTesting);
  Future<void> updateAT(ATModel attoupdate, int id);
  Future<int> deleteATById(int id);
  Future<List<ATModel>> getATLocalDataList();
}

@DataClassName('ATLocalData')
class ATLocalDatasourceImpl extends Table implements ATLocalDatasource {
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
  IntColumn get rating => integer()();
  @required
  IntColumn get ratedVoltage_HV => integer()();
  @required
  IntColumn get ratedVoltage_LV => integer()();
  @required
  RealColumn get ratedCurrent_HV => real()();
  @required
  RealColumn get ratedCurrent_LV => real()();
  @required
  TextColumn get vectorGroup => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get impedanceVoltage => real()();
  @required
  IntColumn get frequency => integer()();
  @required
  TextColumn get typeOfCooling => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get noOfPhases => integer()();
  @required
  IntColumn get noOfTaps => integer()();
  @required
  IntColumn get onOfNominalTaps => integer()();
  @required
  IntColumn get yom => integer()();
  @required
  TextColumn get make => text().withLength(min: 1, max: 50)();
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
  Future<ATModel> getATById(int id) async {
    ATLocalData tATData = await sl<AppDatabase>().getATLocalDataWithId(id);

    ATModel tATModel = ATModel(
      id: tATData.id,
      databaseID: tATData.databaseID,
      etype: tATData.etype,
      trNo: tATData.trNo,
      designation: tATData.designation,
      location: tATData.location,
      serialNo: tATData.serialNo,
      rating: tATData.rating,
      ratedVoltage_HV: tATData.ratedVoltage_HV,
      ratedVoltage_LV: tATData.ratedVoltage_LV,
      ratedCurrent_HV: tATData.ratedCurrent_HV,
      ratedCurrent_LV: tATData.ratedCurrent_LV,
      vectorGroup: tATData.vectorGroup,
      impedanceVoltage: tATData.impedanceVoltage,
      frequency: tATData.frequency,
      typeOfCooling: tATData.typeOfCooling,
      noOfPhases: tATData.noOfPhases,
      noOfTaps: tATData.noOfTaps,
      onOfNominalTaps: tATData.onOfNominalTaps,
      yom: tATData.yom,
      make: tATData.make,
      dateOfTesting: tATData.dateOfTesting,
      updateDate: tATData.updateDate,
      testedBy: tATData.testedBy,
      verifiedBy: tATData.verifiedBy,
      WitnessedBy: tATData.WitnessedBy,
    );

    return tATModel;
  }

  //getCTBySerialNo
  @override
  Future<List<ATModel>> getATBySerialNo(String sn) async {
    final tATData = await sl<AppDatabase>().getATLocalDataWithSerialNo(sn);

    List<ATModel> tatModel = List<ATModel>.empty(growable: true);
    for (var element in tATData) {
      tatModel.add(ATModel(
        id: element.id,
        databaseID: element.databaseID,
        etype: element.etype,
        trNo: element.trNo,
        designation: element.designation,
        location: element.location,
        serialNo: element.serialNo,
        rating: element.rating,
        ratedVoltage_HV: element.ratedVoltage_HV,
        ratedVoltage_LV: element.ratedVoltage_LV,
        ratedCurrent_HV: element.ratedCurrent_HV,
        ratedCurrent_LV: element.ratedCurrent_LV,
        vectorGroup: element.vectorGroup,
        impedanceVoltage: element.impedanceVoltage,
        frequency: element.frequency,
        typeOfCooling: element.typeOfCooling,
        noOfPhases: element.noOfPhases,
        noOfTaps: element.noOfTaps,
        onOfNominalTaps: element.onOfNominalTaps,
        yom: element.yom,
        make: element.make,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return tatModel;
  }

  @override
  Future<List<ATModel>> getATByTrNo(int trNo) async {
    final tATData = await sl<AppDatabase>().getATLocalDataWithtrNo(trNo);

    List<ATModel> tatModel = List<ATModel>.empty(growable: true);
    for (var element in tATData) {
      tatModel.add(ATModel(
        id: element.id,
        databaseID: element.databaseID,
        etype: element.etype,
        trNo: element.trNo,
        designation: element.designation,
        location: element.location,
        serialNo: element.serialNo,
        rating: element.rating,
        ratedVoltage_HV: element.ratedVoltage_HV,
        ratedVoltage_LV: element.ratedVoltage_LV,
        ratedCurrent_HV: element.ratedCurrent_HV,
        ratedCurrent_LV: element.ratedCurrent_LV,
        vectorGroup: element.vectorGroup,
        impedanceVoltage: element.impedanceVoltage,
        frequency: element.frequency,
        typeOfCooling: element.typeOfCooling,
        noOfPhases: element.noOfPhases,
        noOfTaps: element.noOfTaps,
        onOfNominalTaps: element.onOfNominalTaps,
        yom: element.yom,
        make: element.make,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return tatModel;
  }

  @override
  Future<int> localAT(ATModel attolocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createAT(attolocal, dateOfTesting));
  }

  @override
  Future<void> updateAT(ATModel attoupdate, int id) async {
    sl<AppDatabase>().updateAT(attoupdate, id);
  }

  @override
  Future<int> deleteATById(int id) {
    return (sl<AppDatabase>().deleteATById(id));
  }

  @override
  Future<List<ATModel>> getATLocalDataList() async {
    final tatDataList = await sl<AppDatabase>().getATLocalDatadourceImpleList();
    List<ATModel> tatDataModel = List<ATModel>.empty(growable: true);

    for (var listEle in tatDataList) {
      tatDataModel.add(ATModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        etype: listEle.etype,
        trNo: listEle.trNo,
        designation: listEle.designation,
        location: listEle.location,
        serialNo: listEle.serialNo,
        rating: listEle.rating,
        ratedVoltage_HV: listEle.ratedVoltage_HV,
        ratedVoltage_LV: listEle.ratedVoltage_LV,
        ratedCurrent_HV: listEle.ratedCurrent_HV,
        ratedCurrent_LV: listEle.ratedCurrent_LV,
        vectorGroup: listEle.vectorGroup,
        impedanceVoltage: listEle.impedanceVoltage,
        frequency: listEle.frequency,
        typeOfCooling: listEle.typeOfCooling,
        noOfPhases: listEle.noOfPhases,
        noOfTaps: listEle.noOfTaps,
        onOfNominalTaps: listEle.onOfNominalTaps,
        yom: listEle.yom,
        make: listEle.make,
        dateOfTesting: listEle.dateOfTesting,
        updateDate: listEle.updateDate,
        testedBy: listEle.testedBy,
        verifiedBy: listEle.verifiedBy,
        WitnessedBy: listEle.WitnessedBy,
      ));
    }
    return tatDataModel;
  }
}
