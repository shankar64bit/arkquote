// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../../data/models/equipment/Relays/VoltageRelay/vr_model.dart';
import '../../../../data/models/equipment/Relays/VoltageRelay/vr_pac_model.dart';
import '../../../providers/Relays_providers/voltageRelay_provider/vr_pac_provider.dart';
import '../../../providers/Relays_providers/voltageRelay_provider/vr_provider.dart';

class DetailVrPacPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;
  String psMul1Text = '';
  String psMul2Text = '';
  String rOprTime1Text = '';
  String rOprTime2Text = '';

  DetailVrPacPage(this.args, {Key key}) : super(key: key);

  VrPacModel vrPacModel, ntr;

  @override
  Widget build(BuildContext context) {
    final VrModel ntr1 = watchOnly((VrProvider x) => x.vrModel);
    getX((VrPacProvider x) => x.getVrPacById(args['id']));
    VrPacModel ntr = watchOnly((VrPacProvider x) => x.vrPac_Model);

    print(ntr1);
    print("ntr  ......");
    if (ntr1.etype == 'ovr') {
      psMul1Text = 'Plug Setting Multiplier - 1.2x';
      psMul2Text = 'Plug Setting Multiplier - 3x';
      rOprTime1Text = 'Relay Operated Time - 1.2x';
      rOprTime2Text = 'Relay Operated Time - 3x';
    } else if (ntr1.etype == 'uvr') {
      psMul1Text = 'Plug Setting Multiplier - 10%';
      psMul2Text = 'Plug Setting Multiplier - 50%';
      rOprTime1Text = 'Relay Operated Time - 10%';
      rOprTime2Text = 'Relay Operated Time - 50%';
    }

    var mob = const Text('VR - PAC Details', style: TextStyle(fontSize: 15));
    var desk = const Text('VR - PAC Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_VR_PAC', arguments: {
                  'id': args['id'],
                  'TrNo': ntr.trNo,
                  'vrelayDatabaseID': args['vrelayDatabaseID'],
                  'Serial_No': ntr.serialNo,
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((VrPacProvider x) => x.deleteVrPac(args['id']));
              Navigator.popAndPushNamed(context, '/detail_VR', arguments: {
                // 'id': args['VR_ID'],
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
                              child: display_VR_PAC_details(ntr)),
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

  Container display_VR_PAC_details(VrPacModel ntr) {
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
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          const Text('Relay Adopted Setting : ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          Divider(height: 10),
                          Text('plug Setting : ' + ntr.plugSetting.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text('TMS : ' + ntr.TMS.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              psMul1Text +
                                  ' :  ' +
                                  ntr.plugSettingMul1.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              psMul2Text +
                                  ' :  ' +
                                  ntr.plugSettingMul2.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          const Text('Relay Coil Resistance Check: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              'CoilResistenace: ' +
                                  ntr.coilResistanace.toString() +
                                  ' Ω',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          const Text('Relay Operation Check : ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              rOprTime1Text +
                                  ' :  ' +
                                  ntr.relayOprTime_1x.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Divider(height: 10),
                          Text(
                              rOprTime2Text +
                                  ' :  ' +
                                  ntr.relayOprTime_3x.toString(),
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
