import '../../../../domain/entities/equipment/AT/AT_ir.dart';

class ATcoreIRModel extends ATcoreIR {
  const ATcoreIRModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final String equipmentUsed,
    final DateTime updateDate,
    final double hvE_1min,
    final double hvE_10min,
    final double hvE_PImin,
    final double hvLV_1min,
    final double hvLV_10min,
    final double hvLV_PImin,
    final double lvE_1min,
    final double lvE_10min,
    final double lvE_PImin,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
          hvE_1min: hvE_1min,
          hvE_10min: hvE_10min,
          hvE_PImin: hvE_PImin,
          hvLV_1min: hvLV_1min,
          hvLV_10min: hvLV_10min,
          hvLV_PImin: hvLV_PImin,
          lvE_1min: lvE_1min,
          lvE_10min: lvE_10min,
          lvE_PImin: lvE_PImin,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        hvE_1min,
        hvE_10min,
        hvE_PImin,
        hvLV_1min,
        hvLV_10min,
        hvLV_PImin,
        lvE_1min,
        lvE_10min,
        lvE_PImin,
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
      'hvE_1min': hvE_1min,
      'hvE_10min': hvE_10min,
      'hvE_PImin': hvE_PImin,
      'hvLV_1min': hvLV_1min,
      'hvLV_10min': hvLV_10min,
      'hvLV_PImin': hvLV_PImin,
      'lvE_1min': lvE_1min,
      'lvE_10min': lvE_10min,
      'lvE_PImin': lvE_PImin,
    };
  }

  factory ATcoreIRModel.fromJson(Map<String, dynamic> json) {
    return ATcoreIRModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
      hvE_1min: json['hvE_1min'],
      hvE_10min: json['hvE_10min'],
      hvE_PImin: json['hvE_PImin'],
      hvLV_1min: json['hvLV_1min'],
      hvLV_10min: json['hvLV_10min'],
      hvLV_PImin: json['hvLV_PImin'],
      lvE_1min: json['lvE_1min'],
      lvE_10min: json['lvE_10min'],
      lvE_PImin: json['lvE_PImin'],
    );
  }
}
