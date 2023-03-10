import '../../../../../domain/entities/equipment/Relays/AuxiliaryRelay/AR_pudo.dart';

class ARpudoModel extends ARpudo {
  const ARpudoModel({
    final int id,
    final int databaseID,
    final int trNo,
    final int arRef,
    final String coilRef,
    final double coilResistenace,
    final int pickUp,
    final String dropOff,
    final String equipmentUsed,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          arRef: arRef,
          coilRef: coilRef,
          coilResistenace: coilResistenace,
          pickUp: pickUp,
          dropOff: dropOff,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        arRef,
        coilRef,
        coilResistenace,
        pickUp,
        dropOff,
        equipmentUsed,
        updateDate,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'databaseID': databaseID,
      'trNo': trNo,
      'arRef': arRef,
      'coilRef': coilRef,
      'coilResistenace': coilResistenace,
      'pickUp': pickUp,
      'dropOff': dropOff,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
    };
  }

  factory ARpudoModel.fromJson(Map<String, dynamic> json) {
    return ARpudoModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      arRef: json['arRef'],
      coilRef: json['coilRef'],
      coilResistenace: json['coilResistenace'],
      pickUp: json['pickUp'],
      dropOff: json['dropOff'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
