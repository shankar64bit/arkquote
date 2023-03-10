// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../models/equipment/Relays/FPrelay/FPR_undervoltage_model.dart';
import '../../../../../../../injection_container.dart';
import '../../../test_report_local_datasource.dart';

abstract class FPRundervoltageLocalDatasource {
  Future<FPRundervoltageModel> getFPRundervoltageById(int id);
  Future<int> localFPRundervoltage(FPRundervoltageModel fprundervoltagetoLocal);
  Future<void> updateFPRundervoltage(
      FPRundervoltageModel fprundervoltageUpdate, int id);
  Future<int> deleteFPRundervoltageById(int id);
  Future<List<FPRundervoltageModel>> getFPRundervoltageTrNoID(int trNo);
  Future<List<FPRundervoltageModel>> getFPRundervoltageSerialNo(String sNo);
  Future<List<FPRundervoltageModel>> getFPRundervoltEquipmentLists();
}

@DataClassName('FPRundervoltageLocalData')
class FPRundervoltageLocalDatasourceImpl extends Table
    implements FPRundervoltageLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get voltageSet => real()();
  @required
  RealColumn get delay => real()();
  @required
  RealColumn get rn_secVoltageSet => real()();
  @required
  RealColumn get rn_appliedSecVoltage => real()();
  @required
  RealColumn get rn_relayOprTime => real()();
  @required
  RealColumn get yn_secVoltageSet => real()();
  @required
  RealColumn get yn_appliedSecVoltage => real()();
  @required
  RealColumn get yn_relayOprTime => real()();
  @required
  RealColumn get bn_secVoltageSet => real()();
  @required
  RealColumn get bn_appliedSecVoltage => real()();
  @required
  RealColumn get bn_relayOprTime => real()();
  @required
  IntColumn get stageNo => integer()();
  @required
  TextColumn get function => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<FPRundervoltageModel> getFPRundervoltageById(int id) async {
    FPRundervoltageLocalData tFPRundervoltageData =
        await sl<AppDatabase>().getFPRundervoltageLocalDataWithId(id);
    FPRundervoltageModel tFPRundervoltageModel = FPRundervoltageModel(
      id: tFPRundervoltageData.id,
      databaseID: tFPRundervoltageData.databaseID,
      trNo: tFPRundervoltageData.trNo,
      voltageSet: tFPRundervoltageData.voltageSet,
      delay: tFPRundervoltageData.delay,
      rn_secVoltageSet: tFPRundervoltageData.rn_secVoltageSet,
      rn_appliedSecVoltage: tFPRundervoltageData.rn_appliedSecVoltage,
      rn_relayOprTime: tFPRundervoltageData.rn_relayOprTime,
      yn_secVoltageSet: tFPRundervoltageData.yn_secVoltageSet,
      yn_appliedSecVoltage: tFPRundervoltageData.yn_appliedSecVoltage,
      yn_relayOprTime: tFPRundervoltageData.yn_relayOprTime,
      bn_secVoltageSet: tFPRundervoltageData.bn_secVoltageSet,
      bn_appliedSecVoltage: tFPRundervoltageData.bn_appliedSecVoltage,
      bn_relayOprTime: tFPRundervoltageData.bn_relayOprTime,
      serialNo: tFPRundervoltageData.serialNo,
      stageNo: tFPRundervoltageData.stageNo,
      function: tFPRundervoltageData.function,
      equipmentUsed: tFPRundervoltageData.equipmentUsed,
      updateDate: tFPRundervoltageData.updateDate,
    );
    return tFPRundervoltageModel;
  }

  @override
  Future<int> localFPRundervoltage(
      FPRundervoltageModel fprundervoltagetoLocal) {
    return (sl<AppDatabase>().createFPRundervoltage(fprundervoltagetoLocal));
  }

  @override
  Future<void> updateFPRundervoltage(
      FPRundervoltageModel fprundervoltageUpdate, int id) async {
    sl<AppDatabase>().updateFPRundervoltage(fprundervoltageUpdate, id);
  }

  @override
  Future<int> deleteFPRundervoltageById(int id) {
    return (sl<AppDatabase>().deleteFPRundervoltageById(id));
  }

  @override
  Future<List<FPRundervoltageModel>> getFPRundervoltageTrNoID(int trNo) async {
    final tfprundervoltage_data =
        await sl<AppDatabase>().getFPRundervoltageLocalDataWithtrNoID(trNo);

    List<FPRundervoltageModel> tFPRundervoltage_Model =
        List<FPRundervoltageModel>.empty(growable: true);
    for (var listEle in tfprundervoltage_data) {
      tFPRundervoltage_Model.add(FPRundervoltageModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        voltageSet: listEle.voltageSet,
        delay: listEle.delay,
        rn_secVoltageSet: listEle.rn_secVoltageSet,
        rn_appliedSecVoltage: listEle.rn_appliedSecVoltage,
        rn_relayOprTime: listEle.rn_relayOprTime,
        yn_secVoltageSet: listEle.yn_secVoltageSet,
        yn_appliedSecVoltage: listEle.yn_appliedSecVoltage,
        yn_relayOprTime: listEle.yn_relayOprTime,
        bn_secVoltageSet: listEle.bn_secVoltageSet,
        bn_appliedSecVoltage: listEle.bn_appliedSecVoltage,
        bn_relayOprTime: listEle.bn_relayOprTime,
        stageNo: listEle.stageNo,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tFPRundervoltage_Model;
  }

  @override
  Future<List<FPRundervoltageModel>> getFPRundervoltageSerialNo(
      String sNo) async {
    final tFPRundervoltage_data =
        await sl<AppDatabase>().getFPRundervoltageLocalDataWithSerialNo(sNo);

    List<FPRundervoltageModel> tFPRundervoltage_Model =
        List<FPRundervoltageModel>.empty(growable: true);
    for (var listEle in tFPRundervoltage_data) {
      tFPRundervoltage_Model.add(FPRundervoltageModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        voltageSet: listEle.voltageSet,
        delay: listEle.delay,
        rn_secVoltageSet: listEle.rn_secVoltageSet,
        rn_appliedSecVoltage: listEle.rn_appliedSecVoltage,
        rn_relayOprTime: listEle.rn_relayOprTime,
        yn_secVoltageSet: listEle.yn_secVoltageSet,
        yn_appliedSecVoltage: listEle.yn_appliedSecVoltage,
        yn_relayOprTime: listEle.yn_relayOprTime,
        bn_secVoltageSet: listEle.bn_secVoltageSet,
        bn_appliedSecVoltage: listEle.bn_appliedSecVoltage,
        bn_relayOprTime: listEle.bn_relayOprTime,
        stageNo: listEle.stageNo,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tFPRundervoltage_Model;
  }

  @override
  Future<List<FPRundervoltageModel>> getFPRundervoltEquipmentLists() async {
    final tfprundervoltData =
        await sl<AppDatabase>().getFPRundervoltEquipmentListwithAll();
    List<FPRundervoltageModel> tfprundervoltTestModel =
        List<FPRundervoltageModel>.empty(growable: true);
    for (var listEle in tfprundervoltData) {
      tfprundervoltTestModel.add(FPRundervoltageModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        voltageSet: listEle.voltageSet,
        delay: listEle.delay,
        rn_secVoltageSet: listEle.rn_secVoltageSet,
        rn_appliedSecVoltage: listEle.rn_appliedSecVoltage,
        rn_relayOprTime: listEle.rn_relayOprTime,
        yn_secVoltageSet: listEle.yn_secVoltageSet,
        yn_appliedSecVoltage: listEle.yn_appliedSecVoltage,
        yn_relayOprTime: listEle.yn_relayOprTime,
        bn_secVoltageSet: listEle.bn_secVoltageSet,
        bn_appliedSecVoltage: listEle.bn_appliedSecVoltage,
        bn_relayOprTime: listEle.bn_relayOprTime,
        stageNo: listEle.stageNo,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tfprundervoltTestModel;
  }
}
