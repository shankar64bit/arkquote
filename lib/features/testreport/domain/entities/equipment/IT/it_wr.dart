// ignore_for_file: non_constant_identifier_names
import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ItWr extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;
  final String tapPosition;
  final double uV;
  final double vW;
  final double wU;
  final String hvLVOpt;

  const ItWr({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.tapPosition,
    @required this.uV,
    @required this.vW,
    @required this.wU,
    @required this.hvLVOpt,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        tapPosition,
        uV,
        vW,
        wU,
        hvLVOpt,
      ];
}
