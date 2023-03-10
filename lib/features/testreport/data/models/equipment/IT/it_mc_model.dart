import '../../../../domain/entities/equipment/IT/it_mc.dart';

class ItMcTestModel extends ItMc {
  const ItMcTestModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final String equipmentUsed,
    final DateTime updateDate,
    final String tapPosition,
    final double uv,
    final double vw,
    final double wu,
    final double u,
    final double v,
    final double w,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
          tapPosition: tapPosition,
          uv: uv,
          vw: vw,
          wu: wu,
          u: u,
          v: v,
          w: w,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        tapPosition,
        uv,
        vw,
        wu,
        u,
        v,
        w,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'databaseID': databaseID,
      'trNo': trNo,
      'serialNo': serialNo,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
      'tapPosition': tapPosition,
      'uv': uv,
      'vw': vw,
      'wu': wu,
      'u': u,
      'v': v,
      'w': w,
    };
  }

  factory ItMcTestModel.fromJson(Map<String, dynamic> json) {
    return ItMcTestModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
      tapPosition: json['tapPosition'],
      uv: json['uv'],
      vw: json['vw'],
      wu: json['wu'],
      u: json['u'],
      v: json['v'],
      w: json['w'],
    );
  }
}
