// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class It extends Equatable {
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
  final double ratedCurrent_HV;
  final double ratedCurrent_LV;
  final String vectorGroup;
  final double impedanceVoltage_HV_LV1;
  final double impedanceVoltage_HV_LV2;
  final double impedanceVoltage_HV_LV3;
  final double impedanceVoltage_HV_LV4;
  final double impedanceVoltage_LV_LV;
  final int frequency;
  final String typeOfCooling;
  final int noOfPhases;
  final String make;
  final int yom;
  final int noOfTaps;
  final int noOfNominalTaps;
  final int oilTemp;
  final int windingTemp;
  final int ambientTemp;
  final DateTime dateOfTesting;
  final DateTime updateDate;
  final String testedBy;
  final String verifiedBy;
  final String WitnessedBy;

  const It({
    @required this.etype,
    @required this.designation,
    @required this.location,
    @required this.rating,
    @required this.ratedVoltage_HV,
    @required this.ratedVoltage_LV,
    @required this.ratedCurrent_HV,
    @required this.ratedCurrent_LV,
    @required this.vectorGroup,
    @required this.impedanceVoltage_HV_LV1,
    @required this.impedanceVoltage_HV_LV2,
    @required this.impedanceVoltage_HV_LV3,
    @required this.impedanceVoltage_HV_LV4,
    @required this.impedanceVoltage_LV_LV,
    @required this.frequency,
    @required this.typeOfCooling,
    @required this.noOfPhases,
    @required this.make,
    @required this.yom,
    @required this.noOfTaps,
    @required this.noOfNominalTaps,
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
        impedanceVoltage_HV_LV1,
        impedanceVoltage_HV_LV2,
        impedanceVoltage_HV_LV3,
        impedanceVoltage_HV_LV4,
        impedanceVoltage_LV_LV,
        frequency,
        typeOfCooling,
        noOfPhases,
        make,
        yom,
        noOfTaps,
        noOfNominalTaps,
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
