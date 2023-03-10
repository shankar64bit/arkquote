// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/powt/powt_mb_model.dart';
import '../../providers/powt_provider/powt_mb_provider.dart';

class Detail_Powt_mb_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_Powt_mb_page(@required this.args, {Key key}) : super(key: key);

  Powt_mb_Model powt_mbModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((Powt_mb_Provider x) => x.getPowt_mbById(args['id']));
    Powt_mb_Model ntr = watchOnly((Powt_mb_Provider x) => x.powt_mb_Model);

    print(ntr);
    print("ntr  Powt_mb......");
    var mob =
        const Text('Powt_mb Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Powt_mb Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_Powt_mb', arguments: {
                  'id': args['id'],
                  'POWT_ID': args['POWT_ID'],
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((Powt_mb_Provider x) => x.deletePowt_mb(args['id']));
              Navigator.popAndPushNamed(context, '/detail_Powt_mb', arguments: {
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
                              child: display_Powt_mb_details(ntr)),
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

  Container display_Powt_mb_details(Powt_mb_Model ntr) {
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
                                        'RY Cut HV side 1v_1w : ' +
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
                                        'RY Cut HV side 1w_1u : ' +
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
                                        'RY Cut HV side 1u_1n : ' +
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
                                        'RY Cut HV side 1v_1n : ' +
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
                                        'RY Cut HV side 1w_1n : ' +
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
                                        'RY Cut LV side 2u_2v : ' +
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
                                        'RY Cut LV side 2v_2w : ' +
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
                                        'RY Cut LV side 2w_2u : ' +
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
                                        'RY Cut LV side 2u_2n : ' +
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
                                        'RY Cut LV side 2v_2n : ' +
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
                                        'RY Cut LV side 2w_2n : ' +
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
                                        'YB Cut HV side 1u_1v : ' +
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
                                        'YB Cut HV side 1v_1w : ' +
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
                                        'YB Cut HV side 1w_1u : ' +
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
                                        'YB Cut HV side 1u_1n : ' +
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
                                        'YB Cut HV side 1v_1n : ' +
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
                                        'YB Cut HV side 1w_1n : ' +
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
                                        'YB Cut LV side 2u_2v : ' +
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
                                        'YB Cut LV side 2v_2w : ' +
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
                                        'YB Cut LV side 2w_2u : ' +
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
                                        'YB Cut LV side 2u_2n : ' +
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
                                        'YB Cut LV side 2v_2n : ' +
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
                                        'YB Cut LV side 2w_2n : ' +
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
                                        'BR Cut HV side 1u_1v : ' +
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
                                        'BR Cut HV side 1v_1w : ' +
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
                                        'BR Cut HV side 1w_1u : ' +
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
                                        'BR Cut HV side 1u_1n : ' +
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
                                        'BR Cut HV side 1v_1n : ' +
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
                                        'BR Cut HV side 1w_1n : ' +
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
                                        'BR Cut LV side 2u_2v : ' +
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
                                        'BR Cut LV side 2v_2w : ' +
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
                                        'BR Cut LV side 2w_2u : ' +
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
                                        'BR Cut LV side 2u_2n : ' +
                                            ntr.br_lv_2u_2n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    // Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.br_lv_2v_2n != 0.00
                              ? Column(
                                  children: [
                                    Divider(height: 10),
                                    Text(
                                        'BR Cut LV side 2v_2n : ' +
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
                                        'BR Cut LV side 2w_2n : ' +
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
