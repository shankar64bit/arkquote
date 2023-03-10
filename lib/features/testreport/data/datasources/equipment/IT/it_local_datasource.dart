// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/IT/it_model.dart';

abstract class ItLocalDatasource {
  Future<List<ItModel>> getItByTrNo(int trNo);
  Future<List<ItModel>> getItBySerialNo(String sn);
  Future<List<ItModel>> getITLocalDataList();
  Future<ItModel> getItById(int id);
  Future<int> localIt(ItModel itToLocal, DateTime dateOfTesting);
  Future<void> updateIt(ItModel ittoUpdate, int id);
  Future<int> deleteItById(int id);
}

@DataClassName('ItLocalData')
class ItLocalDatasourceImpl extends Table implements ItLocalDatasource {
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
  TextColumn get rating => text().withLength(min: 1, max: 50)();
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
  RealColumn get impedanceVoltage_HV_LV1 => real()();
  @required
  RealColumn get impedanceVoltage_HV_LV2 => real()();
  @required
  RealColumn get impedanceVoltage_HV_LV3 => real()();
  @required
  RealColumn get impedanceVoltage_HV_LV4 => real()();
  @required
  RealColumn get impedanceVoltage_Lv_LV => real()();
  @required
  IntColumn get frequency => integer()();
  @required
  TextColumn get typeOfCooling => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get noOfPhases => integer()();
  @required
  TextColumn get make => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get yom => integer()();
  @required
  IntColumn get noOfTaps => integer()();
  @required
  IntColumn get noOfNominalTaps => integer()();
  @required
  IntColumn get oilTemp => integer()();
  @required
  IntColumn get windingTemp => integer()();
  @required
  IntColumn get ambientTemp => integer()();
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

  @override
  Future<ItModel> getItById(int id) async {
    ItLocalData tItData = await sl<AppDatabase>().getItLocalDataWithId(id);

    ItModel tItModel = ItModel(
      id: tItData.id,
      databaseID: tItData.databaseID,
      etype: tItData.etype,
      trNo: tItData.trNo,
      designation: tItData.designation,
      location: tItData.location,
      serialNo: tItData.serialNo,
      rating: tItData.rating,
      ratedVoltage_HV: tItData.ratedVoltage_HV,
      ratedVoltage_LV: tItData.ratedVoltage_LV,
      ratedCurrent_HV: tItData.ratedCurrent_HV,
      ratedCurrent_LV: tItData.ratedCurrent_LV,
      vectorGroup: tItData.vectorGroup,
      impedanceVoltage_HV_LV1: tItData.impedanceVoltage_HV_LV1,
      impedanceVoltage_HV_LV2: tItData.impedanceVoltage_HV_LV2,
      impedanceVoltage_HV_LV3: tItData.impedanceVoltage_HV_LV3,
      impedanceVoltage_HV_LV4: tItData.impedanceVoltage_HV_LV4,
      impedanceVoltage_LV_LV: tItData.impedanceVoltage_Lv_LV,
      frequency: tItData.frequency,
      typeOfCooling: tItData.typeOfCooling,
      noOfPhases: tItData.noOfPhases,
      make: tItData.make,
      yom: tItData.yom,
      noOfTaps: tItData.noOfTaps,
      noOfNominalTaps: tItData.noOfNominalTaps,
      oilTemp: tItData.oilTemp,
      windingTemp: tItData.windingTemp,
      ambientTemp: tItData.ambientTemp,
      dateOfTesting: tItData.dateOfTesting,
      updateDate: tItData.updateDate,
      testedBy: tItData.testedBy,
      verifiedBy: tItData.verifiedBy,
      WitnessedBy: tItData.WitnessedBy,
    );
    return tItModel;
  }

