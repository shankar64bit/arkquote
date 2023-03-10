import '../../../../domain/entities/equipment/powt_3_winding/powt3win_mcLv.dart';

class Powt3win_mcLv_Model extends Powt3win_mcLv {
  const Powt3win_mcLv_Model({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double lv_u_vn,
    final double lv_v_wn,
    final double lv_w_un,
    final double lv_u,
    final double lv_v,
    final double lv_w,
    final double lv_n,
    final int tapPosition,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          tapPosition: tapPosition,
          lv_u_vn: lv_u_vn,
          lv_v_wn: lv_v_wn,
          lv_w_un: lv_w_un,
          lv_u: lv_u,
          lv_v: lv_v,
          lv_w: lv_w,
          lv_n: lv_n,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        lv_u_vn,
        lv_v_wn,
        lv_w_un,
        lv_u,
        lv_v,
        lv_w,
        lv_n,
        tapPosition,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'databaseID': databaseID,
      'trNo': trNo,
      'serialNo': serialNo,
      'lv_u_vn': lv_u_vn,
      'lv_v_wn': lv_v_wn,
      'lv_w_un': lv_w_un,
      'lv_u': lv_u,
      'lv_v': lv_v,
      'lv_w': lv_w,
      'lv_n': lv_n,
      'tapPosition': tapPosition,
    };
  }

  factory Powt3win_mcLv_Model.fromJson(Map<String, dynamic> json) {
    return Powt3win_mcLv_Model(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      lv_u_vn: json['lv_u_vn'],
      lv_v_wn: json['lv_v_wn'],
      lv_w_un: json['lv_w_un'],
      lv_u: json['lv_u'],
      lv_v: json['lv_v'],
      lv_w: json['lv_w'],
      lv_n: json['lv_n'],
      tapPosition: json['tapPosition'],
    );
  }
}
