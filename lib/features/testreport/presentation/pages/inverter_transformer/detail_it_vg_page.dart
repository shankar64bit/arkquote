// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../../data/models/equipment/IT/it_vg_model.dart';
import '../../providers/it_provider/it_provider.dart';
import '../../providers/it_provider/it_vg_provider.dart';

class DetailItVgPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int IT_ID;
  List fieldTitle = [
    [
      'dd0',
      '1U2w',
      '2w1W',
      '1W2w',
      '1W2v',
      '1U3w',
      '3w1W',
      '1W3w',
      '1W3v',
      '1U4w',
      '4w1W',
      '1W4w',
      '1W4v',
      '1U5w',
      '5w1W',
      '1W5w',
      '1W5v'
    ],
    [
      'dd6',
      '2w1U',
      '1U1W',
      '1W2v',
      '1W2w',
      '3w1U',
      '1U1W',
      '1W3v',
      '1W3w',
      '4w1U',
      '1U1W',
      '1W4v',
      '1W4w',
      '5w1U',
      '1U1W',
      '1W5v',
      '1W5w'
    ],
    [
      'yd1',
      '1U2v',
      '2v1N',
      '1W2w',
      '1V2w',
      '1U3v',
      '3v1N',
      '1W3w',
      '1V3w',
      '1U4v',
      '4v1N',
      '1W4w',
      '1V4w',
      '1U5v',
      '5v1N',
      '1W5w',
      '1V5w'
    ],
    [
      'yd11',
      '1U2w',
      '2wN',
      '1V2v',
      '1W2v',
      '1U3w',
      '3wN',
      '1V3v',
      '1W3v',
      '1U3w',
      '3wN',
      '1V3v',
      '1W3v',
      '1U3w',
      '3wN',
      '1V3v',
      '1W3v'
    ]
  ];
  DetailItVgPage(this.args, {Key key}) : super(key: key);

  ItVgTestModel itVgTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    final ItModel ntr1 = watchOnly((ItProvider x) => x.itModel);
    getX((ItVgProvider x) => x.getItVgByID(args['id']));
    ItVgTestModel ntr = watchOnly((ItVgProvider x) => x.itVgModel);
    var mob = const Text('IT-Vector Group Test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('IT-Vector Group Test Details',
        style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_IT_VG', arguments: {
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
              getX((ItVgProvider x) => x.deleteItVg(args['id']));
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
                              child: display_IT_Vg_details(ntr, ntr1)),
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

  Container display_IT_Vg_details(ItVgTestModel ntr, ItModel ntr1) {
    int index;
    if (ntr1.vectorGroup.contains('Dd0')) {
      index = 0;
    } else if (ntr1.vectorGroup.contains('Dd6')) {
      index = 1;
    } else if (ntr1.vectorGroup.contains('Yd1')) {
      index = 2;
    } else if (ntr1.vectorGroup.contains('Yd11')) {
      index = 3;
    }
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
                    displayFieldsLv12(ntr, index),
                    checkVectoreGroup(ntr1)
                        ? Container()
                        : displayFieldsLv34(ntr, index)
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

  displayFieldsLv12(ItVgTestModel ntr, int index) {
    print(index);
    print("***////**++++");
    print(fieldTitle[index][1] + ntr.lv1_v1.toString());
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(children: [
        Text('LV1: ',
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][1] + " : " + ntr.lv1_v1.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][2] + " : " + ntr.lv1_v2.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][3] + " : " + ntr.lv1_v3.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][4] + " : " + ntr.lv1_v4.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text('LV2 : ',
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][5] + " : " + ntr.lv2_v1.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][6] + " : " + ntr.lv2_v2.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][7] + " : " + ntr.lv2_v3.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][8] + " : " + ntr.lv2_v4.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
      ]),
    );
  }

  displayFieldsLv34(ItVgTestModel ntr, int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(children: [
        Text('LV3 : ',
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][9] + " : " + ntr.lv3_v1.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][10] + " : " + ntr.lv3_v2.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][11] + " : " + ntr.lv3_v3.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][12] + " : " + ntr.lv3_v4.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text('LV4 : ',
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][13] + " : " + ntr.lv4_v1.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][14] + " : " + ntr.lv4_v2.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][15] + " : " + ntr.lv4_v3.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
        const Divider(height: 10),
        Text(fieldTitle[index][16] + " : " + ntr.lv4_v4.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 13)),
      ]),
    );
  }
}
