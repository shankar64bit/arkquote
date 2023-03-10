// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../models/equipment/Relays/FPrelay/FPR_overfreq_model.dart';
import '../../../../../../../injection_container.dart';
import '../../../test_report_local_datasource.dart';

abstract class FPRoverfreqLocalDatasource {
  Future<FPRoverfreqModel> getFPRoverfreqById(int id);
  Future<int> localFPRoverfreq(FPRoverfreqModel fproverfreqtoLocal);
  Future<void> updateFPRoverfreq(FPRoverfreqModel fproverfreqUpdate, int id);
  Future<int> deleteFPRoverfreqById(int id);
  Future<List<FPRoverfreqModel>> getFPRoverfreqTrNoID(int trNo);
  Future<List<FPRoverfreqModel>> getFPRoverfreqSerialNo(String sNo);
  Future<List<FPRoverfreqModel>> getFPRoverffreqEquipmentLists();
}

@DataClassName('FPRoverfreqLocalData')
class FPRoverfreqLocalDatasourceImpl extends Table
    implements FPRoverfreqLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get frequencySet => real()();
  @required
  RealColumn get delay => real()();
  @required
  RealColumn get rn_relayOprTime => real()();
  @required
  RealColumn get yn_relayOprTime => real()();
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
  Future<FPRoverfreqModel> getFPRoverfreqById(int id) async {
    FPRoverfreqLocalData tFPRoverfreqData =
        await sl<AppDatabase>().getFPRoverfreqLocalDataWithId(id);
    FPRoverfreqModel tFPRoverfreqModel = FPRoverfreqModel(
      id: tFPRoverfreqData.id,
      databaseID: tFPRoverfreqData.databaseID,
      trNo: tFPRoverfreqData.trNo,
      serialNo: tFPRoverfreqData.serialNo,
      frequencySet: tFPRoverfreqData.frequencySet,
      delay: tFPRoverfreqData.delay,
      rn_relayOprTime: tFPRoverfreqData.rn_relayOprTime,
      yn_relayOprTime: tFPRoverfreqData.yn_relayOprTime,
      bn_relayOprTime: tFPRoverfreqData.bn_relayOprTime,
      stageNo: tFPRoverfreqData.stageNo,
      function: tFPRoverfreqData.function,
      equipmentUsed: tFPRoverfreqData.equipmentUsed,
      updateDate: tFPRoverfreqData.updateDate,
    );
    return tFPRoverfreqModel;
  }

  @override
  Future<int> localFPRoverfreq(FPRoverfreqModel fproverfreqtoLocal) {
    return (sl<AppDatabase>().createFPRoverfreq(fproverfreqtoLocal));
  }

  @override
  Future<void> updateFPRoverfreq(
      FPRoverfreqModel fproverfreqUpdate, int id) async {
    sl<AppDatabase>().updateFPRoverfreq(fproverfreqUpdate, id);
  }

  @override
  Future<int> deleteFPRoverfreqById(int id) {
    return (sl<AppDatabase>().deleteFPRoverfreqById(id));
  }

  @override
  Future<List<FPRoverfreqModel>> getFPRoverfreqTrNoID(int trNo) async {
    final tfproverfreq_data =
        await sl<AppDatabase>().getFPRoverfreqLocalDataWithtrNoID(trNo);

    List<FPRoverfreqModel> tFPRoverfreq_Model =
        List<FPRoverfreqModel>.empty(growable: true);
    for (var listEle in tfproverfreq_data) {
      tFPRoverfreq_Model.add(FPRoverfreqModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        frequencySet: listEle.frequencySet,
        delay: listEle.delay,
        rn_relayOprTime: listEle.rn_relayOprTime,
        yn_relayOprTime: listEle.yn_relayOprTime,
        bn_relayOprTime: listEle.bn_relayOprTime,
        stageNo: listEle.stageNo,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tFPRoverfreq_Model;
  }

  @override
  Future<List<FPRoverfreqModel>> getFPRoverfreqSerialNo(String sNo) async {
    final tFPRoverfreq_data =
        await sl<AppDatabase>().getFPRoverfreqLocalDataWithSerialNo(sNo);

    List<FPRoverfreqModel> tFPRoverfreq_Model =
        List<FPRoverfreqModel>.empty(growable: true);
    for (var listEle in tFPRoverfreq_data) {
      tFPRoverfreq_Model.add(FPRoverfreqModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        frequencySet: listEle.frequencySet,
        delay: listEle.delay,
        rn_relayOprTime: listEle.rn_relayOprTime,
        yn_relayOprTime: listEle.yn_relayOprTime,
        bn_relayOprTime: listEle.bn_relayOprTime,
        stageNo: listEle.stageNo,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tFPRoverfreq_Model;
  }

  @override
  Future<List<FPRoverfreqModel>> getFPRoverffreqEquipmentLists() async {
    final tfproverfreqData =
        await sl<AppDatabase>().getFPRoverfreqEquipmentListwithAll();
    List<FPRoverfreqModel> tfproverfreqTestModel =
        List<FPRoverfreqModel>.empty(growable: true);
    for (var listEle in tfproverfreqData) {
      tfproverfreqTestModel.add(FPRoverfreqModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        serialNo: listEle.serialNo,
        frequencySet: listEle.frequencySet,
        delay: listEle.delay,
        rn_relayOprTime: listEle.rn_relayOprTime,
        yn_relayOprTime: listEle.yn_relayOprTime,
        bn_relayOprTime: listEle.bn_relayOprTime,
        stageNo: listEle.stageNo,
        function: listEle.function,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tfproverfreqTestModel;
  }
}
