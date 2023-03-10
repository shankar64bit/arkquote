import '../../../../domain/entities/equipment/powt/powt_wrHv.dart';

class PowtwrHvModel extends PowtwrHv {
  const PowtwrHvModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double hv_r_1u_1vn,
    final double hv_r_1v_1wn,
    final double hv_r_1w_1un,
    final int tapPosition,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          hv_r_1u_1vn: hv_r_1u_1vn,
          hv_r_1v_1wn: hv_r_1v_1wn,
          hv_r_1w_1un: hv_r_1w_1un,
          tapPosition: tapPosition,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        hv_r_1u_1vn,
        hv_r_1v_1wn,
        hv_r_1w_1un,
        tapPosition,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'trNo': trNo,
      'serialNo': serialNo,
      'hv_r_1u_1vn': hv_r_1u_1vn,
      'hv_r_1v_1wn': hv_r_1v_1wn,
      'hv_r_1w_1un': hv_r_1w_1un,
      'tapPosition': tapPosition,
      'id': id,
      'databaseID': databaseID,
    };
  }

  factory PowtwrHvModel.fromJson(Map<String, dynamic> json) {
    return PowtwrHvModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      hv_r_1u_1vn: json['hv_r_1u_1vn'],
      hv_r_1v_1wn: json['hv_r_1v_1wn'],
      hv_r_1w_1un: json['hv_r_1w_1un'],
      tapPosition: json['tapPosition'],
    );
  }
}
