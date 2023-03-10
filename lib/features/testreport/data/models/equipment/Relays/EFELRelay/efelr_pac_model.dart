import '../../../../../domain/entities/equipment/Relays/EFELRelay/efelr_pac.dart';

class EfElrPacModel extends EfElrPac {
  const EfElrPacModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double plugSetting,
    final double TMS,
    final double plugSetting_Hi,
    final double time,
    final double plugSettingMul_2x,
    final double plugSettingMul_5x,
    final double coilResistanace,
    final double pickupCurrent,
    final double relayOprTime_2x,
    final double relayOprTime_5x,
    final double relayOprTime_Hi,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          plugSetting: plugSetting,
          TMS: TMS,
          plugSetting_Hi: plugSetting_Hi,
          time: time,
          plugSettingMul_2x: plugSettingMul_2x,
          plugSettingMul_5x: plugSettingMul_5x,
          coilResistanace: coilResistanace,
          pickupCurrent: pickupCurrent,
          relayOprTime_2x: relayOprTime_2x,
          relayOprTime_5x: relayOprTime_5x,
          relayOprTime_Hi: relayOprTime_Hi,
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
        plugSetting_Hi,
        time,
        plugSettingMul_2x,
        plugSettingMul_5x,
        coilResistanace,
        pickupCurrent,
        relayOprTime_Hi,
        relayOprTime_2x,
        relayOprTime_5x,
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
      'plugSetting_Hi': plugSetting_Hi,
      'time': time,
      'plugSettingMul_2x': plugSettingMul_2x,
      'plugSettingMul_5x': plugSettingMul_5x,
      'coilResistanace': coilResistanace,
      'pickupCurrent': pickupCurrent,
      'relayOprTime_2x': relayOprTime_2x,
      'relayOprTime_5x': relayOprTime_5x,
      'relayOprTime_Hi': relayOprTime_Hi,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory EfElrPacModel.fromJson(Map<String, dynamic> json) {
    return EfElrPacModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      plugSetting: json['time'],
      TMS: json['TMS'],
      plugSetting_Hi: json['plugSetting_Hi'],
      time: json['time'],
      plugSettingMul_2x: json['plugSettingMul_2x'],
      plugSettingMul_5x: json['plugSettingMul_5x'],
      coilResistanace: json['coilResistenace'],
      pickupCurrent: json['pickupCurrent'],
      relayOprTime_2x: json['relayOprTime_2x'],
      relayOprTime_5x: json['relayOprTime_5x'],
      relayOprTime_Hi: json['relayOprTime_Hi'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
