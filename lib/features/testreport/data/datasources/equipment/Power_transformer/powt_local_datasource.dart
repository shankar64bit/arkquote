// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/powt/powt_model.dart';
// import '../../../../../../injection_container.dart';
// import '../../test_report_local_datasource.dart';

abstract class PowtLocalDatasource {
  Future<List<PowtModel>> getPowtByTrNo(int trNo);
  Future<List<PowtModel>> getPowtBySerialNo(String sn);
  Future<List<PowtModel>> getPowtLocalDataList();
  Future<PowtModel> getPowtById(int id);
  Future<int> localPowt(PowtModel powttolocal, DateTime dateOfTesting);
  Future<void> updatePowt(PowtModel powttoupdate, int id);
  Future<int> deletePowtById(int id);
}

@DataClassName('PowtLocalData')
class PowtLocalDatasourceImpl extends Table implements PowtLocalDatasource {
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
  Future<PowtModel> getPowtById(int id) async {
    PowtLocalData tPowtData =
        await sl<AppDatabase>().getPowtLocalDataWithId(id);

    PowtModel tPowtModel = PowtModel(
      id: tPowtData.id,
      databaseID: tPowtData.databaseID,
      etype: tPowtData.etype,
      trNo: tPowtData.trNo,
      designation: tPowtData.designation,
      location: tPowtData.location,
      serialNo: tPowtData.serialNo,
      rating: tPowtData.rating,
      ratedVoltage_HV: tPowtData.ratedVoltage_HV,
      ratedVoltage_LV: tPowtData.ratedVoltage_LV,
      ratedCurrent_HV: tPowtData.ratedCurrent_HV,
      ratedCurrent_LV: tPowtData.ratedCurrent_LV,
      vectorGroup: tPowtData.vectorGroup,
      impedanceVoltageLTap: tPowtData.impedanceVoltageLTap,
      impedanceVoltageRTap: tPowtData.impedanceVoltageRTap,
      impedanceVoltageHTap: tPowtData.impedanceVoltageHTap,
      frequency: tPowtData.frequency,
      typeOfCooling: tPowtData.typeOfCooling,
      noOfPhases: tPowtData.noOfPhases,
      make: tPowtData.make,
      yom: tPowtData.yom,
      noOfTaps: tPowtData.noOfTaps,
      onOfNominalTaps: tPowtData.onOfNominalTaps,
      oilTemp: tPowtData.oilTemp,
      windingTemp: tPowtData.windingTemp,
      ambientTemp: tPowtData.ambientTemp,
      dateOfTesting: tPowtData.dateOfTesting,
      updateDate: tPowtData.updateDate,
      testedBy: tPowtData.testedBy,
      verifiedBy: tPowtData.verifiedBy,
      WitnessedBy: tPowtData.WitnessedBy,
    );
    return tPowtModel;
  }

  @override
  Future<List<PowtModel>> getPowtBySerialNo(String sn) async {
    final tpowtData = await sl<AppDatabase>().getPowtLocalDataWithSerialNo(sn);

    List<PowtModel> tpowtModel = List<PowtModel>.empty(growable: true);
    for (var element in tpowtData) {
      tpowtModel.add(PowtModel(
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
    return tpowtModel;
  }

  @override
  Future<List<PowtModel>> getPowtByTrNo(int trNo) async {
    final tPowtData = await sl<AppDatabase>().getPowtLocalDataWithtrNo(trNo);

    List<PowtModel> tpowtModel = List<PowtModel>.empty(growable: true);
    for (var element in tPowtData) {
      tpowtModel.add(PowtModel(
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
    return tpowtModel;
  }

  @override
  Future<int> localPowt(PowtModel powttolocal, DateTime dateOfTesting) {
    return (sl<AppDatabase>().createPowt(powttolocal, dateOfTesting));
  }

  @override
  Future<void> updatePowt(PowtModel powttoupdate, int id) async {
    sl<AppDatabase>().updatePowt(powttoupdate, id);
  }

  @override
  Future<int> deletePowtById(int id) {
    return (sl<AppDatabase>().deletePowtById(id));
  }

  @override
  Future<List<PowtModel>> getPowtLocalDataList() async {
    final tIsoDataList = await sl<AppDatabase>().getPowtLocalDataList();
    List<PowtModel> tIsoDataModel = List<PowtModel>.empty(growable: true);

    for (var listEle in tIsoDataList) {
      tIsoDataModel.add(PowtModel(
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
