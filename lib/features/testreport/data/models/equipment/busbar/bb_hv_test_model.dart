import '../../../../domain/entities/equipment/BusBar/pc_hv.dart';

class BbHvTestModel extends BbHvTest {
  const BbHvTestModel({
    final int id,
    final trNo,
    final databaseID,
    final int bbRefId,
    final String EquipmentType,
    final DateTime lastUpdated,
    final double r,
    final double y,
    final double b,
    final double n,
  }) : super(
          id: id,
          r: r,
          y: y,
          b: b,
          n: n,
          trNo: trNo,
          databaseID: databaseID,
          bbRefId: bbRefId,
          EquipmentType: EquipmentType,
          lastUpdated: lastUpdated,
        );

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'r': r,
      'y': y,
      'b': b,
      'n': n,
      'trNo': trNo,
      'databaseID': databaseID,
      'bbRefId': bbRefId,
      'equipmentUsed': EquipmentType,
      'updateDate': lastUpdated,
    };
  }

  factory BbHvTestModel.fromJson(Map<String, dynamic> json) {
    return BbHvTestModel(
      id: json['id'],
      r: json['r'],
      y: json['y'],
      b: json['b'],
      n: json['n'],
      trNo: json['trNo'],
      databaseID: json['databaseID'],
      bbRefId: json['bbRefId'],
      EquipmentType: json['equipmentUsed'],
      lastUpdated: json['updateDate'],
    );
  }
}
