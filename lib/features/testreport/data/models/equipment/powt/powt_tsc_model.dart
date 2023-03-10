import '../../../../domain/entities/equipment/powt/powt_tsc.dart';

class PowttscModel extends Powttsc {
  const PowttscModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final int hv_voltage,
    final double hv_current,
    final int tapPosition,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          tapPosition: tapPosition,
          hv_voltage: hv_voltage,
          hv_current: hv_current,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        hv_voltage,
        hv_current,
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
      'hv_voltage': hv_voltage,
      'hv_current': hv_current,
      'tapPosition': tapPosition,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory PowttscModel.fromJson(Map<String, dynamic> json) {
    return PowttscModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      hv_voltage: json['hv_voltage'],
      hv_current: json['hv_current'],
      tapPosition: json['tapPosition'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
