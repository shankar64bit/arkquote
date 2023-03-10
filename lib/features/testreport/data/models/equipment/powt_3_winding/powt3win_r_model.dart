import '../../../../domain/entities/equipment/powt_3_winding/powt3win_r.dart';

class Powt3win_R_Model extends Powt3win_R {
  const Powt3win_R_Model({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double hv_1u_1vn,
    final double hv_1v_1wn,
    final double hv_1w_1un,
    final double lv_uvn,
    final double lv_vwn,
    final double lv_wun,
    final double ivt_uvn,
    final double ivt_vwn,
    final double ivt_wun,
    final int tapPosition,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          tapPosition: tapPosition,
          hv_1u_1vn: hv_1u_1vn,
          hv_1v_1wn: hv_1v_1wn,
          hv_1w_1un: hv_1w_1un,
          lv_uvn: lv_uvn,
          lv_vwn: lv_vwn,
          lv_wun: lv_wun,
          ivt_uvn: ivt_uvn,
          ivt_vwn: ivt_vwn,
          ivt_wun: ivt_wun,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
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
        lv_uvn,
        lv_vwn,
        lv_wun,
        ivt_uvn,
        ivt_vwn,
        ivt_wun,
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
      'hv_1u_1vn': hv_1u_1vn,
      'hv_1v_1wn': hv_1v_1wn,
      'hv_1w_1un': hv_1w_1un,
      'lv_uvn': lv_uvn,
      'lv_vwn': lv_vwn,
      'lv_wun': lv_wun,
      'ivt_uvn': ivt_uvn,
      'ivt_vwn': ivt_vwn,
      'ivt_wun': ivt_wun,
      'tapPosition': tapPosition,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory Powt3win_R_Model.fromJson(Map<String, dynamic> json) {
    return Powt3win_R_Model(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      hv_1u_1vn: json['hv_1u_1vn'],
      hv_1v_1wn: json['hv_1v_1wn'],
      hv_1w_1un: json['hv_1w_1un'],
      lv_uvn: json['lv_uvn'],
      lv_vwn: json['lv_vwn'],
      lv_wun: json['lv_wun'],
      ivt_uvn: json['ivt_uvn'],
      ivt_vwn: json['ivt_vwn'],
      ivt_wun: json['ivt_wun'],
      tapPosition: json['tapPosition'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
