import '../../../../../domain/entities/equipment/Relays/FPrelay/FPR_currentMgmt.dart';

class FPRcurrentMgmtModel extends FPRcurrentMgmt {
  const FPRcurrentMgmtModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double rn_measurePrimCurrent,
    final double yn_measurePrimCurrent,
    final double bn_measurePrimCurrent,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          rn_measurePrimCurrent: rn_measurePrimCurrent,
          yn_measurePrimCurrent: yn_measurePrimCurrent,
          bn_measurePrimCurrent: bn_measurePrimCurrent,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        rn_measurePrimCurrent,
        yn_measurePrimCurrent,
        bn_measurePrimCurrent,
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
      'rn_measurePrimCurrent': rn_measurePrimCurrent,
      'yn_measurePrimCurrent': yn_measurePrimCurrent,
      'bn_measurePrimCurrent': bn_measurePrimCurrent,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory FPRcurrentMgmtModel.fromJson(Map<String, dynamic> json) {
    return FPRcurrentMgmtModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      rn_measurePrimCurrent: json['rn_measurePrimCurrent'],
      yn_measurePrimCurrent: json['yn_measurePrimCurrent'],
      bn_measurePrimCurrent: json['bn_measurePrimCurrent'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
