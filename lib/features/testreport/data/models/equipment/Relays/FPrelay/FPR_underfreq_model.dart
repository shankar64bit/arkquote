import '../../../../../domain/entities/equipment/Relays/FPrelay/FPR_underfreq.dart';

class FPRunderfreqModel extends FPRunderfreq {
  const FPRunderfreqModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double frequencySet,
    final double delay,
    final double rn_relayOprTime,
    final double yn_relayOprTime,
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
          frequencySet: frequencySet,
          delay: delay,
          rn_relayOprTime: rn_relayOprTime,
          yn_relayOprTime: yn_relayOprTime,
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
        frequencySet,
        delay,
        rn_relayOprTime,
        yn_relayOprTime,
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
      'frequencySet': frequencySet,
      'delay': delay,
      'rn_relayOprTime': rn_relayOprTime,
      'yn_relayOprTime': yn_relayOprTime,
      'bn_relayOprTime': bn_relayOprTime,
      'stageNo': stageNo,
      'function': function,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory FPRunderfreqModel.fromJson(Map<String, dynamic> json) {
    return FPRunderfreqModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      frequencySet: json['frequencySet'],
      delay: json['delay'],
      rn_relayOprTime: json['rn_relayOprTime'],
      yn_relayOprTime: json['yn_relayOprTime'],
      bn_relayOprTime: json['bn_relayOprTime'],
      stageNo: json['stageNo'],
      function: json['function'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
