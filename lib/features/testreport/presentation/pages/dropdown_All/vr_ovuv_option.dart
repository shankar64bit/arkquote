import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/IT/it_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/inverter_transformer/add_it_wr_page.dart';

import '../../providers/it_provider/it_provider.dart';

enum enumOVUV { ovr, uvr }

var _os;

class OVUV extends StatefulWidget {
  // const MGT_rr({super.key});

  @override
  State<OVUV> createState() => _OVUVState();

  get_OVUV() {
    return _os;
  }

  get_OVUV_default_value() {
    return _os = null;
  }
}

class _OVUVState extends State<OVUV> {
  // SingingCharacter _character = SingingCharacter.giga;

  @override
  Widget build(BuildContext context) {
    // ItModel ntr = AddItWrPage({}).getItModel();
    // bool chk = AddItWrPage({}).checkVectoreGroup(ntr);
    // print("It Model ...///.......");
    // print(ntr);
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(
                      value: enumOVUV.ovr,
                      groupValue: _os,
                      onChanged: (index) {
                        setState(() => _os = index);
                        print(_os);
                      },
                    ),
                    Text('Over Voltage Relay'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: enumOVUV.uvr,
                        groupValue: _os,
                        onChanged: (index) {
                          setState(() => _os = index);
                          print(_os);
                        }),
                    Text('Under Voltage Relay')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
