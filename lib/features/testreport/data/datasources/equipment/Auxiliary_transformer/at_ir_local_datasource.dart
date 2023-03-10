// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/AT/AT_ir_model.dart';
import '../../test_report_local_datasource.dart';

abstract class ATcoreIRLocalDatasource {
  Future<ATcoreIRModel> getATcoreIR_ById(int id);
  Future<int> localATcoreIR(ATcoreIRModel atirtolocal);
  Future<void> updateATcoreIR(ATcoreIRModel atirtoupdate, int id);
  Future<int> deleteATcoreIRById(int id);
  Future<List<ATcoreIRModel>> getATcoreIR_SerialNo(String serialNo);
  Future<List<ATcoreIRModel>> getATirlocalDataEquipmentLists();
}

@DataClassName('ATcoreIRLocalData')
class ATcoreIRLocalDatasourceImpl extends Table
    implements ATcoreIRLocalDatasource {
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
  RealColumn get hvE_1min => real()();
  @required
  RealColumn get hvE_10min => real()();
  @required
  RealColumn get hvE_PImin => real()();
  @required
  RealColumn get hvLV_1min => real()();
  @required
  RealColumn get hvLV_10min => real()();
  @required
  RealColumn get hvLV_PImin => real()();
  @required
  RealColumn get lvE_1min => real()();
  @required
  RealColumn get lvE_10min => real()();
  @required
  RealColumn get lvE_PImin => real()();

  @override
  Future<ATcoreIRModel> getATcoreIR_ById(int id) async {
    ATcoreIRLocalData tATcoreIRData =
        await sl<AppDatabase>().getATcoreIRLocalDataWithId(id);
    ATcoreIRModel tATcoreIRModel = ATcoreIRModel(
      id: tATcoreIRData.id,
      databaseID: tATcoreIRData.databaseID,
      trNo: tATcoreIRData.trNo,
      serialNo: tATcoreIRData.serialNo,
      equipmentUsed: tATcoreIRData.equipmentUsed,
      updateDate: tATcoreIRData.updateDate,
      hvE_1min: tATcoreIRData.hvE_1min,
      hvE_10min: tATcoreIRData.hvE_10min,
      hvE_PImin: tATcoreIRData.hvE_PImin,
      hvLV_1min: tATcoreIRData.hvLV_1min,
      hvLV_10min: tATcoreIRData.hvLV_10min,
      hvLV_PImin: tATcoreIRData.hvLV_PImin,
      lvE_1min: tATcoreIRData.lvE_1min,
      lvE_10min: tATcoreIRData.lvE_10min,
      lvE_PImin: tATcoreIRData.lvE_PImin,
    );
    return tATcoreIRModel;
  }

  @override
  Future<int> localATcoreIR(ATcoreIRModel atirtolocal) {
    return (sl<AppDatabase>().createATcoreIR(atirtolocal));
  }

  @override
  Future<void> updateATcoreIR(ATcoreIRModel atirtoupdate, int id) async {
    sl<AppDatabase>().updateATcoreIR(atirtoupdate, id);
  }

  @override
  Future<int> deleteATcoreIRById(int id) {
    return (sl<AppDatabase>().deleteATcoreIRById(id));
  }

  @override
  Future<List<ATcoreIRModel>> getATcoreIR_SerialNo(String serialNo) async {
    final tATcoreIR_data =
        await sl<AppDatabase>().getATcoreLocalDataWithSerialNo(serialNo);

    List<ATcoreIRModel> tATcoreIR_Model =
        List<ATcoreIRModel>.empty(growable: true);
    for (var listEle in tATcoreIR_data) {
      tATcoreIR_Model.add(ATcoreIRModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        hvE_1min: listEle.hvE_1min,
        hvE_10min: listEle.hvE_10min,
        hvE_PImin: listEle.hvE_PImin,
        hvLV_1min: listEle.hvLV_1min,
        hvLV_10min: listEle.hvLV_10min,
        hvLV_PImin: listEle.hvLV_PImin,
        lvE_1min: listEle.lvE_1min,
        lvE_10min: listEle.lvE_10min,
        lvE_PImin: listEle.lvE_PImin,
      ));
    }
    return tATcoreIR_Model;
  }
  //getATlocalDataEquipmentLists

  @override
  Future<List<ATcoreIRModel>> getATirlocalDataEquipmentLists() async {
    final tATirData = await sl<AppDatabase>().getATirEquipmentListwithAll();
    List<ATcoreIRModel> tATirTestModel =
        List<ATcoreIRModel>.empty(growable: true);
    for (var element in tATirData) {
      tATirTestModel.add(ATcoreIRModel(
        id: element.id,
        trNo: element.trNo,
        databaseID: element.databaseID,
        serialNo: element.serialNo,
        equipmentUsed: element.equipmentUsed,
        updateDate: element.updateDate,
        hvE_1min: element.hvE_1min,
        hvE_10min: element.hvE_10min,
        hvE_PImin: element.hvE_PImin,
        hvLV_1min: element.hvLV_1min,
        hvLV_10min: element.hvLV_10min,
        hvLV_PImin: element.hvLV_PImin,
        lvE_1min: element.lvE_1min,
        lvE_10min: element.lvE_10min,
        lvE_PImin: element.lvE_PImin,
      ));
    }
    return tATirTestModel;
  }
}
