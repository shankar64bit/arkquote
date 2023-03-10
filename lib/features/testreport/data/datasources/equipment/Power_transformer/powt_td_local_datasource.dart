// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';

import '../../../../../../injection_container.dart';
import '../../../models/equipment/powt/powt_td_model.dart';
import '../../test_report_local_datasource.dart';

// import '../../../../../../injection_container.dart';
// import '../../test_report_local_datasource.dart';
// import '../../../../../../injection_container.dart';
// import '../../test_report_local_datasource.dart';

abstract class PowttdLocalDatasource {
  Future<PowttdModel> getPowttdById(int id);
  Future<int> localPowttd(PowttdModel powttdtolocal);
  Future<void> updatePowttd(PowttdModel powttdtoupdate, int id);
  Future<int> deletePowttdById(int id);
  Future<List<PowttdModel>> getPowttdSerialNo(String serialNo);
  Future<List<PowttdModel>> getPowttdEquipmentLists();
}

@DataClassName('PowttdLocalData')
class PowttdLocalDatasourceImpl extends Table implements PowttdLocalDatasource {
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
  RealColumn get ru1 => real()();
  @required
  RealColumn get ru2 => real()();
  @required
  RealColumn get ru3 => real()();
  @required
  RealColumn get ri1 => real()();
  @required
  RealColumn get ri2 => real()();
  @required
  RealColumn get ri3 => real()();
  @required
  RealColumn get rc1 => real()();
  @required
  RealColumn get rc2 => real()();
  @required
  RealColumn get rc3 => real()();
  @required
  RealColumn get rtanD1 => real()();
  @required
  RealColumn get rtanD2 => real()();
  @required
  RealColumn get rtanD3 => real()();
  @required
  RealColumn get rp1 => real()();
  @required
  RealColumn get rp2 => real()();
  @required
  RealColumn get rp3 => real()();
  @required
  RealColumn get rVdf1 => real()();
  @required
  RealColumn get rVdf2 => real()();
  @required
  RealColumn get rVdf3 => real()();
  @required
  RealColumn get yu1 => real()();
  @required
  RealColumn get yu2 => real()();
  @required
  RealColumn get yu3 => real()();
  @required
  RealColumn get yi1 => real()();
  @required
  RealColumn get yi2 => real()();
  @required
  RealColumn get yi3 => real()();
  @required
  RealColumn get yc1 => real()();
  @required
  RealColumn get yc2 => real()();
  @required
  RealColumn get yc3 => real()();
  @required
  RealColumn get ytanD1 => real()();
  @required
  RealColumn get ytanD2 => real()();
  @required
  RealColumn get ytanD3 => real()();
  @required
  RealColumn get yp1 => real()();
  @required
  RealColumn get yp2 => real()();
  @required
  RealColumn get yp3 => real()();
  @required
  RealColumn get yVdf1 => real()();
  @required
  RealColumn get yVdf2 => real()();
  @required
  RealColumn get yVdf3 => real()();
  @required
  RealColumn get bu1 => real()();
  @required
  RealColumn get bu2 => real()();
  @required
  RealColumn get bu3 => real()();
  @required
  RealColumn get bi1 => real()();
  @required
  RealColumn get bi2 => real()();
  @required
  RealColumn get bi3 => real()();
  @required
  RealColumn get bc1 => real()();
  @required
  RealColumn get bc2 => real()();
  @required
  RealColumn get bc3 => real()();
  @required
  RealColumn get btanD1 => real()();
  @required
  RealColumn get btanD2 => real()();
  @required
  RealColumn get btanD3 => real()();
  @required
  RealColumn get bp1 => real()();
  @required
  RealColumn get bp2 => real()();
  @required
  RealColumn get bp3 => real()();
  @required
  RealColumn get bVdf1 => real()();
  @required
  RealColumn get bVdf2 => real()();
  @required
  RealColumn get bVdf3 => real()();
  @required
  RealColumn get hv_lv_u1 => real()();
  @required
  RealColumn get hv_lv_u2 => real()();
  @required
  RealColumn get hv_lv_u3 => real()();
  @required
  RealColumn get hv_lv_i1 => real()();
  @required
  RealColumn get hv_lv_i2 => real()();
  @required
  RealColumn get hv_lv_i3 => real()();
  @required
  RealColumn get hv_lv_c1 => real()();
  @required
  RealColumn get hv_lv_c2 => real()();
  @required
  RealColumn get hv_lv_c3 => real()();
  @required
  RealColumn get hv_lv_tanD1 => real()();
  @required
  RealColumn get hv_lv_tanD2 => real()();
  @required
  RealColumn get hv_lv_tanD3 => real()();
  @required
  RealColumn get hv_lv_p1 => real()();
  @required
  RealColumn get hv_lv_p2 => real()();
  @required
  RealColumn get hv_lv_p3 => real()();
  @required
  RealColumn get hv_lv_Vdf1 => real()();
  @required
  RealColumn get hv_lv_Vdf2 => real()();
  @required
  RealColumn get hv_lv_Vdf3 => real()();
  @required
  RealColumn get hvE_G_u1 => real()();
  @required
  RealColumn get hvE_G_u2 => real()();
  @required
  RealColumn get hvE_G_u3 => real()();
  @required
  RealColumn get hvE_G_i1 => real()();
  @required
  RealColumn get hvE_G_i2 => real()();
  @required
  RealColumn get hvE_G_i3 => real()();
  @required
  RealColumn get hvE_G_c1 => real()();
  @required
  RealColumn get hvE_G_c2 => real()();
  @required
  RealColumn get hvE_G_c3 => real()();
  @required
  RealColumn get hvE_G_tanD1 => real()();
  @required
  RealColumn get hvE_G_tanD2 => real()();
  @required
  RealColumn get hvE_G_tanD3 => real()();
  @required
  RealColumn get hvE_G_p1 => real()();
  @required
  RealColumn get hvE_G_p2 => real()();
  @required
  RealColumn get hvE_G_p3 => real()();
  @required
  RealColumn get hvE_G_Vdf1 => real()();
  @required
  RealColumn get hvE_G_Vdf2 => real()();
  @required
  RealColumn get hvE_G_Vdf3 => real()();
  @required
  RealColumn get hvE_Grnd_u1 => real()();
  @required
  RealColumn get hvE_Grnd_u2 => real()();
  @required
  RealColumn get hvE_Grnd_u3 => real()();
  @required
  RealColumn get hvE_Grnd_i1 => real()();
  @required
  RealColumn get hvE_Grnd_i2 => real()();
  @required
  RealColumn get hvE_Grnd_i3 => real()();
  @required
  RealColumn get hvE_Grnd_c1 => real()();
  @required
  RealColumn get hvE_Grnd_c2 => real()();
  @required
  RealColumn get hvE_Grnd_c3 => real()();
  @required
  RealColumn get hvE_Grnd_tanD1 => real()();
  @required
  RealColumn get hvE_Grnd_tanD2 => real()();
  @required
  RealColumn get hvE_Grnd_tanD3 => real()();
  @required
  RealColumn get hvE_Grnd_p1 => real()();
  @required
  RealColumn get hvE_Grnd_p2 => real()();
  @required
  RealColumn get hvE_Grnd_p3 => real()();
  @required
  RealColumn get hvE_Grnd_Vdf1 => real()();
  @required
  RealColumn get hvE_Grnd_Vdf2 => real()();
  @required
  RealColumn get hvE_Grnd_Vdf3 => real()();
  @required
  RealColumn get lvEu1 => real()();
  @required
  RealColumn get lvEu2 => real()();
  @required
  RealColumn get lvEu3 => real()();
  @required
  RealColumn get lvEi1 => real()();
  @required
  RealColumn get lvEi2 => real()();
  @required
  RealColumn get lvEi3 => real()();
  @required
  RealColumn get lvEc1 => real()();
  @required
  RealColumn get lvEc2 => real()();
  @required
  RealColumn get lvEc3 => real()();
  @required
  RealColumn get lvEtanD1 => real()();
  @required
  RealColumn get lvEtanD2 => real()();
  @required
  RealColumn get lvEtanD3 => real()();
  @required
  RealColumn get lvEp1 => real()();
  @required
  RealColumn get lvEp2 => real()();
  @required
  RealColumn get lvEp3 => real()();
  @required
  RealColumn get lvEVdf1 => real()();
  @required
  RealColumn get lvEVdf2 => real()();
  @required
  RealColumn get lvEVdf3 => real()();
  @required
  RealColumn get lvE_G_u1 => real()();
  @required
  RealColumn get lvE_G_u2 => real()();
  @required
  RealColumn get lvE_G_u3 => real()();
  @required
  RealColumn get lvE_G_i1 => real()();
  @required
  RealColumn get lvE_G_i2 => real()();
  @required
  RealColumn get lvE_G_i3 => real()();
  @required
  RealColumn get lvE_G_c1 => real()();
  @required
  RealColumn get lvE_G_c2 => real()();
  @required
  RealColumn get lvE_G_c3 => real()();
  @required
  RealColumn get lvE_G_tanD1 => real()();
  @required
  RealColumn get lvE_G_tanD2 => real()();
  @required
  RealColumn get lvE_G_tanD3 => real()();
  @required
  RealColumn get lvE_G_p1 => real()();
  @required
  RealColumn get lvE_G_p2 => real()();
  @required
  RealColumn get lvE_G_p3 => real()();
  @required
  RealColumn get lvE_G_Vdf1 => real()();
  @required
  RealColumn get lvE_G_Vdf2 => real()();
  @required
  RealColumn get lvE_G_Vdf3 => real()();
  @required
  RealColumn get lvE_Grnd_u1 => real()();
  @required
  RealColumn get lvE_Grnd_u2 => real()();
  @required
  RealColumn get lvE_Grnd_u3 => real()();
  @required
  RealColumn get lvE_Grnd_i1 => real()();
  @required
  RealColumn get lvE_Grnd_i2 => real()();
  @required
  RealColumn get lvE_Grnd_i3 => real()();
  @required
  RealColumn get lvE_Grnd_c1 => real()();
  @required
  RealColumn get lvE_Grnd_c2 => real()();
  @required
  RealColumn get lvE_Grnd_c3 => real()();
  @required
  RealColumn get lvE_Grnd_tanD1 => real()();
  @required
  RealColumn get lvE_Grnd_tanD2 => real()();
  @required
  RealColumn get lvE_Grnd_tanD3 => real()();
  @required
  RealColumn get lvE_Grnd_p1 => real()();
  @required
  RealColumn get lvE_Grnd_p2 => real()();
  @required
  RealColumn get lvE_Grnd_p3 => real()();
  @required
  RealColumn get lvE_Grnd_Vdf1 => real()();
  @required
  RealColumn get lvE_Grnd_Vdf2 => real()();
  @required
  RealColumn get lvE_Grnd_Vdf3 => real()();

