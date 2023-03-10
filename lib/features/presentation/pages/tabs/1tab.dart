import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:quotesummeryapp/features/data/models/quote_main_model.dart';
import 'package:quotesummeryapp/features/presentation/providers/quote_main_provider.dart';
import '../../../data/models/quote_item_model.dart';
import '../../providers/quote_item_provider.dart';

class firstTab extends StatelessWidget with GetItMixin {
  Map args = {};

  firstTab({Key key}) : super(key: key);

  QuoteMainModel quotemainModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((QuoteMainProvider x) => x.getQuoteMainByID(1));
    QuoteMainModel ntr = watchOnly((QuoteMainProvider x) => x.quotemainModel);
    getX((QuoteItemProvider x) => x.getQuoteItemByID(1));
    QuoteItemModel ntr2 = watchOnly((QuoteItemProvider x) => x.quoteItemModel);
    print(ntr);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                color: Colors.red[400],
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Quote No : ' + ntr.id.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                        SizedBox(height: 10),
                        Text('Quote Name : ' + ntr.quotename.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                        SizedBox(height: 10),
                        Text('Client Name : ' + ntr.client.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                        SizedBox(height: 10),
                        Text('Quote Validity : ' + ntr.address.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                        SizedBox(height: 10),
                        Text('Quote Validity : ' + ntr.quotedate.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                      ]),
                ),
              ),
              SizedBox(height: 20),
              Text('Price Breakup'),
              Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Quote No : ' + ntr.id.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                        SizedBox(height: 10),
                        Text('Quote Name : ' + ntr.quotename.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                        SizedBox(height: 10),
                        Text('Client Name : ' + ntr.client.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                        SizedBox(height: 10),
                        Text('Quote Validity : ' + ntr.address.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                        SizedBox(height: 10),
                        Text('Quote Validity : ' + ntr.quotedate.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
