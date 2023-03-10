import 'package:flutter/material.dart';

enum Enum_ct_ir { m, g, t }

var peR;
var peY;
var peB;
var pc1R;
var pc2R;
var pc3R;
var pc4R;
var pc5R;
var pc1Y;
var pc2Y;
var pc3Y;
var pc4Y;
var pc5Y;
var pc1B;
var pc2B;
var pc3B;
var pc4B;
var pc5B;
var c1eR;
var c2eR;
var c3eR;
var c4eR;
var c5eR;
var c1eY;
var c2eY;
var c3eY;
var c4eY;
var c5eY;
var c1eB;
var c2eB;
var c3eB;
var c4eB;
var c5eB;
var c1c2R;
var c1c2Y;
var c1c2B;
var c2c3R;
var c2c3Y;
var c2c3B;
var c3c4R;
var c3c4Y;
var c3c4B;
var c4c5R;
var c4c5Y;
var c4c5B;
var clc1R;
var clc1Y;
var clc1B;

class Radio_peR extends StatefulWidget {
  @override
  State<Radio_peR> createState() => _Radio_peRState();

  get_Radio_peR() {
    return peR;
  }

  get_Radio_peR_default_value() {
    return peR = null;
  }
}

class _Radio_peRState extends State<Radio_peR> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: peR,
                      onChanged: (index) {
                        setState(() => peR = index);
                        print(peR);
                      },
                    ),
                    Text('mega Ω'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: peR,
                      onChanged: (index) {
                        setState(() => peR = index);
                        print(peR);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: peR,
                      onChanged: (index) {
                        setState(() => peR = index);
                        print(peR);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_peY extends StatefulWidget {
  @override
  State<Radio_peY> createState() => _Radio_peYState();

  get_Radio_peY() {
    return peY;
  }

  get_Radio_peY_default_value() {
    return peY = null;
  }
}

class _Radio_peYState extends State<Radio_peY> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: peY,
                      onChanged: (index) {
                        setState(() => peY = index);
                        print(peY);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: peY,
                      onChanged: (index) {
                        setState(() => peY = index);
                        print(peY);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: peY,
                      onChanged: (index) {
                        setState(() => peY = index);
                        print(peY);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_peB extends StatefulWidget {
  @override
  State<Radio_peB> createState() => _Radio_peBState();

  get_Radio_peB() {
    return peB;
  }

  get_Radio_peB_default_value() {
    return peB = null;
  }
}

class _Radio_peBState extends State<Radio_peB> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: peB,
                      onChanged: (index) {
                        setState(() => peB = index);
                        print(peB);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: peB,
                      onChanged: (index) {
                        setState(() => peB = index);
                        print(peB);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: peB,
                      onChanged: (index) {
                        setState(() => peB = index);
                        print(peB);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc1R extends StatefulWidget {
  @override
  State<Radio_pc1R> createState() => _Radio_pc1RState();

  get_Radio_pc1R() {
    return pc1R;
  }

  get_Radio_pc1R_default_value() {
    return pc1R = null;
  }
}

class _Radio_pc1RState extends State<Radio_pc1R> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc1R,
                      onChanged: (index) {
                        setState(() => pc1R = index);
                        print(pc1R);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc1R,
                      onChanged: (index) {
                        setState(() => pc1R = index);
                        print(pc1R);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc1R,
                      onChanged: (index) {
                        setState(() => pc1R = index);
                        print(pc1R);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc2R extends StatefulWidget {
  @override
  State<Radio_pc2R> createState() => _Radio_pc2RState();

  get_Radio_pc2R() {
    return pc2R;
  }

  get_Radio_pc2R_default_value() {
    return pc2R = null;
  }
}

class _Radio_pc2RState extends State<Radio_pc2R> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc2R,
                      onChanged: (index) {
                        setState(() => pc2R = index);
                        print(pc2R);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc2R,
                      onChanged: (index) {
                        setState(() => pc2R = index);
                        print(pc2R);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc2R,
                      onChanged: (index) {
                        setState(() => pc2R = index);
                        print(pc2R);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc3R extends StatefulWidget {
  @override
  State<Radio_pc3R> createState() => _Radio_pc3RState();

  get_Radio_pc3R() {
    return pc3R;
  }

  get_Radio_pc3R_default_value() {
    return pc3R = null;
  }
}

class _Radio_pc3RState extends State<Radio_pc3R> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc3R,
                      onChanged: (index) {
                        setState(() => pc3R = index);
                        print(pc3R);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc3R,
                      onChanged: (index) {
                        setState(() => pc3R = index);
                        print(pc3R);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc3R,
                      onChanged: (index) {
                        setState(() => pc3R = index);
                        print(pc3R);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc4R extends StatefulWidget {
  @override
  State<Radio_pc4R> createState() => _Radio_pc4RState();

  get_Radio_pc4R() {
    return pc4R;
  }

  get_Radio_pc4R_default_value() {
    return pc4R = null;
  }
}

class _Radio_pc4RState extends State<Radio_pc4R> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc4R,
                      onChanged: (index) {
                        setState(() => pc4R = index);
                        print(pc4R);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc4R,
                      onChanged: (index) {
                        setState(() => pc4R = index);
                        print(pc4R);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc4R,
                      onChanged: (index) {
                        setState(() => pc4R = index);
                        print(pc4R);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc5R extends StatefulWidget {
  @override
  State<Radio_pc5R> createState() => _Radio_pc5RState();

  get_Radio_pc5R() {
    return pc5R;
  }

  get_Radio_pc5R_default_value() {
    return pc5R = null;
  }
}

class _Radio_pc5RState extends State<Radio_pc5R> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc5R,
                      onChanged: (index) {
                        setState(() => pc5R = index);
                        print(pc5R);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc5R,
                      onChanged: (index) {
                        setState(() => pc5R = index);
                        print(pc5R);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc5R,
                      onChanged: (index) {
                        setState(() => pc5R = index);
                        print(pc5R);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc1Y extends StatefulWidget {
  @override
  State<Radio_pc1Y> createState() => _Radio_pc1YState();

  get_Radio_pc1Y() {
    return pc1Y;
  }

  get_Radio_pc1Y_default_value() {
    return pc1Y = null;
  }
}

class _Radio_pc1YState extends State<Radio_pc1Y> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc1Y,
                      onChanged: (index) {
                        setState(() => pc1Y = index);
                        print(pc1Y);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc1Y,
                      onChanged: (index) {
                        setState(() => pc1Y = index);
                        print(pc1Y);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc1Y,
                      onChanged: (index) {
                        setState(() => pc1Y = index);
                        print(pc1Y);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc2Y extends StatefulWidget {
  @override
  State<Radio_pc2Y> createState() => _Radio_pc2YState();

  get_Radio_pc2Y() {
    return pc2Y;
  }

  get_Radio_pc2Y_default_value() {
    return pc2Y = null;
  }
}

class _Radio_pc2YState extends State<Radio_pc2Y> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc2Y,
                      onChanged: (index) {
                        setState(() => pc2Y = index);
                        print(pc2Y);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc2Y,
                      onChanged: (index) {
                        setState(() => pc2Y = index);
                        print(pc2Y);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc2Y,
                      onChanged: (index) {
                        setState(() => pc2Y = index);
                        print(pc2Y);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc3Y extends StatefulWidget {
  @override
  State<Radio_pc3Y> createState() => _Radio_pc3YState();

  get_Radio_pc3Y() {
    return pc3Y;
  }

  get_Radio_pc3Y_default_value() {
    return pc3Y = null;
  }
}

class _Radio_pc3YState extends State<Radio_pc3Y> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc3Y,
                      onChanged: (index) {
                        setState(() => pc3Y = index);
                        print(pc3Y);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc3Y,
                      onChanged: (index) {
                        setState(() => pc3Y = index);
                        print(pc3Y);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc3Y,
                      onChanged: (index) {
                        setState(() => pc3Y = index);
                        print(pc3Y);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc4Y extends StatefulWidget {
  @override
  State<Radio_pc4Y> createState() => _Radio_pc4YState();

  get_Radio_pc4Y() {
    return pc4Y;
  }

  get_Radio_pc4Y_default_value() {
    return pc4Y = null;
  }
}

class _Radio_pc4YState extends State<Radio_pc4Y> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc4Y,
                      onChanged: (index) {
                        setState(() => pc4Y = index);
                        print(pc4Y);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc4Y,
                      onChanged: (index) {
                        setState(() => pc4Y = index);
                        print(pc4Y);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc4Y,
                      onChanged: (index) {
                        setState(() => pc4Y = index);
                        print(pc4Y);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc5Y extends StatefulWidget {
  @override
  State<Radio_pc5Y> createState() => _Radio_pc5YState();

  get_Radio_pc5Y() {
    return pc5Y;
  }

  get_Radio_pc5Y_default_value() {
    return pc5Y = null;
  }
}

class _Radio_pc5YState extends State<Radio_pc5Y> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc5Y,
                      onChanged: (index) {
                        setState(() => pc5Y = index);
                        print(pc5Y);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc5Y,
                      onChanged: (index) {
                        setState(() => pc5Y = index);
                        print(pc5Y);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc5Y,
                      onChanged: (index) {
                        setState(() => pc5Y = index);
                        print(pc5Y);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc1B extends StatefulWidget {
  @override
  State<Radio_pc1B> createState() => _Radio_pc1BState();

  get_Radio_pc1B() {
    return pc1B;
  }

  get_Radio_pc1B_default_value() {
    return pc1B = null;
  }
}

class _Radio_pc1BState extends State<Radio_pc1B> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc1B,
                      onChanged: (index) {
                        setState(() => pc1B = index);
                        print(pc1B);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc1B,
                      onChanged: (index) {
                        setState(() => pc1B = index);
                        print(pc1B);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc1B,
                      onChanged: (index) {
                        setState(() => pc1B = index);
                        print(pc1B);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc2B extends StatefulWidget {
  @override
  State<Radio_pc2B> createState() => _Radio_pc2BState();

  get_Radio_pc2B() {
    return pc2B;
  }

  get_Radio_pc2B_default_value() {
    return pc2B = null;
  }
}

class _Radio_pc2BState extends State<Radio_pc2B> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc2B,
                      onChanged: (index) {
                        setState(() => pc2B = index);
                        print(pc2B);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc2B,
                      onChanged: (index) {
                        setState(() => pc2B = index);
                        print(pc2B);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc2B,
                      onChanged: (index) {
                        setState(() => pc2B = index);
                        print(pc2B);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc3B extends StatefulWidget {
  @override
  State<Radio_pc3B> createState() => _Radio_pc3BState();

  get_Radio_pc3B() {
    return pc3B;
  }

  get_Radio_pc3B_default_value() {
    return pc3B = null;
  }
}

class _Radio_pc3BState extends State<Radio_pc3B> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc3B,
                      onChanged: (index) {
                        setState(() => pc3B = index);
                        print(pc3B);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc3B,
                      onChanged: (index) {
                        setState(() => pc3B = index);
                        print(pc3B);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc3B,
                      onChanged: (index) {
                        setState(() => pc3B = index);
                        print(pc3B);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc4B extends StatefulWidget {
  @override
  State<Radio_pc4B> createState() => _Radio_pc4BState();

  get_Radio_pc4B() {
    return pc4B;
  }

  get_Radio_pc4B_default_value() {
    return pc4B = null;
  }
}

class _Radio_pc4BState extends State<Radio_pc4B> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc4B,
                      onChanged: (index) {
                        setState(() => pc4B = index);
                        print(pc4B);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc4B,
                      onChanged: (index) {
                        setState(() => pc4B = index);
                        print(pc4B);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc4B,
                      onChanged: (index) {
                        setState(() => pc4B = index);
                        print(pc4B);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_pc5B extends StatefulWidget {
  @override
  State<Radio_pc5B> createState() => _Radio_pc5BState();

  get_Radio_pc5B() {
    return pc5B;
  }

  get_Radio_pc5B_default_value() {
    return pc5B = null;
  }
}

class _Radio_pc5BState extends State<Radio_pc5B> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: pc5B,
                      onChanged: (index) {
                        setState(() => pc5B = index);
                        print(pc5B);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: pc5B,
                      onChanged: (index) {
                        setState(() => pc5B = index);
                        print(pc5B);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: pc5B,
                      onChanged: (index) {
                        setState(() => pc5B = index);
                        print(pc5B);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c1eR extends StatefulWidget {
  @override
  State<Radio_c1eR> createState() => _Radio_c1eRState();

  get_Radio_c1eR() {
    return c1eR;
  }

  get_Radio_c1eR_default_value() {
    return c1eR = null;
  }
}

class _Radio_c1eRState extends State<Radio_c1eR> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c1eR,
                      onChanged: (index) {
                        setState(() => c1eR = index);
                        print(c1eR);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c1eR,
                      onChanged: (index) {
                        setState(() => c1eR = index);
                        print(c1eR);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c1eR,
                      onChanged: (index) {
                        setState(() => c1eR = index);
                        print(c1eR);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c2eR extends StatefulWidget {
  @override
  State<Radio_c2eR> createState() => _Radio_c2eRState();

  get_Radio_c2eR() {
    return c2eR;
  }

  get_Radio_c2eR_default_value() {
    return c2eR = null;
  }
}

class _Radio_c2eRState extends State<Radio_c2eR> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c2eR,
                      onChanged: (index) {
                        setState(() => c2eR = index);
                        print(c2eR);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c2eR,
                      onChanged: (index) {
                        setState(() => c2eR = index);
                        print(c2eR);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c2eR,
                      onChanged: (index) {
                        setState(() => c2eR = index);
                        print(c2eR);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c3eR extends StatefulWidget {
  @override
  State<Radio_c3eR> createState() => _Radio_c3eRState();

  get_Radio_c3eR() {
    return c3eR;
  }

  get_Radio_c3eR_default_value() {
    return c3eR = null;
  }
}

class _Radio_c3eRState extends State<Radio_c3eR> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c3eR,
                      onChanged: (index) {
                        setState(() => c3eR = index);
                        print(c3eR);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c3eR,
                      onChanged: (index) {
                        setState(() => c3eR = index);
                        print(c3eR);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c3eR,
                      onChanged: (index) {
                        setState(() => c3eR = index);
                        print(c3eR);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c4eR extends StatefulWidget {
  @override
  State<Radio_c4eR> createState() => _Radio_c4eRState();

  get_Radio_c4eR() {
    return c4eR;
  }

  get_Radio_c4eR_default_value() {
    return c4eR = null;
  }
}

class _Radio_c4eRState extends State<Radio_c4eR> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c4eR,
                      onChanged: (index) {
                        setState(() => c4eR = index);
                        print(c4eR);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c4eR,
                      onChanged: (index) {
                        setState(() => c4eR = index);
                        print(c4eR);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c4eR,
                      onChanged: (index) {
                        setState(() => c4eR = index);
                        print(c4eR);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c5eR extends StatefulWidget {
  @override
  State<Radio_c5eR> createState() => _Radio_c5eRState();

  get_Radio_c5eR() {
    return c5eR;
  }

  get_Radio_c5eR_default_value() {
    return c5eR = null;
  }
}

class _Radio_c5eRState extends State<Radio_c5eR> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c5eR,
                      onChanged: (index) {
                        setState(() => c5eR = index);
                        print(c5eR);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c5eR,
                      onChanged: (index) {
                        setState(() => c5eR = index);
                        print(c5eR);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c5eR,
                      onChanged: (index) {
                        setState(() => c5eR = index);
                        print(c5eR);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c1eY extends StatefulWidget {
  @override
  State<Radio_c1eY> createState() => _Radio_c1eYState();

  get_Radio_c1eY() {
    return c1eY;
  }

  get_Radio_c1eY_default_value() {
    return c1eY = null;
  }
}

class _Radio_c1eYState extends State<Radio_c1eY> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c1eY,
                      onChanged: (index) {
                        setState(() => c1eY = index);
                        print(c1eY);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c1eY,
                      onChanged: (index) {
                        setState(() => c1eY = index);
                        print(c1eY);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c1eY,
                      onChanged: (index) {
                        setState(() => c1eY = index);
                        print(c1eY);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c2eY extends StatefulWidget {
  @override
  State<Radio_c2eY> createState() => _Radio_c2eYState();

  get_Radio_c2eY() {
    return c2eY;
  }

  get_Radio_c2eY_default_value() {
    return c2eY = null;
  }
}

class _Radio_c2eYState extends State<Radio_c2eY> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c2eY,
                      onChanged: (index) {
                        setState(() => c2eY = index);
                        print(c2eY);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c2eY,
                      onChanged: (index) {
                        setState(() => c2eY = index);
                        print(c2eY);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c2eY,
                      onChanged: (index) {
                        setState(() => c2eY = index);
                        print(c2eY);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c3eY extends StatefulWidget {
  @override
  State<Radio_c3eY> createState() => _Radio_c3eYState();

  get_Radio_c3eY() {
    return c3eY;
  }

  get_Radio_c3eY_default_value() {
    return c3eY = null;
  }
}

class _Radio_c3eYState extends State<Radio_c3eY> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c3eY,
                      onChanged: (index) {
                        setState(() => c3eY = index);
                        print(c3eY);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c3eY,
                      onChanged: (index) {
                        setState(() => c3eY = index);
                        print(c3eY);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c3eY,
                      onChanged: (index) {
                        setState(() => c3eY = index);
                        print(c3eY);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c4eY extends StatefulWidget {
  @override
  State<Radio_c4eY> createState() => _Radio_c4eYState();

  get_Radio_c4eY() {
    return c4eY;
  }

  get_Radio_c4eY_default_value() {
    return c4eY = null;
  }
}

class _Radio_c4eYState extends State<Radio_c4eY> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c4eY,
                      onChanged: (index) {
                        setState(() => c4eY = index);
                        print(c4eY);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c4eY,
                      onChanged: (index) {
                        setState(() => c4eY = index);
                        print(c4eY);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c4eY,
                      onChanged: (index) {
                        setState(() => c4eY = index);
                        print(c4eY);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c5eY extends StatefulWidget {
  @override
  State<Radio_c5eY> createState() => _Radio_c5eYState();

  get_Radio_c5eY() {
    return c5eY;
  }

  get_Radio_c5eY_default_value() {
    return c5eY = null;
  }
}

class _Radio_c5eYState extends State<Radio_c5eY> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c5eY,
                      onChanged: (index) {
                        setState(() => c5eY = index);
                        print(c5eY);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c5eY,
                      onChanged: (index) {
                        setState(() => c5eY = index);
                        print(c5eY);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c5eY,
                      onChanged: (index) {
                        setState(() => c5eY = index);
                        print(c5eY);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c1eB extends StatefulWidget {
  @override
  State<Radio_c1eB> createState() => _Radio_c1eBState();

  get_Radio_c1eB() {
    return c1eB;
  }

  get_Radio_c1eB_default_value() {
    return c1eB = null;
  }
}

class _Radio_c1eBState extends State<Radio_c1eB> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c1eB,
                      onChanged: (index) {
                        setState(() => c1eB = index);
                        print(c1eB);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c1eB,
                      onChanged: (index) {
                        setState(() => c1eB = index);
                        print(c1eB);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c1eB,
                      onChanged: (index) {
                        setState(() => c1eB = index);
                        print(c1eB);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c2eB extends StatefulWidget {
  @override
  State<Radio_c2eB> createState() => _Radio_c2eBState();

  get_Radio_c2eB() {
    return c2eB;
  }

  get_Radio_c2eB_default_value() {
    return c2eB = null;
  }
}

class _Radio_c2eBState extends State<Radio_c2eB> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c2eB,
                      onChanged: (index) {
                        setState(() => c2eB = index);
                        print(c2eB);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c2eB,
                      onChanged: (index) {
                        setState(() => c2eB = index);
                        print(c2eB);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c2eB,
                      onChanged: (index) {
                        setState(() => c2eB = index);
                        print(c2eB);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c3eB extends StatefulWidget {
  @override
  State<Radio_c3eB> createState() => _Radio_c3eBState();

  get_Radio_c3eB() {
    return c3eB;
  }

  get_Radio_c3eB_default_value() {
    return c3eB = null;
  }
}

class _Radio_c3eBState extends State<Radio_c3eB> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c3eB,
                      onChanged: (index) {
                        setState(() => c3eB = index);
                        print(c3eB);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c3eB,
                      onChanged: (index) {
                        setState(() => c3eB = index);
                        print(c3eB);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c3eB,
                      onChanged: (index) {
                        setState(() => c3eB = index);
                        print(c3eB);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c4eB extends StatefulWidget {
  @override
  State<Radio_c4eB> createState() => _Radio_c4eBState();

  get_Radio_c4eB() {
    return c4eB;
  }

  get_Radio_c4eB_default_value() {
    return c4eB = null;
  }
}

class _Radio_c4eBState extends State<Radio_c4eB> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c4eB,
                      onChanged: (index) {
                        setState(() => c4eB = index);
                        print(c4eB);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c4eB,
                      onChanged: (index) {
                        setState(() => c4eB = index);
                        print(c4eB);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c4eB,
                      onChanged: (index) {
                        setState(() => c4eB = index);
                        print(c4eB);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c5eB extends StatefulWidget {
  @override
  State<Radio_c5eB> createState() => _Radio_c5eBState();

  get_Radio_c5eB() {
    return c5eB;
  }

  get_Radio_c5eB_default_value() {
    return c5eB = null;
  }
}

class _Radio_c5eBState extends State<Radio_c5eB> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c5eB,
                      onChanged: (index) {
                        setState(() => c5eB = index);
                        print(c5eB);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c5eB,
                      onChanged: (index) {
                        setState(() => c5eB = index);
                        print(c5eB);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c5eB,
                      onChanged: (index) {
                        setState(() => c5eB = index);
                        print(c5eB);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c1c2R extends StatefulWidget {
  @override
  State<Radio_c1c2R> createState() => _Radio_c1c2RState();

  get_Radio_c1c2R() {
    return c1c2R;
  }

  get_Radio_c1c2R_default_value() {
    return c1c2R = null;
  }
}

class _Radio_c1c2RState extends State<Radio_c1c2R> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c1c2R,
                      onChanged: (index) {
                        setState(() => c1c2R = index);
                        print(c1c2R);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c1c2R,
                      onChanged: (index) {
                        setState(() => c1c2R = index);
                        print(c1c2R);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c1c2R,
                      onChanged: (index) {
                        setState(() => c1c2R = index);
                        print(c1c2R);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c1c2Y extends StatefulWidget {
  @override
  State<Radio_c1c2Y> createState() => _Radio_c1c2YState();

  get_Radio_c1c2Y() {
    return c1c2Y;
  }

  get_Radio_c1c2Y_default_value() {
    return c1c2Y = null;
  }
}

class _Radio_c1c2YState extends State<Radio_c1c2Y> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c1c2Y,
                      onChanged: (index) {
                        setState(() => c1c2Y = index);
                        print(c1c2Y);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c1c2Y,
                      onChanged: (index) {
                        setState(() => c1c2Y = index);
                        print(c1c2Y);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c1c2Y,
                      onChanged: (index) {
                        setState(() => c1c2Y = index);
                        print(c1c2Y);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c1c2B extends StatefulWidget {
  @override
  State<Radio_c1c2B> createState() => _Radio_c1c2BState();

  get_Radio_c1c2B() {
    return c1c2B;
  }

  get_Radio_c1c2B_default_value() {
    return c1c2B = null;
  }
}

class _Radio_c1c2BState extends State<Radio_c1c2B> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c1c2B,
                      onChanged: (index) {
                        setState(() => c1c2B = index);
                        print(c1c2B);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c1c2B,
                      onChanged: (index) {
                        setState(() => c1c2B = index);
                        print(c1c2B);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c1c2B,
                      onChanged: (index) {
                        setState(() => c1c2B = index);
                        print(c1c2B);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c2c3R extends StatefulWidget {
  @override
  State<Radio_c2c3R> createState() => _Radio_c2c3RState();

  get_Radio_c2c3R() {
    return c2c3R;
  }

  get_Radio_c2c3R_default_value() {
    return c2c3R = null;
  }
}

class _Radio_c2c3RState extends State<Radio_c2c3R> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c2c3R,
                      onChanged: (index) {
                        setState(() => c2c3R = index);
                        print(c2c3R);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c2c3R,
                      onChanged: (index) {
                        setState(() => c2c3R = index);
                        print(c2c3R);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c2c3R,
                      onChanged: (index) {
                        setState(() => c2c3R = index);
                        print(c2c3R);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c2c3Y extends StatefulWidget {
  @override
  State<Radio_c2c3Y> createState() => _Radio_c2c3YState();

  get_Radio_c2c3Y() {
    return c2c3Y;
  }

  get_Radio_c2c3Y_default_value() {
    return c2c3Y = null;
  }
}

class _Radio_c2c3YState extends State<Radio_c2c3Y> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c2c3Y,
                      onChanged: (index) {
                        setState(() => c2c3Y = index);
                        print(c2c3Y);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c2c3Y,
                      onChanged: (index) {
                        setState(() => c2c3Y = index);
                        print(c2c3Y);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c2c3Y,
                      onChanged: (index) {
                        setState(() => c2c3Y = index);
                        print(c2c3Y);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c2c3B extends StatefulWidget {
  @override
  State<Radio_c2c3B> createState() => _Radio_c2c3BState();

  get_Radio_c2c3B() {
    return c2c3B;
  }

  get_Radio_c2c3B_default_value() {
    return c2c3B = null;
  }
}

class _Radio_c2c3BState extends State<Radio_c2c3B> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c2c3B,
                      onChanged: (index) {
                        setState(() => c2c3B = index);
                        print(c2c3B);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c2c3B,
                      onChanged: (index) {
                        setState(() => c2c3B = index);
                        print(c2c3B);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c2c3B,
                      onChanged: (index) {
                        setState(() => c2c3B = index);
                        print(c2c3B);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c3c4R extends StatefulWidget {
  @override
  State<Radio_c3c4R> createState() => _Radio_c3c4RState();

  get_Radio_c3c4R() {
    return c3c4R;
  }

  get_Radio_c3c4R_default_value() {
    return c3c4R = null;
  }
}

class _Radio_c3c4RState extends State<Radio_c3c4R> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c3c4R,
                      onChanged: (index) {
                        setState(() => c3c4R = index);
                        print(c3c4R);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c3c4R,
                      onChanged: (index) {
                        setState(() => c3c4R = index);
                        print(c3c4R);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c3c4R,
                      onChanged: (index) {
                        setState(() => c3c4R = index);
                        print(c3c4R);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c3c4Y extends StatefulWidget {
  @override
  State<Radio_c3c4Y> createState() => _Radio_c3c4YState();

  get_Radio_c3c4Y() {
    return c3c4Y;
  }

  get_Radio_c3c4Y_default_value() {
    return c3c4Y = null;
  }
}

class _Radio_c3c4YState extends State<Radio_c3c4Y> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c3c4Y,
                      onChanged: (index) {
                        setState(() => c3c4Y = index);
                        print(c3c4Y);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c3c4Y,
                      onChanged: (index) {
                        setState(() => c3c4Y = index);
                        print(c3c4Y);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c3c4Y,
                      onChanged: (index) {
                        setState(() => c3c4Y = index);
                        print(c3c4Y);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c3c4B extends StatefulWidget {
  @override
  State<Radio_c3c4B> createState() => _Radio_c3c4BState();

  get_Radio_c3c4B() {
    return c3c4B;
  }

  get_Radio_c3c4B_default_value() {
    return c3c4B = null;
  }
}

class _Radio_c3c4BState extends State<Radio_c3c4B> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c3c4B,
                      onChanged: (index) {
                        setState(() => c3c4B = index);
                        print(c3c4B);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c3c4B,
                      onChanged: (index) {
                        setState(() => c3c4B = index);
                        print(c3c4B);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c3c4B,
                      onChanged: (index) {
                        setState(() => c3c4B = index);
                        print(c3c4B);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c4c5R extends StatefulWidget {
  @override
  State<Radio_c4c5R> createState() => _Radio_c4c5RState();

  get_Radio_c4c5R() {
    return c4c5R;
  }

  get_Radio_c4c5R_default_value() {
    return c4c5R = null;
  }
}

class _Radio_c4c5RState extends State<Radio_c4c5R> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c4c5R,
                      onChanged: (index) {
                        setState(() => c4c5R = index);
                        print(c4c5R);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c4c5R,
                      onChanged: (index) {
                        setState(() => c4c5R = index);
                        print(c4c5R);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c4c5R,
                      onChanged: (index) {
                        setState(() => c4c5R = index);
                        print(c4c5R);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c4c5Y extends StatefulWidget {
  @override
  State<Radio_c4c5Y> createState() => _Radio_c4c5YState();

  get_Radio_c4c5Y() {
    return c4c5Y;
  }

  get_Radio_c4c5Y_default_value() {
    return c4c5Y = null;
  }
}

class _Radio_c4c5YState extends State<Radio_c4c5Y> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c4c5Y,
                      onChanged: (index) {
                        setState(() => c4c5Y = index);
                        print(c4c5Y);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c4c5Y,
                      onChanged: (index) {
                        setState(() => c4c5Y = index);
                        print(c4c5Y);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c4c5Y,
                      onChanged: (index) {
                        setState(() => c4c5Y = index);
                        print(c4c5Y);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_c4c5B extends StatefulWidget {
  @override
  State<Radio_c4c5B> createState() => _Radio_c4c5BState();

  get_Radio_c4c5B() {
    return c4c5B;
  }

  get_Radio_c4c5B_default_value() {
    return c4c5B = null;
  }
}

class _Radio_c4c5BState extends State<Radio_c4c5B> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: c4c5B,
                      onChanged: (index) {
                        setState(() => c4c5B = index);
                        print(c4c5B);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: c4c5B,
                      onChanged: (index) {
                        setState(() => c4c5B = index);
                        print(c4c5B);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: c4c5B,
                      onChanged: (index) {
                        setState(() => c4c5B = index);
                        print(c4c5B);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_clc1R extends StatefulWidget {
  @override
  State<Radio_clc1R> createState() => _Radio_clc1RState();

  get_Radio_clc1R() {
    return clc1R;
  }

  get_Radio_clc1R_default_value() {
    return clc1R = null;
  }
}

class _Radio_clc1RState extends State<Radio_clc1R> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: clc1R,
                      onChanged: (index) {
                        setState(() => clc1R = index);
                        print(clc1R);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: clc1R,
                      onChanged: (index) {
                        setState(() => clc1R = index);
                        print(clc1R);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: clc1R,
                      onChanged: (index) {
                        setState(() => clc1R = index);
                        print(clc1R);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_clc1Y extends StatefulWidget {
  @override
  State<Radio_clc1Y> createState() => _Radio_clc1YState();

  get_Radio_clc1Y() {
    return clc1Y;
  }

  get_Radio_clc1Y_default_value() {
    return clc1Y = null;
  }
}

class _Radio_clc1YState extends State<Radio_clc1Y> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: clc1Y,
                      onChanged: (index) {
                        setState(() => clc1Y = index);
                        print(clc1Y);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: clc1Y,
                      onChanged: (index) {
                        setState(() => clc1Y = index);
                        print(clc1Y);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: clc1Y,
                      onChanged: (index) {
                        setState(() => clc1Y = index);
                        print(clc1Y);
                      },
                    ),
                    Text('terraΩ'),
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

class Radio_clc1B extends StatefulWidget {
  @override
  State<Radio_clc1B> createState() => _Radio_clc1BState();

  get_Radio_clc1B() {
    return clc1B;
  }

  get_Radio_clc1B_default_value() {
    return clc1B = null;
  }
}

class _Radio_clc1BState extends State<Radio_clc1B> {
  @override
  Widget build(BuildContext context) {
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
                      value: Enum_ct_ir.m,
                      groupValue: clc1B,
                      onChanged: (index) {
                        setState(() => clc1B = index);
                        print(clc1B);
                      },
                    ),
                    Text('megaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.g,
                      groupValue: clc1B,
                      onChanged: (index) {
                        setState(() => clc1B = index);
                        print(clc1B);
                      },
                    ),
                    Text('gigaΩ'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_ir.t,
                      groupValue: clc1B,
                      onChanged: (index) {
                        setState(() => clc1B = index);
                        print(clc1B);
                      },
                    ),
                    Text('terraΩ'),
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
