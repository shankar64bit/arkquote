// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quotesummeryapp/features/data/models/quote_item_model.dart';
import 'package:quotesummeryapp/features/data/models/quote_main_model.dart';
import 'package:quotesummeryapp/features/presentation/providers/quote_main_provider.dart';
import 'package:quotesummeryapp/features/presentation/widgets/customTextFormField.dart';
import 'package:quotesummeryapp/features/presentation/widgets/datepicker.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../providers/quote_item_provider.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class Entry extends StatelessWidget with GetItMixin {
  Map args = {};
  DateTime _dateOfTest;

  Entry(this.args, {Key key}) : super(key: key);

  final TextEditingController _clienTcontroller = TextEditingController();
  final TextEditingController _quoteNamecontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  final TextEditingController _dateofTestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 0, maxWidth: 700),
                      child: Add_Report_Page(context)),
                ),
              ]),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  if (_clienTcontroller.text != null) {
                    final QuoteMainModel reportToLocal = QuoteMainModel(
                      client: _clienTcontroller.text.toString(),
                      address: _addresscontroller.text.toString(),
                      quotename: _quoteNamecontroller.text.toString(),
                      quotedate: _dateOfTest,
                    );

                    getX(
                        (QuoteMainProvider x) => x.addQuoteMain(reportToLocal));
                    watchOnly((QuoteMainProvider x) => {});
                    print('storing into local database');
                    print(reportToLocal);
                  }

                  // Navigator.pushNamed(context, '/');
                },
                icon: const Icon(Icons.save),
                color: Colors.green,
              ),
              Text('save customer table'),
              // ----------------------------------------------------------
              IconButton(
                onPressed: () async {
                  final QuoteItemModel reportToLocalQuoteItem = QuoteItemModel(
                    id: 1,
                    itemname: 'Transformer',
                    qty: 10,
                    quoteno: '1',
                    unitprice: 100.00,
                  );

                  getX((QuoteItemProvider x) =>
                      x.addQuoteItem(reportToLocalQuoteItem));
                  watchOnly((QuoteItemProvider x) => {});
                  print('storing into local database');
                  print(reportToLocalQuoteItem);
                },
                icon: const Icon(Icons.save),
                color: Colors.deepOrange,
              ),
              Text('save Item table'),
              // --------------------------------------------------------------
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: const Icon(Icons.home),
                color: Colors.black,
              ),
              Text('After both saved')
            ],
          ),
        ],
      ),
    );
  }

  Form Add_Report_Page(BuildContext context) {
    return Form(
      key: _formKey,
      child: LayoutBuilder(builder: (context, constraints) {
        ///////////////////////DESKTOP//////////////////////////
        if (constraints.maxWidth > 400) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Quote Details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20),
                  ),
                ),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Column(
                      children: [
                        simplifiedForPC('client', _clienTcontroller),
                        SizedBox(height: 10.0),
                        simplifiedForPC('quotename', _quoteNamecontroller),
                        SizedBox(height: 10.0),
                        simplifiedForPC('Address', _addresscontroller),
                        SizedBox(height: 10.0),
                        CustomDatePickerFormField(
                          _dateofTestController,
                          'Date of Testing',
                          (() {
                            pickDateOfTest(context);
                          }),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          ///////////////////////////////////////MOBILE//////////////////////////////
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Quote Details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20),
                  ),
                ),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        simplifiedForMob('client', _clienTcontroller),
                        SizedBox(height: 10.0),
                        simplifiedForMob('quotename', _quoteNamecontroller),
                        SizedBox(height: 10.0),
                        simplifiedForMob('Address', _addresscontroller),
                        SizedBox(height: 10.0),
                        CustomDatePickerFormField(
                          _dateofTestController,
                          'Date of Testing',
                          (() {
                            pickDateOfTest(context);
                          }),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  simplifiedForMob(String hinttxt, TextEditingController tc) {
    return CustomTextFormField(
      controller: tc,
      hintText: hinttxt,
      // ignore: missing_return
    );
  }

  simplifiedForPC(String hinttxt, TextEditingController tc) {
    return CustomTextFormField(
      controller: tc,
      hintText: hinttxt,
      // ignore: missing_return
    );
  }

  Future<void> pickDateOfTest(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _dateOfTest ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 3),
        builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
                  // primary: Colors.pink,
                  primary: Color.fromARGB(255, 119, 11, 11),
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
                dialogBackgroundColor: Colors.white,
              ),
              child: child ?? const Text(''),
            ));

    if (newDate == null) {
      return;
    }
    _dateOfTest = newDate;
    String dot = DateFormat('dd/MM/yyyy').format(newDate);
    _dateofTestController.text = dot;
  }
}
