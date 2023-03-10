import 'package:flutter_testreports/features/testreport/domain/entities/equipment/acb/acb_crm.dart';

class AcbCrmTestModel extends AcbCrm {
  const AcbCrmTestModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final String EquipmentType,
    final DateTime lastUpdated,
    final double rR,
    final double yY,
    final double bB,
    final double nN,
  }) : super(
          id: id,
          databaseID: databaseID,
          bB: bB,
          rR: rR,
          yY: yY,
          nN: nN,
          trNo: trNo,
          serialNo: serialNo,
          EquipmentType: EquipmentType,
          lastUpdated: lastUpdated,
        );
  @override
  List<Object> get props => [
        id,
        databaseID,
        bB,
        rR,
        yY,
        nN,
        trNo,
        serialNo,
        EquipmentType,
        lastUpdated,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'databaseId': databaseID,
      'bB': bB,
      'rR': rR,
      'yY': yY,
      'nN': nN,
      'trNo': trNo,
      'serialNo': serialNo,
      'equipmentUsed': EquipmentType,
      'updateDate': lastUpdated,
    };
  }

  factory AcbCrmTestModel.fromJson(Map<String, dynamic> json) {
    return AcbCrmTestModel(
      id: json['id'],
      databaseID: json['databaseID'],
      rR: json['rR'],
      bB: json['bB'],
      yY: json['yY'],
      nN: json['nN'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      EquipmentType: json['equipmentUsed'],
      lastUpdated: json['updateDate'],
    );
  }
}
