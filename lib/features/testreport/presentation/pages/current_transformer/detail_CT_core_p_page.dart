// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/CT/ct_core_p_model.dart';
import '../../../data/models/equipment/CT/ct_model.dart';
import '../../providers/ct_provider/ct_core_p_provider.dart';
import '../../providers/ct_provider/ct_provider.dart';

class Detail_CTcoreP_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_CTcoreP_page(@required this.args, {Key key}) : super(key: key);

  CTcorePModel ctCorePModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((CTcorePProvider x) => x.getCTcoreP_ById(args['id']));
    CTcorePModel ntr = watchOnly((CTcorePProvider x) => x.ctcoreP_Model);
    final CTModel ntr1 = watchOnly((CTProvider x) => x.ctModel);

    print(ntr);
    print("ntr  CTcoreP......");
    var mob =
        const Text('CTcore P Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('CTcore P Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_CTcoreP', arguments: {
                  'id': args['id'],
                  'CT_ID': args['CT_ID'],
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((CTcorePProvider x) => x.deleteCTcoreP(args['id']));
              Navigator.popAndPushNamed(context, '/detail_CTcoreP', arguments: {
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
                              child: display_CTcoreP_details(ntr, ntr1)),
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

  Container display_CTcoreP_details(CTcorePModel ntr, CTModel ntr1) {
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
                    ntr1.connectedTap == "S1-S2" || ntr1.connectedTap == "0"
                        ? s1_s2_impl(ntr)
                        : Container(),
                    ntr1.connectedTap == "S1-S3"
                        ? s1_s3_impl(ntr)
                        : Container(),
                    ntr1.connectedTap == "S1-S4"
                        ? s1_s4_impl(ntr)
                        : Container(),
                    ntr1.connectedTap == "S1-S5"
                        ? s1_s5_impl(ntr)
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

  Column s1_s2_impl(CTcorePModel ntr) {
    return Column(
      children: [
        Card(
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                ntr.R_1S1_1S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_1S1_1S2', ntr.R_1S1_1S2),
                ntr.R_2S1_2S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_2S1_2S2', ntr.R_2S1_2S2),
                ntr.R_3S1_3S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_3S1_3S2', ntr.R_3S1_3S2),
                ntr.R_4S1_4S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_4S1_4S2', ntr.R_4S1_4S2),
                ntr.R_5S1_5S2 == '0'
                    ? Container()
                    : Column(
                        children: [
                          Divider(height: 10),
                          Text('R_5S1_5S2 : ' + ntr.R_5S1_5S2.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
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
                ntr.Y_1S1_1S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_1S1_1S2', ntr.Y_1S1_1S2),
                ntr.Y_2S1_2S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_2S1_2S2', ntr.Y_2S1_2S2),
                ntr.Y_3S1_3S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_3S1_3S2', ntr.Y_3S1_3S2),
                ntr.Y_4S1_4S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_4S1_4S2', ntr.Y_4S1_4S2),
                ntr.Y_5S1_5S2 == '0'
                    ? Container()
                    : Column(
                        children: [
                          Divider(height: 10),
                          Text('Y_5S1_5S2 : ' + ntr.Y_5S1_5S2.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
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
                ntr.B_1S1_1S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_1S1_1S2', ntr.B_1S1_1S2),
                ntr.B_2S1_2S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_2S1_2S2', ntr.B_2S1_2S2),
                ntr.B_3S1_3S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_3S1_3S2', ntr.B_3S1_3S2),
                ntr.B_4S1_4S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_4S1_4S2', ntr.B_4S1_4S2),
                ntr.B_5S1_5S2 == '0'
                    ? Container()
                    : Column(
                        children: [
                          Divider(height: 10),
                          Text('B_5S1_5S2 : ' + ntr.B_5S1_5S2.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column s1_s3_impl(CTcorePModel ntr) {
    return Column(
      children: [
        Card(
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                ntr.R_1S1_1S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_1S1_1S3', ntr.R_1S1_1S2),
                ntr.R_2S1_2S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_2S1_2S3', ntr.R_2S1_2S2),
                ntr.R_3S1_3S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_3S1_3S3', ntr.R_3S1_3S2),
                ntr.R_4S1_4S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_4S1_4S3', ntr.R_4S1_4S2),
                ntr.R_5S1_5S2 == '0'
                    ? Container()
                    : Column(
                        children: [
                          Divider(height: 10),
                          Text('R_5S1_5S3 : ' + ntr.R_5S1_5S2.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
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
                ntr.Y_1S1_1S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_1S1_1S3', ntr.Y_1S1_1S2),
                ntr.Y_2S1_2S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_2S1_2S3', ntr.Y_2S1_2S2),
                ntr.Y_3S1_3S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_3S1_3S3', ntr.Y_3S1_3S2),
                ntr.Y_4S1_4S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_4S1_4S3', ntr.Y_4S1_4S2),
                ntr.Y_5S1_5S2 == '0'
                    ? Container()
                    : Column(
                        children: [
                          Divider(height: 10),
                          Text('Y_5S1_5S3 : ' + ntr.Y_5S1_5S2.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
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
                ntr.B_1S1_1S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_1S1_1S3', ntr.B_1S1_1S2),
                ntr.B_2S1_2S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_2S1_2S3', ntr.B_2S1_2S2),
                ntr.B_3S1_3S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_3S1_3S3', ntr.B_3S1_3S2),
                ntr.B_4S1_4S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_4S1_4S3', ntr.B_4S1_4S2),
                ntr.B_5S1_5S2 == '0'
                    ? Container()
                    : Column(
                        children: [
                          Divider(height: 10),
                          Text('B_5S1_5S3 : ' + ntr.B_5S1_5S2.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column s1_s4_impl(CTcorePModel ntr) {
    return Column(
      children: [
        Card(
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                ntr.R_1S1_1S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_1S1_1S4', ntr.R_1S1_1S2),
                ntr.R_2S1_2S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_2S1_2S4', ntr.R_2S1_2S2),
                ntr.R_3S1_3S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_3S1_3S4', ntr.R_3S1_3S2),
                ntr.R_4S1_4S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_4S1_4S4', ntr.R_4S1_4S2),
                ntr.R_5S1_5S2 == '0'
                    ? Container()
                    : Column(
                        children: [
                          Divider(height: 10),
                          Text('R_5S1_5S4 : ' + ntr.R_5S1_5S2.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
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
                ntr.Y_1S1_1S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_1S1_1S4', ntr.Y_1S1_1S2),
                ntr.Y_2S1_2S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_2S1_2S4', ntr.Y_2S1_2S2),
                ntr.Y_3S1_3S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_3S1_3S4', ntr.Y_3S1_3S2),
                ntr.Y_4S1_4S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_4S1_4S4', ntr.Y_4S1_4S2),
                ntr.Y_5S1_5S2 == '0'
                    ? Container()
                    : Column(
                        children: [
                          Divider(height: 10),
                          Text('Y_5S1_5S4 : ' + ntr.Y_5S1_5S2.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
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
                ntr.B_1S1_1S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_1S1_1S4', ntr.B_1S1_1S2),
                ntr.B_2S1_2S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_2S1_2S4', ntr.B_2S1_2S2),
                ntr.B_3S1_3S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_3S1_3S4', ntr.B_3S1_3S2),
                ntr.B_4S1_4S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_4S1_4S4', ntr.B_4S1_4S2),
                ntr.B_5S1_5S2 == '0'
                    ? Container()
                    : Column(
                        children: [
                          Divider(height: 10),
                          Text('B_5S1_5S4 : ' + ntr.B_5S1_5S2.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column s1_s5_impl(CTcorePModel ntr) {
    return Column(
      children: [
        Card(
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                ntr.R_1S1_1S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_1S1_1S5', ntr.R_1S1_1S2),
                ntr.R_2S1_2S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_2S1_2S5', ntr.R_2S1_2S2),
                ntr.R_3S1_3S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_3S1_3S5', ntr.R_3S1_3S2),
                ntr.R_4S1_4S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('R_4S1_4S5', ntr.R_4S1_4S2),
                ntr.R_5S1_5S2 == '0'
                    ? Container()
                    : Column(
                        children: [
                          Divider(height: 10),
                          Text('R_5S1_5S5 : ' + ntr.R_5S1_5S2.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
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
                ntr.Y_1S1_1S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_1S1_1S5', ntr.Y_1S1_1S2),
                ntr.Y_2S1_2S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_2S1_2S5', ntr.Y_2S1_2S2),
                ntr.Y_3S1_3S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_3S1_3S5', ntr.Y_3S1_3S2),
                ntr.Y_4S1_4S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('Y_4S1_4S5', ntr.Y_4S1_4S2),
                ntr.Y_5S1_5S2 == '0'
                    ? Container()
                    : Column(
                        children: [
                          Divider(height: 10),
                          Text('Y_5S1_5S5 : ' + ntr.Y_5S1_5S2.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
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
                ntr.B_1S1_1S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_1S1_1S5', ntr.B_1S1_1S2),
                ntr.B_2S1_2S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_2S1_2S5', ntr.B_2S1_2S2),
                ntr.B_3S1_3S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_3S1_3S5', ntr.B_3S1_3S2),
                ntr.B_4S1_4S2 == '0'
                    ? Container()
                    : simplifiedCT_core_p('B_4S1_4S5', ntr.B_4S1_4S2),
                ntr.B_5S1_5S2 == '0'
                    ? Container()
                    : Column(
                        children: [
                          Divider(height: 10),
                          Text('B_5S1_5S5 : ' + ntr.B_5S1_5S2.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  simplifiedCT_core_p(String hintxt, String value) {
    return Column(
      children: [
        Divider(height: 10),
        Text(hintxt + ' : ' + value,
            style: const TextStyle(color: Colors.black, fontSize: 13)),
      ],
    );
  }
}
