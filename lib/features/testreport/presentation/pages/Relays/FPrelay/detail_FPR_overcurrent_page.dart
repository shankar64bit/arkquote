import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../../data/models/equipment/Relays/FPrelay/FPR_overcurrent_model.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_overcurrent_provider.dart';

class Detail_FPRovercurrent_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_FPRovercurrent_page(@required this.args, {Key key}) : super(key: key);

  FPRovercurrentModel fprovercurrentModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((FPRovercurrentProvider x) => x.getFPRovercurrentById(args['id']));
    FPRovercurrentModel ntr =
        watchOnly((FPRovercurrentProvider x) => x.fprovercurrent_Model);

    print(ntr);
    print("ntr  FPRovercurrent......");
    var mob =
        const Text('overcurrent Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('overcurrent Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_FPRovercurrent',
                    arguments: {
                      'id': args['id'],
                      'FPR_ID': args['FPR_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((FPRovercurrentProvider x) =>
                  x.deleteFPRovercurrent(args['id']));
              Navigator.popAndPushNamed(context, '/detail_FPRovercurrent',
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
                              child: display_FPRovercurrent_details(ntr)),
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

  Container display_FPRovercurrent_details(FPRovercurrentModel ntr) {
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
                          Text('Relay Adopted Settings :',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          const Divider(height: 10),
                          Text('Current Set : ${ntr.CurrentSet}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('TMS : ${ntr.TMS}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('curve : ${ntr.curve}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('function : ${ntr.function}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('delay : ${ntr.delay}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Relay Operation Check ',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          const Divider(height: 10),
                          Text('R-N Pickup Current : ${ntr.rn_pickupCurrent}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'R-N Relay Operated Time-2x : ${ntr.rn_relayOprTime_2x}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'R-N Relay Operated Time-5x : ${ntr.rn_relayOprTime_5x}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Y-N Pickup Current  : ${ntr.yn_pickupCurrent}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Y-N Relay Operated Time-2x : ${ntr.yn_relayOprTime_2x}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Y-N Relay Operated Time-5x  : ${ntr.yn_relayOprTime_5x}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('B-N Pickup Current  : ${ntr.bn_pickupCurrent}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'B-N Relay Operated Time-2x : ${ntr.bn_relayOprTime_2x}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'B-N Relay Operated Time-5x  : ${ntr.bn_relayOprTime_5x}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Stage No : ${ntr.stageNo}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('equipmentUsed : ${ntr.equipmentUsed}',
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
