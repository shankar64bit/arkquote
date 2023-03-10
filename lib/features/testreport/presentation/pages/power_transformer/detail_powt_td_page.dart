import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/powt/powt_td_model.dart';
import '../../providers/powt_provider/powt_td_provider.dart';

class Detail_Powttd_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_Powttd_page(@required this.args, {Key key}) : super(key: key);

  PowttdModel powttdModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((PowttdProvider x) => x.getPowttdById(args['id']));
    PowttdModel ntr = watchOnly((PowttdProvider x) => x.powttd_Model);

    print(ntr);
    print("ntr  PowtTD......");
    var mob = const Text('PowtTD Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('PowtTD Test Details', style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            return desk;
          } else {
            return mob;
          }
        }),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/edit_Powttd', arguments: {
                  'id': args['id'],
                  'POWT_ID': args['POWT_ID'],
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((PowttdProvider x) => x.deletePowttd(args['id']));
              Navigator.popAndPushNamed(context, '/detail_Powttd', arguments: {
                'id': args['id'],
                'trDatabaseID': args['trDatabaseID']
              });
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.end, display_EquipmentValue_details
                        children: [
                          ConstrainedBox(
                              constraints:
                                  BoxConstraints(minHeight: 0, maxWidth: 700),
                              child: display_Powttd_details(ntr)),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container display_Powttd_details(PowttdModel ntr) {
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          Text('ID : ' + args['id'].toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Text('TrNo : ' + ntr.trNo.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            Divider(height: 10),
                            Text('serialNo : ' + ntr.serialNo.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                            Divider(height: 10),
                            Text(
                                'equipment used : ' +
                                    ntr.equipmentUsed.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            ntr.ru1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings U -1 ', ntr.ru1)
                                : Container(),
                            ntr.ru2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings U -2 ', ntr.ru2)
                                : Container(),
                            ntr.ru3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings U -3 ', ntr.ru3)
                                : Container(),
                            ntr.ri1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings I-1 ', ntr.ri1)
                                : Container(),
                            ntr.ri2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings I-2 ', ntr.ri2)
                                : Container(),
                            ntr.ri3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings I-3 ', ntr.ri3)
                                : Container(),
                            ntr.rc1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings C-1 ', ntr.rc1)
                                : Container(),
                            ntr.rc2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings I-2 ', ntr.rc2)
                                : Container(),
                            ntr.rc3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings C-3 ', ntr.rc3)
                                : Container(),
                            ntr.rtanD1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings tanD -1 ', ntr.rtanD1)
                                : Container(),
                            ntr.rtanD2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings tanD -2 ', ntr.rtanD2)
                                : Container(),
                            ntr.rtanD3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings tanD -3 ', ntr.rtanD3)
                                : Container(),
                            ntr.rp1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings P-1 ', ntr.rp1)
                                : Container(),
                            ntr.rp2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings P-2 ', ntr.rp2)
                                : Container(),
                            ntr.rp3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings P-3 ', ntr.rp3)
                                : Container(),
                            ntr.rVdf1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings VDF1 ', ntr.rVdf1)
                                : Container(),
                            ntr.rVdf2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings VDF2 ', ntr.rVdf2)
                                : Container(),
                            ntr.rVdf3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'R Ph Bushings VDF3 ', ntr.rVdf3)
                                : Container(),
                            ntr.yu1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings U-1 ', ntr.yu1)
                                : Container(),
                            ntr.yu2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings U-2 ', ntr.yu2)
                                : Container(),
                            ntr.yu3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings U-3 ', ntr.yu3)
                                : Container(),
                            ntr.yi1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings I-1 ', ntr.yi1)
                                : Container(),
                            ntr.yi2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings I-2 ', ntr.yi2)
                                : Container(),
                            ntr.yi3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings I-3 ', ntr.yi3)
                                : Container(),
                            ntr.yc1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings C-1 ', ntr.yc1)
                                : Container(),
                            ntr.yc2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings C-2 ', ntr.yc2)
                                : Container(),
                            ntr.yc3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings C-3 ', ntr.yc3)
                                : Container(),
                            ntr.ytanD1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings tanD - 1 ', ntr.ytanD1)
                                : Container(),
                            ntr.ytanD2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings tanD-2 ', ntr.ytanD2)
                                : Container(),
                            ntr.ytanD3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings tanD-3 ', ntr.ytanD3)
                                : Container(),
                            ntr.yp1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings P-1 ', ntr.yp1)
                                : Container(),
                            ntr.yp2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings P-2 ', ntr.yp2)
                                : Container(),
                            ntr.yp3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings P-3 ', ntr.yp3)
                                : Container(),
                            ntr.yVdf1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings VDF-1 ', ntr.yVdf1)
                                : Container(),
                            ntr.yVdf2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings VDF-2 ', ntr.yVdf2)
                                : Container(),
                            ntr.yVdf3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'Y Ph Bushings VDF-3 ', ntr.yVdf3)
                                : Container(),
                            ntr.bu1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings U-1 ', ntr.bu1)
                                : Container(),
                            ntr.bu2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings U-2 ', ntr.bu2)
                                : Container(),
                            ntr.bu3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings U-3 ', ntr.bu3)
                                : Container(),
                            ntr.bi1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings I-1 ', ntr.bi1)
                                : Container(),
                            ntr.bi2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings I-2 ', ntr.bi2)
                                : Container(),
                            ntr.bi3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings I-3 ', ntr.bi3)
                                : Container(),
                            ntr.bc1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings C-1 ', ntr.bc1)
                                : Container(),
                            ntr.bc2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings C-2 ', ntr.bc2)
                                : Container(),
                            ntr.bc3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings C-3 ', ntr.bc3)
                                : Container(),
                            ntr.btanD1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings tanD-1 ', ntr.btanD1)
                                : Container(),
                            ntr.btanD2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings tanD-2 ', ntr.btanD2)
                                : Container(),
                            ntr.btanD3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings tanD-3 ', ntr.btanD3)
                                : Container(),
                            ntr.bp1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings P-1 ', ntr.bp1)
                                : Container(),
                            ntr.bp2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings P-2 ', ntr.bp2)
                                : Container(),
                            ntr.bp3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings P-3 ', ntr.bp3)
                                : Container(),
                            ntr.bVdf1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings VDF-1 ', ntr.bVdf1)
                                : Container(),
                            ntr.bVdf2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings VDF-2 ', ntr.bVdf2)
                                : Container(),
                            ntr.bVdf3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'B Ph Bushings VDF-3 ', ntr.bVdf3)
                                : Container(),
                            ntr.hv_lv_u1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding U-1 ', ntr.hv_lv_u1)
                                : Container(),
                            ntr.hv_lv_u2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding U-2 ', ntr.hv_lv_u2)
                                : Container(),
                            ntr.hv_lv_u3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding U-3 ', ntr.hv_lv_u3)
                                : Container(),
                            ntr.hv_lv_i1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding I-1 ', ntr.hv_lv_i1)
                                : Container(),
                            ntr.hv_lv_i2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding I-2 ', ntr.hv_lv_i2)
                                : Container(),
                            ntr.hv_lv_i3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding I-3 ', ntr.hv_lv_i3)
                                : Container(),
                            ntr.hv_lv_c1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding C-1 ', ntr.hv_lv_c1)
                                : Container(),
                            ntr.hv_lv_c2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding C2 ', ntr.hv_lv_c2)
                                : Container(),
                            ntr.hv_lv_c3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding C-3 ', ntr.hv_lv_c3)
                                : Container(),
                            ntr.hv_lv_tanD1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding tanD-1 ', ntr.hv_lv_tanD1)
                                : Container(),
                            ntr.hv_lv_tanD2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding tanD-2 ', ntr.hv_lv_tanD2)
                                : Container(),
                            ntr.hv_lv_tanD3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding tanD-3 ', ntr.hv_lv_tanD3)
                                : Container(),
                            ntr.hv_lv_p1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding P-1 ', ntr.hv_lv_p1)
                                : Container(),
                            ntr.hv_lv_p2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding P-2 ', ntr.hv_lv_p2)
                                : Container(),
                            ntr.hv_lv_p3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding P-3 ', ntr.hv_lv_p3)
                                : Container(),
                            ntr.hv_lv_Vdf1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding VDF-1 ', ntr.hv_lv_Vdf1)
                                : Container(),
                            ntr.hv_lv_Vdf2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding VDF-2 ', ntr.hv_lv_Vdf2)
                                : Container(),
                            ntr.hv_lv_Vdf3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-LV Winding VDF-3 ', ntr.hv_lv_Vdf3)
                                : Container(),
                            ntr.hvE_G_u1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard U-1 ', ntr.hvE_G_u1)
                                : Container(),
                            ntr.hvE_G_u2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard U-2 ', ntr.hvE_G_u2)
                                : Container(),
                            ntr.hvE_G_u3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard U-3 ', ntr.hvE_G_u3)
                                : Container(),
                            ntr.hvE_G_i1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard I-1 ', ntr.hvE_G_i1)
                                : Container(),
                            ntr.hvE_G_i2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard I-2 ', ntr.hvE_G_i2)
                                : Container(),
                            ntr.hvE_G_i3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard I-3 ', ntr.hvE_G_i3)
                                : Container(),
                            ntr.hvE_G_c1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard C-1 ', ntr.hvE_G_c1)
                                : Container(),
                            ntr.hvE_G_c2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard C-2 ', ntr.hvE_G_c2)
                                : Container(),
                            ntr.hvE_G_c3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard C-3 ', ntr.hvE_G_c3)
                                : Container(),
                            ntr.hvE_G_tanD1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard tanD-1 ', ntr.hvE_G_tanD1)
                                : Container(),
                            ntr.hvE_G_tanD2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard tanD-2 ', ntr.hvE_G_tanD2)
                                : Container(),
                            ntr.hvE_G_tanD3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard tanD-3 ', ntr.hvE_G_tanD3)
                                : Container(),
                            ntr.hvE_G_p1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard P-1 ', ntr.hvE_G_p1)
                                : Container(),
                            ntr.hvE_G_p2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard P-2 ', ntr.hvE_G_p2)
                                : Container(),
                            ntr.hvE_G_p3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard P3 ', ntr.hvE_G_p3)
                                : Container(),
                            ntr.hvE_G_Vdf1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard VDF-1 ', ntr.hvE_G_Vdf1)
                                : Container(),
                            ntr.hvE_G_Vdf2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard VDF-2 ', ntr.hvE_G_Vdf2)
                                : Container(),
                            ntr.hvE_G_Vdf3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Guard VDF-3 ', ntr.hvE_G_Vdf3)
                                : Container(),
                            ntr.hvE_Grnd_u1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground U-1 ', ntr.hvE_Grnd_u1)
                                : Container(),
                            ntr.hvE_Grnd_u2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground U-2 ', ntr.hvE_Grnd_u2)
                                : Container(),
                            ntr.hvE_Grnd_u3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground U-3 ', ntr.hvE_Grnd_u3)
                                : Container(),
                            ntr.hvE_Grnd_i1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground I-1 ', ntr.hvE_Grnd_i1)
                                : Container(),
                            ntr.hvE_Grnd_i2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground I-2 ', ntr.hvE_Grnd_i2)
                                : Container(),
                            ntr.hvE_Grnd_i3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground I-3 ', ntr.hvE_Grnd_i3)
                                : Container(),
                            ntr.hvE_Grnd_c1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground C-1 ', ntr.hvE_Grnd_c1)
                                : Container(),
                            ntr.hvE_Grnd_c2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground C-2 ', ntr.hvE_Grnd_c2)
                                : Container(),
                            ntr.hvE_Grnd_c3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground C-3 ', ntr.hvE_Grnd_c3)
                                : Container(),
                            ntr.hvE_Grnd_tanD1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground tanD-1 ', ntr.hvE_Grnd_tanD1)
                                : Container(),
                            ntr.hvE_Grnd_tanD2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground tanD-2 ', ntr.hvE_Grnd_tanD2)
                                : Container(),
                            ntr.hvE_Grnd_tanD3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground tanD-3 ', ntr.hvE_Grnd_tanD3)
                                : Container(),
                            ntr.hvE_Grnd_p1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground P-1 ', ntr.hvE_Grnd_p1)
                                : Container(),
                            ntr.hvE_Grnd_p2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground P-2 ', ntr.hvE_Grnd_p2)
                                : Container(),
                            ntr.hvE_Grnd_p3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground P-3 ', ntr.hvE_Grnd_p3)
                                : Container(),
                            ntr.hvE_Grnd_Vdf1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground VDF-1 ', ntr.hvE_Grnd_Vdf1)
                                : Container(),
                            ntr.hvE_Grnd_Vdf2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground VDF-2 ', ntr.hvE_Grnd_Vdf2)
                                : Container(),
                            ntr.hvE_Grnd_Vdf3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'HV-E Ground VDF-3 ', ntr.hvE_Grnd_Vdf3)
                                : Container(),
                            ntr.lvEu1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding U-1 ', ntr.lvEu1)
                                : Container(),
                            ntr.lvEu2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding U-2 ', ntr.lvEu2)
                                : Container(),
                            ntr.lvEu3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding U-3 ', ntr.lvEu3)
                                : Container(),
                            ntr.lvEi1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding I-1 ', ntr.lvEi1)
                                : Container(),
                            ntr.lvEi2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding I-2 ', ntr.lvEi2)
                                : Container(),
                            ntr.lvEi3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding I-3 ', ntr.lvEi3)
                                : Container(),
                            ntr.lvEc1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding C-1 ', ntr.lvEc1)
                                : Container(),
                            ntr.lvEc2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding C-2 ', ntr.lvEc2)
                                : Container(),
                            ntr.lvEc3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding C-3 ', ntr.lvEc3)
                                : Container(),
                            ntr.lvEtanD1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding tanD-1 ', ntr.lvEtanD1)
                                : Container(),
                            ntr.lvEtanD2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding tanD-2 ', ntr.lvEtanD2)
                                : Container(),
                            ntr.lvEtanD3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding tanD-3 ', ntr.lvEtanD3)
                                : Container(),
                            ntr.lvEp1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding P-1 ', ntr.lvEp1)
                                : Container(),
                            ntr.lvEp2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding P-2 ', ntr.lvEp2)
                                : Container(),
                            ntr.lvEp3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding P-3 ', ntr.lvEp3)
                                : Container(),
                            ntr.lvEVdf1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding VDF1 ', ntr.lvEVdf1)
                                : Container(),
                            ntr.lvEVdf2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding VDF2 ', ntr.lvEVdf2)
                                : Container(),
                            ntr.lvEVdf3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Winding VDF-3 ', ntr.lvEVdf3)
                                : Container(),
                            ntr.lvE_G_u1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard U-1 ', ntr.lvE_G_u1)
                                : Container(),
                            ntr.lvE_G_u2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard U-2 ', ntr.lvE_G_u2)
                                : Container(),
                            ntr.lvE_G_u3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard U-3 ', ntr.lvE_G_u3)
                                : Container(),
                            ntr.lvE_G_i1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard I-1 ', ntr.lvE_G_i1)
                                : Container(),
                            ntr.lvE_G_i2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard I-2 ', ntr.lvE_G_i2)
                                : Container(),
                            ntr.lvE_G_i3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard I-3 ', ntr.lvE_G_i3)
                                : Container(),
                            ntr.lvE_G_c1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard C-1 ', ntr.lvE_G_c1)
                                : Container(),
                            ntr.lvE_G_c2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard C-2 ', ntr.lvE_G_c2)
                                : Container(),
                            ntr.lvE_G_c3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard C-3 ', ntr.lvE_G_c3)
                                : Container(),
                            ntr.lvE_G_tanD1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard tanD-1 ', ntr.lvE_G_tanD1)
                                : Container(),
                            ntr.lvE_G_tanD2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard tanD-2 ', ntr.lvE_G_tanD2)
                                : Container(),
                            ntr.lvE_G_tanD3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard tanD-3 ', ntr.lvE_G_tanD3)
                                : Container(),
                            ntr.lvE_G_p1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard P-1 ', ntr.lvE_G_p1)
                                : Container(),
                            ntr.lvE_G_p2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard P-2 ', ntr.lvE_G_p2)
                                : Container(),
                            ntr.lvE_G_p3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard P-3 ', ntr.lvE_G_p3)
                                : Container(),
                            ntr.lvE_G_Vdf1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard VDF-1 ', ntr.lvE_G_Vdf1)
                                : Container(),
                            ntr.lvE_G_Vdf2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard VDF-2 ', ntr.lvE_G_Vdf2)
                                : Container(),
                            ntr.lvE_G_Vdf3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Guard VDF-3 ', ntr.lvE_G_Vdf3)
                                : Container(),
                            ntr.lvE_Grnd_u1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground U-1 ', ntr.lvE_Grnd_u1)
                                : Container(),
                            ntr.lvE_Grnd_u2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground U-2 ', ntr.lvE_Grnd_u2)
                                : Container(),
                            ntr.lvE_Grnd_u3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground U-3 ', ntr.lvE_Grnd_u3)
                                : Container(),
                            ntr.lvE_Grnd_i1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground I-1 ', ntr.lvE_Grnd_i1)
                                : Container(),
                            ntr.lvE_Grnd_i2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground I-2 ', ntr.lvE_Grnd_i2)
                                : Container(),
                            ntr.lvE_Grnd_i3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground I-3 ', ntr.lvE_Grnd_i3)
                                : Container(),
                            ntr.lvE_Grnd_c1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground C-1 ', ntr.lvE_Grnd_c1)
                                : Container(),
                            ntr.lvE_Grnd_c2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground C-2 ', ntr.lvE_Grnd_c2)
                                : Container(),
                            ntr.lvE_Grnd_c3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground C-3 ', ntr.lvE_Grnd_c3)
                                : Container(),
                            ntr.lvE_Grnd_tanD1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground tanD-1 ', ntr.lvE_Grnd_tanD1)
                                : Container(),
                            ntr.lvE_Grnd_tanD2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground tanD-2 ', ntr.lvE_Grnd_tanD2)
                                : Container(),
                            ntr.lvE_Grnd_tanD3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground tanD-3 ', ntr.lvE_Grnd_tanD3)
                                : Container(),
                            ntr.lvE_Grnd_p1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground P1 ', ntr.lvE_Grnd_p1)
                                : Container(),
                            ntr.lvE_Grnd_p2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground P2 ', ntr.lvE_Grnd_p2)
                                : Container(),
                            ntr.lvE_Grnd_p3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground P3 ', ntr.lvE_Grnd_p3)
                                : Container(),
                            ntr.lvE_Grnd_Vdf1 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground VDF1 ', ntr.lvE_Grnd_Vdf1)
                                : Container(),
                            ntr.lvE_Grnd_Vdf2 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground VDF2 ', ntr.lvE_Grnd_Vdf2)
                                : Container(),
                            ntr.lvE_Grnd_Vdf3 != 0.00
                                ? simplifiedforPowttdDetail(
                                    'LV-E Ground VDF3 ', ntr.lvE_Grnd_Vdf3)
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  simplifiedforPowttdDetail(String hinttxt, var ntr_value) {
    return Column(
      children: [
        Text(hinttxt + ' : ' + ntr_value.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        Divider(height: 10),
      ],
    );
  }
}
