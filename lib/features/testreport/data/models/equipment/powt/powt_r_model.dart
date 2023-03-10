import '../../../../domain/entities/equipment/powt/powt_r.dart';

class Powt_R_Model extends Powt_R {
  const Powt_R_Model({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double hv_1u_1v,
    final double hv_1v_1w,
    final double hv_1w_1u,
    final double hv_1u_1n,
    final double hv_1v_1n,
    final double hv_1w_1n,
    final double lv_2u_2v,
    final double lv_2v_2w,
    final double lv_2w_2u,
    final double lv_2u_2n,
    final double lv_2v_2n,
    final double lv_2w_2n,
    final int tapPosition,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          tapPosition: tapPosition,
          hv_1u_1v: hv_1u_1v,
          hv_1v_1w: hv_1v_1w,
          hv_1w_1u: hv_1w_1u,
          hv_1u_1n: hv_1u_1n,
          hv_1v_1n: hv_1v_1n,
          hv_1w_1n: hv_1w_1n,
          lv_2u_2v: lv_2u_2v,
          lv_2v_2w: lv_2v_2w,
          lv_2w_2u: lv_2w_2u,
          lv_2u_2n: lv_2u_2n,
          lv_2v_2n: lv_2v_2n,
          lv_2w_2n: lv_2w_2n,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        hv_1u_1v,
        hv_1v_1w,
        hv_1w_1u,
        hv_1u_1n,
        hv_1v_1n,
        hv_1w_1n,
        lv_2u_2v,
        lv_2v_2w,
        lv_2w_2u,
        lv_2u_2n,
        lv_2v_2n,
        lv_2w_2n,
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
      'hv_1u_1v': hv_1u_1v,
      'hv_1v_1w': hv_1v_1w,
      'hv_1w_1u': hv_1w_1u,
      'hv_1u_1n': hv_1u_1n,
      'hv_1v_1n': hv_1v_1n,
      'hv_1w_1n': hv_1w_1n,
      'lv_2u_2v': lv_2u_2v,
      'lv_2v_2w': lv_2v_2w,
      'lv_2w_2u': lv_2w_2u,
      'lv_2u_2n': lv_2u_2n,
      'lv_2v_2n': lv_2v_2n,
      'lv_2w_2n': lv_2w_2n,
      'tapPosition': tapPosition,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory Powt_R_Model.fromJson(Map<String, dynamic> json) {
    return Powt_R_Model(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      hv_1u_1v: json['hv_1u_1v'],
      hv_1v_1w: json['hv_1v_1w'],
      hv_1w_1u: json['hv_1w_1u'],
      hv_1u_1n: json['hv_1u_1n'],
      hv_1v_1n: json['hv_1v_1n'],
      hv_1w_1n: json['hv_1w_1n'],
      lv_2u_2v: json['lv_2u_2v'],
      lv_2v_2w: json['lv_2v_2w'],
      lv_2w_2u: json['lv_2w_2u'],
      lv_2u_2n: json['lv_2u_2n'],
      lv_2v_2n: json['lv_2v_2n'],
      lv_2w_2n: json['lv_2w_2n'],
      tapPosition: json['tapPosition'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
