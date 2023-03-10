// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class EFELRelay extends Equatable {
  final int id;
  final int databaseID;
  final String etype;
  final int trNo;
  final String designation;
  final String location;
  final String serialNo;
  final String panel;
  final String make;
  final String rtype;
  final String auxVoltage;
  final String ctRatio;
  final DateTime dateOfTesting;
  final DateTime updateDate;
  final String testedBy;
  final String verifiedBy;
  final String WitnessedBy;

  const EFELRelay({
    @required this.id,
    @required this.databaseID,
    @required this.etype,
    @required this.trNo,
    @required this.designation,
    @required this.location,
    @required this.serialNo,
    @required this.panel,
    @required this.rtype,
    @required this.auxVoltage,
    @required this.ctRatio,
    @required this.make,
    @required this.dateOfTesting,
    @required this.updateDate,
    @required this.testedBy,
    @required this.verifiedBy,
    @required this.WitnessedBy,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        etype,
        trNo,
        designation,
        location,
        serialNo,
        panel,
        make,
        rtype,
        auxVoltage,
        ctRatio,
        dateOfTesting,
        updateDate,
        testedBy,
        verifiedBy,
        WitnessedBy,
      ];
}
