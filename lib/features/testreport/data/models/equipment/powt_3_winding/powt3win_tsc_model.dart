import '../../../../domain/entities/equipment/powt_3_winding/powt3win_tsc.dart';

class Powt3wintscModel extends Powt3wintsc {
  const Powt3wintscModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final int hv_voltage,
    final double hv_current_Onan,
    final double hv_current_Onaf,
    final double hv_current_Ofaf,
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
          hv_current_Onan: hv_current_Onan,
          hv_current_Onaf: hv_current_Onaf,
          hv_current_Ofaf: hv_current_Ofaf,
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
        hv_current_Onan,
        hv_current_Onaf,
        hv_current_Ofaf,
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
      'hv_current_Onan': hv_current_Onan,
      'hv_current_Onaf': hv_current_Onaf,
      'hv_current_Ofaf': hv_current_Ofaf,
      'tapPosition': tapPosition,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory Powt3wintscModel.fromJson(Map<String, dynamic> json) {
    return Powt3wintscModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      hv_voltage: json['hv_voltage'],
      hv_current_Onan: json['hv_current_Onan'],
      hv_current_Onaf: json['hv_current_Onaf'],
      hv_current_Ofaf: json['hv_current_Ofaf'],
      tapPosition: json['tapPosition'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