  @override
  Future<PowttdModel> getPowttdById(int id) async {
    PowttdLocalData tPowttdData =
        await sl<AppDatabase>().getPowttdLocalDataWithId(id);
    PowttdModel tPowttdModel = PowttdModel(
      id: tPowttdData.id,
      databaseID: tPowttdData.databaseID,
      trNo: tPowttdData.trNo,
      serialNo: tPowttdData.serialNo,
      equipmentUsed: tPowttdData.equipmentUsed,
      updateDate: tPowttdData.updateDate,
      ru1: tPowttdData.ru1,
      ru2: tPowttdData.ru2,
      ru3: tPowttdData.ru3,
      ri1: tPowttdData.ri1,
      ri2: tPowttdData.ri2,
      ri3: tPowttdData.ri3,
      rc1: tPowttdData.rc1,
      rc2: tPowttdData.rc2,
      rc3: tPowttdData.rc3,
      rtanD1: tPowttdData.rtanD1,
      rtanD2: tPowttdData.rtanD2,
      rtanD3: tPowttdData.rtanD3,
      rp1: tPowttdData.rp1,
      rp2: tPowttdData.rp2,
      rp3: tPowttdData.rp3,
      rVdf1: tPowttdData.rVdf1,
      rVdf2: tPowttdData.rVdf2,
      rVdf3: tPowttdData.rVdf3,
      yu1: tPowttdData.yu1,
      yu2: tPowttdData.yu2,
      yu3: tPowttdData.yu3,
      yi1: tPowttdData.yi1,
      yi2: tPowttdData.yi2,
      yi3: tPowttdData.yi3,
      yc1: tPowttdData.yc1,
      yc2: tPowttdData.yc2,
      yc3: tPowttdData.yc3,
      ytanD1: tPowttdData.ytanD1,
      ytanD2: tPowttdData.ytanD2,
      ytanD3: tPowttdData.ytanD3,
      yp1: tPowttdData.yp1,
      yp2: tPowttdData.yp2,
      yp3: tPowttdData.yp3,
      yVdf1: tPowttdData.yVdf1,
      yVdf2: tPowttdData.yVdf2,
      yVdf3: tPowttdData.yVdf3,
      bu1: tPowttdData.bu1,
      bu2: tPowttdData.bu2,
      bu3: tPowttdData.bu3,
      bi1: tPowttdData.bi1,
      bi2: tPowttdData.bi2,
      bi3: tPowttdData.bi3,
      bc1: tPowttdData.bc1,
      bc2: tPowttdData.bc2,
      bc3: tPowttdData.bc3,
      btanD1: tPowttdData.btanD1,
      btanD2: tPowttdData.btanD2,
      btanD3: tPowttdData.btanD3,
      bp1: tPowttdData.bp1,
      bp2: tPowttdData.bp2,
      bp3: tPowttdData.bp3,
      bVdf1: tPowttdData.bVdf1,
      bVdf2: tPowttdData.bVdf2,
      bVdf3: tPowttdData.bVdf3,
      hv_lv_u1: tPowttdData.hv_lv_u1,
      hv_lv_u2: tPowttdData.hv_lv_u2,
      hv_lv_u3: tPowttdData.hv_lv_u3,
      hv_lv_i1: tPowttdData.hv_lv_i1,
      hv_lv_i2: tPowttdData.hv_lv_i2,
      hv_lv_i3: tPowttdData.hv_lv_i3,
      hv_lv_c1: tPowttdData.hv_lv_c1,
      hv_lv_c2: tPowttdData.hv_lv_c2,
      hv_lv_c3: tPowttdData.hv_lv_c3,
      hv_lv_tanD1: tPowttdData.hv_lv_tanD1,
      hv_lv_tanD2: tPowttdData.hv_lv_tanD2,
      hv_lv_tanD3: tPowttdData.hv_lv_tanD3,
      hv_lv_p1: tPowttdData.hv_lv_p1,
      hv_lv_p2: tPowttdData.hv_lv_p2,
      hv_lv_p3: tPowttdData.hv_lv_p3,
      hv_lv_Vdf1: tPowttdData.hv_lv_Vdf1,
      hv_lv_Vdf2: tPowttdData.hv_lv_Vdf2,
      hv_lv_Vdf3: tPowttdData.hv_lv_Vdf3,
      hvE_G_u1: tPowttdData.hvE_G_u1,
      hvE_G_u2: tPowttdData.hvE_G_u2,
      hvE_G_u3: tPowttdData.hvE_G_u3,
      hvE_G_i1: tPowttdData.hvE_G_i1,
      hvE_G_i2: tPowttdData.hvE_G_i2,
      hvE_G_i3: tPowttdData.hvE_G_i3,
      hvE_G_c1: tPowttdData.hvE_G_c1,
      hvE_G_c2: tPowttdData.hvE_G_c2,
      hvE_G_c3: tPowttdData.hvE_G_c3,
      hvE_G_tanD1: tPowttdData.hvE_G_tanD1,
      hvE_G_tanD2: tPowttdData.hvE_G_tanD2,
      hvE_G_tanD3: tPowttdData.hvE_G_tanD3,
      hvE_G_p1: tPowttdData.hvE_G_p1,
      hvE_G_p2: tPowttdData.hvE_G_p2,
      hvE_G_p3: tPowttdData.hvE_G_p3,
      hvE_G_Vdf1: tPowttdData.hvE_G_Vdf1,
      hvE_G_Vdf2: tPowttdData.hvE_G_Vdf2,
      hvE_G_Vdf3: tPowttdData.hvE_G_Vdf3,
      hvE_Grnd_u1: tPowttdData.hvE_Grnd_u1,
      hvE_Grnd_u2: tPowttdData.hvE_Grnd_u2,
      hvE_Grnd_u3: tPowttdData.hvE_Grnd_u3,
      hvE_Grnd_i1: tPowttdData.hvE_Grnd_i1,
      hvE_Grnd_i2: tPowttdData.hvE_Grnd_i2,
      hvE_Grnd_i3: tPowttdData.hvE_Grnd_i3,
      hvE_Grnd_c1: tPowttdData.hvE_Grnd_c1,
      hvE_Grnd_c2: tPowttdData.hvE_Grnd_c2,
      hvE_Grnd_c3: tPowttdData.hvE_Grnd_c3,
      hvE_Grnd_tanD1: tPowttdData.hvE_Grnd_tanD1,
      hvE_Grnd_tanD2: tPowttdData.hvE_Grnd_tanD2,
      hvE_Grnd_tanD3: tPowttdData.hvE_Grnd_tanD3,
      hvE_Grnd_p1: tPowttdData.hvE_Grnd_p1,
      hvE_Grnd_p2: tPowttdData.hvE_Grnd_p2,
      hvE_Grnd_p3: tPowttdData.hvE_Grnd_p3,
      hvE_Grnd_Vdf1: tPowttdData.hvE_Grnd_Vdf1,
      hvE_Grnd_Vdf2: tPowttdData.hvE_Grnd_Vdf2,
      hvE_Grnd_Vdf3: tPowttdData.hvE_Grnd_Vdf3,
      lvEu1: tPowttdData.lvEu1,
      lvEu2: tPowttdData.lvEu2,
      lvEu3: tPowttdData.lvEu3,
      lvEi1: tPowttdData.lvEi1,
      lvEi2: tPowttdData.lvEi2,
      lvEi3: tPowttdData.lvEi3,
      lvEc1: tPowttdData.lvEc1,
      lvEc2: tPowttdData.lvEc2,
      lvEc3: tPowttdData.lvEc3,
      lvEtanD1: tPowttdData.lvEtanD1,
      lvEtanD2: tPowttdData.lvEtanD2,
      lvEtanD3: tPowttdData.lvEtanD3,
      lvEp1: tPowttdData.lvEp1,
      lvEp2: tPowttdData.lvEp2,
      lvEp3: tPowttdData.lvEp3,
      lvEVdf1: tPowttdData.lvEVdf1,
      lvEVdf2: tPowttdData.lvEVdf2,
      lvEVdf3: tPowttdData.lvEVdf3,
      lvE_G_u1: tPowttdData.lvE_G_u1,
      lvE_G_u2: tPowttdData.lvE_G_u2,
      lvE_G_u3: tPowttdData.lvE_G_u3,
      lvE_G_i1: tPowttdData.lvE_G_i1,
      lvE_G_i2: tPowttdData.lvE_G_i2,
      lvE_G_i3: tPowttdData.lvE_G_i3,
      lvE_G_c1: tPowttdData.lvE_G_c1,
      lvE_G_c2: tPowttdData.lvE_G_c2,
      lvE_G_c3: tPowttdData.lvE_G_c3,
      lvE_G_tanD1: tPowttdData.lvE_G_tanD1,
      lvE_G_tanD2: tPowttdData.lvE_G_tanD2,
      lvE_G_tanD3: tPowttdData.lvE_G_tanD3,
      lvE_G_p1: tPowttdData.lvE_G_p1,
      lvE_G_p2: tPowttdData.lvE_G_p2,
      lvE_G_p3: tPowttdData.lvE_G_p3,
      lvE_G_Vdf1: tPowttdData.lvE_G_Vdf1,
      lvE_G_Vdf2: tPowttdData.lvE_G_Vdf2,
      lvE_G_Vdf3: tPowttdData.lvE_G_Vdf3,
      lvE_Grnd_u1: tPowttdData.lvE_Grnd_u1,
      lvE_Grnd_u2: tPowttdData.lvE_Grnd_u2,
      lvE_Grnd_u3: tPowttdData.lvE_Grnd_u3,
      lvE_Grnd_i1: tPowttdData.lvE_Grnd_i1,
      lvE_Grnd_i2: tPowttdData.lvE_Grnd_i2,
      lvE_Grnd_i3: tPowttdData.lvE_Grnd_i3,
      lvE_Grnd_c1: tPowttdData.lvE_Grnd_c1,
      lvE_Grnd_c2: tPowttdData.lvE_Grnd_c2,
      lvE_Grnd_c3: tPowttdData.lvE_Grnd_c3,
      lvE_Grnd_tanD1: tPowttdData.lvE_Grnd_tanD1,
      lvE_Grnd_tanD2: tPowttdData.lvE_Grnd_tanD2,
      lvE_Grnd_tanD3: tPowttdData.lvE_Grnd_tanD3,
      lvE_Grnd_p1: tPowttdData.lvE_Grnd_p1,
      lvE_Grnd_p2: tPowttdData.lvE_Grnd_p2,
      lvE_Grnd_p3: tPowttdData.lvE_Grnd_p3,
      lvE_Grnd_Vdf1: tPowttdData.lvE_Grnd_Vdf1,
      lvE_Grnd_Vdf2: tPowttdData.lvE_Grnd_Vdf2,
      lvE_Grnd_Vdf3: tPowttdData.lvE_Grnd_Vdf3,
    );
    return tPowttdModel;
  }

