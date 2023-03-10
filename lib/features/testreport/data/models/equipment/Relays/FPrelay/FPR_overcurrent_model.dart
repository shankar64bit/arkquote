import '../../../../../domain/entities/equipment/Relays/FPrelay/FPR_overcurrent.dart';

class FPRovercurrentModel extends FPRovercurrent {
  const FPRovercurrentModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double CurrentSet,
    final double TMS,
    final double delay,
    final double rn_pickupCurrent,
    final double rn_relayOprTime_2x,
    final double rn_relayOprTime_5x,
    final double yn_pickupCurrent,
    final double yn_relayOprTime_2x,
    final double yn_relayOprTime_5x,
    final double bn_pickupCurrent,
    final double bn_relayOprTime_2x,
    final double bn_relayOprTime_5x,
    final int stageNo,
    final String curve,
    final String function,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          CurrentSet: CurrentSet,
          TMS: TMS,
          delay: delay,
          rn_pickupCurrent: rn_pickupCurrent,
          rn_relayOprTime_2x: rn_relayOprTime_2x,
          rn_relayOprTime_5x: rn_relayOprTime_5x,
          yn_pickupCurrent: yn_pickupCurrent,
          yn_relayOprTime_2x: yn_relayOprTime_2x,
          yn_relayOprTime_5x: yn_relayOprTime_5x,
          bn_pickupCurrent: bn_pickupCurrent,
          bn_relayOprTime_2x: bn_relayOprTime_2x,
          bn_relayOprTime_5x: bn_relayOprTime_5x,
          stageNo: stageNo,
          curve: curve,
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
        CurrentSet,
        TMS,
        delay,
        rn_pickupCurrent,
        rn_relayOprTime_2x,
        rn_relayOprTime_5x,
        yn_pickupCurrent,
        yn_relayOprTime_2x,
        yn_relayOprTime_5x,
        bn_pickupCurrent,
        bn_relayOprTime_2x,
        bn_relayOprTime_5x,
        stageNo,
        curve,
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
      'CurrentSet': CurrentSet,
      'TMS': TMS,
      'delay': delay,
      'rn_pickupCurrent': rn_pickupCurrent,
      'rn_relayOprTime_2x': rn_relayOprTime_2x,
      'rn_relayOprTime_5x': rn_relayOprTime_5x,
      'yn_pickupCurrent': yn_pickupCurrent,
      'yn_relayOprTime_2x': yn_relayOprTime_2x,
      'yn_relayOprTime_5x': yn_relayOprTime_5x,
      'bn_pickupCurrent': bn_pickupCurrent,
      'bn_relayOprTime_2x': bn_relayOprTime_2x,
      'bn_relayOprTime_5x': bn_relayOprTime_5x,
      'stageNo': stageNo,
      'curve': curve,
      'function': function,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory FPRovercurrentModel.fromJson(Map<String, dynamic> json) {
    return FPRovercurrentModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      CurrentSet: json['CurrentSet'],
      TMS: json['TMS'],
      delay: json['delay'],
      rn_pickupCurrent: json['rn_pickupCurrent'],
      rn_relayOprTime_2x: json['rn_relayOprTime_2x'],
      rn_relayOprTime_5x: json['rn_relayOprTime_5x'],
      yn_pickupCurrent: json['yn_pickupCurrent'],
      yn_relayOprTime_2x: json['yn_relayOprTime_2x'],
      yn_relayOprTime_5x: json['yn_relayOprTime_5x'],
      bn_pickupCurrent: json['bn_pickupCurrent'],
      bn_relayOprTime_2x: json['bn_relayOprTime_2x'],
      bn_relayOprTime_5x: json['bn_relayOprTime_5x'],
      stageNo: json['stageNo'],
      curve: json['curve'],
      function: json['function'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
