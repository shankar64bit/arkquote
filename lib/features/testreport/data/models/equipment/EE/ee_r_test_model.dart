import '../../../../domain/entities/equipment/EE/ee_rtest.dart';

class EERTestModel extends eeRTest {
  const EERTestModel({
    final int id,
    final trNo,
    final databaseID,
    final int locNo,
    final String EquipmentType,
    final DateTime lastUpdated,
    final String eeName,
    final double resistanceValue_BR,
    final double resistanceValue_AR,
  }) : super(
          id: id,
          eeName: eeName,
          resistanceValue_BR: resistanceValue_BR,
          resistanceValue_AR: resistanceValue_AR,
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
      'resistanceValue_BR': resistanceValue_BR,
      'resistanceValue_AR': resistanceValue_AR,
      'trNo': trNo,
      'databaseID': databaseID,
      'locNo': locNo,
      'equipmentUsed': EquipmentType,
      'updateDate': lastUpdated,
    };
  }

  factory EERTestModel.fromJson(Map<String, dynamic> json) {
    return EERTestModel(
      id: json['id'],
      eeName: json['eeName'],
      resistanceValue_BR: json['resistanceValue_BR'],
      resistanceValue_AR: json['resistanceValue_AR'],
      trNo: json['trNo'],
      databaseID: json['databaseID'],
      locNo: json['locNo'],
      EquipmentType: json['equipmentUsed'],
      lastUpdated: json['updateDate'],
    );
  }
}
