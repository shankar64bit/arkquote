import 'dart:ffi';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class EnergyMeter extends Equatable {
  final String etype;
  final int trNo;
  final String designation;
  final String location;
  final String panel;
  final String serialNo;
  final String make;
  final int voltage;
  final double eqClass;
  final int frequency;
  final DateTime dateOfTesting;
  final int id;
  final int databaseID;
  final String TestedBy;
  final String VerifiedBy;
  final String WitnessedBy;
  final DateTime updateDate;
  final String ctr;
  final String ptr;

  const EnergyMeter({
    @required this.etype,
    @required this.designation,
    @required this.location,
    @required this.panel,
    @required this.serialNo,
    @required this.make,
    @required this.eqClass,
    @required this.voltage,
    @required this.frequency,
    @required this.dateOfTesting,
    @required this.trNo,
    @required this.id,
    @required this.databaseID,
    @required this.TestedBy,
    @required this.VerifiedBy,
    @required this.WitnessedBy,
    @required this.updateDate,
    @required this.ctr,
    @required this.ptr,
  });

  @override
  List<Object> get props => [
        etype,
        designation,
        location,
        panel,
        serialNo,
        make,
        eqClass,
        frequency,
        voltage,
        dateOfTesting,
        trNo,
        id,
        databaseID,
        TestedBy,
        VerifiedBy,
        WitnessedBy,
        updateDate,
        ctr,
        ptr,
      ];
}
