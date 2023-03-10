import 'package:flutter/material.dart';

enum CONNTap { empty, s1_s2, s1_s3, s1_s4, s1_s5 }

var _connectedTaps;

class connectedTapRadio extends StatefulWidget {
  // const connectedTapRadio({super.key});

  @override
  State<connectedTapRadio> createState() => _connectedTapRadioState();

  get_connectedTapRadio() {
    return _connectedTaps;
  }

  get_connectedTapRadio_default_value() {
    return _connectedTaps = null;
  }
}

class _connectedTapRadioState extends State<connectedTapRadio> {
  // SingingCharacter _character = SingingCharacter.giga;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            Divider(height: 5, color: Colors.black, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(
                      value: CONNTap.empty,
                      groupValue: _connectedTaps,
                      onChanged: (index) {
                        setState(() => _connectedTaps = index);
                        print(_connectedTaps);
                      },
                    ),
                    Text('Empty'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: CONNTap.s1_s2,
                      groupValue: _connectedTaps,
                      onChanged: (index) {
                        setState(() => _connectedTaps = index);
                        print(_connectedTaps);
                      },
                    ),
                    Text('S1-S2'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: CONNTap.s1_s3,
                      groupValue: _connectedTaps,
                      onChanged: (index) {
                        setState(() => _connectedTaps = index);
                        print(_connectedTaps);
                      },
                    ),
                    Text('S1-S3'),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(
                      value: CONNTap.s1_s4,
                      groupValue: _connectedTaps,
                      onChanged: (index) {
                        setState(() => _connectedTaps = index);
                        print(_connectedTaps);
                      },
                    ),
                    Text('S1-S4'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: CONNTap.s1_s5,
                      groupValue: _connectedTaps,
                      onChanged: (index) {
                        setState(() => _connectedTaps = index);
                        print(_connectedTaps);
                      },
                    ),
                    Text('S1-S5'),
                  ],
                ),
              ],
            ),
            Divider(height: 5, color: Colors.black, thickness: 1),
          ],
        ),
      ),
    );
  }
}
