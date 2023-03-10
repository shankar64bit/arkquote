import '../../../../../domain/entities/equipment/Relays/FPrelay/FPrelay.dart';

class FPrelayModel extends FPrelay {
  const FPrelayModel({
    final int id,
    final int databaseID,
    final String etype,
    final int trNo,
    final String designation,
    final String location,
    final String serialNo,
    final String panel,
    final String make,
    final String rtype,
    final String auxVoltage,
    final int ctRatioPri,
    final int ctRatioSec,
    final int ptRatio,
    final DateTime dateOfTesting,
    final DateTime updateDate,
    final String testedBy,
    final String verifiedBy,
    final String WitnessedBy,
  }) : super(
          id: id,
          databaseID: databaseID,
          etype: etype,
          trNo: trNo,
          designation: designation,
          location: location,
          serialNo: serialNo,
          panel: panel,
          make: make,
          rtype: rtype,
          auxVoltage: auxVoltage,
          ctRatioPri: ctRatioPri,
          ctRatioSec: ctRatioSec,
          ptRatio: ptRatio,
          dateOfTesting: dateOfTesting,
          updateDate: updateDate,
          testedBy: testedBy,
          verifiedBy: verifiedBy,
          WitnessedBy: WitnessedBy,
        );

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
        ctRatioPri,
        ctRatioSec,
        ptRatio,
        dateOfTesting,
        updateDate,
        testedBy,
        verifiedBy,
        WitnessedBy,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'databaseID': databaseID,
      'etype': etype,
      'trNo': trNo,
      'designation': designation,
      'location': location,
      'serialNo': serialNo,
      'panel': panel,
      'make': make,
      'rtype': rtype,
      'auxVoltage': auxVoltage,
      'ctRatioPri': ctRatioPri,
      'ctRatioSec': ctRatioSec,
      'ptRatio': ptRatio,
      'dateOfTesting': dateOfTesting,
      'updateDate': updateDate,
      'testedBy': testedBy,
      'verifiedBy': verifiedBy,
      'WitnessedBy': WitnessedBy,
    };
  }

  factory FPrelayModel.fromJson(Map<String, dynamic> json) {
    return FPrelayModel(
      id: json['id'],
      databaseID: json['databaseID'],
      etype: json['etype'],
      trNo: json['trNo'],
      designation: json['designation'],
      location: json['location'],
      serialNo: json['serialNo'],
      panel: json['panel'],
      make: json['make'],
      rtype: json['rtype'],
      auxVoltage: json['auxVoltage'],
      ctRatioPri: json['ctRatioPri'],
      ctRatioSec: json['ctRatioSec'],
      ptRatio: json['ptRatio'],
      dateOfTesting: json['dateOfTesting'],
      updateDate: json['updateDate'],
      testedBy: json['testedBy'],
      verifiedBy: json['verifiedBy'],
      WitnessedBy: json['WitnessedBy'],
    );
  }
}
