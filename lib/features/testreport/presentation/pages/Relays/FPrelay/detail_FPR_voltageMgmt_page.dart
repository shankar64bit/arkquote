import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../../data/models/equipment/Relays/FPrelay/FPR_voltageMgmt_model.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_voltageMgmt_provider.dart';

class Detail_FPRvoltageMgmt_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_FPRvoltageMgmt_page(@required this.args, {Key key}) : super(key: key);

  FPRvoltageMgmtModel fprvoltageMgmtModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((FPRvoltageMgmtProvider x) => x.getFPRvoltageMgmtById(args['id']));
    FPRvoltageMgmtModel ntr =
        watchOnly((FPRvoltageMgmtProvider x) => x.fprvoltageMgmt_Model);

    print(ntr);
    print("ntr  FPRvoltageMgmt......");
    var mob = const Text('FPRvoltageMgmt Test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('FPRvoltageMgmt Test Details',
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
                Navigator.popAndPushNamed(context, '/edit_FPRvoltageMgmt',
                    arguments: {
                      'id': args['id'],
                      'FPR_ID': args['FPR_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((FPRvoltageMgmtProvider x) =>
                  x.deleteFPRvoltageMgmt(args['id']));
              Navigator.popAndPushNamed(context, '/detail_FPRvoltageMgmt',
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
                              child: display_FPRvoltageMgmt_details(ntr)),
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

  Container display_FPRvoltageMgmt_details(FPRvoltageMgmtModel ntr) {
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
                              'R-N Applied Secondary Voltage  : ' +
                                  ntr.rn_applSecVoltage.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'R-N Measured Primary Voltage  : ' +
                                  ntr.rn_measurePrimVoltage.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Y-N Applied Secondary Voltage : ' +
                                  ntr.yn_applSecVoltage.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'Y-N Measured Primary Voltage  : ' +
                                  ntr.yn_measurePrimVoltage.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'B-N Applied Secondary Voltage : ' +
                                  ntr.bn_applSecVoltage.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'B-N Measured Primary Voltage  : ' +
                                  ntr.bn_measurePrimVoltage.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'equipmentUsed : ' + ntr.equipmentUsed.toString(),
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
