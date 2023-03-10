import 'package:flutter_testreports/features/testreport/domain/entities/equipment/acb/acb_cr.dart';

class AcbCRTestModel extends AcbCR {
  const AcbCRTestModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final DateTime lastUpdated,
    final double motorCoil,
    final double closeCoil,
    final double tripCoil,
    final String EquipmentType,
  }) : super(
          id: id,
          databaseID: databaseID,
          trNo: trNo,
          closeCoil: closeCoil,
          motorCoil: motorCoil,
          tripCoil: tripCoil,
          serialNo: serialNo,
          lastUpdated: lastUpdated,
          EquipmentType: EquipmentType,
        );
  @override
  List<Object> get props => [
        id,
        databaseID,
        closeCoil,
        tripCoil,
        motorCoil,
        trNo,
        serialNo,
        lastUpdated,
        EquipmentType,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'databaseId': databaseID,
      'closeCoile': closeCoil,
      'motorCoil': motorCoil,
      'tripCoil': tripCoil,
      'trNo': trNo,
      'serialNo': serialNo,
      'updateDate': lastUpdated,
      'equipmentUsed': EquipmentType,
    };
  }

  factory AcbCRTestModel.fromJson(Map<String, dynamic> json) {
    return AcbCRTestModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      closeCoil: json['closeCoil'],
      motorCoil: json['motorCoil'],
      tripCoil: json['tripCoil'],
      serialNo: json['serialNo'],
      lastUpdated: json['updateDate'],
      EquipmentType: json['equipmentUsed'],
    );
  }
}
