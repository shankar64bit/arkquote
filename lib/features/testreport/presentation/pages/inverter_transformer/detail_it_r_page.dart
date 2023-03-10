// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../../data/models/equipment/IT/it_r_model.dart';
import '../../providers/it_provider/it_provider.dart';
import '../../providers/it_provider/it_r_provider.dart';

class DetailItRPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int IT_ID;

  DetailItRPage(this.args, {Key key}) : super(key: key);

  ItRTestModel itRTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    final ItModel ntr1 = watchOnly((ItProvider x) => x.itModel);
    getX((ItRProvider x) => x.getItRByID(args['id']));
    ItRTestModel ntr = watchOnly((ItRProvider x) => x.itRModel);

    var mob =
        const Text('IT-Ratio Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('IT-Ratio Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_IT_R', arguments: {
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
              getX((ItRProvider x) => x.deleteItR(args['id']));
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
                              constraints: const BoxConstraints(
                                  minHeight: 0, maxWidth: 700),
                              child: display_IT_R_details(ntr, ntr1)),
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

  Container display_IT_R_details(ItRTestModel ntr, ItModel ntr1) {
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
                          Text('ID : ' + ntr.databaseID.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          const Divider(height: 10),
                          Text('TrNo : ${ntr.trNo}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          const Divider(height: 10),
                          Text('SerialNo : ${ntr.serialNo}',
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
                          Text('Applied Voltage HV Side (V)-U-V : ${ntr.hv_uv}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Applied Voltage HV Side (V)-V-W : ${ntr.hv_vw}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Applied Voltage HV Side (V)-W-U : ${ntr.hv_wu}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Measured Voltage LV1 Side (V)-U-V : ${ntr.lv1_uv}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Measured Voltage LV1 Side (V)-V-W : ${ntr.lv1_vw}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Measured Voltage LV1 Side (V)-W-U: ${ntr.lv1_wu}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Measured Voltage LV2 Side (V)-U-V : ${ntr.lv2_uv}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Measured Voltage LV2 Side (V)-V-W : ${ntr.lv2_vw}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Measured Voltage LV2 Side (V)-W-U: ${ntr.lv2_wu}',
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
                                    'Measured Voltage LV3 Side (V)-U-V : ${ntr.lv3_uv}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                const Divider(height: 10),
                                Text(
                                    'Measured Voltage LV3 Side (V)-V-W : ${ntr.lv3_vw}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                const Divider(height: 10),
                                Text(
                                    'Measured Voltage LV3 Side (V)-W-U: ${ntr.lv3_wu}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                const Divider(height: 10),
                                Text(
                                    'Measured Voltage LV4 Side (V)-U-V : ${ntr.lv4_uv}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                const Divider(height: 10),
                                Text(
                                    'Measured Voltage LV4 Side (V)-V-W : ${ntr.lv4_vw}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                const Divider(height: 10),
                                Text(
                                    'Measured Voltage LV4 Side (V)-W-U: ${ntr.lv4_wu}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                              ]),
                            )),
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
