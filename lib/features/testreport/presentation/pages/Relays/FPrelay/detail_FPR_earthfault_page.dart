import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../../data/models/equipment/Relays/FPrelay/FPR_earthfault_model.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_earthfault_provider.dart';

class Detail_FPRearthfault_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_FPRearthfault_page(@required this.args, {Key key}) : super(key: key);

  FPRearthfaultModel fprearthfaultModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((FPRearthfaultProvider x) => x.getFPRearthfaultById(args['id']));
    FPRearthfaultModel ntr =
        watchOnly((FPRearthfaultProvider x) => x.fprearthfault_Model);

    print(ntr);
    print("ntr  FPRearthfault......");
    var mob = const Text('FPRearthfault Test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('FPRearthfault Test Details',
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
                Navigator.popAndPushNamed(context, '/edit_FPRearthfault',
                    arguments: {
                      'id': args['id'],
                      'FPR_ID': args['FPR_ID'],
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((FPRearthfaultProvider x) =>
                  x.deleteFPRearthfault(args['id']));
              Navigator.popAndPushNamed(context, '/detail_FPRearthfault',
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
                              child: display_FPRearthfault_details(ntr)),
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

  Container display_FPRearthfault_details(FPRearthfaultModel ntr) {
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
                          Text('Current Set : ${ntr.currentSet}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('TMS : ${ntr.TMS}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Delay : ${ntr.delay}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Pickup Current : ${ntr.pickupCurrent}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Relay Operated Time 2X : ${ntr.relayOprTime_2x}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text(
                              'Relay Operated Time 5X : ${ntr.relayOprTime_5x}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Stage No : ${ntr.stageNo}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Curve : ${ntr.curve}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          Text('Function : ${ntr.function}',
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
