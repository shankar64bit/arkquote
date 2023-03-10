import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/quote_item_model.dart';
import '../../providers/quote_item_provider.dart';

class secTab extends StatelessWidget with GetItMixin {
  Map args = {};

  secTab({Key key}) : super(key: key);

  QuoteItemModel quoteItemModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((QuoteItemProvider x) => x.getQuoteItemByID(1));
    QuoteItemModel ntr = watchOnly((QuoteItemProvider x) => x.quoteItemModel);
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
                        Text('Item ID : ' + ntr.id.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                        SizedBox(height: 10),
                        Text('Item Name : ' + ntr.itemname,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                        SizedBox(height: 10),
                        Text('Item Qty : ' + ntr.qty.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                        SizedBox(height: 10),
                        Text('Unit Price : ' + ntr.unitprice.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                        SizedBox(height: 10),
                        Text('Quote No : ' + ntr.quoteno.toString(),
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