  @override
  Future<int> localPowttd(PowttdModel powttdtolocal) {
    return (sl<AppDatabase>().createPowttd(powttdtolocal));
  }

  @override
  Future<void> updatePowttd(PowttdModel powttdtoupdate, int id) async {
    sl<AppDatabase>().updatePowttd(powttdtoupdate, id);
  }

  @override
  Future<int> deletePowttdById(int id) {
    return (sl<AppDatabase>().deletePowttdById(id));
  }

  @override
  Future<List<PowttdModel>> getPowttdSerialNo(String serialNo) async {
    final tPowttd_data =
        await sl<AppDatabase>().getPowttdLocalDataWithSerialNo(serialNo);

    List<PowttdModel> tPowttd_Model = List<PowttdModel>.empty(growable: true);
    for (var listEle in tPowttd_data) {
      tPowttd_Model.add(PowttdModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        ru1: listEle.ru1,
        ru2: listEle.ru2,
        ru3: listEle.ru3,
        ri1: listEle.ri1,
        ri2: listEle.ri2,
        ri3: listEle.ri3,
        rc1: listEle.rc1,
        rc2: listEle.rc2,
        rc3: listEle.rc3,
        rtanD1: listEle.rtanD1,
        rtanD2: listEle.rtanD2,
        rtanD3: listEle.rtanD3,
        rp1: listEle.rp1,
        rp2: listEle.rp2,
        rp3: listEle.rp3,
        rVdf1: listEle.rVdf1,
        rVdf2: listEle.rVdf2,
        rVdf3: listEle.rVdf3,
        yu1: listEle.yu1,
        yu2: listEle.yu2,
        yu3: listEle.yu3,
        yi1: listEle.yi1,
        yi2: listEle.yi2,
        yi3: listEle.yi3,
        yc1: listEle.yc1,
        yc2: listEle.yc2,
        yc3: listEle.yc3,
        ytanD1: listEle.ytanD1,
        ytanD2: listEle.ytanD2,
        ytanD3: listEle.ytanD3,
        yp1: listEle.yp1,
        yp2: listEle.yp2,
        yp3: listEle.yp3,
        yVdf1: listEle.yVdf1,
        yVdf2: listEle.yVdf2,
        yVdf3: listEle.yVdf3,
        bu1: listEle.bu1,
        bu2: listEle.bu2,
        bu3: listEle.bu3,
        bi1: listEle.bi1,
        bi2: listEle.bi2,
        bi3: listEle.bi3,
        bc1: listEle.bc1,
        bc2: listEle.bc2,
        bc3: listEle.bc3,
        btanD1: listEle.btanD1,
        btanD2: listEle.btanD2,
        btanD3: listEle.btanD3,
        bp1: listEle.bp1,
        bp2: listEle.bp2,
        bp3: listEle.bp3,
        bVdf1: listEle.bVdf1,
        bVdf2: listEle.bVdf2,
        bVdf3: listEle.bVdf3,
        hv_lv_u1: listEle.hv_lv_u1,
        hv_lv_u2: listEle.hv_lv_u2,
        hv_lv_u3: listEle.hv_lv_u3,
        hv_lv_i1: listEle.hv_lv_i1,
        hv_lv_i2: listEle.hv_lv_i2,
        hv_lv_i3: listEle.hv_lv_i3,
        hv_lv_c1: listEle.hv_lv_c1,
        hv_lv_c2: listEle.hv_lv_c2,
        hv_lv_c3: listEle.hv_lv_c3,
        hv_lv_tanD1: listEle.hv_lv_tanD1,
        hv_lv_tanD2: listEle.hv_lv_tanD2,
        hv_lv_tanD3: listEle.hv_lv_tanD3,
        hv_lv_p1: listEle.hv_lv_p1,
        hv_lv_p2: listEle.hv_lv_p2,
        hv_lv_p3: listEle.hv_lv_p3,
        hv_lv_Vdf1: listEle.hv_lv_Vdf1,
        hv_lv_Vdf2: listEle.hv_lv_Vdf2,
        hv_lv_Vdf3: listEle.hv_lv_Vdf3,
        hvE_G_u1: listEle.hvE_G_u1,
        hvE_G_u2: listEle.hvE_G_u2,
        hvE_G_u3: listEle.hvE_G_u3,
        hvE_G_i1: listEle.hvE_G_i1,
        hvE_G_i2: listEle.hvE_G_i2,
        hvE_G_i3: listEle.hvE_G_i3,
        hvE_G_c1: listEle.hvE_G_c1,
        hvE_G_c2: listEle.hvE_G_c2,
        hvE_G_c3: listEle.hvE_G_c3,
        hvE_G_tanD1: listEle.hvE_G_tanD1,
        hvE_G_tanD2: listEle.hvE_G_tanD2,
        hvE_G_tanD3: listEle.hvE_G_tanD3,
        hvE_G_p1: listEle.hvE_G_p1,
        hvE_G_p2: listEle.hvE_G_p2,
        hvE_G_p3: listEle.hvE_G_p3,
        hvE_G_Vdf1: listEle.hvE_G_Vdf1,
        hvE_G_Vdf2: listEle.hvE_G_Vdf2,
        hvE_G_Vdf3: listEle.hvE_G_Vdf3,
        hvE_Grnd_u1: listEle.hvE_Grnd_u1,
        hvE_Grnd_u2: listEle.hvE_Grnd_u2,
        hvE_Grnd_u3: listEle.hvE_Grnd_u3,
        hvE_Grnd_i1: listEle.hvE_Grnd_i1,
        hvE_Grnd_i2: listEle.hvE_Grnd_i2,
        hvE_Grnd_i3: listEle.hvE_Grnd_i3,
        hvE_Grnd_c1: listEle.hvE_Grnd_c1,
        hvE_Grnd_c2: listEle.hvE_Grnd_c2,
        hvE_Grnd_c3: listEle.hvE_Grnd_c3,
        hvE_Grnd_tanD1: listEle.hvE_Grnd_tanD1,
        hvE_Grnd_tanD2: listEle.hvE_Grnd_tanD2,
        hvE_Grnd_tanD3: listEle.hvE_Grnd_tanD3,
        hvE_Grnd_p1: listEle.hvE_Grnd_p1,
        hvE_Grnd_p2: listEle.hvE_Grnd_p2,
        hvE_Grnd_p3: listEle.hvE_Grnd_p3,
        hvE_Grnd_Vdf1: listEle.hvE_Grnd_Vdf1,
        hvE_Grnd_Vdf2: listEle.hvE_Grnd_Vdf2,
        hvE_Grnd_Vdf3: listEle.hvE_Grnd_Vdf3,
        lvEu1: listEle.lvEu1,
        lvEu2: listEle.lvEu2,
        lvEu3: listEle.lvEu3,
        lvEi1: listEle.lvEi1,
        lvEi2: listEle.lvEi2,
        lvEi3: listEle.lvEi3,
        lvEc1: listEle.lvEc1,
        lvEc2: listEle.lvEc2,
        lvEc3: listEle.lvEc3,
        lvEtanD1: listEle.lvEtanD1,
        lvEtanD2: listEle.lvEtanD2,
        lvEtanD3: listEle.lvEtanD3,
        lvEp1: listEle.lvEp1,
        lvEp2: listEle.lvEp2,
        lvEp3: listEle.lvEp3,
        lvEVdf1: listEle.lvEVdf1,
        lvEVdf2: listEle.lvEVdf2,
        lvEVdf3: listEle.lvEVdf3,
        lvE_G_u1: listEle.lvE_G_u1,
        lvE_G_u2: listEle.lvE_G_u2,
        lvE_G_u3: listEle.lvE_G_u3,
        lvE_G_i1: listEle.lvE_G_i1,
        lvE_G_i2: listEle.lvE_G_i2,
        lvE_G_i3: listEle.lvE_G_i3,
        lvE_G_c1: listEle.lvE_G_c1,
        lvE_G_c2: listEle.lvE_G_c2,
        lvE_G_c3: listEle.lvE_G_c3,
        lvE_G_tanD1: listEle.lvE_G_tanD1,
        lvE_G_tanD2: listEle.lvE_G_tanD2,
        lvE_G_tanD3: listEle.lvE_G_tanD3,
        lvE_G_p1: listEle.lvE_G_p1,
        lvE_G_p2: listEle.lvE_G_p2,
        lvE_G_p3: listEle.lvE_G_p3,
        lvE_G_Vdf1: listEle.lvE_G_Vdf1,
        lvE_G_Vdf2: listEle.lvE_G_Vdf2,
        lvE_G_Vdf3: listEle.lvE_G_Vdf3,
        lvE_Grnd_u1: listEle.lvE_Grnd_u1,
        lvE_Grnd_u2: listEle.lvE_Grnd_u2,
        lvE_Grnd_u3: listEle.lvE_Grnd_u3,
        lvE_Grnd_i1: listEle.lvE_Grnd_i1,
        lvE_Grnd_i2: listEle.lvE_Grnd_i2,
        lvE_Grnd_i3: listEle.lvE_Grnd_i3,
        lvE_Grnd_c1: listEle.lvE_Grnd_c1,
        lvE_Grnd_c2: listEle.lvE_Grnd_c2,
        lvE_Grnd_c3: listEle.lvE_Grnd_c3,
        lvE_Grnd_tanD1: listEle.lvE_Grnd_tanD1,
        lvE_Grnd_tanD2: listEle.lvE_Grnd_tanD2,
        lvE_Grnd_tanD3: listEle.lvE_Grnd_tanD3,
        lvE_Grnd_p1: listEle.lvE_Grnd_p1,
        lvE_Grnd_p2: listEle.lvE_Grnd_p2,
        lvE_Grnd_p3: listEle.lvE_Grnd_p3,
        lvE_Grnd_Vdf1: listEle.lvE_Grnd_Vdf1,
        lvE_Grnd_Vdf2: listEle.lvE_Grnd_Vdf2,
        lvE_Grnd_Vdf3: listEle.lvE_Grnd_Vdf3,
      ));
    }
    return tPowttd_Model;
  }

  @override
  Future<List<PowttdModel>> getPowttdEquipmentLists() async {
    final tpowttdData = await sl<AppDatabase>().getPowttdEquipmentListwithAll();
    List<PowttdModel> tpowttdTestModel =
        List<PowttdModel>.empty(growable: true);
    for (var listEle in tpowttdData) {
      tpowttdTestModel.add(PowttdModel(
        id: listEle.id,
        trNo: listEle.trNo,
        databaseID: listEle.databaseID,
        serialNo: listEle.serialNo,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
        ru1: listEle.ru1,
        ru2: listEle.ru2,
        ru3: listEle.ru3,
        ri1: listEle.ri1,
        ri2: listEle.ri2,
        ri3: listEle.ri3,
        rc1: listEle.rc1,
        rc2: listEle.rc2,
        rc3: listEle.rc3,
        rtanD1: listEle.rtanD1,
        rtanD2: listEle.rtanD2,
        rtanD3: listEle.rtanD3,
        rp1: listEle.rp1,
        rp2: listEle.rp2,
        rp3: listEle.rp3,
        rVdf1: listEle.rVdf1,
        rVdf2: listEle.rVdf2,
        rVdf3: listEle.rVdf3,
        yu1: listEle.yu1,
        yu2: listEle.yu2,
        yu3: listEle.yu3,
        yi1: listEle.yi1,
        yi2: listEle.yi2,
        yi3: listEle.yi3,
        yc1: listEle.yc1,
        yc2: listEle.yc2,
        yc3: listEle.yc3,
        ytanD1: listEle.ytanD1,
        ytanD2: listEle.ytanD2,
        ytanD3: listEle.ytanD3,
        yp1: listEle.yp1,
        yp2: listEle.yp2,
        yp3: listEle.yp3,
        yVdf1: listEle.yVdf1,
        yVdf2: listEle.yVdf2,
        yVdf3: listEle.yVdf3,
        bu1: listEle.bu1,
        bu2: listEle.bu2,
        bu3: listEle.bu3,
        bi1: listEle.bi1,
        bi2: listEle.bi2,
        bi3: listEle.bi3,
        bc1: listEle.bc1,
        bc2: listEle.bc2,
        bc3: listEle.bc3,
        btanD1: listEle.btanD1,
        btanD2: listEle.btanD2,
        btanD3: listEle.btanD3,
        bp1: listEle.bp1,
        bp2: listEle.bp2,
        bp3: listEle.bp3,
        bVdf1: listEle.bVdf1,
        bVdf2: listEle.bVdf2,
        bVdf3: listEle.bVdf3,
        hv_lv_u1: listEle.hv_lv_u1,
        hv_lv_u2: listEle.hv_lv_u2,
        hv_lv_u3: listEle.hv_lv_u3,
        hv_lv_i1: listEle.hv_lv_i1,
        hv_lv_i2: listEle.hv_lv_i2,
        hv_lv_i3: listEle.hv_lv_i3,
        hv_lv_c1: listEle.hv_lv_c1,
        hv_lv_c2: listEle.hv_lv_c2,
        hv_lv_c3: listEle.hv_lv_c3,
        hv_lv_tanD1: listEle.hv_lv_tanD1,
        hv_lv_tanD2: listEle.hv_lv_tanD2,
        hv_lv_tanD3: listEle.hv_lv_tanD3,
        hv_lv_p1: listEle.hv_lv_p1,
        hv_lv_p2: listEle.hv_lv_p2,
        hv_lv_p3: listEle.hv_lv_p3,
        hv_lv_Vdf1: listEle.hv_lv_Vdf1,
        hv_lv_Vdf2: listEle.hv_lv_Vdf2,
        hv_lv_Vdf3: listEle.hv_lv_Vdf3,
        hvE_G_u1: listEle.hvE_G_u1,
        hvE_G_u2: listEle.hvE_G_u2,
        hvE_G_u3: listEle.hvE_G_u3,
        hvE_G_i1: listEle.hvE_G_i1,
        hvE_G_i2: listEle.hvE_G_i2,
        hvE_G_i3: listEle.hvE_G_i3,
        hvE_G_c1: listEle.hvE_G_c1,
        hvE_G_c2: listEle.hvE_G_c2,
        hvE_G_c3: listEle.hvE_G_c3,
        hvE_G_tanD1: listEle.hvE_G_tanD1,
        hvE_G_tanD2: listEle.hvE_G_tanD2,
        hvE_G_tanD3: listEle.hvE_G_tanD3,
        hvE_G_p1: listEle.hvE_G_p1,
        hvE_G_p2: listEle.hvE_G_p2,
        hvE_G_p3: listEle.hvE_G_p3,
        hvE_G_Vdf1: listEle.hvE_G_Vdf1,
        hvE_G_Vdf2: listEle.hvE_G_Vdf2,
        hvE_G_Vdf3: listEle.hvE_G_Vdf3,
        hvE_Grnd_u1: listEle.hvE_Grnd_u1,
        hvE_Grnd_u2: listEle.hvE_Grnd_u2,
        hvE_Grnd_u3: listEle.hvE_Grnd_u3,
        hvE_Grnd_i1: listEle.hvE_Grnd_i1,
        hvE_Grnd_i2: listEle.hvE_Grnd_i2,
        hvE_Grnd_i3: listEle.hvE_Grnd_i3,
        hvE_Grnd_c1: listEle.hvE_Grnd_c1,
        hvE_Grnd_c2: listEle.hvE_Grnd_c2,
        hvE_Grnd_c3: listEle.hvE_Grnd_c3,
        hvE_Grnd_tanD1: listEle.hvE_Grnd_tanD1,
        hvE_Grnd_tanD2: listEle.hvE_Grnd_tanD2,
        hvE_Grnd_tanD3: listEle.hvE_Grnd_tanD3,
        hvE_Grnd_p1: listEle.hvE_Grnd_p1,
        hvE_Grnd_p2: listEle.hvE_Grnd_p2,
        hvE_Grnd_p3: listEle.hvE_Grnd_p3,
        hvE_Grnd_Vdf1: listEle.hvE_Grnd_Vdf1,
        hvE_Grnd_Vdf2: listEle.hvE_Grnd_Vdf2,
        hvE_Grnd_Vdf3: listEle.hvE_Grnd_Vdf3,
        lvEu1: listEle.lvEu1,
        lvEu2: listEle.lvEu2,
        lvEu3: listEle.lvEu3,
        lvEi1: listEle.lvEi1,
        lvEi2: listEle.lvEi2,
        lvEi3: listEle.lvEi3,
        lvEc1: listEle.lvEc1,
        lvEc2: listEle.lvEc2,
        lvEc3: listEle.lvEc3,
        lvEtanD1: listEle.lvEtanD1,
        lvEtanD2: listEle.lvEtanD2,
        lvEtanD3: listEle.lvEtanD3,
        lvEp1: listEle.lvEp1,
        lvEp2: listEle.lvEp2,
        lvEp3: listEle.lvEp3,
        lvEVdf1: listEle.lvEVdf1,
        lvEVdf2: listEle.lvEVdf2,
        lvEVdf3: listEle.lvEVdf3,
        lvE_G_u1: listEle.lvE_G_u1,
        lvE_G_u2: listEle.lvE_G_u2,
        lvE_G_u3: listEle.lvE_G_u3,
        lvE_G_i1: listEle.lvE_G_i1,
        lvE_G_i2: listEle.lvE_G_i2,
        lvE_G_i3: listEle.lvE_G_i3,
        lvE_G_c1: listEle.lvE_G_c1,
        lvE_G_c2: listEle.lvE_G_c2,
        lvE_G_c3: listEle.lvE_G_c3,
        lvE_G_tanD1: listEle.lvE_G_tanD1,
        lvE_G_tanD2: listEle.lvE_G_tanD2,
        lvE_G_tanD3: listEle.lvE_G_tanD3,
        lvE_G_p1: listEle.lvE_G_p1,
        lvE_G_p2: listEle.lvE_G_p2,
        lvE_G_p3: listEle.lvE_G_p3,
        lvE_G_Vdf1: listEle.lvE_G_Vdf1,
        lvE_G_Vdf2: listEle.lvE_G_Vdf2,
        lvE_G_Vdf3: listEle.lvE_G_Vdf3,
        lvE_Grnd_u1: listEle.lvE_Grnd_u1,
        lvE_Grnd_u2: listEle.lvE_Grnd_u2,
        lvE_Grnd_u3: listEle.lvE_Grnd_u3,
        lvE_Grnd_i1: listEle.lvE_Grnd_i1,
        lvE_Grnd_i2: listEle.lvE_Grnd_i2,
        lvE_Grnd_i3: listEle.lvE_Grnd_i3,
        lvE_Grnd_c1: listEle.lvE_Grnd_c1,
        lvE_Grnd_c2: listEle.lvE_Grnd_c2,
        lvE_Grnd_c3: listEle.lvE_Grnd_c3,
        lvE_Grnd_tanD1: listEle.lvE_Grnd_tanD1,
        lvE_Grnd_tanD2: listEle.lvE_Grnd_tanD2,
        lvE_Grnd_tanD3: listEle.lvE_Grnd_tanD3,
        lvE_Grnd_p1: listEle.lvE_Grnd_p1,
        lvE_Grnd_p2: listEle.lvE_Grnd_p2,
        lvE_Grnd_p3: listEle.lvE_Grnd_p3,
        lvE_Grnd_Vdf1: listEle.lvE_Grnd_Vdf1,
        lvE_Grnd_Vdf2: listEle.lvE_Grnd_Vdf2,
        lvE_Grnd_Vdf3: listEle.lvE_Grnd_Vdf3,
      ));
    }
    return tpowttdTestModel;
  }
}
