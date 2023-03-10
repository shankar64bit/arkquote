import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/CT/ct_core_wr_model.dart';
import '../../../data/models/equipment/CT/ct_model.dart';
import '../../providers/ct_provider/ct_core_wr_provider.dart';
import '../../providers/ct_provider/ct_provider.dart';

class Detail_CTcoreWR_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_CTcoreWR_page(@required this.args, {Key key}) : super(key: key);

  CTcoreWRModel ctCoreWRModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((CTcoreWRProvider x) => x.getCTcoreWR_ById(args['id']));
    CTcoreWRModel ntr = watchOnly((CTcoreWRProvider x) => x.ctcoreWR_Model);
    final CTModel ntr1 = watchOnly((CTProvider x) => x.ctModel);

    print(ntr);
    print("ntr  CTcoreWR......");
    var mob =
        const Text('CTcore WR Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('CTcore WR Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_CTcoreWR',
                    arguments: {
                      'id': args['id'],
                      'CT_ID': args['CT_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((CTcoreWRProvider x) => x.deleteCTcoreWR(args['id']));
              Navigator.popAndPushNamed(context, '/detail_CTcoreWR',
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
                        // crossAxisAlignment: CrossAxisAlignment.end, display_EquipmentValue_details
                        children: [
                          ConstrainedBox(
                              constraints:
                                  BoxConstraints(minHeight: 0, maxWidth: 700),
                              child: display_CTcoreWR_details(ntr, ntr1)),
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

  Container display_CTcoreWR_details(CTcoreWRModel ntr, CTModel ntr1) {
    final CTModel ntr2 = watchOnly((CTProvider x) => x.ctModel);
    final splitted = ntr2.connectedTap.split('-');
    var s1 = splitted[0];
    var s2 = splitted[1];
    print(s1);
    print(s2);
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
                    ntr1.connectedTap == "0" ||
                            ntr1.connectedTap == "S1-S2" ||
                            ntr1.connectedTap == "S1-S3" ||
                            ntr1.connectedTap == "S1-S4" ||
                            ntr1.connectedTap == "S1-S5"
                        ? Column(
                            children: [
                              Card(
                                elevation: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      ntr.R_1S1_1S2 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'R_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        ' : ' +
                                                        ntr.R_1S1_1S2
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_2S1_2S2 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'R_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        ' : ' +
                                                        ntr.R_2S1_2S2
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_3S1_3S2 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'R_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        ' : ' +
                                                        ntr.R_3S1_3S2
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_4S1_4S2 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'R_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        ' : ' +
                                                        ntr.R_4S1_4S2
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.R_5S1_5S2 == 0.00
                                          ? Container()
                                          : Text(
                                              'R_5' +
                                                  s1 +
                                                  '_5' +
                                                  s2 +
                                                  ' : ' +
                                                  ntr.R_5S1_5S2.toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13)),
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
                                      ntr.Y_1S1_1S2 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'Y_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        ' : ' +
                                                        ntr.Y_1S1_1S2
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_2S1_2S2 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'Y_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        ' : ' +
                                                        ntr.Y_2S1_2S2
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_3S1_3S2 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'Y_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        ' : ' +
                                                        ntr.Y_3S1_3S2
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_4S1_4S2 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'Y_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        ' : ' +
                                                        ntr.Y_4S1_4S2
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.Y_5S1_5S2 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'Y_5' +
                                                        s1 +
                                                        '_5' +
                                                        s2 +
                                                        ' : ' +
                                                        ntr.Y_5S1_5S2
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                              ],
                                            ),
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
                                      ntr.B_1S1_1S2 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'B_1' +
                                                        s1 +
                                                        '_1' +
                                                        s2 +
                                                        ' : ' +
                                                        ntr.B_1S1_1S2
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_2S1_2S2 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'B_2' +
                                                        s1 +
                                                        '_2' +
                                                        s2 +
                                                        ' : ' +
                                                        ntr.B_2S1_2S2
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_3S1_3S2 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'B_3' +
                                                        s1 +
                                                        '_3' +
                                                        s2 +
                                                        ' : ' +
                                                        ntr.B_3S1_3S2
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_4S1_4S2 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'B_4' +
                                                        s1 +
                                                        '_4' +
                                                        s2 +
                                                        ' : ' +
                                                        ntr.B_4S1_4S2
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                Divider(height: 10),
                                              ],
                                            ),
                                      ntr.B_5S1_5S2 == 0.00
                                          ? Container()
                                          : Column(
                                              children: [
                                                Text(
                                                    'B_5' +
                                                        s1 +
                                                        '_5' +
                                                        s2 +
                                                        ' : ' +
                                                        ntr.B_5S1_5S2
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
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
