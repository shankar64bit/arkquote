import 'package:flutter/material.dart';
import '../../../../../../../injection_container.dart';

enum GMT {
  rb_m,
  rb_g,
  rb_t,
  yb_m,
  yb_g,
  yb_t,
  bb_m,
  bb_g,
  bb_t,
  ra_m,
  ra_g,
  ra_t,
  ya_m,
  ya_g,
  ya_t,
  ba_m,
  ba_g,
  ba_t,
  ryb_m,
  ryb_g,
  ryb_t,
  ybb_m,
  ybb_g,
  ybb_t,
  brb_m,
  brb_g,
  brb_t,
  rya_m,
  rya_g,
  rya_t,
  yba_m,
  yba_g,
  yba_t,
  bra_m,
  bra_g,
  bra_t,
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

//------------------------------------------------------------------------------

class MGT_pc_IR_rb extends StatefulWidget {
  @override
  State<MGT_pc_IR_rb> createState() => _MGT_pc_IR_rbState();

  functionR_rb() {
    return _os1;
  }

  functionR_rb_null() {
    return _os1 = null;
  }

  get_MGT_pc_IR_rb_default_value() {
    _os1 == null;
  }
}

class _MGT_pc_IR_rbState extends State<MGT_pc_IR_rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            functionR_rb(),
          ],
        ),
      ),
    );
  }

  functionR_rb() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.rb_m,
                  groupValue: _os1,
                  onChanged: (index) {
                    setState(() => _os1 = index);
                    print(_os1);
                  },
                ),
                Text('rb_mega'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: GMT.rb_g,
                  groupValue: _os1,
                  onChanged: (index) {
                    setState(() => _os1 = index);
                    print(_os1);
                  },
                ),
                Text('rb_giga'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: GMT.rb_t,
                  groupValue: _os1,
                  onChanged: (index) {
                    setState(() => _os1 = index);
                    print(_os1);
                  },
                ),
                Text('rb_terra'),
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

class MGT_pc_IR_yb extends StatefulWidget {
  @override
  State<MGT_pc_IR_yb> createState() => _MGT_pc_IR_ybState();

  functionR_yb() {
    return _os2;
  }

  functionR_yb_null() {
    return _os2 = null;
  }

  get_MGT_pc_IR_yb_default_value() {
    return _os2 = null;
  }
}

class _MGT_pc_IR_ybState extends State<MGT_pc_IR_yb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            functionR_yb(),
          ],
        ),
      ),
    );
  }

  functionR_yb() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.yb_m,
                  groupValue: _os2,
                  onChanged: (index) {
                    setState(() => _os2 = index);
                    print(_os2);
                  },
                ),
                Text('yb_mega'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.yb_g,
                    groupValue: _os2,
                    onChanged: (index) {
                      setState(() => _os2 = index);
                      print(_os2);
                    }),
                Text('yb_giga'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.yb_t,
                    groupValue: _os2,
                    onChanged: (index) {
                      setState(() => _os2 = index);
                      print(_os2);
                    }),
                Text('yb_terra'),
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

// ---------------------------------------------------------------------------

class MGT_pc_IR_bb extends StatefulWidget {
  @override
  State<MGT_pc_IR_bb> createState() => _MGT_pc_IR_bbState();

  functionR_bb() {
    return _os3;
  }

  functionR_bb_null() {
    return _os3 = null;
  }

  get_MGT_pc_IR_bb_default_value() {
    return _os3 = null;
  }
}

class _MGT_pc_IR_bbState extends State<MGT_pc_IR_bb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            functionR_bb(),
          ],
        ),
      ),
    );
  }

  functionR_bb() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.bb_m,
                  groupValue: _os3,
                  onChanged: (index) {
                    setState(() => _os3 = index);
                    print(_os3);
                  },
                ),
                Text('bb_mega'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.bb_g,
                    groupValue: _os3,
                    onChanged: (index) {
                      setState(() => _os3 = index);
                      print(_os3);
                    }),
                Text('bb_giga'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.bb_t,
                    groupValue: _os3,
                    onChanged: (index) {
                      setState(() => _os3 = index);
                      print(_os3);
                    }),
                Text('bb_terra'),
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

// -----------------------------------------------------------------------------
class MGT_pc_IR_ra extends StatefulWidget {
  @override
  State<MGT_pc_IR_ra> createState() => _MGT_pc_IR_raState();

  functionR_ra() {
    return _os4;
  }

  functionR_ra_null() {
    return _os4 = null;
  }

  get_MGT_pc_IR_ra_default_value() {
    return _os4 = null;
  }
}

class _MGT_pc_IR_raState extends State<MGT_pc_IR_ra> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            functionR_ra(),
          ],
        ),
      ),
    );
  }

  functionR_ra() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.ra_m,
                  groupValue: _os4,
                  onChanged: (index) {
                    setState(() => _os4 = index);
                    print(_os4);
                  },
                ),
                Text('ra_mega'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.ra_g,
                    groupValue: _os4,
                    onChanged: (index) {
                      setState(() => _os4 = index);
                      print(_os4);
                    }),
                Text('ra_giga'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.ra_t,
                    groupValue: _os4,
                    onChanged: (index) {
                      setState(() => _os4 = index);
                      print(_os4);
                    }),
                Text('ra_terra'),
              ],
            ),
            Divider(height: 50)
          ],
        )
      ],
    );
  }
}

