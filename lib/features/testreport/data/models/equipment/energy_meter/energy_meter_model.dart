import '../../../../domain/entities/equipment/energy_meter/energy_meter.dart';

class EnergyMeterModel extends EnergyMeter {
  const EnergyMeterModel({
    final String etype,
    final int trNo,
    final String designation,
    final String location,
    final String panel,
    final String serialNo,
    final String make,
    final int voltage,
    final double eqClass,
    final int frequency,
    final DateTime dateOfTesting,
    final int id,
    final int databaseID,
    final String TestedBy,
    final String VerifiedBy,
    final String WitnessedBy,
    final DateTime updateDate,
    final String ctr,
    final String ptr,
  }) : super(
          etype: etype,
          trNo: trNo,
          designation: designation,
          location: location,
          panel: panel,
          serialNo: serialNo,
          make: make,
          voltage: voltage,
          eqClass: eqClass,
          frequency: frequency,
          dateOfTesting: dateOfTesting,
          id: id,
          databaseID: databaseID,
          TestedBy: TestedBy,
          VerifiedBy: VerifiedBy,
          WitnessedBy: WitnessedBy,
          updateDate: updateDate,
          ctr: ctr,
          ptr: ptr,
        );

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

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'etype': etype,
      'trNo': trNo,
      'designation': designation,
      'location': location,
      'panel': panel,
      'serialNo': serialNo,
      'make': make,
      'voltage': voltage,
      'eqClass': eqClass,
      'frequency': frequency,
      'dateOfTesting': dateOfTesting,
      'id': id,
      'databaseID': databaseID,
      'TestedBy': TestedBy,
      'VerifiedBy': VerifiedBy,
      'WitnessedBy': WitnessedBy,
      'updateDate': updateDate,
      'ctr': ctr,
      'ptr': ptr,
    };
  }

  factory EnergyMeterModel.fromJson(Map<String, dynamic> json) {
    return EnergyMeterModel(
      etype: json['etype'],
      designation: json['designation'],
      location: json['location'],
      panel: json['panel'],
      serialNo: json['serialNo'],
      make: json['make'],
      eqClass: json['eqClass'],
      frequency: json['frequency'],
      voltage: json['voltage'],
      dateOfTesting: json['dateOfTesting'],
      trNo: json['trNo'],
      id: json['id'],
      databaseID: json['databaseID'],
      TestedBy: json['TestedBy'],
      VerifiedBy: json['VerifiedBy'],
      WitnessedBy: json['WitnessedBy'],
      updateDate: json['updateDate'],
      ctr: json['ctr'],
      ptr: json['ptr'],
    );
  }
}
