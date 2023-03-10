// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PowtcoreIR extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;
  final double hvE_60;
  final double hvE_600;
  final double hvLV_60;
  final double hvLV_600;
  final double lvE_60;
  final double lvE_600;
  final double cE_60;
  final double cT_60;
  final double tE_60;

  const PowtcoreIR({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.hvE_60,
    @required this.hvE_600,
    @required this.hvLV_60,
    @required this.hvLV_600,
    @required this.lvE_60,
    @required this.lvE_600,
    @required this.cE_60,
    @required this.cT_60,
    @required this.tE_60,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
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
}