// -----------------------------------------------------------------------------
class MGT_pc_IR_ya extends StatefulWidget {
  @override
  State<MGT_pc_IR_ya> createState() => _MGT_pc_IR_yaState();

  functionR_ya() {
    return _os5;
  }

  functionR_ya_null() {
    return _os5 = null;
  }

  get_MGT_pc_IR_ya_default_value() {
    return _os5 = null;
  }
}

class _MGT_pc_IR_yaState extends State<MGT_pc_IR_ya> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            functionR_ya(),
          ],
        ),
      ),
    );
  }

  functionR_ya() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.ya_m,
                  groupValue: _os5,
                  onChanged: (index) {
                    setState(() => _os5 = index);
                    print(_os5);
                  },
                ),
                Text('ya_mega'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.ya_g,
                    groupValue: _os5,
                    onChanged: (index) {
                      setState(() => _os5 = index);
                      print(_os5);
                    }),
                Text('ya_giga'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.ya_t,
                    groupValue: _os5,
                    onChanged: (index) {
                      setState(() => _os5 = index);
                      print(_os5);
                    }),
                Text('ya_terra'),
              ],
            ),
            Divider(height: 50)
          ],
        )
      ],
    );
  }
}

// -----------------------------------------------------------------------------
class MGT_pc_IR_ba extends StatefulWidget {
  @override
  State<MGT_pc_IR_ba> createState() => _MGT_pc_IR_baState();

  functionR_ba() {
    return _os6;
  }

  functionR_ba_null() {
    return _os6 = null;
  }

  get_MGT_pc_IR_ba_default_value() {
    return _os6 = null;
  }
}

class _MGT_pc_IR_baState extends State<MGT_pc_IR_ba> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            functionR_ba(),
          ],
        ),
      ),
    );
  }

  functionR_ba() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.ba_m,
                  groupValue: _os6,
                  onChanged: (index) {
                    setState(() => _os6 = index);
                    print(_os6);
                  },
                ),
                Text('ba_mega'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.ba_g,
                    groupValue: _os6,
                    onChanged: (index) {
                      setState(() => _os6 = index);
                      print(_os6);
                    }),
                Text('ba_giga'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.ba_t,
                    groupValue: _os6,
                    onChanged: (index) {
                      setState(() => _os6 = index);
                      print(_os6);
                    }),
                Text('ba_terra'),
              ],
            ),
            Divider(height: 50)
          ],
        )
      ],
    );
  }
}

// -----------------------------------------------------------------------------
class MGT_pc_IR_ryb extends StatefulWidget {
  @override
  State<MGT_pc_IR_ryb> createState() => _MGT_pc_IR_rybState();

  functionR_ryb() {
    return _os7;
  }

  functionR_ryb_null() {
    return _os7 = null;
  }

  get_MGT_pc_IR_ryb_default_value() {
    return _os7 = null;
  }
}

class _MGT_pc_IR_rybState extends State<MGT_pc_IR_ryb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            functionR_ryb(),
          ],
        ),
      ),
    );
  }

  functionR_ryb() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.ryb_m,
                  groupValue: _os7,
                  onChanged: (index) {
                    setState(() => _os7 = index);
                    print(_os7);
                  },
                ),
                Text('ryb_mega'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.ryb_g,
                    groupValue: _os7,
                    onChanged: (index) {
                      setState(() => _os7 = index);
                      print(_os7);
                    }),
                Text('ryb_giga'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.ryb_t,
                    groupValue: _os7,
                    onChanged: (index) {
                      setState(() => _os7 = index);
                      print(_os7);
                    }),
                Text('ryb_terra'),
              ],
            ),
            Divider(height: 50)
          ],
        )
      ],
    );
  }
}

// -----------------------------------------------------------------------------
class MGT_pc_IR_ybb extends StatefulWidget {
  @override
  State<MGT_pc_IR_ybb> createState() => _MGT_pc_IR_ybbState();

  functionR_ybb() {
    return _os8;
  }

  functionR_ybb_null() {
    return _os8 = null;
  }

  get_MGT_pc_IR_ybb_default_value() {
    return _os8 = null;
  }
}

class _MGT_pc_IR_ybbState extends State<MGT_pc_IR_ybb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            functionR_ybb(),
          ],
        ),
      ),
    );
  }

  functionR_ybb() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.ybb_m,
                  groupValue: _os8,
                  onChanged: (index) {
                    setState(() => _os8 = index);
                    print(_os8);
                  },
                ),
                Text('ybb_mega'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.ybb_g,
                    groupValue: _os8,
                    onChanged: (index) {
                      setState(() => _os8 = index);
                      print(_os8);
                    }),
                Text('ybb_giga'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.ybb_t,
                    groupValue: _os8,
                    onChanged: (index) {
                      setState(() => _os8 = index);
                      print(_os8);
                    }),
                Text('ybb_terra'),
              ],
            ),
            Divider(height: 50)
          ],
        )
      ],
    );
  }
}

