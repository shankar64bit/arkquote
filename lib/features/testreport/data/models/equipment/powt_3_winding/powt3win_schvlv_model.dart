import '../../../../domain/entities/equipment/powt_3_winding/powt3win_schvlv.dart';

class Powt3winschvlvModel extends Powt3winschvlv {
  const Powt3winschvlvModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final int tapPosition,
    final double hv_u,
    final double hv_v,
    final double hv_w,
    final double hv_n,
    final double lv_u,
    final double lv_v,
    final double lv_w,
    final double lv_n,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          tapPosition: tapPosition,
          hv_u: hv_u,
          hv_v: hv_v,
          hv_w: hv_w,
          hv_n: hv_n,
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
        tapPosition,
        hv_u,
        hv_v,
        hv_w,
        hv_n,
        lv_u,
        lv_v,
        lv_w,
        lv_n,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'databaseID': databaseID,
      'trNo': trNo,
      'serialNo': serialNo,
      'tapPosition': tapPosition,
      'hv_u': hv_u,
      'hv_v': hv_v,
      'hv_w': hv_w,
      'hv_n': hv_n,
      'lv_u': lv_u,
      'lv_v': lv_v,
      'lv_w': lv_w,
      'lv_n': lv_n,
    };
  }

  factory Powt3winschvlvModel.fromJson(Map<String, dynamic> json) {
    return Powt3winschvlvModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      tapPosition: json['tapPosition'],
      hv_u: json['hv_u'],
      hv_v: json['hv_v'],
      hv_w: json['hv_w'],
      hv_n: json['hv_n'],
      lv_u: json['lv_u'],
      lv_v: json['lv_v'],
      lv_w: json['lv_w'],
      lv_n: json['lv_n'],
    );
  }
}
