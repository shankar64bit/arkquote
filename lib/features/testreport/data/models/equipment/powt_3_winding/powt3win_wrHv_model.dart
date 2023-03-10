import '../../../../domain/entities/equipment/powt_3_winding/powt3win_wrHv.dart';

class Powt3winwrHvModel extends Powt3winwrHv {
  const Powt3winwrHvModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double hv_r_1u_1n,
    final double hv_r_1v_1n,
    final double hv_r_1w_1n,
    final int tapPosition,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          hv_r_1u_1n: hv_r_1u_1n,
          hv_r_1v_1n: hv_r_1v_1n,
          hv_r_1w_1n: hv_r_1w_1n,
          tapPosition: tapPosition,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        hv_r_1u_1n,
        hv_r_1v_1n,
        hv_r_1w_1n,
        tapPosition,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'trNo': trNo,
      'serialNo': serialNo,
      'hv_r_1u_1n': hv_r_1u_1n,
      'hv_r_1v_1n': hv_r_1v_1n,
      'hv_r_1w_1n': hv_r_1w_1n,
      'tapPosition': tapPosition,
      'id': id,
      'databaseID': databaseID,
    };
  }

  factory Powt3winwrHvModel.fromJson(Map<String, dynamic> json) {
    return Powt3winwrHvModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      hv_r_1u_1n: json['hv_r_1u_1n'],
      hv_r_1v_1n: json['hv_r_1v_1n'],
      hv_r_1w_1n: json['hv_r_1w_1n'],
      tapPosition: json['tapPosition'],
    );
  }
}
