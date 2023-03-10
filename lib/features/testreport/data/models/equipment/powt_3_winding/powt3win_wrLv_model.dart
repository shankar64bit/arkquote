import '../../../../domain/entities/equipment/powt_3_winding/powt3win_wrLv.dart';

class Powt3winwrLvModel extends Powt3winwrLv {
  const Powt3winwrLvModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double lv_r_uv,
    final double lv_r_vw,
    final double lv_r_wu,
    final int tapPosition,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          tapPosition: tapPosition,
          lv_r_uv: lv_r_uv,
          lv_r_vw: lv_r_vw,
          lv_r_wu: lv_r_wu,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        lv_r_uv,
        lv_r_vw,
        lv_r_wu,
        tapPosition,
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
      'lv_r_uv': lv_r_uv,
      'lv_r_vw': lv_r_vw,
      'lv_r_wu': lv_r_wu,
      'tapPosition': tapPosition,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory Powt3winwrLvModel.fromJson(Map<String, dynamic> json) {
    return Powt3winwrLvModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      lv_r_uv: json['lv_r_uv'],
      lv_r_vw: json['lv_r_vw'],
      lv_r_wu: json['lv_r_wu'],
      tapPosition: json['tapPosition'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
