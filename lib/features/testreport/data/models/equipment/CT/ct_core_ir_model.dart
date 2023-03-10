import 'package:flutter_testreports/features/testreport/domain/entities/equipment/CT/CT_core_ir.dart';

class CTcoreIRModel extends CTcoreIR {
  const CTcoreIRModel({
    final int id,
    final int databaseID,
    final int trNo,
    final String serialNo,
    final String equipmentUsed,
    final DateTime updateDate,
    final double peR,
    final double peY,
    final double peB,
    final double pc1R,
    final double pc2R,
    final double pc3R,
    final double pc4R,
    final double pc5R,
    final double pc1Y,
    final double pc2Y,
    final double pc3Y,
    final double pc4Y,
    final double pc5Y,
    final double pc1B,
    final double pc2B,
    final double pc3B,
    final double pc4B,
    final double pc5B,
    final double c1eR,
    final double c2eR,
    final double c3eR,
    final double c4eR,
    final double c5eR,
    final double c1eY,
    final double c2eY,
    final double c3eY,
    final double c4eY,
    final double c5eY,
    final double c1eB,
    final double c2eB,
    final double c3eB,
    final double c4eB,
    final double c5eB,
    final double c1c2R,
    final double c1c2Y,
    final double c1c2B,
    final double c2c3R,
    final double c2c3Y,
    final double c2c3B,
    final double c3c4R,
    final double c3c4Y,
    final double c3c4B,
    final double c4c5R,
    final double c4c5Y,
    final double c4c5B,
    final double clc1R,
    final double clc1Y,
    final double clc1B,
  }) : super(
          databaseID: databaseID,
          id: id,
          trNo: trNo,
          serialNo: serialNo,
          equipmentUsed: equipmentUsed,
          updateDate: updateDate,
          peR: peR,
          peY: peY,
          peB: peB,
          pc1R: pc1R,
          pc2R: pc2R,
          pc3R: pc3R,
          pc4R: pc4R,
          pc5R: pc5R,
          pc1Y: pc1Y,
          pc2Y: pc2Y,
          pc3Y: pc3Y,
          pc4Y: pc4Y,
          pc5Y: pc5Y,
          pc1B: pc1B,
          pc2B: pc2B,
          pc3B: pc3B,
          pc4B: pc4B,
          pc5B: pc5B,
          c1eR: c1eR,
          c2eR: c2eR,
          c3eR: c3eR,
          c4eR: c4eR,
          c5eR: c5eR,
          c1eY: c1eY,
          c2eY: c2eY,
          c3eY: c3eY,
          c4eY: c4eY,
          c5eY: c5eY,
          c1eB: c1eB,
          c2eB: c2eB,
          c3eB: c3eB,
          c4eB: c4eB,
          c5eB: c5eB,
          c1c2R: c1c2R,
          c1c2Y: c1c2Y,
          c1c2B: c1c2B,
          c2c3R: c2c3R,
          c2c3Y: c2c3Y,
          c2c3B: c2c3B,
          c3c4R: c3c4R,
          c3c4Y: c3c4Y,
          c3c4B: c3c4B,
          c4c5R: c4c5R,
          c4c5Y: c4c5Y,
          c4c5B: c4c5B,
          clc1R: clc1R,
          clc1Y: clc1Y,
          clc1B: clc1B,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        peR,
        peY,
        peB,
        pc1R,
        pc2R,
        pc3R,
        pc4R,
        pc5R,
        pc1Y,
        pc2Y,
        pc3Y,
        pc4Y,
        pc5Y,
        pc1B,
        pc2B,
        pc3B,
        pc4B,
        pc5B,
        c1eR,
        c2eR,
        c3eR,
        c4eR,
        c5eR,
        c1eY,
        c2eY,
        c3eY,
        c4eY,
        c5eY,
        c1eB,
        c2eB,
        c3eB,
        c4eB,
        c5eB,
        c1c2R,
        c1c2Y,
        c1c2B,
        c2c3R,
        c2c3Y,
        c2c3B,
        c3c4R,
        c3c4Y,
        c3c4B,
        c4c5R,
        c4c5Y,
        c4c5B,
        clc1R,
        clc1Y,
        clc1B,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'databaseID': databaseID,
      'trNo': trNo,
      'serialNo': serialNo,
      'equipmentUsed': equipmentUsed,
      'updateDate': updateDate,
      'peR': peR,
      'peY': peY,
      'peB': peB,
      'pc1R': pc1R,
      'pc2R': pc2R,
      'pc3R': pc3R,
      'pc4R': pc4R,
      'pc5R': pc5R,
      'pc1Y': pc1Y,
      'pc2Y': pc2Y,
      'pc3Y': pc3Y,
      'pc4Y': pc4Y,
      'pc5Y': pc5Y,
      'pc1B': pc1B,
      'pc2B': pc2B,
      'pc3B': pc3B,
      'pc4B': pc4B,
      'pc5B': pc5B,
      'c1eR': c1eR,
      'c2eR': c2eR,
      'c3eR': c3eR,
      'c4eR': c4eR,
      'c5eR': c5eR,
      'c1eY': c1eY,
      'c2eY': c2eY,
      'c3eY': c3eY,
      'c4eY': c4eY,
      'c5eY': c5eY,
      'c1eB': c1eB,
      'c2eB': c2eB,
      'c3eB': c3eB,
      'c4eB': c4eB,
      'c5eB': c5eB,
      'c1c2R': c1c2R,
      'c1c2Y': c1c2Y,
      'c1c2B': c1c2B,
      'c2c3R': c2c3R,
      'c2c3Y': c2c3Y,
      'c2c3B': c2c3B,
      'c3c4R': c3c4R,
      'c3c4Y': c3c4Y,
      'c3c4B': c3c4B,
      'c4c5R': c4c5R,
      'c4c5Y': c4c5Y,
      'c4c5B': c4c5B,
      'clc1R': clc1R,
      'clc1Y': clc1Y,
      'clc1B': clc1B,
    };
  }

  factory CTcoreIRModel.fromJson(Map<String, dynamic> json) {
    return CTcoreIRModel(
      id: json['id'],
      databaseID: json['databaseID'],
      trNo: json['trNo'],
      serialNo: json['serialNo'],
      equipmentUsed: json['equipmentUsed'],
      updateDate: json['updateDate'],
      peR: json['peR'],
      peY: json['peY'],
      peB: json['peB'],
      pc1R: json['pc1R'],
      pc2R: json['pc2R'],
      pc3R: json['pc3R'],
      pc4R: json['pc4R'],
      pc5R: json['pc5R'],
      pc1Y: json['pc1Y'],
      pc2Y: json['pc2Y'],
      pc3Y: json['pc3Y'],
      pc4Y: json['pc4Y'],
      pc5Y: json['pc5Y'],
      pc1B: json['pc1B'],
      pc2B: json['pc2B'],
      pc3B: json['pc3B'],
      pc4B: json['pc4B'],
      pc5B: json['pc5B'],
      c1eR: json['c1eR'],
      c2eR: json['c2eR'],
      c3eR: json['c3eR'],
      c4eR: json['c4eR'],
      c5eR: json['c5eR'],
      c1eY: json['c1eY'],
      c2eY: json['c2eY'],
      c3eY: json['c3eY'],
      c4eY: json['c4eY'],
      c5eY: json['c5eY'],
      c1eB: json['c1eB'],
      c2eB: json['c2eB'],
      c3eB: json['c3eB'],
      c4eB: json['c4eB'],
      c5eB: json['c5eB'],
      c1c2R: json['c1c2R'],
      c1c2Y: json['c1c2Y'],
      c1c2B: json['c1c2B'],
      c2c3R: json['c2c3R'],
      c2c3Y: json['c2c3Y'],
      c2c3B: json['c2c3B'],
      c3c4R: json['c3c4R'],
      c3c4Y: json['c3c4Y'],
      c3c4B: json['c3c4B'],
      c4c5R: json['c4c5R'],
      c4c5Y: json['c4c5Y'],
      c4c5B: json['c4c5B'],
      clc1R: json['clc1R'],
      clc1Y: json['clc1Y'],
      clc1B: json['clc1B'],
    );
  }
}