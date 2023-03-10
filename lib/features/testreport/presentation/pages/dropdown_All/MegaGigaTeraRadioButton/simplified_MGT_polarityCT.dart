import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/CT/ct_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ct_provider/ct_core_p_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../../../../injection_container.dart';
import '../../../providers/ct_provider/ct_provider.dart';
import '../../current_transformer/add_CT_core_p_page.dart';

enum GMT {
  forward_R_1S1_1S2,
  reverse_R_1S1_1S2,
  forward_R_2S1_2S2,
  reverse_R_2S1_2S2,
  forward_R_3S1_3S2,
  reverse_R_3S1_3S2,
  forward_R_4S1_4S2,
  reverse_R_4S1_4S2,
  forward_R_5S1_5S2,
  reverse_R_5S1_5S2,
  forward_Y_1S1_1S2,
  reverse_Y_1S1_1S2,
  forward_Y_2S1_2S2,
  reverse_Y_2S1_2S2,
  forward_Y_3S1_3S2,
  reverse_Y_3S1_3S2,
  forward_Y_4S1_4S2,
  reverse_Y_4S1_4S2,
  forward_Y_5S1_5S2,
  reverse_Y_5S1_5S2,
  forward_B_1S1_1S2,
  reverse_B_1S1_1S2,
  forward_B_2S1_2S2,
  reverse_B_2S1_2S2,
  forward_B_3S1_3S2,
  reverse_B_3S1_3S2,
  forward_B_4S1_4S2,
  reverse_B_4S1_4S2,
  forward_B_5S1_5S2,
  reverse_B_5S1_5S2,
}

// var _osDefault;
var _os1;
var _os2;
var _os3;
var _os4;
var _os5;
var _os6;
var _os7;
var _os8;
var _os9;
var _os10;
var _os11;
var _os12;
var _os13;
var _os14;
var _os15;

class MGT extends StatefulWidget {
  // const MGT({super.key});

  @override
  State<MGT> createState() => _MGTState();

  functionR_1S1_1S2() {
    return _os1;
  }

  functionR_2S1_2S2() {
    return _os2;
  }

  functionR_3S1_3S2() {
    return _os3;
  }

  functionR_4S1_4S2() {
    return _os4;
  }

  functionR_5S1_5S2() {
    return _os5;
  }

  functionY_1S1_1S2() {
    return _os6;
  }

  functionY_2S1_2S2() {
    return _os7;
  }

  functionY_3S1_3S2() {
    return _os8;
  }

  functionY_4S1_4S2() {
    return _os9;
  }

  functionY_5S1_5S2() {
    return _os10;
  }

  functionB_1S1_1S2() {
    return _os11;
  }

  functionB_2S1_2S2() {
    return _os12;
  }

  functionB_3S1_3S2() {
    return _os13;
  }

  functionB_4S1_4S2() {
    return _os14;
  }

  functionB_5S1_5S2() {
    return _os15;
  }

  // -----------------------------------
  functionR_1S1_1S2_null() {
    return _os1 = null;
  }

  functionR_2S1_2S2_null() {
    return _os2 = null;
  }

  functionR_3S1_3S2_null() {
    return _os3 = null;
  }

  functionR_4S1_4S2_null() {
    return _os4 = null;
  }

  functionR_5S1_5S2_null() {
    return _os5 = null;
  }

  functionY_1S1_1S2_null() {
    return _os6 = null;
  }

  functionY_2S1_2S2_null() {
    return _os7 = null;
  }

  functionY_3S1_3S2_null() {
    return _os8 = null;
  }

  functionY_4S1_4S2_null() {
    return _os9 = null;
  }

  functionY_5S1_5S2_null() {
    return _os10 = null;
  }

  functionB_1S1_1S2_null() {
    return _os11 = null;
  }

  functionB_2S1_2S2_null() {
    return _os12 = null;
  }

  functionB_3S1_3S2_null() {
    return _os13 = null;
  }

  functionB_4S1_4S2_null() {
    return _os14 = null;
  }

  functionB_5S1_5S2_null() {
    return _os15 = null;
  }

  get_MGT_default_value() {
    _os1 == null;
    _os3 == null;
    _os4 == null;
    _os5 == null;
    _os6 == null;
    _os7 == null;
    _os8 == null;
    _os9 == null;
    _os10 == null;
    _os11 == null;
    _os12 == null;
    _os13 == null;
    _os14 == null;
    _os15 == null;
  }
}

