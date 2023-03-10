// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';

import '../../../../models/equipment/Relays/FPrelay/FPR_earthfault_model.dart';
import '../../../test_report_local_datasource.dart';
import '../../../../../../../injection_container.dart';
// import '../../../../models/equipment/Relays/FPrelay/FPR_earthfault_model.dart';
// import '../../../test_report_local_datasource.dart';
// import '../../../../models/equipment/Relays/FPrelay/FPR_overcurrent_model.dart';

abstract class FPRearthfaultLocalDatasource {
  Future<FPRearthfaultModel> getFPRearthfaultById(int id);
  Future<int> localFPRearthfault(FPRearthfaultModel fprearthfaulttoLocal);
  Future<void> updateFPRearthfault(
      FPRearthfaultModel fprearthfaultUpdate, int id);
  Future<int> deleteFPRearthfaultById(int id);
  Future<List<FPRearthfaultModel>> getFPRearthfaultTrNoID(int trNo);
  Future<List<FPRearthfaultModel>> getFPRearthfaultSerialNo(String sNo);
  Future<List<FPRearthfaultModel>> getFPRearthfaultEquipmentLists();
}

@DataClassName('FPRearthfaultLocalData')
class FPRearthfaultLocalDatasourceImpl extends Table
    implements FPRearthfaultLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get currentSet => real()();
  @required
  RealColumn get TMS => real()();
  @required
  RealColumn get delay => real()();
  @required
  RealColumn get relayOprTime_5x => real()();
  @required
  RealColumn get pickupCurrent => real()();
  @required
  RealColumn get relayOprTime_2x => real()();
  @required
  IntColumn get stageNo => integer()();
  @required
  TextColumn get curve => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get function => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<FPRearthfaultModel> getFPRearthfaultById(int id) async {
    FPRearthfaultLocalData tFPRearthfaultData =
        await sl<AppDatabase>().getFPRearthfaultLocalDataWithId(id);
    FPRearthfaultModel tFPRearthfaultModel = FPRearthfaultModel(
      id: tFPRearthfaultData.id,
      databaseID: tFPRearthfaultData.databaseID,
      trNo: tFPRearthfaultData.trNo,
      serialNo: tFPRearthfaultData.serialNo,
      currentSet: tFPRearthfaultData.currentSet,
      TMS: tFPRearthfaultData.TMS,
      delay: tFPRearthfaultData.delay,
      pickupCurrent: tFPRearthfaultData.pickupCurrent,
      relayOprTime_2x: tFPRearthfaultData.relayOprTime_2x,
      relayOprTime_5x: tFPRearthfaultData.relayOprTime_5x,
      stageNo: tFPRearthfaultData.stageNo,
      curve: tFPRearthfaultData.curve,
      function: tFPRearthfaultData.function,
      equipmentUsed: tFPRearthfaultData.equipmentUsed,
      updateDate: tFPRearthfaultData.updateDate,
    );
    return tFPRearthfaultModel;
  }

  @override
  Future<int> localFPRearthfault(FPRearthfaultModel fprearthfaulttoLocal) {
    return (sl<AppDatabase>().createFPRearthfault(fprearthfaulttoLocal));
  }

  @override
  Future<void> updateFPRearthfault(
      FPRearthfaultModel fprearthfaultUpdate, int id) async {
    sl<AppDatabase>().updateFPRearthfault(fprearthfaultUpdate, id);
  }

  @override
  Future<int> deleteFPRearthfaultById(int id) {
    return (sl<AppDatabase>().deleteFPRearthfaultById(id));
  }

  @override
  Future<List<FPRearthfaultModel>> getFPRearthfaultTrNoID(int trNo) async {
    final tfprearthfault_data =
        await sl<AppDatabase>().getFPRearthfaultLocalDataWithtrNoID(trNo);

    List<FPRearthfaultModel> tFPRearthfault_Model =
        List<FPRearthfaultModel>.empty(growable: true);
    for (var listEle in tfprearthfault_data) {
      tFPRearthfault_Model.add(FPRearthfaultModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        currentSet: listEle.currentSet,
        TMS: listEle.TMS,
        delay: listEle.delay,
        pickupCurrent: listEle.pickupCurrent,
        relayOprTime_2x: listEle.relayOprTime_2x,
        relayOprTime_5x: listEle.relayOprTime_5x,
        stageNo: listEle.stageNo,
        curve: listEle.curve,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tFPRearthfault_Model;
  }

  @override
  Future<List<FPRearthfaultModel>> getFPRearthfaultSerialNo(String sNo) async {
    final tFPRearthfault_data =
        await sl<AppDatabase>().getFPRearthfaultLocalDataWithSerialNo(sNo);

    List<FPRearthfaultModel> tFPRearthfault_Model =
        List<FPRearthfaultModel>.empty(growable: true);
    for (var listEle in tFPRearthfault_data) {
      tFPRearthfault_Model.add(FPRearthfaultModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        currentSet: listEle.currentSet,
        TMS: listEle.TMS,
        delay: listEle.delay,
        pickupCurrent: listEle.pickupCurrent,
        relayOprTime_2x: listEle.relayOprTime_2x,
        relayOprTime_5x: listEle.relayOprTime_5x,
        stageNo: listEle.stageNo,
        curve: listEle.curve,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tFPRearthfault_Model;
  }

  @override
  Future<List<FPRearthfaultModel>> getFPRearthfaultEquipmentLists() async {
    final tfprearthfaultData =
        await sl<AppDatabase>().getFPRearthfaultEquipmentListwithAll();
    List<FPRearthfaultModel> tfprearthfaultTestModel =
        List<FPRearthfaultModel>.empty(growable: true);
    for (var listEle in tfprearthfaultData) {
      tfprearthfaultTestModel.add(FPRearthfaultModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        currentSet: listEle.currentSet,
        TMS: listEle.TMS,
        delay: listEle.delay,
        pickupCurrent: listEle.pickupCurrent,
        relayOprTime_2x: listEle.relayOprTime_2x,
        relayOprTime_5x: listEle.relayOprTime_5x,
        stageNo: listEle.stageNo,
        curve: listEle.curve,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tfprearthfaultTestModel;
  }
}
