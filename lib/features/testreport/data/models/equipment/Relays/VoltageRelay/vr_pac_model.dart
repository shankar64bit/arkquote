import '../../../../../domain/entities/equipment/Relays/VoltageRelay/vr_pac.dart';

class VrPacModel extends VrPac {
  const VrPacModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double plugSetting,
    final double TMS,
    final double plugSettingMul1,
    final double plugSettingMul2,
    final double coilResistanace,
    final double relayOprTime_1x,
    final double relayOprTime_3x,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          plugSetting: plugSetting,
          TMS: TMS,
          plugSettingMul1: plugSettingMul1,
          plugSettingMul2: plugSettingMul2,
          coilResistanace: coilResistanace,
          relayOprTime_1x: relayOprTime_1x,
          relayOprTime_3x: relayOprTime_3x,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        plugSetting,
        TMS,
        plugSettingMul1,
        plugSettingMul2,
        coilResistanace,
        relayOprTime_1x,
        relayOprTime_3x,
        equipmentUsed,
        updateDate,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'databaseID': databaseID,
      'trNo': trNo,
      'serialNo': serialNo,
      'plugSetting': plugSetting,
      'TMS': TMS,
      'plugSettingMul1': plugSettingMul1,
      'plugSettingMul2': plugSettingMul2,
      'coilResistanace': coilResistanace,
      'relayOprTime_1x': relayOprTime_1x,
      'relayOprTime_3x': relayOprTime_3x,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory VrPacModel.fromJson(Map<String, dynamic> json) {
    return VrPacModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      plugSetting: json['time'],
      TMS: json['TMS'],
      plugSettingMul1: json['plugSettingMul1'],
      plugSettingMul2: json['plugSettingMul2'],
      coilResistanace: json['coilResistenace'],
      relayOprTime_1x: json['relayOprTime_1x'],
      relayOprTime_3x: json['relayOprTime_3x'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