// -----------------------------------------------------------------------------
class MGT_pc_IR_brb extends StatefulWidget {
  @override
  State<MGT_pc_IR_brb> createState() => _MGT_pc_IR_brbState();

  functionR_brb() {
    return _os9;
  }

  functionR_brb_null() {
    return _os9 = null;
  }

  get_MGT_pc_IR_brb_default_value() {
    return _os9 = null;
  }
}

class _MGT_pc_IR_brbState extends State<MGT_pc_IR_brb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            functionR_brb(),
          ],
        ),
      ),
    );
  }

  functionR_brb() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.brb_m,
                  groupValue: _os9,
                  onChanged: (index) {
                    setState(() => _os9 = index);
                    print(_os9);
                  },
                ),
                Text('brb_mega'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.brb_g,
                    groupValue: _os9,
                    onChanged: (index) {
                      setState(() => _os9 = index);
                      print(_os9);
                    }),
                Text('brb_giga'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.brb_t,
                    groupValue: _os9,
                    onChanged: (index) {
                      setState(() => _os9 = index);
                      print(_os9);
                    }),
                Text('brb_terra'),
              ],
            ),
            Divider(height: 50)
          ],
        )
      ],
    );
  }
}

// -----------------------------------------------------------------------------
class MGT_pc_IR_rya extends StatefulWidget {
  @override
  State<MGT_pc_IR_rya> createState() => _MGT_pc_IR_ryaState();

  functionR_rya() {
    return _os10;
  }

  functionR_rya_null() {
    return _os10 = null;
  }

  get_MGT_pc_IR_rya_default_value() {
    return _os10 = null;
  }
}

class _MGT_pc_IR_ryaState extends State<MGT_pc_IR_rya> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            functionR_rya(),
          ],
        ),
      ),
    );
  }

  functionR_rya() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.rya_m,
                  groupValue: _os10,
                  onChanged: (index) {
                    setState(() => _os10 = index);
                    print(_os10);
                  },
                ),
                Text('rya_mega'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.rya_g,
                    groupValue: _os10,
                    onChanged: (index) {
                      setState(() => _os10 = index);
                      print(_os10);
                    }),
                Text('rya_giga'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.rya_t,
                    groupValue: _os10,
                    onChanged: (index) {
                      setState(() => _os10 = index);
                      print(_os10);
                    }),
                Text('rya_terra'),
              ],
            ),
            Divider(height: 50)
          ],
        )
      ],
    );
  }
}

// -----------------------------------------------------------------------------
class MGT_pc_IR_yba extends StatefulWidget {
  @override
  State<MGT_pc_IR_yba> createState() => _MGT_pc_IR_ybaState();

  functionR_yba() {
    return _os11;
  }

  functionR_yba_null() {
    return _os11 = null;
  }

  get_MGT_pc_IR_yba_default_value() {
    return _os11 = null;
  }
}

class _MGT_pc_IR_ybaState extends State<MGT_pc_IR_yba> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            functionR_yba(),
          ],
        ),
      ),
    );
  }

  functionR_yba() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.yba_m,
                  groupValue: _os11,
                  onChanged: (index) {
                    setState(() => _os11 = index);
                    print(_os11);
                  },
                ),
                Text('yba_mega'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.yba_g,
                    groupValue: _os11,
                    onChanged: (index) {
                      setState(() => _os11 = index);
                      print(_os11);
                    }),
                Text('yba_giga'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.yba_t,
                    groupValue: _os11,
                    onChanged: (index) {
                      setState(() => _os11 = index);
                      print(_os11);
                    }),
                Text('yba_terra'),
              ],
            ),
            Divider(height: 50)
          ],
        )
      ],
    );
  }
}

// -----------------------------------------------------------------------------
class MGT_pc_IR_bRa extends StatefulWidget {
  @override
  State<MGT_pc_IR_bRa> createState() => _MGT_pc_IR_bRaState();

  functionR_bRa() {
    return _os12;
  }

  functionR_bRa_null() {
    return _os12 = null;
  }

  get_MGT_pc_IR_bRa_default_value() {
    return _os12 = null;
  }
}

class _MGT_pc_IR_bRaState extends State<MGT_pc_IR_bRa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            functionR_bRa(),
          ],
        ),
      ),
    );
  }

  functionR_bRa() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: GMT.bra_m,
                  groupValue: _os12,
                  onChanged: (index) {
                    setState(() => _os12 = index);
                    print(_os12);
                  },
                ),
                Text('bra_mega'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.bra_g,
                    groupValue: _os12,
                    onChanged: (index) {
                      setState(() => _os12 = index);
                      print(_os12);
                    }),
                Text('bra_giga'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: GMT.bra_t,
                    groupValue: _os12,
                    onChanged: (index) {
                      setState(() => _os12 = index);
                      print(_os12);
                    }),
                Text('bra_terra'),
              ],
            ),
            Divider(height: 50)
          ],
        )
      ],
    );
  }
}
