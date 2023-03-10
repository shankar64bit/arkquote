import '../../../../domain/entities/equipment/powt/powt_bNamePlate.dart';

class PowtbNamePlateModel extends PowtbNamePlate {
  const PowtbNamePlateModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final String R_serialNo,
    final int R_ratedVoltage,
    final int R_ratedCurrent,
    final String R_Make,
    final String Y_serialNo,
    final int Y_ratedVoltage,
    final int Y_ratedCurrent,
    final String Y_Make,
    final String B_serialNo,
    final int B_ratedVoltage,
    final int B_ratedCurrent,
    final String B_Make,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          R_serialNo: R_serialNo,
          R_ratedVoltage: R_ratedVoltage,
          R_ratedCurrent: R_ratedCurrent,
          R_Make: R_Make,
          Y_serialNo: Y_serialNo,
          Y_ratedVoltage: Y_ratedVoltage,
          Y_ratedCurrent: Y_ratedCurrent,
          Y_Make: Y_Make,
          B_serialNo: B_serialNo,
          B_ratedVoltage: B_ratedVoltage,
          B_ratedCurrent: B_ratedCurrent,
          B_Make: B_Make,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        R_serialNo,
        R_ratedVoltage,
        R_ratedCurrent,
        R_Make,
        Y_serialNo,
        Y_ratedVoltage,
        Y_ratedCurrent,
        Y_Make,
        B_serialNo,
        B_ratedVoltage,
        B_ratedCurrent,
        B_Make,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'trNo': trNo,
      'serialNo': serialNo,
      'R_serialNo': R_serialNo,
      'R_ratedVoltage': R_ratedVoltage,
      'R_ratedCurrent': R_ratedCurrent,
      'R_Make': R_Make,
      'Y_serialNo': Y_serialNo,
      'Y_ratedVoltage': Y_ratedVoltage,
      'Y_ratedCurrent': Y_ratedCurrent,
      'Y_Make': Y_Make,
      'B_serialNo': B_serialNo,
      'B_ratedVoltage': B_ratedVoltage,
      'B_ratedCurrent': B_ratedCurrent,
      'B_Make': B_Make,
      'id': id,
      'databaseID': databaseID,
    };
  }

  factory PowtbNamePlateModel.fromJson(Map<String, dynamic> json) {
    return PowtbNamePlateModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      R_serialNo: json['R_serialNo'],
      R_ratedVoltage: json['R_ratedVoltage'],
      R_ratedCurrent: json['R_ratedCurrent'],
      R_Make: json['R_Make'],
      Y_serialNo: json['Y_serialNo'],
      Y_ratedVoltage: json['Y_ratedVoltage'],
      Y_ratedCurrent: json['Y_ratedCurrent'],
      Y_Make: json['Y_Make'],
      B_serialNo: json['B_serialNo'],
      B_ratedVoltage: json['B_ratedVoltage'],
      B_ratedCurrent: json['B_ratedCurrent'],
      B_Make: json['B_Make'],
    );
  }
}
