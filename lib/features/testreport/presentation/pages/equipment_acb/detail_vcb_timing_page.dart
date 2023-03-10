import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/vcb_timing_test_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/vcb_timing_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../data/models/equipment/acb/acb_model.dart';
import '../../providers/equipment_acb_provider/acb_provider.dart';

class DetailVcbTimingPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int ACB_ID;

  DetailVcbTimingPage(this.args, {Key key}) : super(key: key);

  VcbTimingTestModel vcbTimingTestModel, ntr;

  @override
  Widget build(BuildContext context) {
    final AcbModel ntr1 = watchOnly((AcbProvider x) => x.acbModel);
    getX((VcbTimingProvider x) => x.getVcbTimingByID(args['id']));
    VcbTimingTestModel ntr =
        watchOnly((VcbTimingProvider x) => x.vcbTimingModel);
    print(ntr);
    print("ntr  timing......");

    var mob =
        const Text('ACB-TIME Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('ACB-TIME Test Details', style: TextStyle(fontSize: 20));
    var mobV =
        const Text('VCB-TIME Test Details', style: TextStyle(fontSize: 15));
    var deskV =
        const Text('VCB-TIME Test Details', style: TextStyle(fontSize: 20));
    var mobO =
        const Text('OCB-TIME Test Details', style: TextStyle(fontSize: 15));
    var deskO =
        const Text('OCB-TIME Test Details', style: TextStyle(fontSize: 20));
    var mobS =
        const Text('SF6-TIME Test Details', style: TextStyle(fontSize: 15));
    var deskS =
        const Text('SF6-TIME Test Details', style: TextStyle(fontSize: 20));

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
          // if (constraints.maxWidth > 400) {
          //   return desk;
          // } else {
          //   return mob;
          // }
        }),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/edit_Vcb_Timing',
                    arguments: {
                      'id': args['id'],
                      'TrNo': ntr.trNo,
                      'ACB_ID': args['ACB_ID'],
                      'Serial_No': ntr.serialNo
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((VcbTimingProvider x) => x.deleteVCBTiming(args['id']));
              Navigator.popAndPushNamed(context, '/detail_ACB',
                  arguments: args['ACB_ID']);
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
                      // ignore: prefer_const_constructors
                      constraints: BoxConstraints(minHeight: 0, maxWidth: 700),
                      child: display_Vcb_Timing_details(ntr)),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  display_Vcb_Timing_details(VcbTimingTestModel ntr) {
    return Column(
      children: [
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(children: [
              Text('DBID : ' + ntr.databaseID.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5)),
              Divider(height: 10),
              Text('TrNo : ' + ntr.trNo.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5)),
              Divider(height: 10),
              Text('SerialNo : ' + ntr.serialNo.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5)),
            ]),
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              const Text('Close',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      letterSpacing: 0.5)),
              Divider(height: 5, thickness: 1, color: Colors.black),
              Card(
                elevation: 0,
                child: Column(children: [
                  Text('CloseR : ' + ntr.closeR.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 13)),
                  Divider(height: 10),
                  Text('CloseY : ' + ntr.closeY.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 13)),
                  Divider(height: 10),
                  Text('CloseB : ' + ntr.closeB.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 13)),
                ]),
              ),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              const Text('Open TC-1',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5)),
              Divider(height: 5, thickness: 1, color: Colors.black),
              Card(
                elevation: 0,
                child: Column(children: [
                  Text('tc1-openR : ' + ntr.tc1OpenR.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 13)),
                  Divider(height: 10),
                  Text('tc1-openY : ' + ntr.tc1OpenY.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 13)),
                  Divider(height: 10),
                  Text('tc1-openB : ' + ntr.tc1OpenB.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 13)),
                ]),
              ),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              const Text('Close TC-1',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5)),
              Divider(height: 5, thickness: 1, color: Colors.black),
              Card(
                elevation: 0,
                child: Column(children: [
                  Text('tc1-closeR : ' + ntr.tc1CloseR.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 13)),
                  Divider(height: 10),
                  Text('tc1-closeY : ' + ntr.tc1CloseY.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 13)),
                  Divider(height: 10),
                  Text('tc1-closeB : ' + ntr.tc1CloseB.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 13)),
                ]),
              ),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              const Text('Open TC-2',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5)),
              Divider(height: 5, thickness: 1, color: Colors.black),
              Card(
                elevation: 0,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('tc2-openR : ' + ntr.tc2OpenR.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Divider(height: 10),
                        Text('tc2-openY : ' + ntr.tc2OpenY.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Divider(height: 10),
                        Text('tc2-openB : ' + ntr.tc2OpenB.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              const Text('Close TC-2',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5)),
              Divider(height: 5, thickness: 1, color: Colors.black),
              Card(
                elevation: 0,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('tc2-closeR : ' + ntr.tc2CloseR.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Divider(height: 10),
                        Text('tc2-closeY : ' + ntr.tc2CloseY.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Divider(height: 10),
                        Text('tc2-closeB : ' + ntr.tc2CloseB.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Divider(height: 10),
                        Text('Equipment Used : ' + ntr.EquipmentType.toString(),
                            style: const TextStyle(color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
