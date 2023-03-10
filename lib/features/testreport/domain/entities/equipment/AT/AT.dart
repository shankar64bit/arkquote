// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AT extends Equatable {
  final int id;
  final int databaseID;
  final String etype;
  final int trNo;
  final String designation;
  final String location;
  final String serialNo;
  final int rating;
  final int ratedVoltage_HV;
  final int ratedVoltage_LV;
  final double ratedCurrent_HV;
  final double ratedCurrent_LV;
  final String vectorGroup;
  final double impedanceVoltage;
  final int frequency;
  final String typeOfCooling;
  final int noOfPhases;
  final int noOfTaps;
  final int onOfNominalTaps;
  final int yom;
  final String make;
  final DateTime dateOfTesting;
  final DateTime updateDate;
  final String testedBy;
  final String verifiedBy;
  final String WitnessedBy;

  const AT({
    @required this.id,
    @required this.databaseID,
    @required this.etype,
    @required this.trNo,
    @required this.designation,
    @required this.location,
    @required this.serialNo,
    @required this.rating,
    @required this.ratedVoltage_HV,
    @required this.ratedVoltage_LV,
    @required this.ratedCurrent_HV,
    @required this.ratedCurrent_LV,
    @required this.vectorGroup,
    @required this.impedanceVoltage,
    @required this.frequency,
    @required this.typeOfCooling,
    @required this.noOfPhases,
    @required this.noOfTaps,
    @required this.onOfNominalTaps,
    @required this.yom,
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
        rating,
        ratedVoltage_HV,
        ratedVoltage_LV,
        ratedCurrent_HV,
        ratedCurrent_LV,
        vectorGroup,
        impedanceVoltage,
        frequency,
        typeOfCooling,
        noOfPhases,
        noOfTaps,
        onOfNominalTaps,
        yom,
        make,
        dateOfTesting,
        updateDate,
        testedBy,
        verifiedBy,
        WitnessedBy,
      ];
}
