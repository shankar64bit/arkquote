import '../../../../domain/entities/equipment/isolator/iso_ir.dart';

class IsoIrTestModel extends IsoIrTest {
  const IsoIrTestModel({
    final int id,
    final trNo,
    final databaseID,
    final String serialNo,
    final String EquipmentType,
    final DateTime lastUpdated,
    final double rr,
    final double yy,
    final double bb,
    final double re,
    final double ye,
    final double be,
    final double ry,
    final double yb,
    final double br,
  }) : super(
          id: id,
          rr: rr,
          yy: yy,
          bb: bb,
          re: re,
          ye: ye,
          be: be,
          ry: ry,
          yb: yb,
          br: br,
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
      'rr': rr,
      'yy': yy,
      'bb': bb,
      're': re,
      'ye': ye,
      'be': be,
      'ry': ry,
      'yb': yb,
      'br': br,
      'trNo': trNo,
      'databaseID': databaseID,
      'serialNo': serialNo,
      'equipmentUsed': EquipmentType,
      'updateDate': lastUpdated,
    };
  }

  factory IsoIrTestModel.fromJson(Map<String, dynamic> json) {
    return IsoIrTestModel(
      id: json['id'],
      rr: json['rr'],
      re: json['re'],
      ry: json['ry'],
      yy: json['yy'],
      yb: json['yb'],
      ye: json['ye'],
      be: json['be'],
      br: json['br'],
      bb: json['bb'],
      trNo: json['trNo'],
      databaseID: json['databaseID'],
      serialNo: json['serialNo'],
      EquipmentType: json['equipmentUsed'],
      lastUpdated: json['updateDate'],
    );
  }
}
