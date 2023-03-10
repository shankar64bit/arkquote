import '../../../../domain/entities/equipment/LA/la_ir.dart';

class LaIrTestModel extends LaIrTest {
  const LaIrTestModel({
    final int id,
    final trNo,
    final databaseID,
    final String serialNo,
    final String EquipmentType,
    final DateTime lastUpdated,
    final double seR,
    final double seY,
    final double seB,
    final double ssR,
    final double ssY,
    final double ssB,
  }) : super(
          id: id,
          seR: seR,
          seY: seY,
          seB: seB,
          ssR: ssR,
          ssY: ssY,
          ssB: ssB,
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
      'seR': seR,
      'seY': seY,
      'seB': seB,
      'ssR': ssR,
      'ssY': ssY,
      'ssB': ssB,
      'trNo': trNo,
      'databaseID': databaseID,
      'serialNo': serialNo,
      'equipmentUsed': EquipmentType,
      'updateDate': lastUpdated,
    };
  }

  factory LaIrTestModel.fromJson(Map<String, dynamic> json) {
    return LaIrTestModel(
      id: json['id'],
      seR: json['seR'],
      seY: json['seY'],
      seB: json['seB'],
      ssR: json['ssR'],
      ssY: json['ssY'],
      ssB: json['ssB'],
      trNo: json['trNo'],
      databaseID: json['databaseID'],
      serialNo: json['serialNo'],
      EquipmentType: json['equipmentUsed'],
      lastUpdated: json['updateDate'],
    );
  }
}
