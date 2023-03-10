import '../../../../domain/entities/equipment/powt/powt_sc.dart';

class PowtscModel extends Powtsc {
  const PowtscModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double hv_1u,
    final double hv_1v,
    final double hv_1w,
    final double hv_1n,
    final double lv_2u,
    final double lv_2v,
    final double lv_2w,
    final double lv_2n,
    final int tapPosition,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          tapPosition: tapPosition,
          hv_1u: hv_1u,
          hv_1v: hv_1v,
          hv_1w: hv_1w,
          hv_1n: hv_1n,
          lv_2u: lv_2u,
          lv_2v: lv_2v,
          lv_2w: lv_2w,
          lv_2n: lv_2n,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        hv_1u,
        hv_1v,
        hv_1w,
        hv_1n,
        lv_2u,
        lv_2v,
        lv_2w,
        lv_2n,
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
      'hv_1u': hv_1u,
      'hv_1v': hv_1v,
      'hv_1w': hv_1w,
      'hv_1n': hv_1n,
      'lv_2u': lv_2u,
      'lv_2v': lv_2v,
      'lv_2w': lv_2w,
      'lv_2n': lv_2n,
      'tapPosition': tapPosition,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory PowtscModel.fromJson(Map<String, dynamic> json) {
    return PowtscModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      hv_1u: json['hv_1u'],
      hv_1v: json['hv_1v'],
      hv_1w: json['hv_1w'],
      hv_1n: json['hv_1n'],
      lv_2u: json['lv_2u'],
      lv_2v: json['lv_2v'],
      lv_2w: json['lv_2w'],
      lv_2n: json['lv_2n'],
      tapPosition: json['tapPosition'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
