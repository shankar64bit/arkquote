import '../../../../domain/entities/equipment/power_cable/pc_hv.dart';

class PcHvTestModel extends PcHvTest {
  const PcHvTestModel({
    final int id,
    final trNo,
    final databaseID,
    final int pcRefId,
    final String EquipmentType,
    final DateTime lastUpdated,
    final double rVoltage,
    final double rCurrent,
    final double yVoltage,
    final double yCurrent,
    final double bVoltage,
    final double bCurrent,
  }) : super(
          id: id,
          rVoltage: rVoltage,
          rCurrent: rCurrent,
          yVoltage: yVoltage,
          yCurrent: yCurrent,
          bVoltage: bVoltage,
          bCurrent: bCurrent,
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
      'rVoltage': rVoltage,
      'rCurrent': rCurrent,
      'yVoltage': yVoltage,
      'yCurrent': yCurrent,
      'bVoltage': bVoltage,
      'bCurrent': bCurrent,
      'trNo': trNo,
      'databaseID': databaseID,
      'pcRefId': pcRefId,
      'equipmentUsed': EquipmentType,
      'updateDate': lastUpdated,
    };
  }

  factory PcHvTestModel.fromJson(Map<String, dynamic> json) {
    return PcHvTestModel(
      id: json['id'],
      rVoltage: json['rVoltage'],
      rCurrent: json['rCurrent'],
      yVoltage: json['yVoltage'],
      yCurrent: json['yCurrent'],
      bVoltage: json['bVoltage'],
      bCurrent: json['bCurrent'],
      trNo: json['trNo'],
      databaseID: json['databaseID'],
      pcRefId: json['pcRefId'],
      EquipmentType: json['equipmentUsed'],
      lastUpdated: json['updateDate'],
    );
  }
}
