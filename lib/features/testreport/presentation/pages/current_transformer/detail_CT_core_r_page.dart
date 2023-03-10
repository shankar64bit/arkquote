// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/CT/ct_core_r_model.dart';
import '../../../data/models/equipment/CT/ct_model.dart';
import '../../providers/ct_provider/ct_core_r_provider.dart';
import '../../providers/ct_provider/ct_provider.dart';

class Detail_CTcoreR_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_CTcoreR_page(@required this.args, {Key key}) : super(key: key);

  CTcoreRModel ctCoreRModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((CTcoreRProvider x) => x.getCTcoreR_ById(args['id']));
    CTcoreRModel ntr = watchOnly((CTcoreRProvider x) => x.ctcoreR_Model);
    final CTModel ntr1 = watchOnly((CTProvider x) => x.ctModel);

    print(ntr);
    print("ntr  CTcoreR......");
    var mob =
        const Text('CTcore R Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('CTcore R Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_CTcoreR', arguments: {
                  'id': args['id'],
                  'CT_ID': args['CT_ID'],
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((CTcoreRProvider x) => x.deleteCTcoreR(args['id']));
              Navigator.popAndPushNamed(context, '/detail_CTcoreR', arguments: {
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
                              child: display_CTcoreR_details(ntr, ntr1)),
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

  Container display_CTcoreR_details(CTcoreRModel ntr, CTModel ntr1) {
    var ratio_value = ntr1.pRatio;
    final splitted = ntr1.connectedTap.split('-');
    var s1 = splitted[0];
    var s2 = splitted[1];

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
                    ntr1.connectedTap == "S1-S2" ||
                            ntr1.connectedTap == "S1-S3" ||
                            ntr1.connectedTap == "S1-S4" ||
                            ntr1.connectedTap == "S1-S5" ||
                            ntr1.connectedTap == "0"
                        ? Column(
                            children: [
                              Card(
                                elevation: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      ntr.R_1S1_1S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'R_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_1S1_1S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_2S1_2S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_2S1_2S2_200  : ' +
                                                    'R_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_2S1_2S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_3S1_3S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_3S1_3S2_200  : ' +
                                                    'R_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_3S1_3S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_4S1_4S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_4S1_4S2_200  : ' +
                                                    'R_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_4S1_4S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_5S1_5S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_5S1_5S2_200  : ' +
                                                    'R_5' +
                                                        s1 +
                                                        '_5' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_5S1_5S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_1S1_1S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_1S1_1S2_200  : ' +
                                                    'Y_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_1S1_1S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_2S1_2S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_2S1_2S2_200  : ' +
                                                    'Y_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_2S1_2S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_3S1_3S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_3S1_3S2_200  : ' +
                                                    'Y_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_3S1_3S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_4S1_4S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_4S1_4S2_200  : ' +
                                                    'Y_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_4S1_4S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_5S1_5S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_5S1_5S2_200  : ' +
                                                    'Y_5' +
                                                        s1 +
                                                        '_5' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_5S1_5S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_1S1_1S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_1S1_1S2_200  : ' +
                                                    'B_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_1S1_1S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_2S1_2S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_2S1_2S2_200  : ' +
                                                    'B_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_2S1_2S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_3S1_3S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_3S1_3S2_200  : ' +
                                                    'B_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_3S1_3S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_4S1_4S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_4S1_4S2_200  : ' +
                                                    'B_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_4S1_4S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_5S1_5S2_200 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_5S1_5S2_200  : ' +
                                                    'B_5' +
                                                        s1 +
                                                        '_5' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 1 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_5S1_5S2_200
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                              ////////////////////////////////NO2
                              Card(
                                elevation: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      ntr.R_1S1_1S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_1S1_1S2_400 : ' +
                                                    'R_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_1S1_1S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_2S1_2S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_2S1_2S2_400  : ' +
                                                    'R_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_2S1_2S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_3S1_3S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_3S1_3S2_400  : ' +
                                                    'R_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_3S1_3S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_4S1_4S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_4S1_4S2_400  : ' +
                                                    'R_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_4S1_4S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_5S1_5S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_5S1_5S2_400  : ' +
                                                    'R_5' +
                                                        s1 +
                                                        '_5' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_5S1_5S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_1S1_1S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_1S1_1S2_400  : ' +
                                                    'Y_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_1S1_1S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_2S1_2S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_2S1_2S2_400  : ' +
                                                    'Y_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_2S1_2S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_3S1_3S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_3S1_3S2_400  : ' +
                                                    'Y_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_3S1_3S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_4S1_4S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_4S1_4S2_400  : ' +
                                                    'Y_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_4S1_4S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_5S1_5S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_5S1_5S2_400  : ' +
                                                    'Y_5' +
                                                        s1 +
                                                        '_5' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_5S1_5S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_1S1_1S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_1S1_1S2_400  : ' +
                                                    'B_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_1S1_1S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_2S1_2S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_2S1_2S2_400  : ' +
                                                    'B_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_2S1_2S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_3S1_3S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_3S1_3S2_400  : ' +
                                                    'B_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_3S1_3S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_4S1_4S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_4S1_4S2_400  : ' +
                                                    'B_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_4S1_4S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_5S1_5S2_400 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_5S1_5S2_400  : ' +
                                                    'B_5' +
                                                        s1 +
                                                        '_5' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 2 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_5S1_5S2_400
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                              ////////////////////////////////NO3
                              Card(
                                elevation: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      ntr.R_1S1_1S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_1S1_1S2_600 : ' +
                                                    'R_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_1S1_1S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_2S1_2S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_2S1_2S2_600  : ' +
                                                    'R_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_2S1_2S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_3S1_3S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_3S1_3S2_600  : ' +
                                                    'R_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_3S1_3S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_4S1_4S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_4S1_4S2_600  : ' +
                                                    'R_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_4S1_4S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_5S1_5S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_5S1_5S2_600  : ' +
                                                    'R_5' +
                                                        s1 +
                                                        '_5' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_5S1_5S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_1S1_1S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_1S1_1S2_600  : ' +
                                                    'Y_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_1S1_1S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_2S1_2S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_2S1_2S2_600  : ' +
                                                    'Y_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_2S1_2S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_3S1_3S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_3S1_3S2_600  : ' +
                                                    'Y_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_3S1_3S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_4S1_4S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_4S1_4S2_600  : ' +
                                                    'Y_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_4S1_4S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_5S1_5S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_5S1_5S2_600  : ' +
                                                    'Y_5' +
                                                        s1 +
                                                        '_5' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_5S1_5S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_1S1_1S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_1S1_1S2_600  : ' +
                                                    'B_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_1S1_1S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_2S1_2S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_2S1_2S2_600  : ' +
                                                    'B_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_2S1_2S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_3S1_3S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_3S1_3S2_600  : ' +
                                                    'B_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_3S1_3S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_4S1_4S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_4S1_4S2_600  : ' +
                                                    'B_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_4S1_4S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_5S1_5S2_600 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_5S1_5S2_600  : ' +
                                                    'B_5' +
                                                        s1 +
                                                        '_5' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 3 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_5S1_5S2_600
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                              ////////////////////////////////NO4
                              Card(
                                elevation: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      ntr.R_1S1_1S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_1S1_1S2_800 : ' +
                                                    'R_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_1S1_1S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_2S1_2S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_2S1_2S2_800  : ' +
                                                    'R_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_2S1_2S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_3S1_3S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_3S1_3S2_800  : ' +4
                                                    'R_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_3S1_3S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_4S1_4S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_4S1_4S2_800  : ' +
                                                    'R_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_4S1_4S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_5S1_5S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'R_5S1_5S2_800  : ' +
                                                    'R_5' +
                                                        s1 +
                                                        '_5' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.R_5S1_5S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_1S1_1S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_1S1_1S2_800  : ' +
                                                    'Y_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_1S1_1S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_2S1_2S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_2S1_2S2_800  : ' +
                                                    'Y_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_2S1_2S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_3S1_3S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_3S1_3S2_800  : ' +
                                                    'Y_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_3S1_3S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_4S1_4S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_4S1_4S2_800  : ' +
                                                    'Y_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_4S1_4S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_5S1_5S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'Y_5S1_5S2_800  : ' +
                                                    'Y_5' +
                                                        s1 +
                                                        '_5' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.Y_5S1_5S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_1S1_1S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_1S1_1S2_800  : ' +
                                                    'B_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_1S1_1S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_2S1_2S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_2S1_2S2_800  : ' +
                                                    'B_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_2S1_2S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_3S1_3S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_3S1_3S2_800  : ' +
                                                    'B_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_3S1_3S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_4S1_4S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_4S1_4S2_800  : ' +
                                                    'B_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_4S1_4S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_5S1_5S2_800 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    // 'B_5S1_5S2_800  : ' +
                                                    'B_5' +
                                                        s1 +
                                                        '_5' +
                                                        s2 +
                                                        '_' +
                                                        (ratio_value * 4 / 4)
                                                            .toStringAsFixed(
                                                                0) +
                                                        ' : ' +
                                                        ntr.B_5S1_5S2_800
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