  @override
  Future<List<ItModel>> getItBySerialNo(String sn) async {
    final tPTData = await sl<AppDatabase>().getItLocalDataWithSerialNo(sn);

    List<ItModel> tItModel = List<ItModel>.empty(growable: true);
    for (var element in tPTData) {
      tItModel.add(ItModel(
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
        impedanceVoltage_HV_LV1: element.impedanceVoltage_HV_LV1,
        impedanceVoltage_HV_LV2: element.impedanceVoltage_HV_LV2,
        impedanceVoltage_HV_LV3: element.impedanceVoltage_HV_LV3,
        impedanceVoltage_HV_LV4: element.impedanceVoltage_HV_LV4,
        impedanceVoltage_LV_LV: element.impedanceVoltage_Lv_LV,
        frequency: element.frequency,
        typeOfCooling: element.typeOfCooling,
        noOfPhases: element.noOfPhases,
        make: element.make,
        yom: element.yom,
        noOfTaps: element.noOfTaps,
        noOfNominalTaps: element.noOfNominalTaps,
        oilTemp: element.oilTemp,
        windingTemp: element.windingTemp,
        ambientTemp: element.ambientTemp,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return tItModel;
  }

  @override
  Future<List<ItModel>> getItByTrNo(int trNo) async {
    final tItData = await sl<AppDatabase>().getItLocalDataWithtrNo(trNo);

    List<ItModel> titModel = List<ItModel>.empty(growable: true);
    for (var element in tItData) {
      titModel.add(ItModel(
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
        impedanceVoltage_HV_LV1: element.impedanceVoltage_HV_LV1,
        impedanceVoltage_HV_LV2: element.impedanceVoltage_HV_LV2,
        impedanceVoltage_HV_LV3: element.impedanceVoltage_HV_LV3,
        impedanceVoltage_HV_LV4: element.impedanceVoltage_HV_LV4,
        impedanceVoltage_LV_LV: element.impedanceVoltage_Lv_LV,
        frequency: element.frequency,
        typeOfCooling: element.typeOfCooling,
        noOfPhases: element.noOfPhases,
        make: element.make,
        yom: element.yom,
        noOfTaps: element.noOfTaps,
        noOfNominalTaps: element.noOfNominalTaps,
        oilTemp: element.oilTemp,
        windingTemp: element.windingTemp,
        ambientTemp: element.ambientTemp,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return titModel;
  }

  @override
  Future<int> localIt(ItModel itToLocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createIt(itToLocal, dateOfTesting));
  }

  @override
  Future<void> updateIt(ItModel ittoUpdate, int id) async {
    sl<AppDatabase>().updateIt(ittoUpdate, id);
  }

  @override
  Future<int> deleteItById(int id) {
    return (sl<AppDatabase>().deleteItById(id));
  }

  //getITLocalDataList
  @override
  Future<List<ItModel>> getITLocalDataList() async {
    final tItData = await sl<AppDatabase>().getItLocalDataWithLists();

    List<ItModel> titModel = List<ItModel>.empty(growable: true);
    for (var element in tItData) {
      titModel.add(ItModel(
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
        impedanceVoltage_HV_LV1: element.impedanceVoltage_HV_LV1,
        impedanceVoltage_HV_LV2: element.impedanceVoltage_HV_LV2,
        impedanceVoltage_HV_LV3: element.impedanceVoltage_HV_LV3,
        impedanceVoltage_HV_LV4: element.impedanceVoltage_HV_LV4,
        impedanceVoltage_LV_LV: element.impedanceVoltage_Lv_LV,
        frequency: element.frequency,
        typeOfCooling: element.typeOfCooling,
        noOfPhases: element.noOfPhases,
        make: element.make,
        yom: element.yom,
        noOfTaps: element.noOfTaps,
        noOfNominalTaps: element.noOfNominalTaps,
        oilTemp: element.oilTemp,
        windingTemp: element.windingTemp,
        ambientTemp: element.ambientTemp,
        dateOfTesting: element.dateOfTesting,
        updateDate: element.updateDate,
        testedBy: element.testedBy,
        verifiedBy: element.verifiedBy,
        WitnessedBy: element.WitnessedBy,
      ));
    }
    return titModel;
  }
}
