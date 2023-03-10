// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PTcoreIR extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;

  final double peR;
  final double peY;
  final double peB;
  final double pc1R;
  final double pc2R;
  final double pc3R;

  final double pc1Y;
  final double pc2Y;
  final double pc3Y;

  final double pc1B;
  final double pc2B;
  final double pc3B;

  final double c1eR;
  final double c2eR;
  final double c3eR;

  final double c1eY;
  final double c2eY;
  final double c3eY;

  final double c1eB;
  final double c2eB;
  final double c3eB;

  final double c1c2R;
  final double c1c2Y;
  final double c1c2B;

  final double c2c3R;
  final double c2c3Y;
  final double c2c3B;

  final double clc1R;
  final double clc1Y;
  final double clc1B;

  const PTcoreIR({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.peR,
    @required this.peY,
    @required this.peB,
    @required this.pc1R,
    @required this.pc2R,
    @required this.pc3R,
    @required this.pc1Y,
    @required this.pc2Y,
    @required this.pc3Y,
    @required this.pc1B,
    @required this.pc2B,
    @required this.pc3B,
    @required this.c1eR,
    @required this.c2eR,
    @required this.c3eR,
    @required this.c1eY,
    @required this.c2eY,
    @required this.c3eY,
    @required this.c1eB,
    @required this.c2eB,
    @required this.c3eB,
    @required this.c1c2R,
    @required this.c1c2Y,
    @required this.c1c2B,
    @required this.c2c3R,
    @required this.c2c3Y,
    @required this.c2c3B,
    @required this.clc1R,
    @required this.clc1Y,
    @required this.clc1B,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
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
        pc1Y,
        pc2Y,
        pc3Y,
        pc1B,
        pc2B,
        pc3B,
        c1eR,
        c2eR,
        c3eR,
        c1eY,
        c2eY,
        c3eY,
        c1eB,
        c2eB,
        c3eB,
        c1c2R,
        c1c2Y,
        c1c2B,
        c2c3R,
        c2c3Y,
        c2c3B,
        clc1R,
        clc1Y,
        clc1B,
      ];
}
