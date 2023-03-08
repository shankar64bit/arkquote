import 'package:flutter/material.dart';

class secTab extends StatelessWidget {
  // const secTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[100],
      child: Center(
          child: Text(
        '2ND TAB [Detailed Breakup]',
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
