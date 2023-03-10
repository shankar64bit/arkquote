// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import '../../../../../../injection_container.dart';
import '../../../models/equipment/PT/pt_ir_model.dart';

abstract class PTcoreIRLocalDatasource {
  Future<PTcoreIRModel> getPTcoreIR_ById(int id);
  Future<int> localPTcoreIR(PTcoreIRModel ptirtolocal);
  Future<void> updatePTcoreIR(PTcoreIRModel ptirtoupdate, int id);
  Future<int> deletePTcoreIRById(int id);
  Future<List<PTcoreIRModel>> getPTcoreIR_SerialNo(String serialNo);
  Future<List<PTcoreIRModel>> getptirEquipmentLists();
}

@DataClassName('PTcoreIRLocalData')
class PTcoreIRLocalDatasourceImpl extends Table
    implements PTcoreIRLocalDatasource {
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
  RealColumn get peR => real()();
  @required
  RealColumn get peY => real()();
  @required
  RealColumn get peB => real()();
  ///////////////////////////////
  @required
  RealColumn get pc1R => real()();
  @required
  RealColumn get pc2R => real()();
  @required
  RealColumn get pc3R => real()();

  @required
  RealColumn get pc1Y => real()();
  @required
  RealColumn get pc2Y => real()();
  @required
  RealColumn get pc3Y => real()();

  @required
  RealColumn get pc1B => real()();
  @required
  RealColumn get pc2B => real()();
  @required
  RealColumn get pc3B => real()();

  ///////////////////////////////
  @required
  RealColumn get c1eR => real()();
  @required
  RealColumn get c2eR => real()();
  @required
  RealColumn get c3eR => real()();

  @required
  RealColumn get c1eY => real()();
  @required
  RealColumn get c2eY => real()();
  @required
  RealColumn get c3eY => real()();

  @required
  RealColumn get c1eB => real()();
  @required
  RealColumn get c2eB => real()();
  @required
  RealColumn get c3eB => real()();

  ////////////////////////////////
  @required
  RealColumn get c1c2R => real()();
  @required
  RealColumn get c1c2Y => real()();
  @required
  RealColumn get c1c2B => real()();
  @required
  RealColumn get c2c3R => real()();
  @required
  RealColumn get c2c3Y => real()();
  @required
  RealColumn get c2c3B => real()();

  ////////////////////////////////
  @required
  RealColumn get clc1R => real()();
  @required
  RealColumn get clc1Y => real()();
  @required
  RealColumn get clc1B => real()();

  @override
  Future<PTcoreIRModel> getPTcoreIR_ById(int id) async {
    PTcoreIRLocalData tPTcoreIRData =
        await sl<AppDatabase>().getPTcoreIRLocalDataWithId(id);
    PTcoreIRModel tPTcoreIRModel = PTcoreIRModel(
      id: tPTcoreIRData.id,
      databaseID: tPTcoreIRData.databaseID,
      trNo: tPTcoreIRData.trNo,
      serialNo: tPTcoreIRData.serialNo,
      equipmentUsed: tPTcoreIRData.equipmentUsed,
      updateDate: tPTcoreIRData.updateDate,
      peR: tPTcoreIRData.peR,
      peY: tPTcoreIRData.peY,
      peB: tPTcoreIRData.peB,
      pc1R: tPTcoreIRData.pc1R,
      pc2R: tPTcoreIRData.pc2R,
      pc3R: tPTcoreIRData.pc3R,
      pc1Y: tPTcoreIRData.pc1Y,
      pc2Y: tPTcoreIRData.pc2Y,
      pc3Y: tPTcoreIRData.pc3Y,
      pc1B: tPTcoreIRData.pc1B,
      pc2B: tPTcoreIRData.pc2B,
      pc3B: tPTcoreIRData.pc3B,
      c1eR: tPTcoreIRData.c1eR,
      c2eR: tPTcoreIRData.c2eR,
      c3eR: tPTcoreIRData.c3eR,
      c1eY: tPTcoreIRData.c1eY,
      c2eY: tPTcoreIRData.c2eY,
      c3eY: tPTcoreIRData.c3eY,
      c1eB: tPTcoreIRData.c1eB,
      c2eB: tPTcoreIRData.c2eB,
      c3eB: tPTcoreIRData.c3eB,
      c1c2R: tPTcoreIRData.c1c2R,
      c1c2Y: tPTcoreIRData.c1c2Y,
      c1c2B: tPTcoreIRData.c1c2B,
      c2c3R: tPTcoreIRData.c2c3R,
      c2c3Y: tPTcoreIRData.c2c3Y,
      c2c3B: tPTcoreIRData.c2c3B,
      clc1R: tPTcoreIRData.clc1R,
      clc1Y: tPTcoreIRData.clc1Y,
      clc1B: tPTcoreIRData.clc1B,
    );
    return tPTcoreIRModel;
  }

  @override
  Future<int> localPTcoreIR(PTcoreIRModel ptirtolocal) {
    return (sl<AppDatabase>().createPTcoreIR(ptirtolocal));
  }

  @override
  Future<void> updatePTcoreIR(PTcoreIRModel ptirtoupdate, int id) async {
    sl<AppDatabase>().updatePTcoreIR(ptirtoupdate, id);
  }

  @override
  Future<int> deletePTcoreIRById(int id) {
    return (sl<AppDatabase>().deletePTcoreIRById(id));
  }

  @override
  Future<List<PTcoreIRModel>> getPTcoreIR_SerialNo(String serialNo) async {
    final tPTcoreIR_data =
        await sl<AppDatabase>().getPTcoreLocalDataWithSerialNo(serialNo);

    List<PTcoreIRModel> tPTcoreIR_Model =
        List<PTcoreIRModel>.empty(growable: true);
    for (var listEle in tPTcoreIR_data) {
      tPTcoreIR_Model.add(PTcoreIRModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        peR: listEle.peR,
        peY: listEle.peY,
        peB: listEle.peB,
        pc1R: listEle.pc1R,
        pc2R: listEle.pc2R,
        pc3R: listEle.pc3R,
        pc1Y: listEle.pc1Y,
        pc2Y: listEle.pc2Y,
        pc3Y: listEle.pc3Y,
        pc1B: listEle.pc1B,
        pc2B: listEle.pc2B,
        pc3B: listEle.pc3B,
        c1eR: listEle.c1eR,
        c2eR: listEle.c2eR,
        c3eR: listEle.c3eR,
        c1eY: listEle.c1eY,
        c2eY: listEle.c2eY,
        c3eY: listEle.c3eY,
        c1eB: listEle.c1eB,
        c2eB: listEle.c2eB,
        c3eB: listEle.c3eB,
        c1c2R: listEle.c1c2R,
        c1c2Y: listEle.c1c2Y,
        c1c2B: listEle.c1c2B,
        c2c3R: listEle.c2c3R,
        c2c3Y: listEle.c2c3Y,
        c2c3B: listEle.c2c3B,
        clc1R: listEle.clc1R,
        clc1Y: listEle.clc1Y,
        clc1B: listEle.clc1B,
      ));
    }
    return tPTcoreIR_Model;
  }

  @override
  Future<List<PTcoreIRModel>> getptirEquipmentLists() async {
    final tptirData = await sl<AppDatabase>().getPTirEquipmentListwithAll();
    List<PTcoreIRModel> tptirTestModel =
        List<PTcoreIRModel>.empty(growable: true);
    for (var element in tptirData) {
      tptirTestModel.add(PTcoreIRModel(
        id: element.id,
        databaseID: element.databaseID,
        trNo: element.trNo,
        serialNo: element.serialNo,
        equipmentUsed: element.equipmentUsed,
        updateDate: element.updateDate,
        peR: element.peR,
        peY: element.peY,
        peB: element.peB,
        pc1R: element.pc1R,
        pc2R: element.pc2R,
        pc3R: element.pc3R,
        pc1Y: element.pc1Y,
        pc2Y: element.pc2Y,
        pc3Y: element.pc3Y,
        pc1B: element.pc1B,
        pc2B: element.pc2B,
        pc3B: element.pc3B,
        c1eR: element.c1eR,
        c2eR: element.c2eR,
        c3eR: element.c3eR,
        c1eY: element.c1eY,
        c2eY: element.c2eY,
        c3eY: element.c3eY,
        c1eB: element.c1eB,
        c2eB: element.c2eB,
        c3eB: element.c3eB,
        c1c2R: element.c1c2R,
        c1c2Y: element.c1c2Y,
        c1c2B: element.c1c2B,
        c2c3R: element.c2c3R,
        c2c3Y: element.c2c3Y,
        c2c3B: element.c2c3B,
        clc1R: element.clc1R,
        clc1Y: element.clc1Y,
        clc1B: element.clc1B,
      ));
    }
    return tptirTestModel;
  }
}
