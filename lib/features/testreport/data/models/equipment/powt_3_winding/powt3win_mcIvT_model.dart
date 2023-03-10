import '../../../../domain/entities/equipment/powt_3_winding/powt3win_mcIvT.dart';

class Powt3winmcIvTModel extends Powt3winmcIvT {
  const Powt3winmcIvTModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double ivt_u_vn,
    final double ivt_v_wn,
    final double ivt_w_un,
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
          ivt_u_vn: ivt_u_vn,
          ivt_v_wn: ivt_v_wn,
          ivt_w_un: ivt_w_un,
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
        ivt_u_vn,
        ivt_v_wn,
        ivt_w_un,
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
      'ivt_u_vn': ivt_u_vn,
      'ivt_v_wn': ivt_v_wn,
      'ivt_w_un': ivt_w_un,
      'ivt_u': ivt_u,
      'ivt_v': ivt_v,
      'ivt_w': ivt_w,
      'ivt_n': ivt_n,
      'tapPosition': tapPosition,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory Powt3winmcIvTModel.fromJson(Map<String, dynamic> json) {
    return Powt3winmcIvTModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      ivt_u_vn: json['ivt_u_vn'],
      ivt_v_wn: json['ivt_v_wn'],
      ivt_w_un: json['ivt_w_un'],
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
