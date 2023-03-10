import '../../../../../domain/entities/equipment/Relays/FPrelay/FPR_earthfault.dart';

class FPRearthfaultModel extends FPRearthfault {
  const FPRearthfaultModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double currentSet,
    final double TMS,
    final double delay,
    final double pickupCurrent,
    final double relayOprTime_2x,
    final double relayOprTime_5x,
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
          currentSet: currentSet,
          TMS: TMS,
          delay: delay,
          pickupCurrent: pickupCurrent,
          relayOprTime_2x: relayOprTime_2x,
          relayOprTime_5x: relayOprTime_5x,
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
        currentSet,
        TMS,
        delay,
        pickupCurrent,
        relayOprTime_2x,
        relayOprTime_5x,
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
      'currentSet': currentSet,
      'TMS': TMS,
      'delay': delay,
      'pickupCurrent': pickupCurrent,
      'relayOprTime_2x': relayOprTime_2x,
      'relayOprTime_5x': relayOprTime_5x,
      'stageNo': stageNo,
      'curve': curve,
      'function': function,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory FPRearthfaultModel.fromJson(Map<String, dynamic> json) {
    return FPRearthfaultModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      currentSet: json['currentSet'],
      TMS: json['TMS'],
      delay: json['delay'],
      pickupCurrent: json['pickupCurrent'],
      relayOprTime_2x: json['relayOprTime_2x'],
      relayOprTime_5x: json['relayOprTime_5x'],
      stageNo: json['stageNo'],
      curve: json['curve'],
      function: json['function'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
