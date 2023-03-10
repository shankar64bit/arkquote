// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../models/equipment/powt_3_winding/powt3winding_model.dart';
import '../../test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';

abstract class Powt3WindingLocalDatasource {
  Future<List<Powt3WindingModel>> getPowt3WindingByTrNo(int trNo);
  Future<List<Powt3WindingModel>> getPowt3WindingBySerialNo(String sn);
  Future<List<Powt3WindingModel>> getPowt3WindingLocalDataList();
  Future<Powt3WindingModel> getPowt3WindingById(int id);
  Future<int> localPowt3Winding(
      Powt3WindingModel p3wtolocal, DateTime dateOfTesting);
  Future<void> updatePowt3Winding(
      Powt3WindingModel p3wtoupdate, int id);
  Future<int> deletePowt3WindingById(int id);
}

@DataClassName('Powt3WindingLocalData')
class Powt3WindingLocalDatasourceImpl extends Table
    implements Powt3WindingLocalDatasource {
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
  IntColumn get ratedVoltage_TS => integer()();
  @required
  TextColumn get ratedCurrent_TS => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get ratedCurrent_HV => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get ratedCurrent_LV => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get vectorGroup => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get impedanceVoltageLTap => real()();
  @required
  RealColumn get impedanceVoltageRTap => real()();
  @required
  RealColumn get impedanceVoltageHTap => real()();
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
  IntColumn get onOfNominalTaps => integer()();
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
  Future<Powt3WindingModel> getPowt3WindingById(int id) async {
    Powt3WindingLocalData tPowt3WindingData =
        await sl<AppDatabase>().getPowt3WindingLocalDataWithId(id);

    Powt3WindingModel tPowt3WindingModel = Powt3WindingModel(
      id: tPowt3WindingData.id,
      databaseID: tPowt3WindingData.databaseID,
      etype: tPowt3WindingData.etype,
      trNo: tPowt3WindingData.trNo,
      designation: tPowt3WindingData.designation,
      location: tPowt3WindingData.location,
      serialNo: tPowt3WindingData.serialNo,
      rating: tPowt3WindingData.rating,
      ratedVoltage_HV: tPowt3WindingData.ratedVoltage_HV,
      ratedVoltage_LV: tPowt3WindingData.ratedVoltage_LV,
      ratedCurrent_HV: tPowt3WindingData.ratedCurrent_HV,
      ratedCurrent_LV: tPowt3WindingData.ratedCurrent_LV,
      vectorGroup: tPowt3WindingData.vectorGroup,
      impedanceVoltageLTap: tPowt3WindingData.impedanceVoltageLTap,
      impedanceVoltageRTap: tPowt3WindingData.impedanceVoltageRTap,
      impedanceVoltageHTap: tPowt3WindingData.impedanceVoltageHTap,
      frequency: tPowt3WindingData.frequency,
      typeOfCooling: tPowt3WindingData.typeOfCooling,
      noOfPhases: tPowt3WindingData.noOfPhases,
      make: tPowt3WindingData.make,
      ratedCurrent_TS: tPowt3WindingData.ratedCurrent_TS,
      ratedVoltage_TS: tPowt3WindingData.ratedVoltage_TS,
      yom: tPowt3WindingData.yom,
      noOfTaps: tPowt3WindingData.noOfTaps,
      onOfNominalTaps: tPowt3WindingData.onOfNominalTaps,
      oilTemp: tPowt3WindingData.oilTemp,
      windingTemp: tPowt3WindingData.windingTemp,
      ambientTemp: tPowt3WindingData.ambientTemp,
      dateOfTesting: tPowt3WindingData.dateOfTesting,
      updateDate: tPowt3WindingData.updateDate,
      testedBy: tPowt3WindingData.testedBy,
      verifiedBy: tPowt3WindingData.verifiedBy,
      WitnessedBy: tPowt3WindingData.WitnessedBy,
    );
    return tPowt3WindingModel;
  }

  @override
  Future<List<Powt3WindingModel>> getPowt3WindingBySerialNo(String sn) async {
    final tpowt3WindingData =
        await sl<AppDatabase>().getPowt3WindingLocalDataWithSerialNo(sn);

    List<Powt3WindingModel> tpowt3WindingModel =
        List<Powt3WindingModel>.empty(growable: true);
    for (var element in tpowt3WindingData) {
      tpowt3WindingModel.add(Powt3WindingModel(
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
        impedanceVoltageLTap: element.impedanceVoltageLTap,
        impedanceVoltageRTap: element.impedanceVoltageRTap,
        impedanceVoltageHTap: element.impedanceVoltageHTap,
        frequency: element.frequency,
        typeOfCooling: element.typeOfCooling,
        noOfPhases: element.noOfPhases,
        make: element.make,
        yom: element.yom,
        ratedCurrent_TS: element.ratedCurrent_TS,
        ratedVoltage_TS: element.ratedVoltage_TS,
        noOfTaps: element.noOfTaps,
        onOfNominalTaps: element.onOfNominalTaps,
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
    return tpowt3WindingModel;
  }

  @override
  Future<List<Powt3WindingModel>> getPowt3WindingByTrNo(int trNo) async {
    final tPowt3WindingData =
        await sl<AppDatabase>().getPowt3WindingLocalDataWithtrNo(trNo);

    List<Powt3WindingModel> tpowt3WindingModel =
        List<Powt3WindingModel>.empty(growable: true);
    for (var element in tPowt3WindingData) {
      tpowt3WindingModel.add(Powt3WindingModel(
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
        ratedCurrent_TS: element.ratedCurrent_TS,
        ratedVoltage_TS: element.ratedVoltage_TS,
        impedanceVoltageLTap: element.impedanceVoltageLTap,
        impedanceVoltageRTap: element.impedanceVoltageRTap,
        impedanceVoltageHTap: element.impedanceVoltageHTap,
        frequency: element.frequency,
        typeOfCooling: element.typeOfCooling,
        noOfPhases: element.noOfPhases,
        make: element.make,
        yom: element.yom,
        noOfTaps: element.noOfTaps,
        onOfNominalTaps: element.onOfNominalTaps,
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
    return tpowt3WindingModel;
  }

  @override
  Future<int> localPowt3Winding(
      Powt3WindingModel p3wtolocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>()
        .createPowt3Winding(p3wtolocal, dateOfTesting));
  }

  @override
  Future<void> updatePowt3Winding(
      Powt3WindingModel p3wtoupdate, int id) async {
    sl<AppDatabase>().updatePowt3Winding(p3wtoupdate, id);
  }

  @override
  Future<int> deletePowt3WindingById(int id) {
    return (sl<AppDatabase>().deletePowt3WindingById(id));
  }

  @override
  Future<List<Powt3WindingModel>> getPowt3WindingLocalDataList() async {
    final tIsoDataList = await sl<AppDatabase>().getPowt3WinLocalDataList();
    List<Powt3WindingModel> tIsoDataModel =
        List<Powt3WindingModel>.empty(growable: true);

    for (var listEle in tIsoDataList) {
      tIsoDataModel.add(Powt3WindingModel(
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
        ratedCurrent_TS: listEle.ratedCurrent_TS,
        ratedVoltage_TS: listEle.ratedVoltage_TS,
        impedanceVoltageLTap: listEle.impedanceVoltageLTap,
        impedanceVoltageRTap: listEle.impedanceVoltageRTap,
        impedanceVoltageHTap: listEle.impedanceVoltageHTap,
        frequency: listEle.frequency,
        typeOfCooling: listEle.typeOfCooling,
        noOfPhases: listEle.noOfPhases,
        make: listEle.make,
        yom: listEle.yom,
        noOfTaps: listEle.noOfTaps,
        onOfNominalTaps: listEle.onOfNominalTaps,
        oilTemp: listEle.oilTemp,
        windingTemp: listEle.windingTemp,
        ambientTemp: listEle.ambientTemp,
        dateOfTesting: listEle.dateOfTesting,
        updateDate: listEle.updateDate,
        testedBy: listEle.testedBy,
        verifiedBy: listEle.verifiedBy,
        WitnessedBy: listEle.WitnessedBy,
      ));
    }
    return tIsoDataModel;
  }
}
