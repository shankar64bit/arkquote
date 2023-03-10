import '../../../../domain/entities/equipment/AT/AT_wrHv.dart';

class ATwrHv_Model extends AT_wrHv {
  const ATwrHv_Model({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double hv_1u_1n,
    final double hv_1v_1n,
    final double hv_1w_1n,
    final int tapPosition,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          hv_1u_1n: hv_1u_1n,
          hv_1v_1n: hv_1v_1n,
          hv_1w_1n: hv_1w_1n,
          tapPosition: tapPosition,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        hv_1u_1n,
        hv_1v_1n,
        hv_1w_1n,
        tapPosition,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'trNo': trNo,
      'serialNo': serialNo,
      'hv_1u_1n': hv_1u_1n,
      'hv_1v_1n': hv_1v_1n,
      'hv_1w_1n': hv_1w_1n,
      'tapPosition': tapPosition,
      'id': id,
      'databaseID': databaseID,
    };
  }

  factory ATwrHv_Model.fromJson(Map<String, dynamic> json) {
    return ATwrHv_Model(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      hv_1u_1n: json['hv_1u_1n'],
      hv_1v_1n: json['hv_1v_1n'],
      hv_1w_1n: json['hv_1w_1n'],
      tapPosition: json['tapPosition'],
    );
  }
}
