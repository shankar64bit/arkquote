import '../../../../domain/entities/equipment/CT/CT_core_r.dart';

class CTcoreRModel extends CTcoreR {
  const CTcoreRModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final String equipmentUsed,
    final DateTime updateDate,
    final double R_1S1_1S2_200,
    final double R_2S1_2S2_200,
    final double R_3S1_3S2_200,
    final double R_4S1_4S2_200,
    final double R_5S1_5S2_200,
    final double Y_1S1_1S2_200,
    final double Y_2S1_2S2_200,
    final double Y_3S1_3S2_200,
    final double Y_4S1_4S2_200,
    final double Y_5S1_5S2_200,
    final double B_1S1_1S2_200,
    final double B_2S1_2S2_200,
    final double B_3S1_3S2_200,
    final double B_4S1_4S2_200,
    final double B_5S1_5S2_200,
////////////////////////////
    final double R_1S1_1S2_400,
    final double R_2S1_2S2_400,
    final double R_3S1_3S2_400,
    final double R_4S1_4S2_400,
    final double R_5S1_5S2_400,
    final double Y_1S1_1S2_400,
    final double Y_2S1_2S2_400,
    final double Y_3S1_3S2_400,
    final double Y_4S1_4S2_400,
    final double Y_5S1_5S2_400,
    final double B_1S1_1S2_400,
    final double B_2S1_2S2_400,
    final double B_3S1_3S2_400,
    final double B_4S1_4S2_400,
    final double B_5S1_5S2_400,
////////////////////////////
    final double R_1S1_1S2_600,
    final double R_2S1_2S2_600,
    final double R_3S1_3S2_600,
    final double R_4S1_4S2_600,
    final double R_5S1_5S2_600,
    final double Y_1S1_1S2_600,
    final double Y_2S1_2S2_600,
    final double Y_3S1_3S2_600,
    final double Y_4S1_4S2_600,
    final double Y_5S1_5S2_600,
    final double B_1S1_1S2_600,
    final double B_2S1_2S2_600,
    final double B_3S1_3S2_600,
    final double B_4S1_4S2_600,
    final double B_5S1_5S2_600,
///////////////////////////
    final double R_1S1_1S2_800,
    final double R_2S1_2S2_800,
    final double R_3S1_3S2_800,
    final double R_4S1_4S2_800,
    final double R_5S1_5S2_800,
    final double Y_1S1_1S2_800,
    final double Y_2S1_2S2_800,
    final double Y_3S1_3S2_800,
    final double Y_4S1_4S2_800,
    final double Y_5S1_5S2_800,
    final double B_1S1_1S2_800,
    final double B_2S1_2S2_800,
    final double B_3S1_3S2_800,
    final double B_4S1_4S2_800,
    final double B_5S1_5S2_800,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
          R_1S1_1S2_200: R_1S1_1S2_200,
          R_2S1_2S2_200: R_2S1_2S2_200,
          R_3S1_3S2_200: R_3S1_3S2_200,
          R_4S1_4S2_200: R_4S1_4S2_200,
          R_5S1_5S2_200: R_5S1_5S2_200,
          Y_1S1_1S2_200: Y_1S1_1S2_200,
          Y_2S1_2S2_200: Y_2S1_2S2_200,
          Y_3S1_3S2_200: Y_3S1_3S2_200,
          Y_4S1_4S2_200: Y_4S1_4S2_200,
          Y_5S1_5S2_200: Y_5S1_5S2_200,
          B_1S1_1S2_200: B_1S1_1S2_200,
          B_2S1_2S2_200: B_2S1_2S2_200,
          B_3S1_3S2_200: B_3S1_3S2_200,
          B_4S1_4S2_200: B_4S1_4S2_200,
          B_5S1_5S2_200: B_5S1_5S2_200,
          R_1S1_1S2_400: R_1S1_1S2_400,
          R_2S1_2S2_400: R_2S1_2S2_400,
          R_3S1_3S2_400: R_3S1_3S2_400,
          R_4S1_4S2_400: R_4S1_4S2_400,
          R_5S1_5S2_400: R_5S1_5S2_400,
          Y_1S1_1S2_400: Y_1S1_1S2_400,
          Y_2S1_2S2_400: Y_2S1_2S2_400,
          Y_3S1_3S2_400: Y_3S1_3S2_400,
          Y_4S1_4S2_400: Y_4S1_4S2_400,
          Y_5S1_5S2_400: Y_5S1_5S2_400,
          B_1S1_1S2_400: B_1S1_1S2_400,
          B_2S1_2S2_400: B_2S1_2S2_400,
          B_3S1_3S2_400: B_3S1_3S2_400,
          B_4S1_4S2_400: B_4S1_4S2_400,
          B_5S1_5S2_400: B_5S1_5S2_400,
          R_1S1_1S2_600: R_1S1_1S2_600,
          R_2S1_2S2_600: R_2S1_2S2_600,
          R_3S1_3S2_600: R_3S1_3S2_600,
          R_4S1_4S2_600: R_4S1_4S2_600,
          R_5S1_5S2_600: R_5S1_5S2_600,
          Y_1S1_1S2_600: Y_1S1_1S2_600,
          Y_2S1_2S2_600: Y_2S1_2S2_600,
          Y_3S1_3S2_600: Y_3S1_3S2_600,
          Y_4S1_4S2_600: Y_4S1_4S2_600,
          Y_5S1_5S2_600: Y_5S1_5S2_600,
          B_1S1_1S2_600: B_1S1_1S2_600,
          B_2S1_2S2_600: B_2S1_2S2_600,
          B_3S1_3S2_600: B_3S1_3S2_600,
          B_4S1_4S2_600: B_4S1_4S2_600,
          B_5S1_5S2_600: B_5S1_5S2_600,
          R_1S1_1S2_800: R_1S1_1S2_800,
          R_2S1_2S2_800: R_2S1_2S2_800,
          R_3S1_3S2_800: R_3S1_3S2_800,
          R_4S1_4S2_800: R_4S1_4S2_800,
          R_5S1_5S2_800: R_5S1_5S2_800,
          Y_1S1_1S2_800: Y_1S1_1S2_800,
          Y_2S1_2S2_800: Y_2S1_2S2_800,
          Y_3S1_3S2_800: Y_3S1_3S2_800,
          Y_4S1_4S2_800: Y_4S1_4S2_800,
          Y_5S1_5S2_800: Y_5S1_5S2_800,
          B_1S1_1S2_800: B_1S1_1S2_800,
          B_2S1_2S2_800: B_2S1_2S2_800,
          B_3S1_3S2_800: B_3S1_3S2_800,
          B_4S1_4S2_800: B_4S1_4S2_800,
          B_5S1_5S2_800: B_5S1_5S2_800,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        R_1S1_1S2_200,
        R_2S1_2S2_200,
        R_3S1_3S2_200,
        R_4S1_4S2_200,
        R_5S1_5S2_200,
        Y_1S1_1S2_200,
        Y_2S1_2S2_200,
        Y_3S1_3S2_200,
        Y_4S1_4S2_200,
        Y_5S1_5S2_200,
        B_1S1_1S2_200,
        B_2S1_2S2_200,
        B_3S1_3S2_200,
        B_4S1_4S2_200,
        B_5S1_5S2_200,
        R_1S1_1S2_400,
        R_2S1_2S2_400,
        R_3S1_3S2_400,
        R_4S1_4S2_400,
        R_5S1_5S2_400,
        Y_1S1_1S2_400,
        Y_2S1_2S2_400,
        Y_3S1_3S2_400,
        Y_4S1_4S2_400,
        Y_5S1_5S2_400,
        B_1S1_1S2_400,
        B_2S1_2S2_400,
        B_3S1_3S2_400,
        B_4S1_4S2_400,
        B_5S1_5S2_400,
        R_1S1_1S2_600,
        R_2S1_2S2_600,
        R_3S1_3S2_600,
        R_4S1_4S2_600,
        R_5S1_5S2_600,
        Y_1S1_1S2_600,
        Y_2S1_2S2_600,
        Y_3S1_3S2_600,
        Y_4S1_4S2_600,
        Y_5S1_5S2_600,
        B_1S1_1S2_600,
        B_2S1_2S2_600,
        B_3S1_3S2_600,
        B_4S1_4S2_600,
        B_5S1_5S2_600,
        R_1S1_1S2_800,
        R_2S1_2S2_800,
        R_3S1_3S2_800,
        R_4S1_4S2_800,
        R_5S1_5S2_800,
        Y_1S1_1S2_800,
        Y_2S1_2S2_800,
        Y_3S1_3S2_800,
        Y_4S1_4S2_800,
        Y_5S1_5S2_800,
        B_1S1_1S2_800,
        B_2S1_2S2_800,
        B_3S1_3S2_800,
        B_4S1_4S2_800,
        B_5S1_5S2_800,
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
      'R_1S1_1S2_200': R_1S1_1S2_200,
      'R_2S1_2S2_200': R_2S1_2S2_200,
      'R_3S1_3S2_200': R_3S1_3S2_200,
      'R_4S1_4S2_200': R_4S1_4S2_200,
      'R_5S1_5S2_200': R_5S1_5S2_200,
      'Y_1S1_1S2_200': Y_1S1_1S2_200,
      'Y_2S1_2S2_200': Y_2S1_2S2_200,
      'Y_3S1_3S2_200': Y_3S1_3S2_200,
      'Y_4S1_4S2_200': Y_4S1_4S2_200,
      'Y_5S1_5S2_200': Y_5S1_5S2_200,
      'B_1S1_1S2_200 ': B_1S1_1S2_200,
      'B_2S1_2S2_200 ': B_2S1_2S2_200,
      'B_3S1_3S2_200 ': B_3S1_3S2_200,
      'B_4S1_4S2_200 ': B_4S1_4S2_200,
      'B_5S1_5S2_200 ': B_5S1_5S2_200,
      'R_1S1_1S2_400': R_1S1_1S2_400,
      'R_2S1_2S2_400 ': R_2S1_2S2_400,
      'R_3S1_3S2_400 ': R_3S1_3S2_400,
      'R_4S1_4S2_400 ': R_4S1_4S2_400,
      'R_5S1_5S2_400 ': R_5S1_5S2_400,
      'Y_1S1_1S2_400 ': Y_1S1_1S2_400,
      'Y_2S1_2S2_400 ': Y_2S1_2S2_400,
      'Y_3S1_3S2_400 ': Y_3S1_3S2_400,
      'Y_4S1_4S2_400 ': Y_4S1_4S2_400,
      'Y_5S1_5S2_400 ': Y_5S1_5S2_400,
      'B_1S1_1S2_400 ': B_1S1_1S2_400,
      'B_2S1_2S2_400 ': B_2S1_2S2_400,
      'B_3S1_3S2_400 ': B_3S1_3S2_400,
      'B_4S1_4S2_400 ': B_4S1_4S2_400,
      'B_5S1_5S2_400 ': B_5S1_5S2_400,
      'R_1S1_1S2_600': R_1S1_1S2_600,
      'R_2S1_2S2_600 ': R_2S1_2S2_600,
      'R_3S1_3S2_600 ': R_3S1_3S2_600,
      'R_4S1_4S2_600 ': R_4S1_4S2_600,
      'R_5S1_5S2_600 ': R_5S1_5S2_600,
      'Y_1S1_1S2_600 ': Y_1S1_1S2_600,
      'Y_2S1_2S2_600 ': Y_2S1_2S2_600,
      'Y_3S1_3S2_600 ': Y_3S1_3S2_600,
      'Y_4S1_4S2_600 ': Y_4S1_4S2_600,
      'Y_5S1_5S2_600 ': Y_5S1_5S2_600,
      'B_1S1_1S2_600 ': B_1S1_1S2_600,
      'B_2S1_2S2_600 ': B_2S1_2S2_600,
      'B_3S1_3S2_600 ': B_3S1_3S2_600,
      'B_4S1_4S2_600 ': B_4S1_4S2_600,
      'B_5S1_5S2_600 ': B_5S1_5S2_600,
      'R_1S1_1S2_800': R_1S1_1S2_800,
      'R_2S1_2S2_800 ': R_2S1_2S2_800,
      'R_3S1_3S2_800 ': R_3S1_3S2_800,
      'R_4S1_4S2_800 ': R_4S1_4S2_800,
      'R_5S1_5S2_800 ': R_5S1_5S2_800,
      'Y_1S1_1S2_800 ': Y_1S1_1S2_800,
      'Y_2S1_2S2_800 ': Y_2S1_2S2_800,
      'Y_3S1_3S2_800 ': Y_3S1_3S2_800,
      'Y_4S1_4S2_800 ': Y_4S1_4S2_800,
      'Y_5S1_5S2_800 ': Y_5S1_5S2_800,
      'B_1S1_1S2_800 ': B_1S1_1S2_800,
      'B_2S1_2S2_800 ': B_2S1_2S2_800,
      'B_3S1_3S2_800 ': B_3S1_3S2_800,
      'B_4S1_4S2_800 ': B_4S1_4S2_800,
      'B_5S1_5S2_800 ': B_5S1_5S2_800,
    };
  }

  factory CTcoreRModel.fromJson(Map<String, dynamic> json) {
    return CTcoreRModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
      R_1S1_1S2_200: json['R_1S1_1S2_200'],
      R_2S1_2S2_200: json['R_2S1_2S2_200 '],
      R_3S1_3S2_200: json['R_3S1_3S2_200 '],
      R_4S1_4S2_200: json['R_4S1_4S2_200 '],
      R_5S1_5S2_200: json['R_5S1_5S2_200 '],
      Y_1S1_1S2_200: json['Y_1S1_1S2_200 '],
      Y_2S1_2S2_200: json['Y_2S1_2S2_200 '],
      Y_3S1_3S2_200: json['Y_3S1_3S2_200 '],
      Y_4S1_4S2_200: json['Y_4S1_4S2_200 '],
      Y_5S1_5S2_200: json['Y_5S1_5S2_200 '],
      B_1S1_1S2_200: json['B_1S1_1S2_200 '],
      B_2S1_2S2_200: json['B_2S1_2S2_200 '],
      B_3S1_3S2_200: json['B_3S1_3S2_200 '],
      B_4S1_4S2_200: json['B_4S1_4S2_200 '],
      B_5S1_5S2_200: json['B_5S1_5S2_200 '],
      R_1S1_1S2_400: json['R_1S1_1S2_400'],
      R_2S1_2S2_400: json['R_2S1_2S2_400 '],
      R_3S1_3S2_400: json['R_3S1_3S2_400 '],
      R_4S1_4S2_400: json['R_4S1_4S2_400 '],
      R_5S1_5S2_400: json['R_5S1_5S2_400 '],
      Y_1S1_1S2_400: json['Y_1S1_1S2_400 '],
      Y_2S1_2S2_400: json['Y_2S1_2S2_400 '],
      Y_3S1_3S2_400: json['Y_3S1_3S2_400 '],
      Y_4S1_4S2_400: json['Y_4S1_4S2_400 '],
      Y_5S1_5S2_400: json['Y_5S1_5S2_400 '],
      B_1S1_1S2_400: json['B_1S1_1S2_400 '],
      B_2S1_2S2_400: json['B_2S1_2S2_400 '],
      B_3S1_3S2_400: json['B_3S1_3S2_400 '],
      B_4S1_4S2_400: json['B_4S1_4S2_400 '],
      B_5S1_5S2_400: json['B_5S1_5S2_400 '],
      R_1S1_1S2_600: json['R_1S1_1S2_600'],
      R_2S1_2S2_600: json['R_2S1_2S2_600 '],
      R_3S1_3S2_600: json['R_3S1_3S2_600 '],
      R_4S1_4S2_600: json['R_4S1_4S2_600 '],
      R_5S1_5S2_600: json['R_5S1_5S2_600 '],
      Y_1S1_1S2_600: json['Y_1S1_1S2_600 '],
      Y_2S1_2S2_600: json['Y_2S1_2S2_600 '],
      Y_3S1_3S2_600: json['Y_3S1_3S2_600 '],
      Y_4S1_4S2_600: json['Y_4S1_4S2_600 '],
      Y_5S1_5S2_600: json['Y_5S1_5S2_600 '],
      B_1S1_1S2_600: json['B_1S1_1S2_600 '],
      B_2S1_2S2_600: json['B_2S1_2S2_600 '],
      B_3S1_3S2_600: json['B_3S1_3S2_600 '],
      B_4S1_4S2_600: json['B_4S1_4S2_600 '],
      B_5S1_5S2_600: json['B_5S1_5S2_600 '],
      R_1S1_1S2_800: json['R_1S1_1S2_800'],
      R_2S1_2S2_800: json['R_2S1_2S2_800 '],
      R_3S1_3S2_800: json['R_3S1_3S2_800 '],
      R_4S1_4S2_800: json['R_4S1_4S2_800 '],
      R_5S1_5S2_800: json['R_5S1_5S2_800 '],
      Y_1S1_1S2_800: json['Y_1S1_1S2_800 '],
      Y_2S1_2S2_800: json['Y_2S1_2S2_800 '],
      Y_3S1_3S2_800: json['Y_3S1_3S2_800 '],
      Y_4S1_4S2_800: json['Y_4S1_4S2_800 '],
      Y_5S1_5S2_800: json['Y_5S1_5S2_800 '],
      B_1S1_1S2_800: json['B_1S1_1S2_800 '],
      B_2S1_2S2_800: json['B_2S1_2S2_800 '],
      B_3S1_3S2_800: json['B_3S1_3S2_800 '],
      B_4S1_4S2_800: json['B_4S1_4S2_800 '],
      B_5S1_5S2_800: json['B_5S1_5S2_800 '],
    );
  }
}