class _MGTState extends State<MGT> {
  // Map args = {};
  // CTModel get gettingNTR => Add_CTcoreP(args).sendToMGTfile();
  // SingingCharacter _character = SingingCharacter.giga;
  @override
  Widget build(BuildContext context) {
    var noc = sl<CTProvider>().ctModel.noOfCores;
    String ntr1 = sl<CTProvider>().ctModel.connectedTap;

    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Text(noc.toString()),
            noc == 1 || noc < 1 || noc > 1
                ? Column(
                    children: [
                      functionR_1S1_1S2(),
                      functionY_1S1_1S2(),
                      functionB_1S1_1S2(),
                      noc > 1 && noc == 2 || noc > 2
                          ? Column(
                              children: [
                                functionR_2S1_2S2(),
                                functionY_2S1_2S2(),
                                functionB_2S1_2S2(),
                                noc > 1 && noc > 2 && noc == 3 || noc > 3
                                    ? Column(
                                        children: [
                                          functionR_3S1_3S2(),
                                          functionY_3S1_3S2(),
                                          functionB_3S1_3S2(),
                                          noc > 1 &&
                                                      noc > 2 &&
                                                      noc > 3 &&
                                                      noc == 4 ||
                                                  noc > 4
                                              ? Column(
                                                  children: [
                                                    functionR_4S1_4S2(),
                                                    functionY_4S1_4S2(),
                                                    functionB_4S1_4S2(),
                                                    noc > 1 &&
                                                            noc > 2 &&
                                                            noc > 3 &&
                                                            noc > 4 &&
                                                            noc == 5
                                                        ? Column(
                                                            children: [
                                                              functionR_5S1_5S2(),
                                                              functionY_5S1_5S2(),
                                                              functionB_5S1_5S2(),
                                                            ],
                                                          )
                                                        : Container(),
                                                  ],
                                                )
                                              : Container(),
                                        ],
                                      )
                                    : Container(),
                              ],
                            )
                          : Container(),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////////////////////////////
  functionR_1S1_1S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_R_1S1_1S2,
                  groupValue: _os1,
                  onChanged: (index) {
                    setState(() => _os1 = index);
                    print(_os1);
                  },
                ),
                Text('forward \nR_1S1_1S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_R_1S1_1S2,
                    groupValue: _os1,
                    onChanged: (index) {
                      setState(() => _os1 = index);
                      print(_os1);
                    }),
                Text('reverse \nR_1S1_1S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }

  functionR_2S1_2S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_R_2S1_2S2,
                  groupValue: _os2,
                  onChanged: (index) {
                    setState(() => _os2 = index);
                    print(_os2);
                  },
                ),
                Text('forward \nR_2S1_2S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_R_2S1_2S2,
                    groupValue: _os2,
                    onChanged: (index) {
                      setState(() => _os2 = index);
                      print(_os2);
                    }),
                Text('reverse \nR_2S1_2S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }

  functionR_3S1_3S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_R_3S1_3S2,
                  groupValue: _os3,
                  onChanged: (index) {
                    setState(() => _os3 = index);
                    print(_os3);
                  },
                ),
                Text('forward \nR_3S1_3S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_R_3S1_3S2,
                    groupValue: _os3,
                    onChanged: (index) {
                      setState(() => _os3 = index);
                      print(_os3);
                    }),
                Text('reverse \nR_3S1_3S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }

  functionR_4S1_4S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_R_4S1_4S2,
                  groupValue: _os4,
                  onChanged: (index) {
                    setState(() => _os4 = index);
                    print(_os4);
                  },
                ),
                Text('forward \nR_4S1_4S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_R_4S1_4S2,
                    groupValue: _os4,
                    onChanged: (index) {
                      setState(() => _os4 = index);
                      print(_os4);
                    }),
                Text('reverse \nR_4S1_4S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }

  functionR_5S1_5S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_R_5S1_5S2,
                  groupValue: _os5,
                  onChanged: (index) {
                    setState(() => _os5 = index);
                    print(_os5);
                  },
                ),
                Text('forward \nR_5S1_5S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_R_5S1_5S2,
                    groupValue: _os5,
                    onChanged: (index) {
                      setState(() => _os5 = index);
                      print(_os5);
                    }),
                Text('reverse \nR_5S1_5S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }

  functionY_1S1_1S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_Y_1S1_1S2,
                  groupValue: _os6,
                  onChanged: (index) {
                    setState(() => _os6 = index);
                    print(_os6);
                  },
                ),
                Text('forward \nY_1S1_1S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_Y_1S1_1S2,
                    groupValue: _os6,
                    onChanged: (index) {
                      setState(() => _os6 = index);
                      print(_os6);
                    }),
                Text('reverse \nY_1S1_1S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }

  functionY_2S1_2S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_Y_2S1_2S2,
                  groupValue: _os7,
                  onChanged: (index) {
                    setState(() => _os7 = index);
                    print(_os7);
                  },
                ),
                Text('forward \nY_2S1_2S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_Y_2S1_2S2,
                    groupValue: _os7,
                    onChanged: (index) {
                      setState(() => _os7 = index);
                      print(_os7);
                    }),
                Text('reverse \nY_2S1_2S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }

  functionY_3S1_3S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_Y_3S1_3S2,
                  groupValue: _os8,
                  onChanged: (index) {
                    setState(() => _os8 = index);
                    print(_os8);
                  },
                ),
                Text('forward \nY_3S1_3S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_Y_3S1_3S2,
                    groupValue: _os8,
                    onChanged: (index) {
                      setState(() => _os8 = index);
                      print(_os8);
                    }),
                Text('reverse \nY_3S1_3S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }

  functionY_4S1_4S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_Y_4S1_4S2,
                  groupValue: _os9,
                  onChanged: (index) {
                    setState(() => _os9 = index);
                    print(_os9);
                  },
                ),
                Text('forward \nY_4S1_4S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_Y_4S1_4S2,
                    groupValue: _os9,
                    onChanged: (index) {
                      setState(() => _os9 = index);
                      print(_os9);
                    }),
                Text('reverse \nY_4S1_4S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }

  functionY_5S1_5S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_Y_5S1_5S2,
                  groupValue: _os10,
                  onChanged: (index) {
                    setState(() => _os10 = index);
                    print(_os10);
                  },
                ),
                Text('forward \nY_5S1_5S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_Y_5S1_5S2,
                    groupValue: _os10,
                    onChanged: (index) {
                      setState(() => _os10 = index);
                      print(_os10);
                    }),
                Text('reverse \nY_5S1_5S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }

  functionB_1S1_1S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_B_1S1_1S2,
                  groupValue: _os11,
                  onChanged: (index) {
                    setState(() => _os11 = index);
                    print(_os11);
                  },
                ),
                Text('forward \nB_1S1_1S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_B_1S1_1S2,
                    groupValue: _os11,
                    onChanged: (index) {
                      setState(() => _os11 = index);
                      print(_os11);
                    }),
                Text('reverse \nB_1S1_1S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }

  functionB_2S1_2S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_B_2S1_2S2,
                  groupValue: _os12,
                  onChanged: (index) {
                    setState(() => _os12 = index);
                    print(_os12);
                  },
                ),
                Text('forward \nB_2S1_2S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_B_2S1_2S2,
                    groupValue: _os12,
                    onChanged: (index) {
                      setState(() => _os12 = index);
                      print(_os12);
                    }),
                Text('reverse \nB_2S1_2S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }

  functionB_3S1_3S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_B_3S1_3S2,
                  groupValue: _os13,
                  onChanged: (index) {
                    setState(() => _os13 = index);
                    print(_os13);
                  },
                ),
                Text('forward \nB_3S1_3S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_B_3S1_3S2,
                    groupValue: _os13,
                    onChanged: (index) {
                      setState(() => _os13 = index);
                      print(_os13);
                    }),
                Text('reverse \nB_3S1_3S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }

  functionB_4S1_4S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_B_4S1_4S2,
                  groupValue: _os14,
                  onChanged: (index) {
                    setState(() => _os14 = index);
                    print(_os14);
                  },
                ),
                Text('forward \nB_4S1_4S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_B_4S1_4S2,
                    groupValue: _os14,
                    onChanged: (index) {
                      setState(() => _os14 = index);
                      print(_os14);
                    }),
                Text('reverse \nB_4S1_4S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }

  functionB_5S1_5S2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.forward_B_5S1_5S2,
                  groupValue: _os15,
                  onChanged: (index) {
                    setState(() => _os15 = index);
                    print(_os15);
                  },
                ),
                Text('forward \nB_5S1_5S2'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.reverse_B_5S1_5S2,
                    groupValue: _os15,
                    onChanged: (index) {
                      setState(() => _os15 = index);
                      print(_os15);
                    }),
                Text('reverse \nB_5S1_5S2'),
              ],
            ),
            Divider(
              height: 50,
            )
          ],
        )
      ],
    );
  }
}
