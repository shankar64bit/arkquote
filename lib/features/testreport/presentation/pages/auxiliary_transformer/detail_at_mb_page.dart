// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/AT/AT_mb_model.dart';
import '../../providers/at_provider/at_mb_provider.dart';

class Detail_AT_mb_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_AT_mb_page(@required this.args, {Key key}) : super(key: key);

  AT_mb_Model at_mbModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((AT_mb_Provider x) => x.getAT_mbById(args['id']));
    AT_mb_Model ntr = watchOnly((AT_mb_Provider x) => x.at_mb_Model);

    print(ntr);
    print("ntr  AT_mb......");
    var mob = const Text('AT_mb Test Details', style: TextStyle(fontSize: 15));
    var desk = const Text('AT_mb Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_AT_mb', arguments: {
                  'id': args['id'],
                  'AT_ID': args['AT_ID'],
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((AT_mb_Provider x) => x.deleteAT_mb(args['id']));
              Navigator.popAndPushNamed(context, '/detail_AT_mb', arguments: {
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
                              child: display_AT_mb_details(ntr)),
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

  Container display_AT_mb_details(AT_mb_Model ntr) {
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
                          Text('DBID : ' + ntr.databaseID.toString(),
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
                          Text('Trno : ' + ntr.trNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('serialNo : ' + ntr.serialNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          ntr.ry_hv_1u_1v != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'ry_hv_1u_1v : ' +
                                            ntr.ry_hv_1u_1v.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ry_hv_1v_1w != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'ry_hv_1v_1w : ' +
                                            ntr.ry_hv_1v_1w.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ry_hv_1w_1u != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'ry_hv_1w_1u : ' +
                                            ntr.ry_hv_1w_1u.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ry_hv_1u_1n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'ry_hv_1u_1n : ' +
                                            ntr.ry_hv_1u_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ry_hv_1v_1n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'ry_hv_1v_1n : ' +
                                            ntr.ry_hv_1v_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ry_hv_1w_1n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'ry_hv_1w_1n : ' +
                                            ntr.ry_hv_1w_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ry_lv_2u_2v != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'ry_lv_2u_2v : ' +
                                            ntr.ry_lv_2u_2v.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ry_lv_2v_2w != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'ry_lv_2v_2w : ' +
                                            ntr.ry_lv_2v_2w.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.ry_lv_2w_2u != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'ry_lv_2w_2u : ' +
                                            ntr.ry_lv_2w_2u.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
                              : Container(),
                          ntr.ry_lv_2u_2n != 0.00
                              ? Column(
                                  children: [
                                    Divider(height: 10),
                                    Text(
                                        'ry_lv_2u_2n : ' +
                                            ntr.ry_lv_2u_2n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
                              : Container(),
                          ntr.ry_lv_2v_2n != 0.00
                              ? Column(
                                  children: [
                                    Divider(height: 10),
                                    Text(
                                        'ry_lv_2v_2n : ' +
                                            ntr.ry_lv_2v_2n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
                              : Container(),
                          ntr.ry_lv_2w_2n != 0.00
                              ? Column(
                                  children: [
                                    Divider(height: 10),
                                    Text(
                                        'ry_lv_2w_2n : ' +
                                            ntr.ry_lv_2w_2n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
                              : Container(),
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(children: [
                          ntr.yb_hv_1u_1v != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'yb_hv_1u_1v : ' +
                                            ntr.yb_hv_1u_1v.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.yb_hv_1v_1w != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'yb_hv_1v_1w : ' +
                                            ntr.yb_hv_1v_1w.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.yb_hv_1w_1u != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'yb_hv_1w_1u : ' +
                                            ntr.yb_hv_1w_1u.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.yb_hv_1u_1n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'yb_hv_1u_1n : ' +
                                            ntr.yb_hv_1u_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.yb_hv_1v_1n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'yb_hv_1v_1n : ' +
                                            ntr.yb_hv_1v_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.yb_hv_1w_1n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'yb_hv_1w_1n : ' +
                                            ntr.yb_hv_1w_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.yb_lv_2u_2v != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'yb_lv_2u_2v : ' +
                                            ntr.yb_lv_2u_2v.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.yb_lv_2v_2w != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'yb_lv_2v_2w : ' +
                                            ntr.yb_lv_2v_2w.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.yb_lv_2w_2u != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'yb_lv_2w_2u : ' +
                                            ntr.yb_lv_2w_2u.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
                              : Container(),
                          ntr.yb_lv_2u_2n != 0.00
                              ? Column(
                                  children: [
                                    Divider(height: 10),
                                    Text(
                                        'yb_lv_2u_2n : ' +
                                            ntr.yb_lv_2u_2n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
                              : Container(),
                          ntr.yb_lv_2v_2n != 0.00
                              ? Column(
                                  children: [
                                    Divider(height: 10),
                                    Text(
                                        'yb_lv_2v_2n : ' +
                                            ntr.yb_lv_2v_2n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
                              : Container(),
                          ntr.yb_lv_2w_2n != 0.00
                              ? Column(
                                  children: [
                                    Divider(height: 10),
                                    Text(
                                        'yb_lv_2w_2n : ' +
                                            ntr.yb_lv_2w_2n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
                              : Container(),
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(children: [
                          ntr.br_hv_1u_1v != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'br_hv_1u_1v : ' +
                                            ntr.br_hv_1u_1v.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.br_hv_1v_1w != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'br_hv_1v_1w : ' +
                                            ntr.br_hv_1v_1w.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.br_hv_1w_1u != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'br_hv_1w_1u : ' +
                                            ntr.br_hv_1w_1u.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.br_hv_1u_1n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'br_hv_1u_1n : ' +
                                            ntr.br_hv_1u_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.br_hv_1v_1n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'br_hv_1v_1n : ' +
                                            ntr.br_hv_1v_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.br_hv_1w_1n != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'br_hv_1w_1n : ' +
                                            ntr.br_hv_1w_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.br_lv_2u_2v != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'br_lv_2u_2v : ' +
                                            ntr.br_lv_2u_2v.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.br_lv_2v_2w != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'br_lv_2v_2w : ' +
                                            ntr.br_lv_2v_2w.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.br_lv_2w_2u != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'br_lv_2w_2u : ' +
                                            ntr.br_lv_2w_2u.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
                              : Container(),
                          ntr.br_lv_2u_2n != 0.00
                              ? Column(
                                  children: [
                                    Divider(height: 10),
                                    Text(
                                        'br_lv_2u_2n : ' +
                                            ntr.br_lv_2u_2n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.br_lv_2v_2n != 0.00
                              ? Column(
                                  children: [
                                    Divider(height: 10),
                                    Text(
                                        'br_lv_2v_2n : ' +
                                            ntr.br_lv_2v_2n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
                              : Container(),
                          ntr.br_lv_2w_2n != 0.00
                              ? Column(
                                  children: [
                                    Divider(height: 10),
                                    Text(
                                        'br_lv_2w_2n : ' +
                                            ntr.br_lv_2w_2n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                  ],
                                )
                              : Container(),
                        ]),
                      ),
                    )
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
