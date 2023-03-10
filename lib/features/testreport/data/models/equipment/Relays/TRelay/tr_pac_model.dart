import 'package:flutter_testreports/features/testreport/domain/entities/equipment/Relays/TRelay/tr_pac.dart';

class TrPacModel extends TrPac {
  const TrPacModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double time,
    final double coilResistenace,
    final double relayOprTime,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          time: time,
          coilResistenace: coilResistenace,
          relayOprTime: relayOprTime,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        time,
        coilResistenace,
        relayOprTime,
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
      'time': time,
      'coilResistenace': coilResistenace,
      'relayOprTime': relayOprTime,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory TrPacModel.fromJson(Map<String, dynamic> json) {
    return TrPacModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      time: json['time'],
      coilResistenace: json['coilResistenace'],
      relayOprTime: json['relayOprTime'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
