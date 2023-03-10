import '../../../../domain/entities/equipment/powt/powt_mc.dart';

class Powt_mc_Model extends Powt_mc {
  const Powt_mc_Model({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double hv_1u_1n,
    final double hv_1v_1n,
    final double hv_1w_1n,
    final double hv_1u,
    final double hv_1v,
    final double hv_1w,
    final double hv_1n,
    final int tapPosition,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          tapPosition: tapPosition,
          hv_1u_1n: hv_1u_1n,
          hv_1v_1n: hv_1v_1n,
          hv_1w_1n: hv_1w_1n,
          hv_1u: hv_1u,
          hv_1v: hv_1v,
          hv_1w: hv_1w,
          hv_1n: hv_1n,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
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
        hv_1u,
        hv_1v,
        hv_1w,
        hv_1n,
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
      'hv_1u_1n': hv_1u_1n,
      'hv_1v_1n': hv_1v_1n,
      'hv_1w_1n': hv_1w_1n,
      'hv_1u': hv_1u,
      'hv_1v': hv_1v,
      'hv_1w': hv_1w,
      'hv_1n': hv_1n,
      'tapPosition': tapPosition,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory Powt_mc_Model.fromJson(Map<String, dynamic> json) {
    return Powt_mc_Model(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      hv_1u_1n: json['hv_1u_1n'],
      hv_1v_1n: json['hv_1v_1n'],
      hv_1w_1n: json['hv_1w_1n'],
      hv_1u: json['hv_1u'],
      hv_1v: json['hv_1v'],
      hv_1w: json['hv_1w'],
      hv_1n: json['hv_1n'],
      tapPosition: json['tapPosition'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
