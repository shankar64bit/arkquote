// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powt3winIR extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;
  final double hvE_60;
  final double hvE_600;
  final double hvLv_60;
  final double hvLv_600;
  final double hvT_60;
  final double hvT_600;
  final double lvE_60;
  final double lvE_600;
  final double lvT_60;
  final double lvT_600;
  final double tE_60;
  final double tE_600;
  final double cF_60;
  final double cT_60;
  final double fT_60;

  const Powt3winIR({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.hvE_60,
    @required this.hvE_600,
    @required this.hvLv_60,
    @required this.hvLv_600,
    @required this.hvT_60,
    @required this.hvT_600,
    @required this.lvE_60,
    @required this.lvE_600,
    @required this.lvT_60,
    @required this.lvT_600,
    @required this.tE_60,
    @required this.tE_600,
    @required this.cF_60,
    @required this.cT_60,
    @required this.fT_60,
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
        hvLv_60,
        hvLv_600,
        hvT_60,
        hvT_600,
        lvE_60,
        lvE_600,
        lvT_60,
        lvT_600,
        tE_60,
        tE_600,
        cF_60,
        cT_60,
        fT_60,
      ];
}
