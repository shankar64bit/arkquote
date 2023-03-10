// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../../data/models/equipment/Relays/OCEFRelay/ocefr_model.dart';
import '../../../../data/models/equipment/Relays/OCEFRelay/ocefr_pac_model.dart';
import '../../../providers/Relays_providers/OCEFRelay_provider/ocefr_pac_provider.dart';
import '../../../providers/Relays_providers/OCEFRelay_provider/ocefr_provider.dart';

class DetailOcEfrPacPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;
  String psMul1Text = '';
  String psMul2Text = '';
  String rOprTime1Text = '';
  String rOprTime2Text = '';

  DetailOcEfrPacPage(this.args, {Key key}) : super(key: key);

  OcEfrPacModel ocefrPacModel, ntr;

  @override
  Widget build(BuildContext context) {
    final OcEfrModel ntr1 = watchOnly((OcEfrProvider x) => x.ocefrModel);
    getX((OcEfrPacProvider x) => x.getOcEfrPacById(args['id']));
    OcEfrPacModel ntr = watchOnly((OcEfrPacProvider x) => x.ocefrPac_Model);

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
                Navigator.popAndPushNamed(context, '/edit_OCEFR_PAC',
                    arguments: {
                      'id': args['id'],
                      'TrNo': ntr.trNo,
                      'ocefrelayDatabaseID': args['ocefrelayDatabaseID'],
                      'Serial_No_Rph': ntr1.serialNo_Rph,
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((OcEfrPacProvider x) => x.deleteOcEfrPac(args['id']));
              Navigator.popAndPushNamed(context, '/detail_OCEFR', arguments: {
                // 'id': args['OCEFR_ID'],
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
                              child: display_OCEFR_PAC_details(ntr, ntr1)),
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

  Container display_OCEFR_PAC_details(OcEfrPacModel ntr, OcEfrModel ntr1) {
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
                          Divider(height: 10),
                          Text('TrNo : ${ntr.trNo}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          Divider(height: 10),
                          Text('SerialNo : ${ntr.serialNo}',
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
                    ntr1.etype == 'ocrinv' ||
                            ntr1.etype == 'ocrinvl' ||
                            ntr1.etype == 'ocefrinv' ||
                            ntr1.etype == 'ocefrinvl'
                        ? Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  Text('plug Setting-R: ${ntr.r_plugSetting}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 13)),
                                  Divider(height: 10),
                                  Text('TMS-R : ${ntr.r_TMS}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 13)),
                                  Divider(height: 10),
                                  Text('plug Setting-Y: ${ntr.y_plugSetting}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 13)),
                                  Divider(height: 10),
                                  Text('TMS-Y : ${ntr.y_TMS}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 13)),
                                  Divider(height: 10),
                                  Text('plug Setting-B : ${ntr.b_plugSetting}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 13)),
                                  Divider(height: 10),
                                  Text('TMS-B : ${ntr.b_TMS}',
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
                    Text('plug Setting (Hi)-R: ${ntr.r_plugSetting_Hi}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Divider(height: 10),
                    Text('Time-R : ${ntr.r_time}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Divider(height: 10),
                    Text('plug Setting (Hi)-Y: ${ntr.r_plugSetting_Hi}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Divider(height: 10),
                    Text('Time-Y : ${ntr.r_time}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Divider(height: 10),
                    Text('plug Setting (Hi)-B: ${ntr.b_plugSetting_Hi}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Divider(height: 10),
                    Text('Time-B: ${ntr.b_time}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Card(
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
                                  'R-Coil Resistenace: ${ntr.r_coilResistanace}' +
                                      ' Ω',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13)),
                              Divider(height: 10),
                              Text(
                                  'Y-Coil Resistenace: ${ntr.y_coilResistanace}' +
                                      ' Ω',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13)),
                              Divider(height: 10),
                              Text(
                                  'B-Coil Resistenace: ${ntr.b_coilResistanace}' +
                                      ' Ω',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13)),
                            ]))),
                    Divider(height: 10),
                    const Text('Relay Operation Check : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            fontSize: 13)),
                    ntr1.etype == 'ocrinv' ||
                            ntr1.etype == 'ocrinvl' ||
                            ntr1.etype == 'ocefrinv' ||
                            ntr1.etype == 'ocefrinvl'
                        ? Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                // Divider(height: 10),
                                Text(
                                    'Pickup Current-R :  ${ntr.r_pickupCurrent}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text(
                                    'Pickup Current-Y :  ${ntr.y_pickupCurrent}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text(
                                    'Pickup Current-B :  ${ntr.b_pickupCurrent}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text(
                                    'Relay Operated Time -2X-R: ${ntr.r_relayOprTime_2x}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text(
                                    'Relay Operated Time -5X-R :  ${ntr.r_relayOprTime_5x}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text(
                                    'Relay Operated Time -2X-Y: ${ntr.y_relayOprTime_2x}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text(
                                    'Relay Operated Time -5X-Y :  ${ntr.y_relayOprTime_5x}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text(
                                    'Relay Operated Time -2X-B: ${ntr.b_relayOprTime_2x}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                                Divider(height: 10),
                                Text(
                                    'Relay Operated Time -5X-B :  ${ntr.b_relayOprTime_5x}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                              ]),
                            ),
                          )
                        : Container(),
                    Divider(height: 10),
                    Text('Relay Operated Time Hi-R: ${ntr.r_relayOprTime_Hi}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Divider(height: 10),
                    Text('Relay Operated Time Hi-Y: ${ntr.y_relayOprTime_Hi}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Divider(height: 10),
                    Text('Relay Operated Time Hi-B: ${ntr.b_relayOprTime_Hi}',
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
