import 'package:flutter_testreports/features/testreport/domain/entities/equipment/SC/surge_counter.dart';

class ScModel extends SurgeCounter {
  const ScModel({
    final String etype,
    final String designation,
    final String location,
    final String serialNo,
    final String make,
    final String equipType,
    final int yom,
    final DateTime dateOfTesting,
    final int trNo,
    final int id,
    final int databaseID,
    final String TestedBy,
    final String VerifiedBy,
    final String WitnessedBy,
    final DateTime lastUpdated,
  }) : super(
          etype: etype,
          designation: designation,
          location: location,
          serialNo: serialNo,
          make: make,
          equipType: equipType,
          dateOfTesting: dateOfTesting,
          yom: yom,
          trNo: trNo,
          id: id,
          databaseID: databaseID,
          TestedBy: TestedBy,
          VerifiedBy: VerifiedBy,
          WitnessedBy: WitnessedBy,
          updateDate: lastUpdated,
        );

  @override
  List<Object> get props => [
        etype,
        designation,
        location,
        serialNo,
        make,
        equipType,
        yom,
        dateOfTesting,
        trNo,
        id,
        databaseID,
        TestedBy,
        VerifiedBy,
        WitnessedBy,
        updateDate,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'etype': etype,
      'designation': designation,
      'location': location,
      'serialNo': serialNo,
      'make': make,
      'equipType': equipType,
      'yom': yom,
      'dateOfTesting': dateOfTesting,
      'trNo': trNo,
      'id': id,
      'databaseID': databaseID,
      'testedBy': TestedBy,
      'verifiedBy': VerifiedBy,
      'WitnessedBy': WitnessedBy,
      'updateDate': updateDate,
    };
  }

  factory ScModel.fromJson(Map<String, dynamic> json) {
    return ScModel(
      etype: json['etype'],
      designation: json['designation'],
      location: json['location'],
      serialNo: json['serialNo'],
      make: json['make'],
      equipType: json['equipType'],
      yom: json['yom'],
      dateOfTesting: json['dateOfTesting'],
      trNo: json['trNo'],
      id: json['id'],
      databaseID: json['databaseID'],
      TestedBy: json['testedBy'],
      VerifiedBy: json['verifiedBy'],
      WitnessedBy: json['WitnessedBy'],
      lastUpdated: json['updateDate'],
    );
  }
}
