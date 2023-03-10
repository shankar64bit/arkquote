import 'package:drift/drift.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import '../../../../injection_container.dart';
import '../models/inventory_model.dart';

abstract class InventoryLocalDatasource {
  // Future<int> deleteInventoryById(int id);

  Future<InventoryModel> getInventoryById(String barcode);
  Future<List<InventoryModel>> getEquipmentLocalDataList();
  Future<void> localInventory(InventoryModel inventoryToLocal);
}

@DataClassName('InventoryLocalData')
class InventorytocalDatasourceImpl extends Table
    implements InventoryLocalDatasource {
  @required
  DateTimeColumn get lastUpdated =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Set<Column> get primaryKey => {barcode};
  @required
  TextColumn get barcode => text().withLength(min: 1, max: 50)();
  @required
  // ignore: non_constant_identifier_names
  TextColumn get SpecialKit => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get serialNo => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get type => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get make => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get model => text().withLength(min: 1, max: 50)();

  @required
  DateTimeColumn get dateOfTesting =>
      dateTime().withDefault(Constant(DateTime.now()))();
  @required
  DateTimeColumn get dueDateOfTesting =>
      dateTime().withDefault(Constant(DateTime.now()))();

//////////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<InventoryModel> getInventoryById(String barcode) async {
    InventoryLocalData tInventoryData =
        await sl<AppDatabase>().getInventoryLocaldataWithId(barcode);

    InventoryModel tInventoryModel = InventoryModel(
      barcode: tInventoryData.barcode,
      type: tInventoryData.type,
      make: tInventoryData.make,
      model: tInventoryData.model,
      serialNo: tInventoryData.serialNo,
      SpecialKit: tInventoryData.SpecialKit,
      dateOfTesting: tInventoryData.dateOfTesting,
      dueDateOfTesting: tInventoryData.dueDateOfTesting,
      lastUpdated: tInventoryData.lastUpdated,
    );
    return tInventoryModel;
  }

  @override
  Future<List<InventoryModel>> getEquipmentLocalDataList() async {
    final tInventoryDataList =
        await sl<AppDatabase>().getEquipmentLocalDataList();
    List<InventoryModel> tInventoryListModel =
        List<InventoryModel>.empty(growable: true);

    for (var listelement in tInventoryDataList) {
      tInventoryListModel.add(InventoryModel(
        barcode: listelement.barcode,
        type: listelement.type,
        serialNo: listelement.serialNo,
        model: listelement.model,
        dateOfTesting: listelement.dateOfTesting,
        dueDateOfTesting: listelement.dueDateOfTesting,
        make: listelement.make,
        SpecialKit: listelement.SpecialKit,
        lastUpdated: listelement.lastUpdated,
      ));
    }
    return tInventoryListModel;
  }

  @override
  Future<int> localInventory(InventoryModel inventoryToLocal) {
    return (sl<AppDatabase>().createInventory(inventoryToLocal));
  }

  // @override
  // Future<int> deleteInventoryById(int id) {
  //   return (sl<AppDatabase>().deleteInventoryById(id));
  // }
}
