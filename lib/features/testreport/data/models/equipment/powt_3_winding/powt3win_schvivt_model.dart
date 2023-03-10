import '../../../../domain/entities/equipment/powt_3_winding/powt3win_schvivt.dart';

class Powt3winschvivtModel extends Powt3winschvivt {
  const Powt3winschvivtModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double hv_u,
    final double hv_v,
    final double hv_w,
    final double hv_n,
    final double ivt_u,
    final double ivt_v,
    final double ivt_w,
    final double ivt_n,
    final int tapPosition,
    final String equipmentUsed,
    final DateTime updateDate,
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
          ivt_u: ivt_u,
          ivt_v: ivt_v,
          ivt_w: ivt_w,
          ivt_n: ivt_n,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        hv_u,
        hv_v,
        hv_w,
        hv_n,
        ivt_u,
        ivt_v,
        ivt_w,
        ivt_n,
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
      'hv_u': hv_u,
      'hv_v': hv_v,
      'hv_w': hv_w,
      'hv_n': hv_n,
      'ivt_u': ivt_u,
      'ivt_v': ivt_v,
      'ivt_w': ivt_w,
      'ivt_n': ivt_n,
      'tapPosition': tapPosition,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory Powt3winschvivtModel.fromJson(Map<String, dynamic> json) {
    return Powt3winschvivtModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      hv_u: json['hv_u'],
      hv_v: json['hv_v'],
      hv_w: json['hv_w'],
      hv_n: json['hv_n'],
      ivt_u: json['ivt_u'],
      ivt_v: json['ivt_v'],
      ivt_w: json['ivt_w'],
      ivt_n: json['ivt_n'],
      tapPosition: json['tapPosition'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
