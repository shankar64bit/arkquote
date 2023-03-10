import 'package:flutter_testreports/features/testreport/domain/entities/equipment/EE/ee_test.dart';

class EETestModel extends eeTest {
  const EETestModel({
    final int id,
    final trNo,
    final databaseID,
    final int locNo,
    final String EquipmentType,
    final DateTime lastUpdated,
    final String eeName,
    final double resistanceValue,
  }) : super(
          id: id,
          eeName: eeName,
          resistanceValue: resistanceValue,
          trNo: trNo,
          databaseID: databaseID,
          locNo: locNo,
          EquipmentType: EquipmentType,
          lastUpdated: lastUpdated,
        );

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eeName': eeName,
      'resistanceValue': resistanceValue,
      'trNo': trNo,
      'databaseID': databaseID,
      'locNo': locNo,
      'equipmentUsed': EquipmentType,
      'updateDate': lastUpdated,
    };
  }

  factory EETestModel.fromJson(Map<String, dynamic> json) {
    return EETestModel(
      id: json['id'],
      eeName: json['eeName'],
      resistanceValue: json['resistanceValue'],
      trNo: json['trNo'],
      databaseID: json['databaseID'],
      locNo: json['locNo'],
      EquipmentType: json['equipmentUsed'],
      lastUpdated: json['updateDate'],
    );
  }
}
