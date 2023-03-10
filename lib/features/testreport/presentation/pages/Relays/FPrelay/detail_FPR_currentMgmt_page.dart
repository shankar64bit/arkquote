import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../../data/models/equipment/Relays/FPrelay/FPR_currentMgmt_model.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_currentMgmt_provider.dart';

class Detail_FPRcurrentMgmt_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_FPRcurrentMgmt_page(@required this.args, {Key key}) : super(key: key);

  FPRcurrentMgmtModel fprcurrentMgmtModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((FPRcurrentMgmtProvider x) => x.getFPRcurrentMgmtById(args['id']));
    FPRcurrentMgmtModel ntr =
        watchOnly((FPRcurrentMgmtProvider x) => x.fprcurrentMgmt_Model);

    print(ntr.databaseID);
    print("ntr FPR CurrentMgmt......");
    var mob = const Text('FPR CurrentMgmt Test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('FPR CurrentMgmt Test Details',
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
                Navigator.popAndPushNamed(context, '/edit_FPRcurrentMgmt',
                    arguments: {
                      'id': args['id'],
                      'FPR_ID': args['FPR_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((FPRcurrentMgmtProvider x) =>
                  x.deleteFPRcurrentMgmt(args['id']));
              Navigator.popAndPushNamed(context, '/detail_FPRcurrentMgmt',
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
                              child: display_FPRcurrentMgmt_details(ntr)),
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

  Container display_FPRcurrentMgmt_details(FPRcurrentMgmtModel ntr) {
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
                          Text('Serial No : ' + ntr.serialNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'R-N Measure Primary Current : ' +
                                  ntr.rn_measurePrimCurrent.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Y-N Measure Primary Current : ' +
                                  ntr.yn_measurePrimCurrent.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'B-N Measure Primary Current : ' +
                                  ntr.bn_measurePrimCurrent.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Equipment Used : ' +
                                  ntr.equipmentUsed.toString(),
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
}