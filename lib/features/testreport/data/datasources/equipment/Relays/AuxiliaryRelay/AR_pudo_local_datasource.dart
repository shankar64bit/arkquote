// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';
import '../../../../../../../injection_container.dart';
import '../../../../models/equipment/Relays/AuxiliaryRelay/AR_pudo_model.dart';
// import '../../../../models/equipment/Relays/FPrelay/FPR_currentMgmt_model.dart';
import '../../../test_report_local_datasource.dart';

abstract class ARpudoLocalDatasource {
  Future<ARpudoModel> getARpudoById(int id);
  Future<int> localARpudo(ARpudoModel arpudotoLocal);
  Future<void> updateARpudo(ARpudoModel arpudoUpdate, int id);
  Future<int> deleteARpudoById(int id);
  Future<List<ARpudoModel>> getARpudoTrNoID(int trNo);
  Future<List<ARpudoModel>> getARpudoSerialNo(String sNo);
  Future<List<ARpudoModel>> getARpudoEquipmentLists();
}

@DataClassName('ARpudoLocalData')
class ARpudoLocalDatasourceImpl extends Table implements ARpudoLocalDatasource {
  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  IntColumn get trNo => integer()();
  @required
  IntColumn get arRef => integer()();
  @required
  TextColumn get coilRef => text().withLength(min: 1, max: 50)();
  @required
  RealColumn get coilResistenace => real()();
  @required
  IntColumn get pickUp => integer()();
  @required
  TextColumn get dropOff => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get equipmentUsed => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get updateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<ARpudoModel> getARpudoById(int id) async {
    ARpudoLocalData tARpudoData =
        await sl<AppDatabase>().getARpudoLocalDataWithId(id);
    ARpudoModel tARpudoModel = ARpudoModel(
      id: tARpudoData.id,
      databaseID: tARpudoData.databaseID,
      trNo: tARpudoData.trNo,
      arRef: tARpudoData.arRef,
      coilRef: tARpudoData.coilRef,
      coilResistenace: tARpudoData.coilResistenace,
      pickUp: tARpudoData.pickUp,
      dropOff: tARpudoData.dropOff,
      equipmentUsed: tARpudoData.equipmentUsed,
      updateDate: tARpudoData.updateDate,
    );
    return tARpudoModel;
  }

  @override
  Future<int> localARpudo(ARpudoModel arpudotoLocal) {
    return (sl<AppDatabase>().createARpudo(arpudotoLocal));
  }

  @override
  Future<void> updateARpudo(ARpudoModel arpudoUpdate, int id) async {
    sl<AppDatabase>().updateARpudo(arpudoUpdate, id);
  }

  @override
  Future<int> deleteARpudoById(int id) {
    return (sl<AppDatabase>().deleteARpudoById(id));
  }

  @override
  Future<List<ARpudoModel>> getARpudoTrNoID(int trNo) async {
    final tarpudo_data =
        await sl<AppDatabase>().getARpudoLocalDataWithtrNoID(trNo);

    List<ARpudoModel> tFPRcurrentMgmt_Model =
        List<ARpudoModel>.empty(growable: true);
    for (var listEle in tarpudo_data) {
      tFPRcurrentMgmt_Model.add(ARpudoModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        arRef: listEle.arRef,
        coilRef: listEle.coilRef,
        coilResistenace: listEle.coilResistenace,
        pickUp: listEle.pickUp,
        dropOff: listEle.dropOff,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tFPRcurrentMgmt_Model;
  }

  @override
  Future<List<ARpudoModel>> getARpudoSerialNo(String sNo) async {
    final tARpudo_data =
        await sl<AppDatabase>().getARpudoLocalDataWithSerialNo(sNo);

    List<ARpudoModel> tARpudo_Model = List<ARpudoModel>.empty(growable: true);
    for (var listEle in tARpudo_data) {
      tARpudo_Model.add(ARpudoModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        arRef: listEle.arRef,
        coilRef: listEle.coilRef,
        coilResistenace: listEle.coilResistenace,
        pickUp: listEle.pickUp,
        dropOff: listEle.dropOff,
        equipmentUsed: listEle.equipmentUsed,
      ));
    }
    return tARpudo_Model;
  }

  @override
  Future<List<ARpudoModel>> getARpudoEquipmentLists() async {
    final tARpudoData = await sl<AppDatabase>().getARpudoEquipmentListwithAll();
    List<ARpudoModel> tARpudoTestModel =
        List<ARpudoModel>.empty(growable: true);
    for (var listEle in tARpudoData) {
      tARpudoTestModel.add(ARpudoModel(
        id: listEle.id,
        databaseID: listEle.databaseID,
        trNo: listEle.trNo,
        arRef: listEle.arRef,
        coilRef: listEle.coilRef,
        coilResistenace: listEle.coilResistenace,
        pickUp: listEle.pickUp,
        dropOff: listEle.dropOff,
        equipmentUsed: listEle.equipmentUsed,
        updateDate: listEle.updateDate,
      ));
    }
    return tARpudoTestModel;
  }
}
