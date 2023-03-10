// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powt3Winding extends Equatable {
  final int id;
  final int databaseID;
  final String etype;
  final int trNo;
  final String designation;
  final String location;
  final String serialNo;
  final String rating;
  final int ratedVoltage_HV;
  final int ratedVoltage_LV;
  final int ratedVoltage_TS;
  final String ratedCurrent_TS;
  final String ratedCurrent_HV;
  final String ratedCurrent_LV;
  final String vectorGroup;
  final double impedanceVoltageLTap;
  final double impedanceVoltageRTap;
  final double impedanceVoltageHTap;
  final int frequency;
  final String typeOfCooling;
  final int noOfPhases;
  final String make;
  final int yom;
  final int noOfTaps;
  final int onOfNominalTaps;
  final int oilTemp;
  final int windingTemp;
  final int ambientTemp;
  final DateTime dateOfTesting;
  final DateTime updateDate;
  final String testedBy;
  final String verifiedBy;
  final String WitnessedBy;

  const Powt3Winding({
    @required this.etype,
    @required this.designation,
    @required this.location,
    @required this.rating,
    @required this.ratedVoltage_HV,
    @required this.ratedVoltage_LV,
    @required this.ratedCurrent_HV,
    @required this.ratedCurrent_LV,
    @required this.vectorGroup,
    @required this.impedanceVoltageLTap,
    @required this.impedanceVoltageRTap,
    @required this.impedanceVoltageHTap,
    @required this.frequency,
    @required this.typeOfCooling,
    @required this.noOfPhases,
    @required this.make,
    @required this.yom,
    @required this.ratedVoltage_TS,
    @required this.ratedCurrent_TS,
    @required this.noOfTaps,
    @required this.onOfNominalTaps,
    @required this.oilTemp,
    @required this.windingTemp,
    @required this.ambientTemp,
    @required this.dateOfTesting,
    @required this.testedBy,
    @required this.verifiedBy,
    @required this.WitnessedBy,
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.updateDate,
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
        impedanceVoltageLTap,
        impedanceVoltageRTap,
        impedanceVoltageHTap,
        frequency,
        typeOfCooling,
        noOfPhases,
        make,
        ratedVoltage_TS,
        ratedCurrent_TS,
        yom,
        noOfTaps,
        onOfNominalTaps,
        oilTemp,
        windingTemp,
        ambientTemp,
        dateOfTesting,
        updateDate,
        testedBy,
        verifiedBy,
        WitnessedBy,
      ];
}
