import 'package:flutter/material.dart';

enum Enum_ct_wr { mega, giga, terra }

var _B_1S1_1S2;
var _B_2S1_2S2;
var _B_3S1_3S2;
var _B_4S1_4S2;
var _B_5S1_5S2;

var _R_1S1_1S2;
var _R_2S1_2S2;
var _R_3S1_3S2;
var _R_4S1_4S2;
var _R_5S1_5S2;

var _Y_1S1_1S2;
var _Y_2S1_2S2;
var _Y_3S1_3S2;
var _Y_4S1_4S2;
var _Y_5S1_5S2;

class Radio_B_1S1_1S2 extends StatefulWidget {
  @override
  State<Radio_B_1S1_1S2> createState() => _Radio_B_1S1_1S2State();

  get_Radio_B_1S1_1S2() {
    return _B_1S1_1S2;
  }

  get_Radio_B_1S1_1S2_default_value() {
    return _B_1S1_1S2 = null;
  }
}

class _Radio_B_1S1_1S2State extends State<Radio_B_1S1_1S2> {
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
                      value: Enum_ct_wr.mega,
                      groupValue: _B_1S1_1S2,
                      onChanged: (index) {
                        setState(() => _B_1S1_1S2 = index);
                        print(_B_1S1_1S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _B_1S1_1S2,
                      onChanged: (index) {
                        setState(() => _B_1S1_1S2 = index);
                        print(_B_1S1_1S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _B_1S1_1S2,
                      onChanged: (index) {
                        setState(() => _B_1S1_1S2 = index);
                        print(_B_1S1_1S2);
                      },
                    ),
                    Text('terra'),
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

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
class Radio_B_2S1_2S2 extends StatefulWidget {
  @override
  State<Radio_B_2S1_2S2> createState() => _Radio_B_2S1_2S2State();

  get_Radio_B_2S1_2S2() {
    return _B_2S1_2S2;
  }

  get_Radio_B_2S1_2S2_default_value() {
    return _B_2S1_2S2 = null;
  }
}

class _Radio_B_2S1_2S2State extends State<Radio_B_2S1_2S2> {
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
                      value: Enum_ct_wr.mega,
                      groupValue: _B_2S1_2S2,
                      onChanged: (index) {
                        setState(() => _B_2S1_2S2 = index);
                        print(_B_2S1_2S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _B_2S1_2S2,
                      onChanged: (index) {
                        setState(() => _B_2S1_2S2 = index);
                        print(_B_2S1_2S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _B_2S1_2S2,
                      onChanged: (index) {
                        setState(() => _B_2S1_2S2 = index);
                        print(_B_2S1_2S2);
                      },
                    ),
                    Text('terra'),
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

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
class Radio_B_3S1_3S2 extends StatefulWidget {
  @override
  State<Radio_B_3S1_3S2> createState() => _Radio_B_3S1_3S2State();

  get_Radio_B_3S1_3S2() {
    return _B_3S1_3S2;
  }

  get_Radio_B_3S1_3S2_default_value() {
    return _B_3S1_3S2 = null;
  }
}

class _Radio_B_3S1_3S2State extends State<Radio_B_3S1_3S2> {
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
                      value: Enum_ct_wr.mega,
                      groupValue: _B_3S1_3S2,
                      onChanged: (index) {
                        setState(() => _B_3S1_3S2 = index);
                        print(_B_3S1_3S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _B_3S1_3S2,
                      onChanged: (index) {
                        setState(() => _B_3S1_3S2 = index);
                        print(_B_3S1_3S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _B_3S1_3S2,
                      onChanged: (index) {
                        setState(() => _B_3S1_3S2 = index);
                        print(_B_3S1_3S2);
                      },
                    ),
                    Text('terra'),
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

class Radio_B_4S1_4S2 extends StatefulWidget {
  @override
  State<Radio_B_4S1_4S2> createState() => _Radio_B_4S1_4S2State();

  get_Radio_B_4S1_4S2() {
    return _B_4S1_4S2;
  }

  get_Radio_B_4S1_4S2_default_value() {
    return _B_4S1_4S2 = null;
  }
}

class _Radio_B_4S1_4S2State extends State<Radio_B_4S1_4S2> {
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
                      value: Enum_ct_wr.mega,
                      groupValue: _B_4S1_4S2,
                      onChanged: (index) {
                        setState(() => _B_4S1_4S2 = index);
                        print(_B_4S1_4S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _B_4S1_4S2,
                      onChanged: (index) {
                        setState(() => _B_4S1_4S2 = index);
                        print(_B_4S1_4S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _B_4S1_4S2,
                      onChanged: (index) {
                        setState(() => _B_4S1_4S2 = index);
                        print(_B_4S1_4S2);
                      },
                    ),
                    Text('terra'),
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

class Radio_B_5S1_5S2 extends StatefulWidget {
  @override
  State<Radio_B_5S1_5S2> createState() => _Radio_B_5S1_5S2State();

  get_Radio_B_5S1_5S2() {
    return _B_5S1_5S2;
  }

  get_Radio_B_5S1_5S2_default_value() {
    return _B_5S1_5S2 = null;
  }
}

class _Radio_B_5S1_5S2State extends State<Radio_B_5S1_5S2> {
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
                      value: Enum_ct_wr.mega,
                      groupValue: _B_5S1_5S2,
                      onChanged: (index) {
                        setState(() => _B_5S1_5S2 = index);
                        print(_B_5S1_5S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _B_5S1_5S2,
                      onChanged: (index) {
                        setState(() => _B_5S1_5S2 = index);
                        print(_B_5S1_5S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _B_5S1_5S2,
                      onChanged: (index) {
                        setState(() => _B_5S1_5S2 = index);
                        print(_B_5S1_5S2);
                      },
                    ),
                    Text('terra'),
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

class Radio_R_1S1_1S2 extends StatefulWidget {
  @override
  State<Radio_R_1S1_1S2> createState() => _Radio_R_1S1_1S2State();

  get_Radio_R_1S1_1S2() {
    return _R_1S1_1S2;
  }

  get_Radio_R_1S1_1S2_default_value() {
    return _R_1S1_1S2 = null;
  }
}

class _Radio_R_1S1_1S2State extends State<Radio_R_1S1_1S2> {
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
                      value: Enum_ct_wr.mega,
                      groupValue: _R_1S1_1S2,
                      onChanged: (index) {
                        setState(() => _R_1S1_1S2 = index);
                        print(_R_1S1_1S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _R_1S1_1S2,
                      onChanged: (index) {
                        setState(() => _R_1S1_1S2 = index);
                        print(_R_1S1_1S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _R_1S1_1S2,
                      onChanged: (index) {
                        setState(() => _R_1S1_1S2 = index);
                        print(_R_1S1_1S2);
                      },
                    ),
                    Text('terra'),
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

class Radio_R_2S1_2S2 extends StatefulWidget {
  // const Radio_R_2S1_2S2({super.key});

  @override
  State<Radio_R_2S1_2S2> createState() => _Radio_R_2S1_2S2State();

  get_Radio_R_2S1_2S2() {
    return _R_2S1_2S2;
  }

  get_Radio_R_2S1_2S2_default_value() {
    return _R_2S1_2S2 = null;
  }
}

class _Radio_R_2S1_2S2State extends State<Radio_R_2S1_2S2> {
  // SingingCharacter _character = SingingCharacter.giga;
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
                      value: Enum_ct_wr.mega,
                      groupValue: _R_2S1_2S2,
                      onChanged: (index) {
                        setState(() => _R_2S1_2S2 = index);
                        print(_R_2S1_2S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _R_2S1_2S2,
                      onChanged: (index) {
                        setState(() => _R_2S1_2S2 = index);
                        print(_R_2S1_2S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _R_2S1_2S2,
                      onChanged: (index) {
                        setState(() => _R_2S1_2S2 = index);
                        print(_R_2S1_2S2);
                      },
                    ),
                    Text('terra'),
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

class Radio_R_3S1_3S2 extends StatefulWidget {
  // const Radio_R_3S1_3S2({super.key});

  @override
  State<Radio_R_3S1_3S2> createState() => _Radio_R_3S1_3S2State();

  get_Radio_R_3S1_3S2() {
    return _R_3S1_3S2;
  }

  get_Radio_R_3S1_3S2_default_value() {
    return _R_3S1_3S2 = null;
  }
}

class _Radio_R_3S1_3S2State extends State<Radio_R_3S1_3S2> {
  // SingingCharacter _character = SingingCharacter.giga;
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
                      value: Enum_ct_wr.mega,
                      groupValue: _R_3S1_3S2,
                      onChanged: (index) {
                        setState(() => _R_3S1_3S2 = index);
                        print(_R_3S1_3S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _R_3S1_3S2,
                      onChanged: (index) {
                        setState(() => _R_3S1_3S2 = index);
                        print(_R_3S1_3S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _R_3S1_3S2,
                      onChanged: (index) {
                        setState(() => _R_3S1_3S2 = index);
                        print(_R_3S1_3S2);
                      },
                    ),
                    Text('terra'),
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

class Radio_R_4S1_4S2 extends StatefulWidget {
  // const Radio_R_4S1_4S2({super.key});

  @override
  State<Radio_R_4S1_4S2> createState() => _Radio_R_4S1_4S2State();

  get_Radio_R_4S1_4S2() {
    return _R_4S1_4S2;
  }

  get_Radio_R_4S1_4S2_default_value() {
    return _R_4S1_4S2 = null;
  }
}

class _Radio_R_4S1_4S2State extends State<Radio_R_4S1_4S2> {
  // SingingCharacter _character = SingingCharacter.giga;
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
                      value: Enum_ct_wr.mega,
                      groupValue: _R_4S1_4S2,
                      onChanged: (index) {
                        setState(() => _R_4S1_4S2 = index);
                        print(_R_4S1_4S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _R_4S1_4S2,
                      onChanged: (index) {
                        setState(() => _R_4S1_4S2 = index);
                        print(_R_4S1_4S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _R_4S1_4S2,
                      onChanged: (index) {
                        setState(() => _R_4S1_4S2 = index);
                        print(_R_4S1_4S2);
                      },
                    ),
                    Text('terra'),
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

class Radio_R_5S1_5S2 extends StatefulWidget {
  // const Radio_R_5S1_5S2({super.key});

  @override
  State<Radio_R_5S1_5S2> createState() => _Radio_R_5S1_5S2State();

  get_Radio_R_5S1_5S2() {
    return _R_5S1_5S2;
  }

  get_Radio_R_5S1_5S2_default_value() {
    return _R_5S1_5S2 = null;
  }
}

class _Radio_R_5S1_5S2State extends State<Radio_R_5S1_5S2> {
  // SingingCharacter _character = SingingCharacter.giga;
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
                      value: Enum_ct_wr.mega,
                      groupValue: _R_5S1_5S2,
                      onChanged: (index) {
                        setState(() => _R_5S1_5S2 = index);
                        print(_R_5S1_5S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _R_5S1_5S2,
                      onChanged: (index) {
                        setState(() => _R_5S1_5S2 = index);
                        print(_R_5S1_5S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _R_5S1_5S2,
                      onChanged: (index) {
                        setState(() => _R_5S1_5S2 = index);
                        print(_R_5S1_5S2);
                      },
                    ),
                    Text('terra'),
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

class Radio_Y_1S1_1S2 extends StatefulWidget {
  // const Radio_Y_1S1_1S2({super.key});

  @override
  State<Radio_Y_1S1_1S2> createState() => _Radio_Y_1S1_1S2State();

  get_Radio_Y_1S1_1S2() {
    return _Y_1S1_1S2;
  }

  get_Radio_Y_1S1_1S2_default_value() {
    return _Y_1S1_1S2 = null;
  }
}

class _Radio_Y_1S1_1S2State extends State<Radio_Y_1S1_1S2> {
  // SingingCharacter _character = SingingCharacter.giga;
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
                      value: Enum_ct_wr.mega,
                      groupValue: _Y_1S1_1S2,
                      onChanged: (index) {
                        setState(() => _Y_1S1_1S2 = index);
                        print(_Y_1S1_1S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _Y_1S1_1S2,
                      onChanged: (index) {
                        setState(() => _Y_1S1_1S2 = index);
                        print(_Y_1S1_1S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _Y_1S1_1S2,
                      onChanged: (index) {
                        setState(() => _Y_1S1_1S2 = index);
                        print(_Y_1S1_1S2);
                      },
                    ),
                    Text('terra'),
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

class Radio_Y_2S1_2S2 extends StatefulWidget {
  // const Radio_Y_2S1_2S2({super.key});

  @override
  State<Radio_Y_2S1_2S2> createState() => _Radio_Y_2S1_2S2State();

  get_Radio_Y_2S1_2S2() {
    return _Y_2S1_2S2;
  }

  get_Radio_Y_2S1_2S2_default_value() {
    return _Y_2S1_2S2 = null;
  }
}

class _Radio_Y_2S1_2S2State extends State<Radio_Y_2S1_2S2> {
  // SingingCharacter _character = SingingCharacter.giga;
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
                      value: Enum_ct_wr.mega,
                      groupValue: _Y_2S1_2S2,
                      onChanged: (index) {
                        setState(() => _Y_2S1_2S2 = index);
                        print(_Y_2S1_2S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _Y_2S1_2S2,
                      onChanged: (index) {
                        setState(() => _Y_2S1_2S2 = index);
                        print(_Y_2S1_2S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _Y_2S1_2S2,
                      onChanged: (index) {
                        setState(() => _Y_2S1_2S2 = index);
                        print(_Y_2S1_2S2);
                      },
                    ),
                    Text('terra'),
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

class Radio_Y_3S1_3S2 extends StatefulWidget {
  @override
  State<Radio_Y_3S1_3S2> createState() => _Radio_Y_3S1_3S2State();

  get_Radio_Y_3S1_3S2() {
    return _Y_3S1_3S2;
  }

  get_Radio_Y_3S1_3S2_default_value() {
    return _Y_3S1_3S2 = null;
  }
}

class _Radio_Y_3S1_3S2State extends State<Radio_Y_3S1_3S2> {
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
                      value: Enum_ct_wr.mega,
                      groupValue: _Y_3S1_3S2,
                      onChanged: (index) {
                        setState(() => _Y_3S1_3S2 = index);
                        print(_Y_3S1_3S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _Y_3S1_3S2,
                      onChanged: (index) {
                        setState(() => _Y_3S1_3S2 = index);
                        print(_Y_3S1_3S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _Y_3S1_3S2,
                      onChanged: (index) {
                        setState(() => _Y_3S1_3S2 = index);
                        print(_Y_3S1_3S2);
                      },
                    ),
                    Text('terra'),
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

class Radio_Y_4S1_4S2 extends StatefulWidget {
  // const Radio_Y_4S1_4S2({super.key});

  @override
  State<Radio_Y_4S1_4S2> createState() => _Radio_Y_4S1_4S2State();

  get_Radio_Y_4S1_4S2() {
    return _Y_4S1_4S2;
  }

  get_Radio_Y_4S1_4S2_default_value() {
    return _Y_4S1_4S2 = null;
  }
}

class _Radio_Y_4S1_4S2State extends State<Radio_Y_4S1_4S2> {
  // SingingCharacter _character = SingingCharacter.giga;
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
                      value: Enum_ct_wr.mega,
                      groupValue: _Y_4S1_4S2,
                      onChanged: (index) {
                        setState(() => _Y_4S1_4S2 = index);
                        print(_Y_4S1_4S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _Y_4S1_4S2,
                      onChanged: (index) {
                        setState(() => _Y_4S1_4S2 = index);
                        print(_Y_4S1_4S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _Y_4S1_4S2,
                      onChanged: (index) {
                        setState(() => _Y_4S1_4S2 = index);
                        print(_Y_4S1_4S2);
                      },
                    ),
                    Text('terra'),
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

class Radio_Y_5S1_5S2 extends StatefulWidget {
  @override
  State<Radio_Y_5S1_5S2> createState() => _Radio_Y_5S1_5S2State();

  get_Radio_Y_5S1_5S2() {
    return _Y_5S1_5S2;
  }

  get_Radio_Y_5S1_5S2_default_value() {
    return _Y_5S1_5S2 = null;
  }
}

class _Radio_Y_5S1_5S2State extends State<Radio_Y_5S1_5S2> {
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
                      value: Enum_ct_wr.mega,
                      groupValue: _Y_5S1_5S2,
                      onChanged: (index) {
                        setState(() => _Y_5S1_5S2 = index);
                        print(_Y_5S1_5S2);
                      },
                    ),
                    Text('mega'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.giga,
                      groupValue: _Y_5S1_5S2,
                      onChanged: (index) {
                        setState(() => _Y_5S1_5S2 = index);
                        print(_Y_5S1_5S2);
                      },
                    ),
                    Text('giga'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Enum_ct_wr.terra,
                      groupValue: _Y_5S1_5S2,
                      onChanged: (index) {
                        setState(() => _Y_5S1_5S2 = index);
                        print(_Y_5S1_5S2);
                      },
                    ),
                    Text('terra'),
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
