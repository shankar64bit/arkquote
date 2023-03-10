import '../../../../domain/entities/equipment/CT/CT_tap.dart';

class CT_tap_Model extends CT_tap {
  const CT_tap_Model({
    final int id,
    final int databaseID,
    final String tapName,
    final int ratio,
    final int kneePointVoltage,
    final int leakageCurrent,
    final int coreRef,
    final DateTime updateDate,
  }) : super(
          id: id,
          databaseID: databaseID,
          tapName: tapName,
          ratio: ratio,
          kneePointVoltage: kneePointVoltage,
          leakageCurrent: leakageCurrent,
          coreRef: coreRef,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        tapName,
        ratio,
        kneePointVoltage,
        leakageCurrent,
        coreRef,
        updateDate,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'databaseID': databaseID,
      'tapName': tapName,
      'ratio': ratio,
      'kneePointVoltage': kneePointVoltage,
      'leakageCurrent': leakageCurrent,
      'coreRef': coreRef,
      'updateDate': updateDate,
    };
  }

  factory CT_tap_Model.fromJson(Map<String, dynamic> json) {
    return CT_tap_Model(
        id: json['id'],
        databaseID: json['databaseID'],
        tapName: json['tapName'],
        ratio: json['ratio'],
        kneePointVoltage: json['kneePointVoltage'],
        leakageCurrent: json['leakageCurrent'],
        coreRef: json['coreRef'],
        updateDate: json['updateDate']);
  }
}
