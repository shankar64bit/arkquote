// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/CT/ct_core_kvp_model.dart';
import '../../../data/models/equipment/CT/ct_core_model.dart';
import '../../../data/models/equipment/CT/ct_model.dart';
import '../../../data/models/equipment/CT/ct_tap_model.dart';
import '../../providers/ct_provider/ct_core_kvp_provider.dart';
import '../../providers/ct_provider/ct_core_provider.dart';
import '../../providers/ct_provider/ct_provider.dart';
import '../../providers/ct_provider/ct_tap_provider.dart';

class Detail_CTcoreKVP_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_CTcoreKVP_page(@required this.args, {Key key}) : super(key: key);

  CTcoreKVPModel ctCoreKVPModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((CTcoreKVPProvider x) => x.getCTcoreKVP_ById(args['id']));
    CTcoreKVPModel ntr = watchOnly((CTcoreKVPProvider x) => x.ctcoreKVP_Model);

    print(ntr);
    print("ntr  CTcoreKVP......");
    var mob =
        const Text('CTcore KVP Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('CTcore KVP Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_CTcoreKVP',
                    arguments: {
                      'id': args['id'],
                      'CT_ID': args['CT_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((CTcoreKVPProvider x) => x.deleteCTcoreKVP(args['id']));
              Navigator.popAndPushNamed(context, '/detail_CTcoreKVP',
                  arguments: {
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
                        children: [
                          ConstrainedBox(
                              constraints:
                                  BoxConstraints(minHeight: 0, maxWidth: 700),
                              child: display_CTcoreKVP_details(ntr)),
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

  Container display_CTcoreKVP_details(CTcoreKVPModel ntr) {
    CTModel ntr_model = watchOnly((CTProvider x) => x.ctModel);

    var splitConn = ntr_model.connectedTap.split('-');
    var kvp = 0;

    getX((CT_core_Provider x) => x.getCTcoreByctNoID(ntr_model.id));
    final List<CT_core_Model> reports =
        watchOnly((CT_core_Provider x) => x.ct_core_ctNoIDList);

    for (var eachCore in reports) {
      var CoreIds = eachCore.id;
      print('coreId' + CoreIds.toString());
      if (eachCore.coreClass.toLowerCase() == 'ps') {
        getX((CT_tap_Provider x) => x.getCTtapByctNoID(eachCore.id));
        final List<CT_tap_Model> reports1 =
            watchOnly((CT_tap_Provider x) => x.ct_tap_ctNoIDList);

        for (var eachTap in reports1) {
          print('eachTap' + eachTap.toString());

          var present = true;
          var TapName = eachTap.tapName;
          var kvp1 = eachTap.kneePointVoltage;
          print('TapName  : ' + TapName.toString());
          print('splitConn : ' + splitConn.toString());

          for (var eachSymbol in splitConn) {
            if (!TapName.contains(eachSymbol)) {
              present = false;
            }
          }
          if (present == true) {
            kvp = eachTap.kneePointVoltage;
          } else {
            kvp = 0;
          }
        }
      }
    }

    var vk_convertion_value = ntr_model.vk;
    var vkConn = vk_convertion_value * kvp;

    print(vk_convertion_value);
    print(vkConn);

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
                            ntr.R_35 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' R_' + (vkConn * 0.1).toStringAsFixed(0),
                                    ntr.R_35),
                            ntr.R_70 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' R_' + (vkConn * 0.2).toStringAsFixed(0),
                                    ntr.R_70),
                            ntr.R_105 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' R_' + (vkConn * 0.3).toStringAsFixed(0),
                                    ntr.R_105),
                            ntr.R_140 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' R_' + (vkConn * 0.4).toStringAsFixed(0),
                                    ntr.R_140),
                            ntr.R_175 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' R_' + (vkConn * 0.5).toStringAsFixed(0),
                                    ntr.R_175),
                            ntr.R_210 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' R_' + (vkConn * 0.6).toStringAsFixed(0),
                                    ntr.R_210),
                            ntr.R_245 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' R_' + (vkConn * 0.7).toStringAsFixed(0),
                                    ntr.R_245),
                            ntr.R_280 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' R_' + (vkConn * 0.8).toStringAsFixed(0),
                                    ntr.R_280),
                            ntr.R_315 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' R_' + (vkConn * 0.9).toStringAsFixed(0),
                                    ntr.R_315),
                            ntr.R_350 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' R_' + (vkConn * 1.0).toStringAsFixed(0),
                                    ntr.R_350),
                            ntr.R_385 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' R_' + (vkConn * 1.1).toStringAsFixed(0),
                                    ntr.R_385),
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
                            ntr.Y_35 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' Y_' + (vkConn * 0.1).toStringAsFixed(0),
                                    ntr.Y_35),
                            ntr.Y_70 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' Y_' + (vkConn * 0.2).toStringAsFixed(0),
                                    ntr.Y_70),
                            ntr.Y_105 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' Y_' + (vkConn * 0.3).toStringAsFixed(0),
                                    ntr.Y_105),
                            ntr.Y_140 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' Y_' + (vkConn * 0.4).toStringAsFixed(0),
                                    ntr.Y_140),
                            ntr.Y_175 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' Y_' + (vkConn * 0.5).toStringAsFixed(0),
                                    ntr.Y_175),
                            ntr.Y_210 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' Y_' + (vkConn * 0.6).toStringAsFixed(0),
                                    ntr.Y_210),
                            ntr.Y_245 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' Y_' + (vkConn * 0.7).toStringAsFixed(0),
                                    ntr.Y_245),
                            ntr.Y_280 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' Y_' + (vkConn * 0.8).toStringAsFixed(0),
                                    ntr.Y_280),
                            ntr.Y_315 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' Y_' + (vkConn * 0.9).toStringAsFixed(0),
                                    ntr.Y_315),
                            ntr.Y_350 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' Y_' + (vkConn * 1.0).toStringAsFixed(0),
                                    ntr.Y_350),
                            ntr.Y_385 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' Y_' + (vkConn * 1.1).toStringAsFixed(0),
                                    ntr.Y_385),
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
                            ntr.B_35 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' B_' + (vkConn * 0.1).toStringAsFixed(0),
                                    ntr.B_35),
                            ntr.B_70 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' B_' + (vkConn * 0.2).toStringAsFixed(0),
                                    ntr.B_70),
                            ntr.B_105 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' B_' + (vkConn * 0.3).toStringAsFixed(0),
                                    ntr.B_105),
                            ntr.B_140 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' B_' + (vkConn * 0.4).toStringAsFixed(0),
                                    ntr.B_140),
                            ntr.B_175 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' B_' + (vkConn * 0.5).toStringAsFixed(0),
                                    ntr.B_175),
                            ntr.B_210 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' B_' + (vkConn * 0.6).toStringAsFixed(0),
                                    ntr.B_210),
                            ntr.B_245 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' B_' + (vkConn * 0.7).toStringAsFixed(0),
                                    ntr.B_245),
                            ntr.B_280 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' B_' + (vkConn * 0.8).toStringAsFixed(0),
                                    ntr.B_280),
                            ntr.B_315 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' B_' + (vkConn * 0.9).toStringAsFixed(0),
                                    ntr.B_315),
                            ntr.B_350 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' B_' + (vkConn * 1.0).toStringAsFixed(0),
                                    ntr.B_350),
                            ntr.B_385 == 0.00
                                ? Container()
                                : toSimplifiedCTcorekvp(
                                    ' B_' + (vkConn * 1.1).toStringAsFixed(0),
                                    ntr.B_385),
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

  toSimplifiedCTcorekvp(var hinttxt, var ntrValue) {
    return Column(
      children: [
        Text(hinttxt + ' : ' + ntrValue.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        Divider(height: 10),
      ],
    );
  }
}
