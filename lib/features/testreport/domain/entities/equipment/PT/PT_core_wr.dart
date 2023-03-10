// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PTcoreWR extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;

  final double R_1a_1n;
  final double R_2a_2n;
  final double R_3a_3n;
  final double Y_1a_1n;
  final double Y_2a_2n;
  final double Y_3a_3n;
  final double B_1a_1n;
  final double B_2a_2n;
  final double B_3a_3n;

  const PTcoreWR({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.R_1a_1n,
    @required this.R_2a_2n,
    @required this.R_3a_3n,
    @required this.Y_1a_1n,
    @required this.Y_2a_2n,
    @required this.Y_3a_3n,
    @required this.B_1a_1n,
    @required this.B_2a_2n,
    @required this.B_3a_3n,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
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
}
