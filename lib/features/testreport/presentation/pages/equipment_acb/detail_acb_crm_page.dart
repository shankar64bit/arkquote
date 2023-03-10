// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/equipment_acb_provider/acb_crm_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/acb/acb_crm_test_model.dart';
import '../../../data/models/equipment/acb/acb_model.dart';
import '../../providers/equipment_acb_provider/acb_provider.dart';

class DetailAcbCrmPage extends StatelessWidget with GetItMixin {
  Map args = {};
  DetailAcbCrmPage(this.args, {Key key}) : super(key: key);

  AcbCrmTestModel acbCrmTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    final AcbModel ntr1 = watchOnly((AcbProvider x) => x.acbModel);
    getX((AcbCrmProvider x) => x.getAcbCrmByID(args['id']));
    final ntr = watchOnly((AcbCrmProvider x) => x.acbCrmModel);
    print("*** Detail ACB CRm tr NO ****" + args['trDatabaseID'].toString());
    var mob =
        const Text('ACB CRM Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('ACB CRM Test Details', style: TextStyle(fontSize: 20));
    var mobV =
        const Text('VCB CRM Test Details', style: TextStyle(fontSize: 15));
    var deskV =
        const Text('VCB CRM Test Details', style: TextStyle(fontSize: 20));
    var mobO =
        const Text('OCB CRM Test Details', style: TextStyle(fontSize: 15));
    var deskO =
        const Text('OCB CRM Test Details', style: TextStyle(fontSize: 20));
    var mobS =
        const Text('SF6 CRM Test Details', style: TextStyle(fontSize: 15));
    var deskS =
        const Text('SF6 CRM Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_ACB_Crm', arguments: {
                  'id': args['id'],
                  'TrNo': ntr.trNo,
                  'ACB_ID': args['ACB_ID'],
                  'Serial_No': ntr.serialNo,
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((AcbCrmProvider x) => x.deleteACBCrm(args['id']));
              Navigator.pop(context);
              // Navigator.popAndPushNamed(context, '/detail_ACB',
              //     arguments: args['ACB_ID']);
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
                      child: display_Acb_Cmr_details(ntr)),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Container display_Acb_Cmr_details(AcbCrmTestModel ntr) {
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
                      'Measured Resistance Values',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          letterSpacing: 0.5),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Column(children: [
                      Text('rR : ' + ntr.rR.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13)),
                      Divider(height: 10),
                      Text('yY : ' + ntr.yY.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13)),
                      Divider(height: 10),
                      Text('bB : ' + ntr.bB.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13)),
                      ntr.nN == 0.00
                          ? Container()
                          : Column(
                              children: [
                                Divider(height: 10),
                                Text('nN : ' + ntr.nN.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 13)),
                              ],
                            ),
                      Divider(height: 10),
                      Text('Equipment Used : ' + ntr.EquipmentType.toString(),
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
