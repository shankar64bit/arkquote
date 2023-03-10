import '../../../../domain/entities/equipment/power_cable/pc_ir.dart';

class PcIrTestModel extends PcIrTest {
  const PcIrTestModel({
    final int id,
    final trNo,
    final databaseID,
    final int pcRefId,
    final String EquipmentType,
    final DateTime lastUpdated,
    final double rA,
    final double rB,
    final double yA,
    final double yB,
    final double bA,
    final double bB,
    final double ryA,
    final double ryB,
    final double ybA,
    final double ybB,
    final double brA,
    final double brB,
  }) : super(
          id: id,
          rA: rA,
          rB: rB,
          yA: yA,
          yB: yB,
          bA: bA,
          bB: bB,
          ryA: ryA,
          ryB: ryB,
          ybA: ybA,
          ybB: ybB,
          brA: brA,
          brB: brB,
          trNo: trNo,
          databaseID: databaseID,
          pcRefId: pcRefId,
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
      'ryA': ryA,
      'ryB': ryB,
      'ybA': ybA,
      'ybB': ybB,
      'brA': brA,
      'brB': brB,
      'trNo': trNo,
      'databaseID': databaseID,
      'pcRefId': pcRefId,
      'equipmentUsed': EquipmentType,
      'updateDate': lastUpdated,
    };
  }

  factory PcIrTestModel.fromJson(Map<String, dynamic> json) {
    return PcIrTestModel(
      id: json['id'],
      rA: json['rA'],
      rB: json['rB'],
      yA: json['yA'],
      yB: json['yB'],
      bA: json['bA'],
      bB: json['bB'],
      ryA: json['ryA'],
      ryB: json['ryB'],
      ybA: json['ybA'],
      ybB: json['ybB'],
      brA: json['brA'],
      brB: json['brB'],
      trNo: json['trNo'],
      databaseID: json['databaseID'],
      pcRefId: json['pcRefId'],
      EquipmentType: json['equipmentUsed'],
      lastUpdated: json['updateDate'],
    );
  }
}
