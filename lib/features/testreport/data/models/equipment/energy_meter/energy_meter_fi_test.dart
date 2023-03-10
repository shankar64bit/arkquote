import '../../../../domain/entities/equipment/energy_meter/energy_meter_fi.dart';

class EnergyMeterFiTestModel extends EnergyMeterFiTest {
  const EnergyMeterFiTestModel({
    final int id,
    final double yr,
    final double ya,
    final double br,
    final double ba,
    final double rr,
    final double ra,
    final int trNo,
    final int databaseID,
    final String serialNo,
    final String EquipmentType,
    final DateTime updateDate,
  }) : super(
          id: id,
          trNo: trNo,
          yr: yr,
          ya: ya,
          br: br,
          ba: ba,
          rr: rr,
          ra: ra,
          databaseID: databaseID,
          serialNo: serialNo,
          EquipmentType: EquipmentType,
          updateDate: updateDate,
        );

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trNo': trNo,
      'yr': yr,
      'ya': ya,
      'br': br,
      'ba': ba,
      'rr': rr,
      'ra': ra,
      'databaseID': databaseID,
      'serialNo': serialNo,
      'equipmentUsed': EquipmentType,
      'updateDate': updateDate,
    };
  }

  factory EnergyMeterFiTestModel.fromJson(Map<String, dynamic> json) {
    return EnergyMeterFiTestModel(
      id: json['id'],
      trNo: json['trNo'],
      yr: json['yr'],
      ya: json['ya'],
      br: json['br'],
      ba: json['ba'],
      rr: json['rr'],
      ra: json['ra'],
      databaseID: json['databaseID'],
      serialNo: json['serialNo'],
      EquipmentType: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
