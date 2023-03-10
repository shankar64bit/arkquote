// ignore_for_file: missing_return

import 'package:flutter/material.dart';

import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/IT/it_ir_model.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../providers/it_provider/it_ir_provider.dart';
import '../../providers/it_provider/it_provider.dart';

class DetailItIrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int IT_ID;

  DetailItIrPage(this.args, {Key key}) : super(key: key);

  ItIrTestModel itIrTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    final ItModel ntr1 = watchOnly((ItProvider x) => x.itModel);
    getX((ItIrProvider x) => x.getItIrByID(args['id']));
    ItIrTestModel ntr = watchOnly((ItIrProvider x) => x.itIrModel);

    var mob =
        const Text('IT - Ir Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('IT - Ir Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_IT_IR', arguments: {
                  'id': args['id'],
                  'TrNo': ntr.trNo,
                  'itDatabaseID': args['itDatabaseID'],
                  'SerialNo': ntr.serialNo,
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((ItIrProvider x) => x.deleteItIr(args['id']));
              Navigator.popAndPushNamed(context, '/detail_IT', arguments: {
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
                              child: display_IT_IR_details(ntr, ntr1)),
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

  Container display_IT_IR_details(ItIrTestModel ntr, ItModel ntr1) {
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          Text('DBID : ' + ntr.databaseID.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          Divider(height: 10),
                          Text('TrNo : ' + ntr.trNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          Divider(height: 10),
                          Text('SerialNo : ' + ntr.serialNo.toString(),
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
                        child: Column(children: [
                          Text('HV-Earth 60 Sec : ' + ntr.hvE_60.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('HV-Earth 600 Sec  : ' + ntr.hvE_600.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('HV-LV1 60 sec : ' + ntr.hvLv1_60.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('HV-LV1 600 sec : ' + ntr.hvLv1_600.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('HV-LV2 60 sec : ' + ntr.hvLv2_60.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('HV-LV2 600 sec : ' + ntr.hvLv2_600.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                        ]),
                      ),
                    ),
                    checkVectoreGroup(ntr1)
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                Text(
                                    'HV-LV3 60 sec : ' +
                                        ntr.hvLv3_60.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text(
                                    'HV-LV3 600 sec : ' +
                                        ntr.hvLv3_600.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text(
                                    'HV-LV4 60 sec : ' +
                                        ntr.hvLv4_60.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text(
                                    'HV-LV4 600 sec : ' +
                                        ntr.hvLv4_600.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                              ]),
                            )),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          Text('LV1-Earth : ' + ntr.lv1E.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('LV2-Earth: ' + ntr.lv2E.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                        ]),
                      ),
                    ),
                    checkVectoreGroup(ntr1)
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                Text('LV3-Earth : ' + ntr.lv3E.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text('Lv4-Earth: ' + ntr.lv4E.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                              ]),
                            ),
                          ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          Text('LV1-LV2 : ' + ntr.lv1Lv2.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                        ]),
                      ),
                    ),
                    checkVectoreGroup(ntr1)
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                Text('LV1-LV1 : ' + ntr.lv1Lv3.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text('Lv1-LV4 : ' + ntr.lv1Lv4.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text('Lv2-LV3 : ' + ntr.lv2Lv3.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text('Lv2-LV4 : ' + ntr.lv2Lv4.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text('Lv3-LV4 : ' + ntr.lv3Lv4.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text('Lv4-LV1 : ' + ntr.lv4Lv1.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                              ]),
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

  bool checkVectoreGroup(ItModel ntr) {
    return ntr.vectorGroup.toLowerCase() == 'dd0/dd0' ||
        ntr.vectorGroup.toLowerCase() == 'dd6/dd6' ||
        ntr.vectorGroup.toLowerCase() == 'yd1d1' ||
        ntr.vectorGroup.toLowerCase() == 'yd11d11';
  }
}
