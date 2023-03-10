// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ATcoreIR extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;
  final double hvE_1min;
  final double hvE_10min;
  final double hvE_PImin;
  final double hvLV_1min;
  final double hvLV_10min;
  final double hvLV_PImin;
  final double lvE_1min;
  final double lvE_10min;
  final double lvE_PImin;

  const ATcoreIR({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.hvE_1min,
    @required this.hvE_10min,
    @required this.hvE_PImin,
    @required this.hvLV_1min,
    @required this.hvLV_10min,
    @required this.hvLV_PImin,
    @required this.lvE_1min,
    @required this.lvE_10min,
    @required this.lvE_PImin,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
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
}
