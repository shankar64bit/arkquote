import '../../../../../domain/entities/equipment/Relays/FPrelay/FPR_undervoltage.dart';

class FPRundervoltageModel extends FPRundervoltage {
  const FPRundervoltageModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double voltageSet,
    final double delay,
    final double rn_secVoltageSet,
    final double rn_appliedSecVoltage,
    final double rn_relayOprTime,
    final double yn_secVoltageSet,
    final double yn_appliedSecVoltage,
    final double yn_relayOprTime,
    final double bn_secVoltageSet,
    final double bn_appliedSecVoltage,
    final double bn_relayOprTime,
    final int stageNo,
    final String function,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          voltageSet: voltageSet,
          delay: delay,
          rn_secVoltageSet: rn_secVoltageSet,
          rn_appliedSecVoltage: rn_appliedSecVoltage,
          rn_relayOprTime: rn_relayOprTime,
          yn_secVoltageSet: yn_secVoltageSet,
          yn_appliedSecVoltage: yn_appliedSecVoltage,
          yn_relayOprTime: yn_relayOprTime,
          bn_secVoltageSet: bn_secVoltageSet,
          bn_appliedSecVoltage: bn_appliedSecVoltage,
          bn_relayOprTime: bn_relayOprTime,
          stageNo: stageNo,
          function: function,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        voltageSet,
        delay,
        rn_secVoltageSet,
        rn_appliedSecVoltage,
        rn_relayOprTime,
        yn_secVoltageSet,
        yn_appliedSecVoltage,
        yn_relayOprTime,
        bn_secVoltageSet,
        bn_appliedSecVoltage,
        bn_relayOprTime,
        stageNo,
        function,
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
      'voltageSet': voltageSet,
      'delay': delay,
      'rn_secVoltageSet': rn_secVoltageSet,
      'rn_appliedSecVoltage': rn_appliedSecVoltage,
      'rn_relayOprTime': rn_relayOprTime,
      'yn_secVoltageSet': yn_secVoltageSet,
      'yn_appliedSecVoltage': yn_appliedSecVoltage,
      'yn_relayOprTime': yn_relayOprTime,
      'bn_secVoltageSet': bn_secVoltageSet,
      'bn_appliedSecVoltage': bn_appliedSecVoltage,
      'bn_relayOprTime': bn_relayOprTime,
      'stageNo': stageNo,
      'function': function,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory FPRundervoltageModel.fromJson(Map<String, dynamic> json) {
    return FPRundervoltageModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      voltageSet: json['voltageSet'],
      delay: json['delay'],
      rn_secVoltageSet: json['rn_secVoltageSet'],
      rn_appliedSecVoltage: json['rn_appliedSecVoltage'],
      rn_relayOprTime: json['rn_relayOprTime'],
      yn_secVoltageSet: json['yn_secVoltageSet'],
      yn_appliedSecVoltage: json['yn_appliedSecVoltage'],
      yn_relayOprTime: json['yn_relayOprTime'],
      bn_secVoltageSet: json['bn_secVoltageSet'],
      bn_appliedSecVoltage: json['bn_appliedSecVoltage'],
      bn_relayOprTime: json['bn_relayOprTime'],
      stageNo: json['stageNo'],
      function: json['function'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
