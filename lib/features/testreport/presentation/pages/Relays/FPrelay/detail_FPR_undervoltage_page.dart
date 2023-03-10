import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../../data/models/equipment/Relays/FPrelay/FPR_undervoltage_model.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_undervoltage_provider.dart';

class Detail_FPRundervoltage_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_FPRundervoltage_page(@required this.args, {Key key}) : super(key: key);

  FPRundervoltageModel fprundervoltageModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((FPRundervoltageProvider x) => x.getFPRundervoltageById(args['id']));
    FPRundervoltageModel ntr =
        watchOnly((FPRundervoltageProvider x) => x.fprundervoltage_Model);

    print(ntr);
    print("ntr  FPRundervoltage......");
    var mob = const Text('FPR Undervoltage Test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('FPR Undervoltage Test Details',
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
                Navigator.popAndPushNamed(context, '/edit_FPRundervoltage',
                    arguments: {
                      'id': args['id'],
                      'FPR_ID': args['FPR_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((FPRundervoltageProvider x) =>
                  x.deleteFPRundervoltage(args['id']));
              Navigator.popAndPushNamed(context, '/detail_FPRundervoltage',
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
                              constraints: const BoxConstraints(
                                  minHeight: 0, maxWidth: 700),
                              child: display_FPRundervoltage_details(ntr)),
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

  Container display_FPRundervoltage_details(FPRundervoltageModel ntr) {
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
                          Text('ID : ${args['id']}',
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
                          Text('Trno : ${ntr.trNo}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Serial No : ${ntr.serialNo}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          const Text('Relay Adopted Settings: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          const Divider(height: 10),
                          Text('Voltage Set : ${ntr.voltageSet}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Delay : ${ntr.delay}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          const Text('Relay Operation check: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          const Divider(height: 10),
                          Text('Function : ${ntr.function}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'R-N Secondary Voltage Set : ${ntr.rn_secVoltageSet}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'R-N_Applied Secondary Voltage : ${ntr.rn_appliedSecVoltage}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'R-N Relay Operated Time : ${ntr.rn_relayOprTime}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Y-N Secondary Voltage Set : ${ntr.yn_secVoltageSet}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Y-N_Applied Secondary Voltage : ${ntr.yn_appliedSecVoltage}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Y-N Relay Operated Time : ${ntr.yn_relayOprTime}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'B-N Secondary Voltage Set : ${ntr.bn_secVoltageSet}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'B-N_Applied Secondary Voltage : ${ntr.bn_appliedSecVoltage}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'B-N Relay Operated Time : ${ntr.bn_relayOprTime}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Stage No : ${ntr.stageNo}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Equipment Used : ${ntr.equipmentUsed}',
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
