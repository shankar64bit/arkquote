// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../../data/models/equipment/Relays/EFELRelay/efelr_model.dart';
import '../../../../data/models/equipment/Relays/EFELRelay/efelr_pac_model.dart';
import '../../../providers/Relays_providers/EFELRelay_provider/efelr_pac_provider.dart';
import '../../../providers/Relays_providers/EFELRelay_provider/efelr_provider.dart';

class DetailEfElrPacPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;
  String psMul1Text = '';
  String psMul2Text = '';
  String rOprTime1Text = '';
  String rOprTime2Text = '';

  DetailEfElrPacPage(this.args, {Key key}) : super(key: key);

  EfElrPacModel efelrPacModel, ntr;

  @override
  Widget build(BuildContext context) {
    final EfElrModel ntr1 = watchOnly((EfElrProvider x) => x.efelrModel);
    getX((EfElrPacProvider x) => x.getEfElrPacById(args['id']));
    EfElrPacModel ntr = watchOnly((EfElrPacProvider x) => x.efelrPac_Model);

    print(ntr1);
    print("ntr  ......");

    var mob = const Text('Protection Accuracy Check Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Protection Accuracy Check Details',
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
                Navigator.popAndPushNamed(context, '/edit_EFELR_PAC',
                    arguments: {
                      'id': args['id'],
                      'TrNo': ntr.trNo,
                      'efelrelayDatabaseID': args['efelrelayDatabaseID'],
                      'Serial_No': ntr.serialNo,
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((EfElrPacProvider x) => x.deleteEfElrPac(args['id']));
              Navigator.popAndPushNamed(context, '/detail_EFELR', arguments: {
                // 'id': args['EFELR_ID'],
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
                              constraints:
                                  BoxConstraints(minHeight: 0, maxWidth: 700),
                              child: display_EFELR_PAC_details(ntr, ntr1)),
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

  Container display_EFELR_PAC_details(EfElrPacModel ntr, EfElrModel ntr1) {
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
                          Text('ID : ' + args['id'].toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          Divider(height: 10),
                          Text('TrNo : ' + ntr.trNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          Divider(height: 10),
                          Text('SerialNo : ' + ntr.serialNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                        ]),
                      ),
                    ),
                    const Text('Relay Adopted Setting : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            fontSize: 13)),
                    Divider(height: 10),
                    ntr1.etype == 'efrinv' || ntr1.etype == 'efrinvl'
                        ? Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  Text('plug Setting : ${ntr.plugSetting}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 13)),
                                  Divider(height: 10),
                                  Text('TMS : ' + ntr.TMS.toString(),
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 13)),
                                  Divider(height: 10),
                                  Text(
                                      'Plug Setting Multiplier-2X :  ${ntr.plugSettingMul_2x}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 13)),
                                  Divider(height: 10),
                                  Text(
                                      'Plug Setting Multiplier-5X :  ${ntr.plugSettingMul_5x}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 13)),
                                ])))
                        : Container(),
                    Text('plug Setting (Hi): ' + ntr.plugSetting_Hi.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Divider(height: 10),
                    Text('Time : ' + ntr.time.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    ntr1.etype != 'elr'
                        ? Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  const Text('Relay Coil Resistance Check: ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                          fontSize: 13)),
                                  Divider(height: 10),
                                  Text(
                                      'Coil Resistenace: ' +
                                          ntr.coilResistanace.toString() +
                                          ' Ω',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 13))
                                ])))
                        : Container(),
                    Divider(height: 10),
                    const Text('Relay Operation Check : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            fontSize: 13)),
                    ntr1.etype == 'efrinv' || ntr1.etype == 'efrinvl'
                        ? Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                // Divider(height: 10),
                                Text(
                                    'Pickup Current :  ' +
                                        ntr.pickupCurrent.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text(
                                    'Relay Operated Time -2X : ' +
                                        ntr.relayOprTime_2x.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text(
                                    'Relay Operated Time -5X :  ' +
                                        ntr.relayOprTime_5x.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                              ]),
                            ),
                          )
                        : Container(),
                    Divider(height: 10),
                    Text(
                        'Relay Operated Time Hi: ' +
                            ntr.relayOprTime_Hi.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
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
