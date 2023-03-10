import '../../../../domain/entities/equipment/powt/powt_wrLv.dart';

class PowtwrLvModel extends PowtwrLv {
  const PowtwrLvModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double lv_r_2u_2vn,
    final double lv_r_2v_2wn,
    final double lv_r_2w_2un,
    final int tapPosition,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          tapPosition: tapPosition,
          lv_r_2u_2vn: lv_r_2u_2vn,
          lv_r_2v_2wn: lv_r_2v_2wn,
          lv_r_2w_2un: lv_r_2w_2un,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        lv_r_2u_2vn,
        lv_r_2v_2wn,
        lv_r_2w_2un,
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
      'lv_r_2u_2vn': lv_r_2u_2vn,
      'lv_r_2v_2wn': lv_r_2v_2wn,
      'lv_r_2w_2un': lv_r_2w_2un,
      'tapPosition': tapPosition,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory PowtwrLvModel.fromJson(Map<String, dynamic> json) {
    return PowtwrLvModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      lv_r_2u_2vn: json['lv_r_2u_2vn'],
      lv_r_2v_2wn: json['lv_r_2v_2wn'],
      lv_r_2w_2un: json['lv_r_2w_2un'],
      tapPosition: json['tapPosition'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
