import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EnergyMeterApTest extends Equatable {
  final int trNo;
  final int id;
  final int databaseID;
  final double initialTestMeterReading;
  final double afterTestMeterReading;
  final double testMeterReading_R;
  final double initialStandardMeterReading;
  final double afterStandardMeterReading;
  final double standardMeterReading_A;
  final String serialNo;
  final String EquipmentType;
  final DateTime updateDate;

  const EnergyMeterApTest({
    @required this.id,
    @required this.trNo,
    @required this.serialNo,
    @required this.databaseID,
    @required this.EquipmentType,
    @required this.initialTestMeterReading,
    @required this.initialStandardMeterReading,
    @required this.afterTestMeterReading,
    @required this.afterStandardMeterReading,
    @required this.testMeterReading_R,
    @required this.standardMeterReading_A,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        trNo,
        serialNo,
        databaseID,
        EquipmentType,
        initialTestMeterReading,
        afterTestMeterReading,
        testMeterReading_R,
        initialStandardMeterReading,
        afterStandardMeterReading,
        standardMeterReading_A,
        updateDate,
      ];
}
