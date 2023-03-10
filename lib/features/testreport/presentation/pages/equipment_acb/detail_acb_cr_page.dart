// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/acb/acb_cr_test_model.dart';
import '../../../data/models/equipment/acb/acb_model.dart';
import '../../providers/equipment_acb_provider/acb_cr_provider.dart';
import '../../providers/equipment_acb_provider/acb_provider.dart';

class DetailAcbCRPage extends StatelessWidget with GetItMixin {
  Map args = {};
  DetailAcbCRPage(this.args, {Key key}) : super(key: key);

  AcbCRTestModel acbCRTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    final AcbModel ntr1 = watchOnly((AcbProvider x) => x.acbModel);
    getX((AcbCRProvider x) => x.getAcbCRByID(args['id']));
    final ntr = watchOnly((AcbCRProvider x) => x.acbCRModel);

    var mob = const Text('ACB CR Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('ACB CR Test Details', style: TextStyle(fontSize: 20));
    var mobV =
        const Text('VCB CR Test Details', style: TextStyle(fontSize: 15));
    var deskV =
        const Text('VCB CR Test Details', style: TextStyle(fontSize: 20));
    var mobO =
        const Text('OCB CR Test Details', style: TextStyle(fontSize: 15));
    var deskO =
        const Text('OCB CR Test Details', style: TextStyle(fontSize: 20));
    var mobS =
        const Text('SF6 CR Test Details', style: TextStyle(fontSize: 15));
    var deskS =
        const Text('SF6 CR Test Details', style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        // ignore: missing_return
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            if (ntr1.etype == 'acb') {
              return ntr1.etype == 'acb' ? desk : mob;
            } else if (ntr1.etype == 'vcb') {
              return ntr1.etype == 'vcb' ? deskV : mobV;
            } else if (ntr1.etype == 'ocb') {
              return ntr1.etype == 'ocb' ? deskO : mobO;
            } else if (ntr1.etype == 'sf6') {
              return ntr1.etype == 'sf6' ? deskS : mobS;
            }
          } else {
            if (ntr1.etype == 'acb') {
              return ntr1.etype == 'acb' ? mob : desk;
            } else if (ntr1.etype == 'vcb') {
              return ntr1.etype == 'vcb' ? mobV : deskV;
            } else if (ntr1.etype == 'ocb') {
              return ntr1.etype == 'ocb' ? mobO : deskO;
            } else if (ntr1.etype == 'sf6') {
              return ntr1.etype == 'sf6' ? mobS : deskS;
            }
          }
        }),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/edit_ACB_CR', arguments: {
                  'id': args['id'],
                  'TrNo': ntr.trNo,
                  'ACB_ID': args['ACB_ID'],
                  'Serial_No': ntr.serialNo
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((AcbCRProvider x) => x.deleteACBCR(args['id']));
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(3, 0, 15, 0),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 0, maxWidth: 700),
                      child: display_Acb_CR_details(ntr)),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Container display_Acb_CR_details(AcbCRTestModel ntr) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(children: [
                  Text('DBID : ' + ntr.databaseID.toString(),
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
            Divider(height: 10, color: Colors.grey[100]),
            Card(
              elevation: 2,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'CR Measured Resistance Values',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          letterSpacing: 0.5),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Column(children: [
                      Text('motor coil : ' + ntr.motorCoil.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13)),
                      Divider(height: 10),
                      Text('close coil : ' + ntr.closeCoil.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13)),
                      Divider(height: 10),
                      Text('trip coil : ' + ntr.tripCoil.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13)),
                      Divider(height: 10),
                      Text('Equipment Type : ' + ntr.EquipmentType.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13)),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
