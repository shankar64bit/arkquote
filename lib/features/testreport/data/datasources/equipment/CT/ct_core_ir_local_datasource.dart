// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/CT/ct_core_ir_model.dart';

abstract class CTcoreIRLocalDatasource {
  Future<CTcoreIRModel> getCTcoreIR_ById(int id);
  Future<int> localCTcoreIR(CTcoreIRModel ctirtolocal);
  Future<void> updateCTcoreIR(CTcoreIRModel ctirtoupdate, int id);
  Future<int> deleteCTcoreIRById(int id);
  Future<List<CTcoreIRModel>> getCTcoreIR_SerialNo(String serialNo);
  Future<List<CTcoreIRModel>> getCTirEquipmentLists();
}

@DataClassName('CTcoreIRLocalData')
class CTcoreIRLocalDatasourceImpl extends Table
    implements CTcoreIRLocalDatasource {
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
  RealColumn get pc4R => real()();
  @required
  RealColumn get pc5R => real()();
  @required
  RealColumn get pc1Y => real()();
  @required
  RealColumn get pc2Y => real()();
  @required
  RealColumn get pc3Y => real()();
  @required
  RealColumn get pc4Y => real()();
  @required
  RealColumn get pc5Y => real()();
  @required
  RealColumn get pc1B => real()();
  @required
  RealColumn get pc2B => real()();
  @required
  RealColumn get pc3B => real()();
  @required
  RealColumn get pc4B => real()();
  @required
  RealColumn get pc5B => real()();
  ///////////////////////////////
  @required
  RealColumn get c1eR => real()();
  @required
  RealColumn get c2eR => real()();
  @required
  RealColumn get c3eR => real()();
  @required
  RealColumn get c4eR => real()();
  @required
  RealColumn get c5eR => real()();
  @required
  RealColumn get c1eY => real()();
  @required
  RealColumn get c2eY => real()();
  @required
  RealColumn get c3eY => real()();
  @required
  RealColumn get c4eY => real()();
  @required
  RealColumn get c5eY => real()();
  @required
  RealColumn get c1eB => real()();
  @required
  RealColumn get c2eB => real()();
  @required
  RealColumn get c3eB => real()();
  @required
  RealColumn get c4eB => real()();
  @required
  RealColumn get c5eB => real()();
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
  @required
  RealColumn get c3c4R => real()();
  @required
  RealColumn get c3c4Y => real()();
  @required
  RealColumn get c3c4B => real()();
  @required
  RealColumn get c4c5R => real()();
  @required
  RealColumn get c4c5Y => real()();
  @required
  RealColumn get c4c5B => real()();
  ////////////////////////////////
  @required
  RealColumn get clc1R => real()();
  @required
  RealColumn get clc1Y => real()();
  @required
  RealColumn get clc1B => real()();

  @override
  Future<CTcoreIRModel> getCTcoreIR_ById(int id) async {
    CTcoreIRLocalData tCTcoreIRData =
        await sl<AppDatabase>().getCTcoreIRLocalDataWithId(id);
    CTcoreIRModel tCTcoreIRModel = CTcoreIRModel(
      id: tCTcoreIRData.id,
      databaseID: tCTcoreIRData.databaseID,
      trNo: tCTcoreIRData.trNo,
      serialNo: tCTcoreIRData.serialNo,
      equipmentUsed: tCTcoreIRData.equipmentUsed,
      updateDate: tCTcoreIRData.updateDate,
      peR: tCTcoreIRData.peR,
      peY: tCTcoreIRData.peY,
      peB: tCTcoreIRData.peB,
      pc1R: tCTcoreIRData.pc1R,
      pc2R: tCTcoreIRData.pc2R,
      pc3R: tCTcoreIRData.pc3R,
      pc4R: tCTcoreIRData.pc4R,
      pc5R: tCTcoreIRData.pc5R,
      pc1Y: tCTcoreIRData.pc1Y,
      pc2Y: tCTcoreIRData.pc2Y,
      pc3Y: tCTcoreIRData.pc3Y,
      pc4Y: tCTcoreIRData.pc4Y,
      pc5Y: tCTcoreIRData.pc5Y,
      pc1B: tCTcoreIRData.pc1B,
      pc2B: tCTcoreIRData.pc2B,
      pc3B: tCTcoreIRData.pc3B,
      pc4B: tCTcoreIRData.pc4B,
      pc5B: tCTcoreIRData.pc5B,
      c1eR: tCTcoreIRData.c1eR,
      c2eR: tCTcoreIRData.c2eR,
      c3eR: tCTcoreIRData.c3eR,
      c4eR: tCTcoreIRData.c4eR,
      c5eR: tCTcoreIRData.c5eR,
      c1eY: tCTcoreIRData.c1eY,
      c2eY: tCTcoreIRData.c2eY,
      c3eY: tCTcoreIRData.c3eY,
      c4eY: tCTcoreIRData.c4eY,
      c5eY: tCTcoreIRData.c5eY,
      c1eB: tCTcoreIRData.c1eB,
      c2eB: tCTcoreIRData.c2eB,
      c3eB: tCTcoreIRData.c3eB,
      c4eB: tCTcoreIRData.c4eB,
      c5eB: tCTcoreIRData.c5eB,
      c1c2R: tCTcoreIRData.c1c2R,
      c1c2Y: tCTcoreIRData.c1c2Y,
      c1c2B: tCTcoreIRData.c1c2B,
      c2c3R: tCTcoreIRData.c2c3R,
      c2c3Y: tCTcoreIRData.c2c3Y,
      c2c3B: tCTcoreIRData.c2c3B,
      c3c4R: tCTcoreIRData.c3c4R,
      c3c4Y: tCTcoreIRData.c3c4Y,
      c3c4B: tCTcoreIRData.c3c4B,
      c4c5R: tCTcoreIRData.c4c5R,
      c4c5Y: tCTcoreIRData.c4c5Y,
      c4c5B: tCTcoreIRData.c4c5B,
      clc1R: tCTcoreIRData.clc1R,
      clc1Y: tCTcoreIRData.clc1Y,
      clc1B: tCTcoreIRData.clc1B,
    );
    return tCTcoreIRModel;
  }

  @override
  Future<int> localCTcoreIR(CTcoreIRModel ctirtolocal) {
    return (sl<AppDatabase>().createCTcoreIR(ctirtolocal));
  }

  @override
  Future<void> updateCTcoreIR(CTcoreIRModel ctirtoupdate, int id) async {
    sl<AppDatabase>().updateCTcoreIR(ctirtoupdate, id);
  }

  @override
  Future<int> deleteCTcoreIRById(int id) {
    return (sl<AppDatabase>().deleteCTcoreIRById(id));
  }

  @override
  Future<List<CTcoreIRModel>> getCTcoreIR_SerialNo(String serialNo) async {
    final tCTcoreIR_data =
        await sl<AppDatabase>().getCTcoreLocalDataWithSerialNo(serialNo);

    List<CTcoreIRModel> tCTcoreIR_Model =
        List<CTcoreIRModel>.empty(growable: true);
    for (var listEle in tCTcoreIR_data) {
      tCTcoreIR_Model.add(CTcoreIRModel(
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
        pc4R: listEle.pc4R,
        pc5R: listEle.pc5R,
        pc1Y: listEle.pc1Y,
        pc2Y: listEle.pc2Y,
        pc3Y: listEle.pc3Y,
        pc4Y: listEle.pc4Y,
        pc5Y: listEle.pc5Y,
        pc1B: listEle.pc1B,
        pc2B: listEle.pc2B,
        pc3B: listEle.pc3B,
        pc4B: listEle.pc4B,
        pc5B: listEle.pc5B,
        c1eR: listEle.c1eR,
        c2eR: listEle.c2eR,
        c3eR: listEle.c3eR,
        c4eR: listEle.c4eR,
        c5eR: listEle.c5eR,
        c1eY: listEle.c1eY,
        c2eY: listEle.c2eY,
        c3eY: listEle.c3eY,
        c4eY: listEle.c4eY,
        c5eY: listEle.c5eY,
        c1eB: listEle.c1eB,
        c2eB: listEle.c2eB,
        c3eB: listEle.c3eB,
        c4eB: listEle.c4eB,
        c5eB: listEle.c5eB,
        c1c2R: listEle.c1c2R,
        c1c2Y: listEle.c1c2Y,
        c1c2B: listEle.c1c2B,
        c2c3R: listEle.c2c3R,
        c2c3Y: listEle.c2c3Y,
        c2c3B: listEle.c2c3B,
        c3c4R: listEle.c3c4R,
        c3c4Y: listEle.c3c4Y,
        c3c4B: listEle.c3c4B,
        c4c5R: listEle.c4c5R,
        c4c5Y: listEle.c4c5Y,
        c4c5B: listEle.c4c5B,
        clc1R: listEle.clc1R,
        clc1Y: listEle.clc1Y,
        clc1B: listEle.clc1B,
      ));
    }
    return tCTcoreIR_Model;
  }

  @override
  Future<List<CTcoreIRModel>> getCTirEquipmentLists() async {
    final tCTirData = await sl<AppDatabase>().getCTirEquipmentListwithAll();
    List<CTcoreIRModel> tCTirTestModel =
        List<CTcoreIRModel>.empty(growable: true);
    for (var element in tCTirData) {
      tCTirTestModel.add(CTcoreIRModel(
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
        pc4R: element.pc4R,
        pc5R: element.pc5R,
        pc1Y: element.pc1Y,
        pc2Y: element.pc2Y,
        pc3Y: element.pc3Y,
        pc4Y: element.pc4Y,
        pc5Y: element.pc5Y,
        pc1B: element.pc1B,
        pc2B: element.pc2B,
        pc3B: element.pc3B,
        pc4B: element.pc4B,
        pc5B: element.pc5B,
        c1eR: element.c1eR,
        c2eR: element.c2eR,
        c3eR: element.c3eR,
        c4eR: element.c4eR,
        c5eR: element.c5eR,
        c1eY: element.c1eY,
        c2eY: element.c2eY,
        c3eY: element.c3eY,
        c4eY: element.c4eY,
        c5eY: element.c5eY,
        c1eB: element.c1eB,
        c2eB: element.c2eB,
        c3eB: element.c3eB,
        c4eB: element.c4eB,
        c5eB: element.c5eB,
        c1c2R: element.c1c2R,
        c1c2Y: element.c1c2Y,
        c1c2B: element.c1c2B,
        c2c3R: element.c2c3R,
        c2c3Y: element.c2c3Y,
        c2c3B: element.c2c3B,
        c3c4R: element.c3c4R,
        c3c4Y: element.c3c4Y,
        c3c4B: element.c3c4B,
        c4c5R: element.c4c5R,
        c4c5Y: element.c4c5Y,
        c4c5B: element.c4c5B,
        clc1R: element.clc1R,
        clc1Y: element.clc1Y,
        clc1B: element.clc1B,
      ));
    }
    return tCTirTestModel;
  }
}
