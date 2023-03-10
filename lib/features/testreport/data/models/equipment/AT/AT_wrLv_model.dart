import '../../../../domain/entities/equipment/AT/AT_wrLv.dart';

class ATwrLv_Model extends AT_wrLv {
  const ATwrLv_Model({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double lv_2u_2v,
    final double lv_2v_2w,
    final double lv_2w_2u,
    final int tapPosition,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          tapPosition: tapPosition,
          lv_2u_2v: lv_2u_2v,
          lv_2v_2w: lv_2v_2w,
          lv_2w_2u: lv_2w_2u,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        lv_2u_2v,
        lv_2v_2w,
        lv_2w_2u,
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
      'lv_2u_2v': lv_2u_2v,
      'lv_2v_2w': lv_2v_2w,
      'lv_2w_2u': lv_2w_2u,
      'tapPosition': tapPosition,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory ATwrLv_Model.fromJson(Map<String, dynamic> json) {
    return ATwrLv_Model(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      lv_2u_2v: json['lv_2u_2v'],
      lv_2v_2w: json['lv_2v_2w'],
      lv_2w_2u: json['lv_2w_2u'],
      tapPosition: json['tapPosition'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
