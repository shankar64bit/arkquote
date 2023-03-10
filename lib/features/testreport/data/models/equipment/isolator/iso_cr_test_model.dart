import '../../../../domain/entities/equipment/isolator/iso_cr.dart';

class IsoCrTestModel extends IsoCrTest {
  const IsoCrTestModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final String EquipmentType,
    final DateTime lastUpdated,
    final double rr,
    final double yy,
    final double bb,
  }) : super(
          id: id,
          databaseID: databaseID,
          rr: rr,
          yy: yy,
          bb: bb,
          trNo: trNo,
          serialNo: serialNo,
          EquipmentType: EquipmentType,
          lastUpdated: lastUpdated,
        );
  @override
  List<Object> get props => [
        id,
        databaseID,
        rr,
        yy,
        bb,
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
      'rr': rr,
      'yy': yy,
      'bb': bb,
      'trNo': trNo,
      'serialNo': serialNo,
      'equipmentUsed': EquipmentType,
      'updateDate': lastUpdated,
    };
  }

  factory IsoCrTestModel.fromJson(Map<String, dynamic> json) {
    return IsoCrTestModel(
      id: json['id'],
      databaseID: json['databaseID'],
      rr: json['rR'],
      bb: json['bB'],
      yy: json['yY'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      EquipmentType: json['equipmentUsed'],
      lastUpdated: json['updateDate'],
    );
  }
}
