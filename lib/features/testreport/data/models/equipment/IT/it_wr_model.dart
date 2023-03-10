import 'package:flutter_testreports/features/testreport/domain/entities/equipment/IT/it_wr.dart';

class ItWrTestModel extends ItWr {
  const ItWrTestModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final String equipmentUsed,
    final DateTime updateDate,
    final String tapPosition,
    final double uV,
    final double vW,
    final double wU,
    final String hvLVOpt,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
          tapPosition: tapPosition,
          uV: uV,
          vW: vW,
          wU: wU,
          hvLVOpt: hvLVOpt,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        tapPosition,
        uV,
        vW,
        wU,
        hvLVOpt,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'databaseID': databaseID,
      'trNo': trNo,
      'serialNo': serialNo,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
      'tapPosition': tapPosition,
      'uV': uV,
      'vW': vW,
      'wU': wU,
      'hvLVOpt': hvLVOpt,
    };
  }

  factory ItWrTestModel.fromJson(Map<String, dynamic> json) {
    return ItWrTestModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
      tapPosition: json['tapPosition'],
      uV: json['uV'],
      vW: json['vW'],
      wU: json['wU'],
      hvLVOpt: json['hvLVOpt'],
    );
  }
}
