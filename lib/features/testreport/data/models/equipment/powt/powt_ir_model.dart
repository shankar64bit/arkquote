import '../../../../domain/entities/equipment/powt/powt_ir.dart';

class PowtcoreIRModel extends PowtcoreIR {
  const PowtcoreIRModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final String equipmentUsed,
    final DateTime updateDate,
    final double hvE_60,
    final double hvE_600,
    final double hvLV_60,
    final double hvLV_600,
    final double lvE_60,
    final double lvE_600,
    final double cE_60,
    final double cT_60,
    final double tE_60,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
          hvE_60: hvE_60,
          hvE_600: hvE_600,
          hvLV_60: hvLV_60,
          hvLV_600: hvLV_600,
          lvE_60: lvE_60,
          lvE_600: lvE_600,
          cE_60: cE_60,
          cT_60: cT_60,
          tE_60: tE_60,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        hvE_60,
        hvE_600,
        hvLV_60,
        hvLV_600,
        lvE_60,
        lvE_600,
        cE_60,
        cT_60,
        tE_60,
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
      'hvE_60': hvE_60,
      'hvE_600': hvE_600,
      'hvLV_60': hvLV_60,
      'hvLV_600': hvLV_600,
      'lvE_60': lvE_60,
      'lvE_600': lvE_600,
      'cE_60': cE_60,
      'cT_60': cT_60,
      'tE_60': tE_60,
    };
  }

  factory PowtcoreIRModel.fromJson(Map<String, dynamic> json) {
    return PowtcoreIRModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
      hvE_60: json['hvE_60'],
      hvE_600: json['hvE_600'],
      hvLV_60: json['hvLV_60'],
      hvLV_600: json['hvLV_600'],
      lvE_60: json['lvE_60'],
      lvE_600: json['lvE_600'],
      cE_60: json['cE_60'],
      cT_60: json['cT_60'],
      tE_60: json['tE_60'],
    );
  }
}
