import '../../../../domain/entities/equipment/DG/dg_wr.dart';

class DgWrTestModel extends DgWrTest {
  const DgWrTestModel({
    final int id,
    final trNo,
    final databaseID,
    final String serialNo,
    final String EquipmentType,
    final DateTime lastUpdated,
    final double uv,
    final double vw,
    final double wu,
  }) : super(
          id: id,
          uv: uv,
          vw: vw,
          wu: wu,
          trNo: trNo,
          databaseID: databaseID,
          serialNo: serialNo,
          EquipmentType: EquipmentType,
          lastUpdated: lastUpdated,
        );

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uv': uv,
      'vw': vw,
      'wu': wu,
      'trNo': trNo,
      'databaseID': databaseID,
      'serialNo': serialNo,
      'equipmentUsed': EquipmentType,
      'updateDate': lastUpdated,
    };
  }

  factory DgWrTestModel.fromJson(Map<String, dynamic> json) {
    return DgWrTestModel(
      id: json['id'],
      uv: json['uv'],
      vw: json['vw'],
      wu: json['wu'],
      trNo: json['trNo'],
      databaseID: json['databaseID'],
      serialNo: json['serialNo'],
      EquipmentType: json['equipmentUsed'],
      lastUpdated: json['updateDate'],
    );
  }
}
