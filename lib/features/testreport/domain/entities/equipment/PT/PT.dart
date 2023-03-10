// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PT extends Equatable {
  final int id;
  final int databaseID;
  final String etype;
  final int trNo;
  final String designation;
  final String location;
  final String make;
  final String panel;
  final String serialNo_Rph;
  final String serialNo_Yph;
  final String serialNo_Bph;
  final int pRatio;
  final int sRatio;
  final int noOfCores;
  // final int noOfTaps;
  final int yom;
  final DateTime dateOfTesting;
  final DateTime updateDate;
  final String testedBy;
  final String verifiedBy;
  final String WitnessedBy;
  final int ratedVoltage;
  // final String connectedTap;

  const PT({
    @required this.serialNo_Rph,
    @required this.serialNo_Yph,
    @required this.serialNo_Bph,
    @required this.pRatio,
    @required this.sRatio,
    @required this.noOfCores,
    // @required this.noOfTaps,
    @required this.updateDate,
    @required this.testedBy,
    @required this.verifiedBy,
    @required this.etype,
    @required this.designation,
    @required this.location,
    @required this.panel,
    @required this.make,
    @required this.yom,
    @required this.dateOfTesting,
    @required this.trNo,
    @required this.WitnessedBy,
    @required this.ratedVoltage,
    @required this.databaseID,
    @required this.id,
    // @required this.connectedTap,
  });

  @override
  List<Object> get props => [
        serialNo_Rph,
        serialNo_Yph,
        serialNo_Bph,
        pRatio,
        sRatio,
        noOfCores,
        // noOfTaps,
        updateDate,
        testedBy,
        verifiedBy,
        etype,
        designation,
        location,
        panel,
        make,
        yom,
        dateOfTesting,
        trNo,
        WitnessedBy,
        ratedVoltage,
        databaseID,
        id,
        // connectedTap,
      ];
}
