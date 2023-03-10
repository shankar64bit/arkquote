import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/IT/it_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/inverter_transformer/add_it_wr_page.dart';

import '../../providers/it_provider/it_provider.dart';

enum enumHVLV { hv, lv1, lv2, lv3, lv4 }

var _os;

class HVLV extends StatefulWidget {
  // const MGT_rr({super.key});

  @override
  State<HVLV> createState() => _HVLVState();

  get_HVLV() {
    return _os;
  }

  get_HVLV_default_value() {
    return _os = null;
  }
}

class _HVLVState extends State<HVLV> {
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
                      value: enumHVLV.hv,
                      groupValue: _os,
                      onChanged: (index) {
                        setState(() => _os = index);
                        print(_os);
                      },
                    ),
                    Text('HV'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: enumHVLV.lv1,
                        groupValue: _os,
                        onChanged: (index) {
                          setState(() => _os = index);
                          print(_os);
                        }),
                    Text('LV1')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: enumHVLV.lv2,
                        groupValue: _os,
                        onChanged: (index) {
                          setState(() => _os = index);
                          print(_os);
                        }),
                    Text('LV2')
                  ],
                ),
              ],
            ),

//-----
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(
                      value: enumHVLV.lv3,
                      groupValue: _os,
                      onChanged: (index) {
                        setState(() => _os = index);
                        print(_os);
                      },
                    ),
                    Text('LV3'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: enumHVLV.lv4,
                        groupValue: _os,
                        onChanged: (index) {
                          setState(() => _os = index);
                          print(_os);
                        }),
                    Text('LV4')
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
