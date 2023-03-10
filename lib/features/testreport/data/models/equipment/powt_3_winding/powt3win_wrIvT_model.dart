import '../../../../domain/entities/equipment/powt_3_winding/powt3win_wrIvT.dart';

class Powt3winwrIvTModel extends Powt3winwrIvT {
  const Powt3winwrIvTModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final double ivt_r_uvn,
    final double ivt_r_vwn,
    final double ivt_r_wun,
    final int tapPosition,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          tapPosition: tapPosition,
          ivt_r_uvn: ivt_r_uvn,
          ivt_r_vwn: ivt_r_vwn,
          ivt_r_wun: ivt_r_wun,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        ivt_r_uvn,
        ivt_r_vwn,
        ivt_r_wun,
        tapPosition,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'databaseID': databaseID,
      'trNo': trNo,
      'serialNo': serialNo,
      'ivt_r_uvn': ivt_r_uvn,
      'ivt_r_vwn': ivt_r_vwn,
      'ivt_r_wun': ivt_r_wun,
      'tapPosition': tapPosition,
    };
  }

  factory Powt3winwrIvTModel.fromJson(Map<String, dynamic> json) {
    return Powt3winwrIvTModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      ivt_r_uvn: json['ivt_r_uvn'],
      ivt_r_vwn: json['ivt_r_vwn'],
      ivt_r_wun: json['ivt_r_wun'],
      tapPosition: json['tapPosition'],
    );
  }
}
