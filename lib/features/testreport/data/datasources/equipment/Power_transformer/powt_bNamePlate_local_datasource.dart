// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../models/equipment/powt/powt_bNamePlate_model.dart';
import '../../test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';
// import '../../../models/equipment/powt/powt_wrHv_model.dart';
// import '../../test_report_local_datasource.dart';
// import '../../../../../../injection_container.dart';
// import '../../test_report_local_datasource.dart';

abstract class PowtbNamePlateLocalDatasource {
  Future<PowtbNamePlateModel> getPowtbNamePlate_ById(int id);
  Future<int> localPowtbNamePlate(PowtbNamePlateModel powtbnameplatetolocal);
  Future<void> updatePowtbNamePlate(
      PowtbNamePlateModel powtbnameplatetoupdate, int id);
  Future<int> deletePowtbNamePlateById(int id);
  Future<List<PowtbNamePlateModel>> getPowtbNamePlateTrNoID(int trNo);
  Future<List<PowtbNamePlateModel>> getPowtbNamePlateSerialNo(String serialNo);
  Future<List<PowtbNamePlateModel>> getPowtbnameplateEquipmentLists();
}

@DataClassName('PowtbNamePlateLocalData')
class PowtbNamePlateLocalDatasourceImpl extends Table
    implements PowtbNamePlateLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get R_serialNo => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get R_ratedVoltage => integer()();
  @required
  IntColumn get R_ratedCurrent => integer()();
  @required
  TextColumn get R_Make => text().withLength(min: 1, max: 50)();

  @required
  TextColumn get Y_serialNo => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get Y_ratedVoltage => integer()();
  @required
  IntColumn get Y_ratedCurrent => integer()();
  @required
  TextColumn get Y_Make => text().withLength(min: 1, max: 50)();

  @required
  TextColumn get B_serialNo => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get B_ratedVoltage => integer()();
  @required
  IntColumn get B_ratedCurrent => integer()();
  @required
  TextColumn get B_Make => text().withLength(min: 1, max: 50)();

  @override
  Future<PowtbNamePlateModel> getPowtbNamePlate_ById(int id) async {
    PowtbNamePlateLocalData tPowtbNamePlateData =
        await sl<AppDatabase>().getPowtbNamePlateLocalDataWithId(id);
    PowtbNamePlateModel tPowtbNamePlateModel = PowtbNamePlateModel(
      id: tPowtbNamePlateData.id,
      databaseID: tPowtbNamePlateData.databaseID,
      trNo: tPowtbNamePlateData.trNo,
      serialNo: tPowtbNamePlateData.serialNo,
      R_serialNo: tPowtbNamePlateData.R_serialNo,
      R_ratedVoltage: tPowtbNamePlateData.R_ratedVoltage,
      R_ratedCurrent: tPowtbNamePlateData.R_ratedCurrent,
      R_Make: tPowtbNamePlateData.R_Make,
      Y_serialNo: tPowtbNamePlateData.Y_serialNo,
      Y_ratedVoltage: tPowtbNamePlateData.Y_ratedVoltage,
      Y_ratedCurrent: tPowtbNamePlateData.Y_ratedCurrent,
      Y_Make: tPowtbNamePlateData.Y_Make,
      B_serialNo: tPowtbNamePlateData.B_serialNo,
      B_ratedVoltage: tPowtbNamePlateData.B_ratedVoltage,
      B_ratedCurrent: tPowtbNamePlateData.B_ratedCurrent,
      B_Make: tPowtbNamePlateData.B_Make,
    );
    return tPowtbNamePlateModel;
  }

  @override
  Future<int> localPowtbNamePlate(PowtbNamePlateModel powtbnameplatetolocal) {
    return (sl<AppDatabase>().createPowtbNamePlate(powtbnameplatetolocal));
  }

  @override
  Future<void> updatePowtbNamePlate(
      PowtbNamePlateModel powtbnameplatetoupdate, int id) async {
    sl<AppDatabase>().updatePowtbNamePlate(powtbnameplatetoupdate, id);
  }

  @override
  Future<int> deletePowtbNamePlateById(int id) {
    return (sl<AppDatabase>().deletePowtbNamePlateById(id));
  }

  @override
  Future<List<PowtbNamePlateModel>> getPowtbNamePlateTrNoID(int trNo) async {
    final tPowtbNamePlate_data =
        await sl<AppDatabase>().getPowtbNamePlateLocalDataWithtrNoID(trNo);

    List<PowtbNamePlateModel> tPowtbNamePlate_Model =
        List<PowtbNamePlateModel>.empty(growable: true);
    for (var listEle in tPowtbNamePlate_data) {
      tPowtbNamePlate_Model.add(PowtbNamePlateModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        R_serialNo: listEle.R_serialNo,
        R_ratedVoltage: listEle.R_ratedVoltage,
        R_ratedCurrent: listEle.R_ratedCurrent,
        R_Make: listEle.R_Make,
        Y_serialNo: listEle.Y_serialNo,
        Y_ratedVoltage: listEle.Y_ratedVoltage,
        Y_ratedCurrent: listEle.Y_ratedCurrent,
        Y_Make: listEle.Y_Make,
        B_serialNo: listEle.B_serialNo,
        B_ratedVoltage: listEle.B_ratedVoltage,
        B_ratedCurrent: listEle.B_ratedCurrent,
        B_Make: listEle.B_Make,
      ));
    }
    return tPowtbNamePlate_Model;
  }

  @override
  Future<List<PowtbNamePlateModel>> getPowtbNamePlateSerialNo(
      String serialNo) async {
    final tPowtbNamePlate_data = await sl<AppDatabase>()
        .getPowtbNamePlateLocalDataWithSerialNo(serialNo);

    List<PowtbNamePlateModel> tPowtbNamePlate_Model =
        List<PowtbNamePlateModel>.empty(growable: true);
    for (var listEle in tPowtbNamePlate_data) {
      tPowtbNamePlate_Model.add(PowtbNamePlateModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        R_serialNo: listEle.R_serialNo,
        R_ratedVoltage: listEle.R_ratedVoltage,
        R_ratedCurrent: listEle.R_ratedCurrent,
        R_Make: listEle.R_Make,
        Y_serialNo: listEle.Y_serialNo,
        Y_ratedVoltage: listEle.Y_ratedVoltage,
        Y_ratedCurrent: listEle.Y_ratedCurrent,
        Y_Make: listEle.Y_Make,
        B_serialNo: listEle.B_serialNo,
        B_ratedVoltage: listEle.B_ratedVoltage,
        B_ratedCurrent: listEle.B_ratedCurrent,
        B_Make: listEle.B_Make,
      ));
    }
    return tPowtbNamePlate_Model;
  }

  @override
  Future<List<PowtbNamePlateModel>> getPowtbnameplateEquipmentLists() async {
    final tpowtbnameplatData =
        await sl<AppDatabase>().getPowtbNameplateEquipmentListwithAll();
    List<PowtbNamePlateModel> tpowtbnameplateTestModel =
        List<PowtbNamePlateModel>.empty(growable: true);
    for (var element in tpowtbnameplatData) {
      tpowtbnameplateTestModel.add(PowtbNamePlateModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        R_serialNo: element.R_serialNo,
        R_ratedVoltage: element.R_ratedVoltage,
        R_ratedCurrent: element.R_ratedCurrent,
        R_Make: element.R_Make,
        Y_serialNo: element.Y_serialNo,
        Y_ratedVoltage: element.Y_ratedVoltage,
        Y_ratedCurrent: element.Y_ratedCurrent,
        Y_Make: element.Y_Make,
        B_serialNo: element.B_serialNo,
        B_ratedVoltage: element.B_ratedVoltage,
        B_ratedCurrent: element.B_ratedCurrent,
        B_Make: element.B_Make,
      ));
    }
    return tpowtbnameplateTestModel;
  }
}
