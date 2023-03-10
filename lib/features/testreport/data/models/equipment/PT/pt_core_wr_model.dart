import '../../../../domain/entities/equipment/PT/PT_core_wr.dart';

class PTcoreWRModel extends PTcoreWR {
  const PTcoreWRModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final String equipmentUsed,
    final DateTime updateDate,
    final double R_1a_1n,
    final double R_2a_2n,
    final double R_3a_3n,
    final double Y_1a_1n,
    final double Y_2a_2n,
    final double Y_3a_3n,
    final double B_1a_1n,
    final double B_2a_2n,
    final double B_3a_3n,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
          R_1a_1n: R_1a_1n,
          R_2a_2n: R_2a_2n,
          R_3a_3n: R_3a_3n,
          Y_1a_1n: Y_1a_1n,
          Y_2a_2n: Y_2a_2n,
          Y_3a_3n: Y_3a_3n,
          B_1a_1n: B_1a_1n,
          B_2a_2n: B_2a_2n,
          B_3a_3n: B_3a_3n,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        R_1a_1n,
        R_2a_2n,
        R_3a_3n,
        Y_1a_1n,
        Y_2a_2n,
        Y_3a_3n,
        B_1a_1n,
        B_2a_2n,
        B_3a_3n,
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
      'R_1a_1n': R_1a_1n,
      'R_2a_2n': R_2a_2n,
      'R_3a_3n': R_3a_3n,
      'Y_1a_1n': Y_1a_1n,
      'Y_2a_2n': Y_2a_2n,
      'Y_3a_3n': Y_3a_3n,
      'B_1a_1n': B_1a_1n,
      'B_2a_2n': B_2a_2n,
      'B_3a_3n': B_3a_3n,
    };
  }

  factory PTcoreWRModel.fromJson(Map<String, dynamic> json) {
    return PTcoreWRModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
      R_1a_1n: json['R_1a_1n'],
      R_2a_2n: json['R_2a_2n'],
      R_3a_3n: json['R_3a_3n'],
      Y_1a_1n: json['Y_1a_1n'],
      Y_2a_2n: json['Y_2a_2n'],
      Y_3a_3n: json['Y_3a_3n'],
      B_1a_1n: json['B_1a_1n'],
      B_2a_2n: json['B_2a_2n'],
      B_3a_3n: json['B_3a_3n'],
    );
  }
}
