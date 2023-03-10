import '../../../../domain/entities/equipment/SC/sc_c.dart';

class ScCTestModel extends ScCTest {
  const ScCTestModel({
    final int id,
    final trNo,
    final databaseID,
    final String serialNo,
    final String EquipmentType,
    final DateTime lastUpdated,
    final double rA,
    final double rB,
    final double yA,
    final double yB,
    final double bA,
    final double bB,
  }) : super(
          id: id,
          rA: rA,
          rB: rB,
          yA: yA,
          yB: yB,
          bA: bA,
          bB: bB,
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
      'rA': rA,
      'rB': rB,
      'yA': yA,
      'yB': yB,
      'bA': bA,
      'bB': bB,
      'trNo': trNo,
      'databaseID': databaseID,
      'serialNo': serialNo,
      'equipmentUsed': EquipmentType,
      'updateDate': lastUpdated,
    };
  }

  factory ScCTestModel.fromJson(Map<String, dynamic> json) {
    return ScCTestModel(
      id: json['id'],
      rA: json['rA'],
      rB: json['rB'],
      yA: json['yA'],
      yB: json['yB'],
      bA: json['bA'],
      bB: json['bB'],
      trNo: json['trNo'],
      databaseID: json['databaseID'],
      serialNo: json['serialNo'],
      EquipmentType: json['equipmentUsed'],
      lastUpdated: json['updateDate'],
    );
  }
}
