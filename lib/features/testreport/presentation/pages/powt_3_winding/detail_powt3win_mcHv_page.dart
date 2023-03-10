import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_mcHv_model.dart';
import '../../providers/powt_3_winding/powt3win_mcHv_provider.dart';

class Detail_Powt3win_mcHv_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_Powt3win_mcHv_page(@required this.args, {Key key}) : super(key: key);

  Powt3win_mcHv_Model powt3win_mcHvModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((Powt3win_mcHv_Provider x) => x.getPowt3win_mcHvById(args['id']));
    Powt3win_mcHv_Model ntr =
        watchOnly((Powt3win_mcHv_Provider x) => x.powt3win_mcHv_Model);

    print(ntr);
    print("ntr  Powt3win_mcHv......");
    var mob = const Text('Powt3win_mcHv Test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Powt3win_mcHv Test Details',
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
                Navigator.popAndPushNamed(context, '/edit_POWT3WIN_mcHv',
                    arguments: {
                      'id': args['id'],
                      'POWT3WIN_ID': args['POWT3WIN_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((Powt3win_mcHv_Provider x) =>
                  x.deletePowt3win_mcHv(args['id']));
              Navigator.popAndPushNamed(context, '/detail_POWT3WIN_mcHv',
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
                              child: display_Powt3win_mcHv_details(ntr)),
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

  Container display_Powt3win_mcHv_details(Powt3win_mcHv_Model ntr) {
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
                          ntr.hv_1u_1vn != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'hv_1u_1vn : ' +
                                            ntr.hv_1u_1vn.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1v_1wn != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'hv_1v_1wn : ' +
                                            ntr.hv_1v_1wn.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1w_1un != 0.00
                              ? Column(
                                  children: [
                                    Text(
                                        'hv_1w_1un : ' +
                                            ntr.hv_1w_1un.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1u != 0.00
                              ? Column(
                                  children: [
                                    Text('hv_1u : ' + ntr.hv_1u.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1v != 0.00
                              ? Column(
                                  children: [
                                    Text('hv_1v : ' + ntr.hv_1v.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1w != 0.00
                              ? Column(
                                  children: [
                                    Text('hv_1w : ' + ntr.hv_1w.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.hv_1n != 0.00
                              ? Column(
                                  children: [
                                    Text('hv_1n : ' + ntr.hv_1n.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    Divider(height: 10),
                                  ],
                                )
                              : Container(),
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
}
