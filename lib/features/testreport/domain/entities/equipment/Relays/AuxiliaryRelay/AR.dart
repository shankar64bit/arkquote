// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AR extends Equatable {
  final int id;
  final int databaseID;
  final String etype;
  final int trNo;
  final String designation;
  final String location;
  final int noOfCoil;
  final String panel;
  final String make;
  final String rtype;
  final String auxVoltage;
  final DateTime dateOfTesting;
  final DateTime updateDate;
  final String testedBy;
  final String verifiedBy;
  final String WitnessedBy;

  const AR({
    @required this.id,
    @required this.databaseID,
    @required this.etype,
    @required this.trNo,
    @required this.designation,
    @required this.location,
    @required this.noOfCoil,
    @required this.panel,
    @required this.rtype,
    @required this.auxVoltage,
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
        noOfCoil,
        panel,
        make,
        rtype,
        auxVoltage,
        dateOfTesting,
        updateDate,
        testedBy,
        verifiedBy,
        WitnessedBy,
      ];
}
