import '../../../../../domain/entities/equipment/Relays/FPrelay/FPR_voltageMgmt.dart';

class FPRvoltageMgmtModel extends FPRvoltageMgmt {
  const FPRvoltageMgmtModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double rn_applSecVoltage,
    final double rn_measurePrimVoltage,
    final double yn_applSecVoltage,
    final double yn_measurePrimVoltage,
    final double bn_applSecVoltage,
    final double bn_measurePrimVoltage,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          rn_applSecVoltage: rn_applSecVoltage,
          rn_measurePrimVoltage: rn_measurePrimVoltage,
          yn_applSecVoltage: yn_applSecVoltage,
          yn_measurePrimVoltage: yn_measurePrimVoltage,
          bn_applSecVoltage: bn_applSecVoltage,
          bn_measurePrimVoltage: bn_measurePrimVoltage,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        rn_applSecVoltage,
        rn_measurePrimVoltage,
        yn_applSecVoltage,
        yn_measurePrimVoltage,
        bn_applSecVoltage,
        bn_measurePrimVoltage,
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
      'rn_applSecVoltage': rn_applSecVoltage,
      'rn_measurePrimVoltage': rn_measurePrimVoltage,
      'yn_applSecVoltage': yn_applSecVoltage,
      'yn_measurePrimVoltage': yn_measurePrimVoltage,
      'bn_applSecVoltage': bn_applSecVoltage,
      'bn_measurePrimVoltage': bn_measurePrimVoltage,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory FPRvoltageMgmtModel.fromJson(Map<String, dynamic> json) {
    return FPRvoltageMgmtModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      rn_applSecVoltage: json['rn_applSecVoltage'],
      rn_measurePrimVoltage: json['rn_measurePrimVoltage'],
      yn_applSecVoltage: json['yn_applSecVoltage'],
      yn_measurePrimVoltage: json['yn_measurePrimVoltage'],
      bn_applSecVoltage: json['bn_applSecVoltage'],
      bn_measurePrimVoltage: json['bn_measurePrimVoltage'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
