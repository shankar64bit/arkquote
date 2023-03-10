// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powt3winwrLv extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final int tapPosition;
  final double lv_r_uv;
  final double lv_r_vw;
  final double lv_r_wu;
  final String equipmentUsed;
  final DateTime updateDate;

  const Powt3winwrLv({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.tapPosition,
    @required this.serialNo,
    @required this.lv_r_uv,
    @required this.lv_r_vw,
    @required this.lv_r_wu,
    @required this.equipmentUsed,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        lv_r_uv,
        lv_r_vw,
        lv_r_wu,
        equipmentUsed,
        updateDate,
        tapPosition,
      ];
}
