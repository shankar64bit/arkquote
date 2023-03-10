import '../../../../domain/entities/equipment/energy_meter/energy_meter_rp.dart';

class EnergyMeterRpTestModel extends EnergyMeterRpTest {
  const EnergyMeterRpTestModel({
    final int id,
    final double initialTestMeterReading,
    final double afterTestMeterReading,
    final double testMeterReading_R,
    final double initialStandardMeterReading,
    final double afterStandardMeterReading,
    final double standardMeterReading_A,
    final int trNo,
    final int databaseID,
    final String serialNo,
    final String EquipmentType,
    final DateTime updateDate,
  }) : super(
          id: id,
          initialTestMeterReading: initialTestMeterReading,
          afterTestMeterReading: afterTestMeterReading,
          testMeterReading_R: testMeterReading_R,
          initialStandardMeterReading: initialStandardMeterReading,
          afterStandardMeterReading: afterStandardMeterReading,
          standardMeterReading_A: standardMeterReading_A,
          trNo: trNo,
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
      'initialTestMeterReading': initialTestMeterReading,
      'afterTestMeterReading': afterTestMeterReading,
      'testMeterReading_R': testMeterReading_R,
      'initialStandardMeterReading': initialStandardMeterReading,
      'afterStandardMeterReading': afterStandardMeterReading,
      'standardMeterReading_A': standardMeterReading_A,
      'trNo': trNo,
      'databaseID': databaseID,
      'serialNo': serialNo,
      'equipmentUsed': EquipmentType,
      'updateDate': updateDate,
    };
  }

  factory EnergyMeterRpTestModel.fromJson(Map<String, dynamic> json) {
    return EnergyMeterRpTestModel(
      id: json['id'],
      initialTestMeterReading: json['initialTestMeterReading'],
      afterTestMeterReading: json['afterTestMeterReading'],
      testMeterReading_R: json['testMeterReading_R'],
      initialStandardMeterReading: json['initialStandardMeterReading'],
      afterStandardMeterReading: json['afterStandardMeterReading'],
      standardMeterReading_A: json['standardMeterReading_A'],
      trNo: json['trNo'],
      databaseID: json['databaseID'],
      serialNo: json['serialNo'],
      EquipmentType: json['equipmentUsed'],
      updateDate: json['updateDate'],
    );
  }
}
