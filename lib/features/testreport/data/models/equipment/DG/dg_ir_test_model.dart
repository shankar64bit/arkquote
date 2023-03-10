import '../../../../domain/entities/equipment/DG/dg_ir.dart';

class DgIrTestModel extends DgIrTest {
  const DgIrTestModel({
    final int id,
    final trNo,
    final databaseID,
    final String serialNo,
    final String EquipmentType,
    final DateTime lastUpdated,
    final double re_mResistance,
    final double ye_mResistance,
    final double be_mResistance,
  }) : super(
          id: id,
          re_mResistance: re_mResistance,
          ye_mResistance: ye_mResistance,
          be_mResistance: be_mResistance,
          trNo: trNo,
          databaseID: databaseID,
          serialNo: serialNo,
          EquipmentType: EquipmentType,
          lastUpdated: lastUpdated,
        );

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      're_mResistance': re_mResistance,
      'ye_mResistance': ye_mResistance,
      'be_mResistance': be_mResistance,
      'trNo': trNo,
      'databaseID': databaseID,
      'serialNo': serialNo,
      'equipmentUsed': EquipmentType,
      'updateDate': lastUpdated,
    };
  }

  factory DgIrTestModel.fromJson(Map<String, dynamic> json) {
    return DgIrTestModel(
      id: json['id'],
      re_mResistance: json['re_mResistance'],
      ye_mResistance: json['ye_mResistance'],
      be_mResistance: json['be_mResistance'],
      trNo: json['trNo'],
      databaseID: json['databaseID'],
      serialNo: json['serialNo'],
      EquipmentType: json['equipmentUsed'],
      lastUpdated: json['updateDate'],
    );
  }
}
