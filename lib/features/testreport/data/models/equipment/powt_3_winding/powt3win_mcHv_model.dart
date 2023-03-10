import '../../../../domain/entities/equipment/powt_3_winding/powt3win_mcHv.dart';

class Powt3win_mcHv_Model extends Powt3win_mcHv {
  const Powt3win_mcHv_Model({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double hv_1u_1vn,
    final double hv_1v_1wn,
    final double hv_1w_1un,
    final double hv_1u,
    final double hv_1v,
    final double hv_1w,
    final double hv_1n,
    final int tapPosition,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          tapPosition: tapPosition,
          hv_1u_1vn: hv_1u_1vn,
          hv_1v_1wn: hv_1v_1wn,
          hv_1w_1un: hv_1w_1un,
          hv_1u: hv_1u,
          hv_1v: hv_1v,
          hv_1w: hv_1w,
          hv_1n: hv_1n,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        hv_1u_1vn,
        hv_1v_1wn,
        hv_1w_1un,
        hv_1u,
        hv_1v,
        hv_1w,
        hv_1n,
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
      'hv_1u_1vn': hv_1u_1vn,
      'hv_1v_1wn': hv_1v_1wn,
      'hv_1w_1un': hv_1w_1un,
      'hv_1u': hv_1u,
      'hv_1v': hv_1v,
      'hv_1w': hv_1w,
      'hv_1n': hv_1n,
      'tapPosition': tapPosition,
    };
  }

  factory Powt3win_mcHv_Model.fromJson(Map<String, dynamic> json) {
    return Powt3win_mcHv_Model(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      hv_1u_1vn: json['hv_1u_1vn'],
      hv_1v_1wn: json['hv_1v_1wn'],
      hv_1w_1un: json['hv_1w_1un'],
      hv_1u: json['hv_1u'],
      hv_1v: json['hv_1v'],
      hv_1w: json['hv_1w'],
      hv_1n: json['hv_1n'],
      tapPosition: json['tapPosition'],
    );
  }
}
