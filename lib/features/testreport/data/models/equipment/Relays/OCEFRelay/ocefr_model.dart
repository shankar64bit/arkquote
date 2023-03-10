import '../../../../../domain/entities/equipment/Relays/OCEFRelay/ocefrelay.dart';

class OcEfrModel extends OCEFRelay {
  const OcEfrModel({
    final int id,
    final int databaseID,
    final String etype,
    final int trNo,
    final String designation,
    final String location,
    final String serialNo_Rph,
    final String serialNo_Yph,
    final String serialNo_Bph,
    final String panel,
    final String make,
    final String rtype,
    final String auxVoltage,
    final String ctRatio,
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
          serialNo_Rph: serialNo_Rph,
          serialNo_Yph: serialNo_Yph,
          serialNo_Bph: serialNo_Bph,
          panel: panel,
          make: make,
          rtype: rtype,
          auxVoltage: auxVoltage,
          ctRatio: ctRatio,
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
      'serialNo_Rph': serialNo_Rph,
      'serialNo_Yph': serialNo_Yph,
      'serialNo_Bph': serialNo_Bph,
      'panel': panel,
      'make': make,
      'rtype': rtype,
      'auxVoltage': auxVoltage,
      'ctRatio': ctRatio,
      'dateOfTesting': dateOfTesting,
      'updateDate': updateDate,
      'testedBy': testedBy,
      'verifiedBy': verifiedBy,
      'WitnessedBy': WitnessedBy,
    };
  }

  factory OcEfrModel.fromJson(Map<String, dynamic> json) {
    return OcEfrModel(
      id: json['id'],
      databaseID: json['databaseID'],
      etype: json['etype'],
      trNo: json['trNo'],
      designation: json['designation'],
      location: json['location'],
      serialNo_Rph: json['serialNo_Rph'],
      serialNo_Yph: json['serialNo_Yph'],
      serialNo_Bph: json['serialNo_Bph'],
      panel: json['panel'],
      make: json['make'],
      rtype: json['rtype'],
      auxVoltage: json['auxVoltage'],
      ctRatio: json['ctRatio'],
      dateOfTesting: json['dateOfTesting'],
      updateDate: json['updateDate'],
      testedBy: json['testedBy'],
      verifiedBy: json['verifiedBy'],
      WitnessedBy: json['WitnessedBy'],
    );
  }
}
