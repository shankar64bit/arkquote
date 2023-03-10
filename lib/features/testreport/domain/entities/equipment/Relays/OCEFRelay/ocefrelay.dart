// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class OCEFRelay extends Equatable {
  final int id;
  final int databaseID;
  final String etype;
  final int trNo;
  final String designation;
  final String location;
  final String serialNo_Rph;
  final String serialNo_Yph;
  final String serialNo_Bph;
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

  const OCEFRelay({
    @required this.id,
    @required this.databaseID,
    @required this.etype,
    @required this.trNo,
    @required this.designation,
    @required this.location,
    @required this.serialNo_Rph,
    @required this.serialNo_Yph,
    @required this.serialNo_Bph,
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
        serialNo_Rph,
        serialNo_Yph,
        serialNo_Bph,
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
