// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Powttd extends Equatable {
  final int id;
  final int databaseID;
  final int trNo;
  final String serialNo;
  final String equipmentUsed;
  final DateTime updateDate;
  final double ru1;
  final double ru2;
  final double ru3;
  final double ri1;
  final double ri2;
  final double ri3;
  final double rc1;
  final double rc2;
  final double rc3;
  final double rtanD1;
  final double rtanD2;
  final double rtanD3;
  final double rp1;
  final double rp2;
  final double rp3;
  final double rVdf1;
  final double rVdf2;
  final double rVdf3;
  final double yu1;
  final double yu2;
  final double yu3;
  final double yi1;
  final double yi2;
  final double yi3;
  final double yc1;
  final double yc2;
  final double yc3;
  final double ytanD1;
  final double ytanD2;
  final double ytanD3;
  final double yp1;
  final double yp2;
  final double yp3;
  final double yVdf1;
  final double yVdf2;
  final double yVdf3;
  final double bu1;
  final double bu2;
  final double bu3;
  final double bi1;
  final double bi2;
  final double bi3;
  final double bc1;
  final double bc2;
  final double bc3;
  final double btanD1;
  final double btanD2;
  final double btanD3;
  final double bp1;
  final double bp2;
  final double bp3;
  final double bVdf1;
  final double bVdf2;
  final double bVdf3;
  final double hv_lv_u1;
  final double hv_lv_u2;
  final double hv_lv_u3;
  final double hv_lv_i1;
  final double hv_lv_i2;
  final double hv_lv_i3;
  final double hv_lv_c1;
  final double hv_lv_c2;
  final double hv_lv_c3;
  final double hv_lv_tanD1;
  final double hv_lv_tanD2;
  final double hv_lv_tanD3;
  final double hv_lv_p1;
  final double hv_lv_p2;
  final double hv_lv_p3;
  final double hv_lv_Vdf1;
  final double hv_lv_Vdf2;
  final double hv_lv_Vdf3;
  final double hvE_G_u1;
  final double hvE_G_u2;
  final double hvE_G_u3;
  final double hvE_G_i1;
  final double hvE_G_i2;
  final double hvE_G_i3;
  final double hvE_G_c1;
  final double hvE_G_c2;
  final double hvE_G_c3;
  final double hvE_G_tanD1;
  final double hvE_G_tanD2;
  final double hvE_G_tanD3;
  final double hvE_G_p1;
  final double hvE_G_p2;
  final double hvE_G_p3;
  final double hvE_G_Vdf1;
  final double hvE_G_Vdf2;
  final double hvE_G_Vdf3;
  final double hvE_Grnd_u1;
  final double hvE_Grnd_u2;
  final double hvE_Grnd_u3;
  final double hvE_Grnd_i1;
  final double hvE_Grnd_i2;
  final double hvE_Grnd_i3;
  final double hvE_Grnd_c1;
  final double hvE_Grnd_c2;
  final double hvE_Grnd_c3;
  final double hvE_Grnd_tanD1;
  final double hvE_Grnd_tanD2;
  final double hvE_Grnd_tanD3;
  final double hvE_Grnd_p1;
  final double hvE_Grnd_p2;
  final double hvE_Grnd_p3;
  final double hvE_Grnd_Vdf1;
  final double hvE_Grnd_Vdf2;
  final double hvE_Grnd_Vdf3;
  final double lvEu1;
  final double lvEu2;
  final double lvEu3;
  final double lvEi1;
  final double lvEi2;
  final double lvEi3;
  final double lvEc1;
  final double lvEc2;
  final double lvEc3;
  final double lvEtanD1;
  final double lvEtanD2;
  final double lvEtanD3;
  final double lvEp1;
  final double lvEp2;
  final double lvEp3;
  final double lvEVdf1;
  final double lvEVdf2;
  final double lvEVdf3;
  final double lvE_G_u1;
  final double lvE_G_u2;
  final double lvE_G_u3;
  final double lvE_G_i1;
  final double lvE_G_i2;
  final double lvE_G_i3;
  final double lvE_G_c1;
  final double lvE_G_c2;
  final double lvE_G_c3;
  final double lvE_G_tanD1;
  final double lvE_G_tanD2;
  final double lvE_G_tanD3;
  final double lvE_G_p1;
  final double lvE_G_p2;
  final double lvE_G_p3;
  final double lvE_G_Vdf1;
  final double lvE_G_Vdf2;
  final double lvE_G_Vdf3;
  final double lvE_Grnd_u1;
  final double lvE_Grnd_u2;
  final double lvE_Grnd_u3;
  final double lvE_Grnd_i1;
  final double lvE_Grnd_i2;
  final double lvE_Grnd_i3;
  final double lvE_Grnd_c1;
  final double lvE_Grnd_c2;
  final double lvE_Grnd_c3;
  final double lvE_Grnd_tanD1;
  final double lvE_Grnd_tanD2;
  final double lvE_Grnd_tanD3;
  final double lvE_Grnd_p1;
  final double lvE_Grnd_p2;
  final double lvE_Grnd_p3;
  final double lvE_Grnd_Vdf1;
  final double lvE_Grnd_Vdf2;
  final double lvE_Grnd_Vdf3;

  const Powttd({
    @required this.id,
    @required this.databaseID,
    @required this.trNo,
    @required this.serialNo,
    @required this.equipmentUsed,
    @required this.updateDate,
    @required this.ru1,
    @required this.ru2,
    @required this.ru3,
    @required this.ri1,
    @required this.ri2,
    @required this.ri3,
    @required this.rc1,
    @required this.rc2,
    @required this.rc3,
    @required this.rtanD1,
    @required this.rtanD2,
    @required this.rtanD3,
    @required this.rp1,
    @required this.rp2,
    @required this.rp3,
    @required this.rVdf1,
    @required this.rVdf2,
    @required this.rVdf3,
    @required this.yu1,
    @required this.yu2,
    @required this.yu3,
    @required this.yi1,
    @required this.yi2,
    @required this.yi3,
    @required this.yc1,
    @required this.yc2,
    @required this.yc3,
    @required this.ytanD1,
    @required this.ytanD2,
    @required this.ytanD3,
    @required this.yp1,
    @required this.yp2,
    @required this.yp3,
    @required this.yVdf1,
    @required this.yVdf2,
    @required this.yVdf3,
    @required this.bu1,
    @required this.bu2,
    @required this.bu3,
    @required this.bi1,
    @required this.bi2,
    @required this.bi3,
    @required this.bc1,
    @required this.bc2,
    @required this.bc3,
    @required this.btanD1,
    @required this.btanD2,
    @required this.btanD3,
    @required this.bp1,
    @required this.bp2,
    @required this.bp3,
    @required this.bVdf1,
    @required this.bVdf2,
    @required this.bVdf3,
    @required this.hv_lv_u1,
    @required this.hv_lv_u2,
    @required this.hv_lv_u3,
    @required this.hv_lv_i1,
    @required this.hv_lv_i2,
    @required this.hv_lv_i3,
    @required this.hv_lv_c1,
    @required this.hv_lv_c2,
    @required this.hv_lv_c3,
    @required this.hv_lv_tanD1,
    @required this.hv_lv_tanD2,
    @required this.hv_lv_tanD3,
    @required this.hv_lv_p1,
    @required this.hv_lv_p2,
    @required this.hv_lv_p3,
    @required this.hv_lv_Vdf1,
    @required this.hv_lv_Vdf2,
    @required this.hv_lv_Vdf3,
    @required this.hvE_G_u1,
    @required this.hvE_G_u2,
    @required this.hvE_G_u3,
    @required this.hvE_G_i1,
    @required this.hvE_G_i2,
    @required this.hvE_G_i3,
    @required this.hvE_G_c1,
    @required this.hvE_G_c2,
    @required this.hvE_G_c3,
    @required this.hvE_G_tanD1,
    @required this.hvE_G_tanD2,
    @required this.hvE_G_tanD3,
    @required this.hvE_G_p1,
    @required this.hvE_G_p2,
    @required this.hvE_G_p3,
    @required this.hvE_G_Vdf1,
    @required this.hvE_G_Vdf2,
    @required this.hvE_G_Vdf3,
    @required this.hvE_Grnd_u1,
    @required this.hvE_Grnd_u2,
    @required this.hvE_Grnd_u3,
    @required this.hvE_Grnd_i1,
    @required this.hvE_Grnd_i2,
    @required this.hvE_Grnd_i3,
    @required this.hvE_Grnd_c1,
    @required this.hvE_Grnd_c2,
    @required this.hvE_Grnd_c3,
    @required this.hvE_Grnd_tanD1,
    @required this.hvE_Grnd_tanD2,
    @required this.hvE_Grnd_tanD3,
    @required this.hvE_Grnd_p1,
    @required this.hvE_Grnd_p2,
    @required this.hvE_Grnd_p3,
    @required this.hvE_Grnd_Vdf1,
    @required this.hvE_Grnd_Vdf2,
    @required this.hvE_Grnd_Vdf3,
    @required this.lvEu1,
    @required this.lvEu2,
    @required this.lvEu3,
    @required this.lvEi1,
    @required this.lvEi2,
    @required this.lvEi3,
    @required this.lvEc1,
    @required this.lvEc2,
    @required this.lvEc3,
    @required this.lvEtanD1,
    @required this.lvEtanD2,
    @required this.lvEtanD3,
    @required this.lvEp1,
    @required this.lvEp2,
    @required this.lvEp3,
    @required this.lvEVdf1,
    @required this.lvEVdf2,
    @required this.lvEVdf3,
    @required this.lvE_G_u1,
    @required this.lvE_G_u2,
    @required this.lvE_G_u3,
    @required this.lvE_G_i1,
    @required this.lvE_G_i2,
    @required this.lvE_G_i3,
    @required this.lvE_G_c1,
    @required this.lvE_G_c2,
    @required this.lvE_G_c3,
    @required this.lvE_G_tanD1,
    @required this.lvE_G_tanD2,
    @required this.lvE_G_tanD3,
    @required this.lvE_G_p1,
    @required this.lvE_G_p2,
    @required this.lvE_G_p3,
    @required this.lvE_G_Vdf1,
    @required this.lvE_G_Vdf2,
    @required this.lvE_G_Vdf3,
    @required this.lvE_Grnd_u1,
    @required this.lvE_Grnd_u2,
    @required this.lvE_Grnd_u3,
    @required this.lvE_Grnd_i1,
    @required this.lvE_Grnd_i2,
    @required this.lvE_Grnd_i3,
    @required this.lvE_Grnd_c1,
    @required this.lvE_Grnd_c2,
    @required this.lvE_Grnd_c3,
    @required this.lvE_Grnd_tanD1,
    @required this.lvE_Grnd_tanD2,
    @required this.lvE_Grnd_tanD3,
    @required this.lvE_Grnd_p1,
    @required this.lvE_Grnd_p2,
    @required this.lvE_Grnd_p3,
    @required this.lvE_Grnd_Vdf1,
    @required this.lvE_Grnd_Vdf2,
    @required this.lvE_Grnd_Vdf3,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        trNo,
        serialNo,
        equipmentUsed,
        updateDate,
        ru1,
        ru2,
        ru3,
        ri1,
        ri2,
        ri3,
        rc1,
        rc2,
        rc3,
        rtanD1,
        rtanD2,
        rtanD3,
        rp1,
        rp2,
        rp3,
        rVdf1,
        rVdf2,
        rVdf3,
        yu1,
        yu2,
        yu3,
        yi1,
        yi2,
        yi3,
        yc1,
        yc2,
        yc3,
        ytanD1,
        ytanD2,
        ytanD3,
        yp1,
        yp2,
        yp3,
        yVdf1,
        yVdf2,
        yVdf3,
        bu1,
        bu2,
        bu3,
        bi1,
        bi2,
        bi3,
        bc1,
        bc2,
        bc3,
        btanD1,
        btanD2,
        btanD3,
        bp1,
        bp2,
        bp3,
        bVdf1,
        bVdf2,
        bVdf3,
        hv_lv_u1,
        hv_lv_u2,
        hv_lv_u3,
        hv_lv_i1,
        hv_lv_i2,
        hv_lv_i3,
        hv_lv_c1,
        hv_lv_c2,
        hv_lv_c3,
        hv_lv_tanD1,
        hv_lv_tanD2,
        hv_lv_tanD3,
        hv_lv_p1,
        hv_lv_p2,
        hv_lv_p3,
        hv_lv_Vdf1,
        hv_lv_Vdf2,
        hv_lv_Vdf3,
        hvE_G_u1,
        hvE_G_u2,
        hvE_G_u3,
        hvE_G_i1,
        hvE_G_i2,
        hvE_G_i3,
        hvE_G_c1,
        hvE_G_c2,
        hvE_G_c3,
        hvE_G_tanD1,
        hvE_G_tanD2,
        hvE_G_tanD3,
        hvE_G_p1,
        hvE_G_p2,
        hvE_G_p3,
        hvE_G_Vdf1,
        hvE_G_Vdf2,
        hvE_G_Vdf3,
        hvE_Grnd_u1,
        hvE_Grnd_u2,
        hvE_Grnd_u3,
        hvE_Grnd_i1,
        hvE_Grnd_i2,
        hvE_Grnd_i3,
        hvE_Grnd_c1,
        hvE_Grnd_c2,
        hvE_Grnd_c3,
        hvE_Grnd_tanD1,
        hvE_Grnd_tanD2,
        hvE_Grnd_tanD3,
        hvE_Grnd_p1,
        hvE_Grnd_p2,
        hvE_Grnd_p3,
        hvE_Grnd_Vdf1,
        hvE_Grnd_Vdf2,
        hvE_Grnd_Vdf3,
        lvEu1,
        lvEu2,
        lvEu3,
        lvEi1,
        lvEi2,
        lvEi3,
        lvEc1,
        lvEc2,
        lvEc3,
        lvEtanD1,
        lvEtanD2,
        lvEtanD3,
        lvEp1,
        lvEp2,
        lvEp3,
        lvEVdf1,
        lvEVdf2,
        lvEVdf3,
        lvE_G_u1,
        lvE_G_u2,
        lvE_G_u3,
        lvE_G_i1,
        lvE_G_i2,
        lvE_G_i3,
        lvE_G_c1,
        lvE_G_c2,
        lvE_G_c3,
        lvE_G_tanD1,
        lvE_G_tanD2,
        lvE_G_tanD3,
        lvE_G_p1,
        lvE_G_p2,
        lvE_G_p3,
        lvE_G_Vdf1,
        lvE_G_Vdf2,
        lvE_G_Vdf3,
        lvE_Grnd_u1,
        lvE_Grnd_u2,
        lvE_Grnd_u3,
        lvE_Grnd_i1,
        lvE_Grnd_i2,
        lvE_Grnd_i3,
        lvE_Grnd_c1,
        lvE_Grnd_c2,
        lvE_Grnd_c3,
        lvE_Grnd_tanD1,
        lvE_Grnd_tanD2,
        lvE_Grnd_tanD3,
        lvE_Grnd_p1,
        lvE_Grnd_p2,
        lvE_Grnd_p3,
        lvE_Grnd_Vdf1,
        lvE_Grnd_Vdf2,
        lvE_Grnd_Vdf3,
      ];
}
