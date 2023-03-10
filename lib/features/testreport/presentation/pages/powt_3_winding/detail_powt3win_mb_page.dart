import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt_3_winding/powt3winding_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_3_winding/powt_3_winding_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_mb_model.dart';
import '../../providers/powt_3_winding/powt3win_mb_provider.dart';

class Detail_Powt3win_mb_page extends StatelessWidget with GetItMixin {
  Map args = {};

  Detail_Powt3win_mb_page(@required this.args, {Key key}) : super(key: key);

  Powt3win_mb_Model ntr;

  @override
  Widget build(BuildContext context) {
    final Powt3WindingModel ntr_equip =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

    getX((Powt3win_mb_Provider x) => x.getPowt3win_mbById(args['id']));
    Powt3win_mb_Model ntr =
        watchOnly((Powt3win_mb_Provider x) => x.powt3win_mb_Model);

    print(ntr);
    print("ntr  Powt3win_MB......");
    var mob =
        const Text('Powt3win MB Test Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Powt3win MB Test Details', style: TextStyle(fontSize: 20));

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
                Navigator.popAndPushNamed(context, '/edit_POWT3WIN_mb',
                    arguments: {
                      'id': args['id'],
                      'POWT3WIN_ID': args['POWT3WIN_ID'],
                      'trDatabaseID': args['trDatabaseID'],
                      'TrNo': ntr.trNo,
                      'Serial_No': ntr.serialNo,
                      'trDatabaseID': args['trDatabaseID']
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              getX((Powt3win_mb_Provider x) => x.deletePowt3win_mb(args['id']));

              Navigator.popAndPushNamed(context, '/detail_POWT3WIN_mb',
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
                              child:
                                  display_Powt3win_MB_details(ntr, ntr_equip)),
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

  Container display_Powt3win_MB_details(
      Powt3win_mb_Model ntr, Powt3WindingModel ntr_equip) {
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
                          Text('serialNo : ${ntr.serialNo}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          const Text('HV Side : ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          ntr.r_hv_un != 0.00
                              ? Column(
                                  children: [
                                    Text('RY-Cut UN : ${ntr.r_hv_un}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.r_hv_vn != 0.00
                              ? Column(
                                  children: [
                                    Text('RY-Cut vN : ${ntr.r_hv_vn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.r_hv_wn != 0.00
                              ? Column(
                                  children: [
                                    Text('RY-Cut WN : ${ntr.r_hv_wn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.y_hv_un != 0.00
                              ? Column(
                                  children: [
                                    Text('YB-Cut UN : ${ntr.y_hv_un}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.y_hv_vn != 0.00
                              ? Column(
                                  children: [
                                    Text('YB-Cut VN : ${ntr.y_hv_vn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.y_hv_wn != 0.00
                              ? Column(
                                  children: [
                                    Text('YB-Cut WN : ${ntr.y_hv_wn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.b_hv_un != 0.00
                              ? Column(
                                  children: [
                                    Text('BR-Cut UN : ${ntr.b_hv_un}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.b_hv_vn != 0.00
                              ? Column(
                                  children: [
                                    Text('BR-Cut VN : ${ntr.b_hv_vn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.b_hv_wn != 0.00
                              ? Column(
                                  children: [
                                    Text('BR-Cut WN : ${ntr.b_hv_wn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          const Text('LV Side : ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          ntr.r_lv_un != 0.00
                              ? Column(
                                  children: [
                                    Text('RY-Cut UN : ${ntr.r_lv_un}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.r_lv_vn != 0.00
                              ? Column(
                                  children: [
                                    Text('RY-Cut VN : ${ntr.r_lv_vn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.r_lv_wn != 0.00
                              ? Column(
                                  children: [
                                    Text('RY-Cut WN : ${ntr.r_lv_wn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.y_lv_un != 0.00
                              ? Column(
                                  children: [
                                    Text('YB-Cut UN : ${ntr.y_lv_un}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.y_lv_vn != 0.00
                              ? Column(
                                  children: [
                                    Text('YB-Cut VN : ${ntr.y_lv_vn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.y_lv_wn != 0.00
                              ? Column(
                                  children: [
                                    Text('YB-Cut WN : ${ntr.y_lv_wn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.b_lv_un != 0.00
                              ? Column(
                                  children: [
                                    Text('BR-Cut UN : ${ntr.b_lv_un}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.b_lv_vn != 0.00
                              ? Column(
                                  children: [
                                    Text('BR-Cut VN : ${ntr.b_lv_vn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.b_lv_wn != 0.00
                              ? Column(
                                  children: [
                                    Text('BR-Cut WN : ${ntr.b_lv_wn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          ntr_equip.vectorGroup.toLowerCase == 'yna0d11'
                              ? const Text('IV Side',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13))
                              : const Text('Teritory Side',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13)),
                          const Divider(height: 10),
                          ntr.r_ivt_un != 0.00
                              ? Column(
                                  children: [
                                    Text('r_ivt_un : ${ntr.r_ivt_un}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.r_ivt_vn != 0.00
                              ? Column(
                                  children: [
                                    Text('r_ivt_vn : ${ntr.r_ivt_vn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.r_ivt_wn != 0.00
                              ? Column(
                                  children: [
                                    Text('r_ivt_wn : ${ntr.r_ivt_wn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.y_ivt_un != 0.00
                              ? Column(
                                  children: [
                                    Text('y_ivt_un : ${ntr.y_ivt_un}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.y_ivt_vn != 0.00
                              ? Column(
                                  children: [
                                    Text('y_ivt_vn : ${ntr.y_ivt_vn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.y_ivt_wn != 0.00
                              ? Column(
                                  children: [
                                    Text('y_ivt_wn : ${ntr.y_ivt_wn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.b_ivt_un != 0.00
                              ? Column(
                                  children: [
                                    Text('b_ivt_un : ${ntr.b_ivt_un}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.b_ivt_vn != 0.00
                              ? Column(
                                  children: [
                                    Text('b_ivt_vn : ${ntr.b_ivt_vn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
                          ntr.b_ivt_wn != 0.00
                              ? Column(
                                  children: [
                                    Text('b_ivt_wn : ${ntr.b_ivt_wn}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 13)),
                                    const Divider(height: 10),
                                  ],
                                )
                              : Container(),
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
