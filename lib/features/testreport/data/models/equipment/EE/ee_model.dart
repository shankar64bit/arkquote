import 'package:flutter_testreports/features/testreport/domain/entities/equipment/EE/earth_electrode.dart';

class EEModel extends EE {
  const EEModel({
    final String etype,
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
          dateOfTesting: dateOfTesting,
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

  factory EEModel.fromJson(Map<String, dynamic> json) {
    return EEModel(
      etype: json['etype'],
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
