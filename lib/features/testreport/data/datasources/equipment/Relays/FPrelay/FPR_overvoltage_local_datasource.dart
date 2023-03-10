// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../models/equipment/Relays/FPrelay/FPR_overvoltage_model.dart';
import '../../../test_report_local_datasource.dart';
import '../../../../../../../injection_container.dart';

abstract class FPRovervoltageLocalDatasource {
  Future<FPRovervoltageModel> getFPRovervoltageById(int id);
  Future<int> localFPRovervoltage(FPRovervoltageModel fprovervoltagetoLocal);
  Future<void> updateFPRovervoltage(
      FPRovervoltageModel fprovervoltageUpdate, int id);
  Future<int> deleteFPRovervoltageById(int id);
  Future<List<FPRovervoltageModel>> getFPRovervoltageTrNoID(int trNo);
  Future<List<FPRovervoltageModel>> getFPRovervoltageSerialNo(String sNo);
  Future<List<FPRovervoltageModel>> getfprovervoltEquipmentLists();
}

@DataClassName('FPRovervoltageLocalData')
class FPRovervoltageLocalDatasourceImpl extends Table
    implements FPRovervoltageLocalDatasource {
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
  Future<FPRovervoltageModel> getFPRovervoltageById(int id) async {
    FPRovervoltageLocalData tFPRovervoltageData =
        await sl<AppDatabase>().getFPRovervoltageLocalDataWithId(id);
    FPRovervoltageModel tFPRovervoltageModel = FPRovervoltageModel(
      id: tFPRovervoltageData.id,
      databaseID: tFPRovervoltageData.databaseID,
      trNo: tFPRovervoltageData.trNo,
      voltageSet: tFPRovervoltageData.voltageSet,
      delay: tFPRovervoltageData.delay,
      rn_secVoltageSet: tFPRovervoltageData.rn_secVoltageSet,
      rn_appliedSecVoltage: tFPRovervoltageData.rn_appliedSecVoltage,
      rn_relayOprTime: tFPRovervoltageData.rn_relayOprTime,
      yn_secVoltageSet: tFPRovervoltageData.yn_secVoltageSet,
      yn_appliedSecVoltage: tFPRovervoltageData.yn_appliedSecVoltage,
      yn_relayOprTime: tFPRovervoltageData.yn_relayOprTime,
      bn_secVoltageSet: tFPRovervoltageData.bn_secVoltageSet,
      bn_appliedSecVoltage: tFPRovervoltageData.bn_appliedSecVoltage,
      bn_relayOprTime: tFPRovervoltageData.bn_relayOprTime,
      serialNo: tFPRovervoltageData.serialNo,
      stageNo: tFPRovervoltageData.stageNo,
      function: tFPRovervoltageData.function,
      equipmentUsed: tFPRovervoltageData.equipmentUsed,
      updateDate: tFPRovervoltageData.updateDate,
    );
    return tFPRovervoltageModel;
  }

  @override
  Future<int> localFPRovervoltage(FPRovervoltageModel fprovervoltagetoLocal) {
    return (sl<AppDatabase>().createFPRovervoltage(fprovervoltagetoLocal));
  }

  @override
  Future<void> updateFPRovervoltage(
      FPRovervoltageModel fprovervoltageUpdate, int id) async {
    sl<AppDatabase>().updateFPRovervoltage(fprovervoltageUpdate, id);
  }

  @override
  Future<int> deleteFPRovervoltageById(int id) {
    return (sl<AppDatabase>().deleteFPRovervoltageById(id));
  }

  @override
  Future<List<FPRovervoltageModel>> getFPRovervoltageTrNoID(int trNo) async {
    final tfprovervoltage_data =
        await sl<AppDatabase>().getFPRovervoltageLocalDataWithtrNoID(trNo);

    List<FPRovervoltageModel> tFPRovervoltage_Model =
        List<FPRovervoltageModel>.empty(growable: true);
    for (var listEle in tfprovervoltage_data) {
      tFPRovervoltage_Model.add(FPRovervoltageModel(
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
    return tFPRovervoltage_Model;
  }

  @override
  Future<List<FPRovervoltageModel>> getFPRovervoltageSerialNo(
      String sNo) async {
    final tFPRovervoltage_data =
        await sl<AppDatabase>().getFPRovervoltageLocalDataWithSerialNo(sNo);

    List<FPRovervoltageModel> tFPRovervoltage_Model =
        List<FPRovervoltageModel>.empty(growable: true);
    for (var listEle in tFPRovervoltage_data) {
      tFPRovervoltage_Model.add(FPRovervoltageModel(
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
    return tFPRovervoltage_Model;
  }

  @override
  Future<List<FPRovervoltageModel>> getfprovervoltEquipmentLists() async {
    final tfprovervoltData =
        await sl<AppDatabase>().getfprovervoltEquipmentListwithAll();
    List<FPRovervoltageModel> tfprovervoltTestModel =
        List<FPRovervoltageModel>.empty(growable: true);
    for (var listEle in tfprovervoltData) {
      tfprovervoltTestModel.add(FPRovervoltageModel(
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
    return tfprovervoltTestModel;
  }
}
