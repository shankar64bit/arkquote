// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quotesummeryapp/presentation/pages/tabs/1tab.dart';
import 'package:quotesummeryapp/presentation/pages/tabs/2tab.dart';
import 'package:quotesummeryapp/presentation/pages/tabs/3tab.dart';
import 'package:quotesummeryapp/presentation/pages/tabs/4tab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('N_A_M_E   Q U O T E'),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 700) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(250, 0, 250, 0),
                        child: TabBar(
                          labelColor: Colors.black, //<-- selected text color
                          unselectedLabelColor:
                              Color.fromARGB(255, 146, 134, 134),
                          indicatorColor: Color.fromARGB(255, 173, 37, 27),
                          tabs: [
                            Tab(
                              child: Text(
                                'Quote Summary',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Detailed Breakup',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Payment Details',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'FAQs/Help',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            firstTab(),
                            secTab(),
                            thirdTab(),
                            fourthTab(),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: Colors.black, //<-- selected text color
                        unselectedLabelColor:
                            Color.fromARGB(255, 146, 134, 134),
                        indicatorColor: Color.fromARGB(255, 173, 37, 27),
                        tabs: [
                          Tab(
                            child: Text(
                              'Quote Summary',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Detailed Breakup',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Payment Details',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'FAQs/Help',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            firstTab(),
                            secTab(),
                            thirdTab(),
                            fourthTab(),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}
