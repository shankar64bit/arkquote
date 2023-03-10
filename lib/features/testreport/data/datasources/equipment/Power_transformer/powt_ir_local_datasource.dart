// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/powt/powt_ir_model.dart';
import '../../test_report_local_datasource.dart';
// import '../../../../../../injection_container.dart';
// import '../../test_report_local_datasource.dart';

abstract class PowtcoreIRLocalDatasource {
  Future<PowtcoreIRModel> getPowtcoreIR_ById(int id);
  Future<int> localPowtcoreIR(PowtcoreIRModel powtirtolocal);
  Future<void> updatePowtcoreIR(PowtcoreIRModel powtirtoupdate, int id);
  Future<int> deletePowtcoreIRById(int id);
  Future<List<PowtcoreIRModel>> getPowtcoreIR_SerialNo(String serialNo);
  Future<List<PowtcoreIRModel>> getPowtIREquipmentLists();
}

@DataClassName('PowtcoreIRLocalData')
class PowtcoreIRLocalDatasourceImpl extends Table
    implements PowtcoreIRLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();
  @required
  RealColumn get hvE_60 => real()();
  @required
  RealColumn get hvE_600 => real()();
  @required
  RealColumn get hvLV_60 => real()();
  @required
  RealColumn get hvLV_600 => real()();
  @required
  RealColumn get lvE_60 => real()();
  @required
  RealColumn get lvE_600 => real()();
  @required
  RealColumn get cE_60 => real()();
  @required
  RealColumn get cT_60 => real()();
  @required
  RealColumn get tE_60 => real()();

  @override
  Future<PowtcoreIRModel> getPowtcoreIR_ById(int id) async {
    PowtcoreIRLocalData tPowtcoreIRData =
        await sl<AppDatabase>().getPowtcoreIRLocalDataWithId(id);
    PowtcoreIRModel tPowtcoreIRModel = PowtcoreIRModel(
      id: tPowtcoreIRData.id,
      databaseID: tPowtcoreIRData.databaseID,
      trNo: tPowtcoreIRData.trNo,
      serialNo: tPowtcoreIRData.serialNo,
      equipmentUsed: tPowtcoreIRData.equipmentUsed,
      updateDate: tPowtcoreIRData.updateDate,
      hvE_60: tPowtcoreIRData.hvE_60,
      hvE_600: tPowtcoreIRData.hvE_600,
      hvLV_60: tPowtcoreIRData.hvLV_60,
      hvLV_600: tPowtcoreIRData.hvLV_600,
      lvE_60: tPowtcoreIRData.lvE_60,
      lvE_600: tPowtcoreIRData.lvE_600,
      cE_60: tPowtcoreIRData.cE_60,
      cT_60: tPowtcoreIRData.cT_60,
      tE_60: tPowtcoreIRData.tE_60,
    );
    return tPowtcoreIRModel;
  }

  @override
  Future<int> localPowtcoreIR(PowtcoreIRModel powtirtolocal) {
    return (sl<AppDatabase>().createPowtcoreIR(powtirtolocal));
  }

  @override
  Future<void> updatePowtcoreIR(PowtcoreIRModel powtirtoupdate, int id) async {
    sl<AppDatabase>().updatePowtcoreIR(powtirtoupdate, id);
  }

  @override
  Future<int> deletePowtcoreIRById(int id) {
    return (sl<AppDatabase>().deletePowtcoreIRById(id));
  }

  @override
  Future<List<PowtcoreIRModel>> getPowtcoreIR_SerialNo(String serialNo) async {
    final tPowtcoreIR_data =
        await sl<AppDatabase>().getPowtcoreLocalDataWithSerialNo(serialNo);

    List<PowtcoreIRModel> tPowtcoreIR_Model =
        List<PowtcoreIRModel>.empty(growable: true);
    for (var listEle in tPowtcoreIR_data) {
      tPowtcoreIR_Model.add(PowtcoreIRModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        hvE_60: listEle.hvE_60,
        hvE_600: listEle.hvE_600,
        hvLV_60: listEle.hvLV_60,
        hvLV_600: listEle.hvLV_600,
        lvE_60: listEle.lvE_60,
        lvE_600: listEle.lvE_600,
        cE_60: listEle.cE_60,
        cT_60: listEle.cT_60,
        tE_60: listEle.tE_60,
      ));
    }
    return tPowtcoreIR_Model;
  }

  @override
  Future<List<PowtcoreIRModel>> getPowtIREquipmentLists() async {
    final tPowtIRData = await sl<AppDatabase>().getPowtIREquipmentListwithAll();
    List<PowtcoreIRModel> tPowtIRTestModel =
        List<PowtcoreIRModel>.empty(growable: true);
    for (var element in tPowtIRData) {
      tPowtIRTestModel.add(PowtcoreIRModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        equipmentUsed: element.equipmentUsed,
        hvE_60: element.hvE_60,
        hvE_600: element.hvE_600,
        hvLV_60: element.hvLV_60,
        hvLV_600: element.hvLV_600,
        lvE_60: element.lvE_60,
        lvE_600: element.lvE_600,
        cE_60: element.cE_60,
        cT_60: element.cT_60,
        tE_60: element.tE_60,
        updateDate: element.updateDate,
      ));
    }
    return tPowtIRTestModel;
  }
}
