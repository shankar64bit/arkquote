// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../../data/models/equipment/Relays/TRelay/tr_model.dart';
import '../../../../data/models/equipment/Relays/TRelay/tr_pac_model.dart';
import '../../../providers/Relays_providers/TimerRelay_provider/tr_pac_provider.dart';
import '../../../providers/Relays_providers/TimerRelay_provider/tr_provider.dart';

class DetailTrPacPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;

  DetailTrPacPage(this.args, {Key key}) : super(key: key);

  TrPacModel trPacModel, ntr;

  @override
  Widget build(BuildContext context) {
    final TrModel ntr1 = watchOnly((TrProvider x) => x.trModel);
    getX((TrPacProvider x) => x.getTrPacById(args['id']));
    TrPacModel ntr = watchOnly((TrPacProvider x) => x.trPac_Model);

    print(ntr);
    print("ntr  ......");

    var mob = const Text('TR - PAC Details', style: TextStyle(fontSize: 15));
    var desk = const Text('TR - PAC Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_TR_PAC', arguments: {
                  'id': args['id'],
                  'TrNo': ntr.trNo,
                  'trelayDatabaseID': args['trelayDatabaseID'],
                  'Serial_No': ntr.serialNo,
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((TrPacProvider x) => x.deleteTrPac(args['id']));
              Navigator.popAndPushNamed(context, '/detail_TR', arguments: {
                // 'id': args['TR_ID'],
                'id': ntr1.id,
                'trNo': ntr.trNo,
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
                              constraints: const BoxConstraints(
                                  minHeight: 0, maxWidth: 700),
                              child: display_TR_PAC_details(ntr)),
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

  Container display_TR_PAC_details(TrPacModel ntr) {
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          const Divider(height: 10),
                          Text('TrNo : ${ntr.trNo}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          const Divider(height: 10),
                          Text('SerialNo : ${ntr.serialNo}',
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
                          const Text(
                            'Relay Adopted Setting',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                          const Divider(height: 10),
                          Text('time : ${ntr.time}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          const Text(
                            'Relay Coil Resistance Check',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                          const Divider(height: 10),
                          Text('coilResistenace: ${ntr.coilResistenace}' + ' Ω',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          const Text(
                            'Relay Operation Check',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                          const Divider(height: 10),
                          Text(
                              'Relay Operated Time (Seconds): ${ntr.relayOprTime}',
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
