import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../injection_container.dart';
import '../../../data/models/quote_item_model.dart';
import '../../providers/quote_item_provider.dart';

var qtys = 0;

class secTab extends StatelessWidget with GetItMixin {
  Map args = {};

  sendqtytoQuoteMain() {
    return qtys;
  }

  secTab({Key key}) : super(key: key);

  QuoteItemModel quoteItemModel, ntr;

  @override
  Widget build(BuildContext context) {
    getX((QuoteItemProvider x) => x.getQuoteItemByID(1));
    QuoteItemModel ntr = watchOnly((QuoteItemProvider x) => x.quoteItemModel);
    print(ntr);

    // var collect = sl<QuoteItemProvider>().quoteItemlocaldataList;
    // List<dynamic> collectIDlist = [];
    // for (var i in collect) {
    //   int eachid = i.id;
    //   collectIDlist.add(eachid);
    //   print('object');
    //   print(collectIDlist);
    // }
    // print(collectIDlist);

    return Container(
      child: Expanded(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        SizedBox(child: generateListOfItem(ntr)),
                      ],
                    ),
                  )
                ],
              );
            })),
      ),
    );
  }

  generateListOfItem(QuoteItemModel ntr) {
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
                      SizedBox(height: 5),
                      Text('Item Name : ' + ntr.itemname,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14)),
                      // SizedBox(height: 5),
                      // Text('Item Qty : ' + ntr.qty.toString(),
                      //     style: const TextStyle(
                      //         color: Colors.white, fontSize: 14)),
                      SizedBox(height: 5),
                      Text('Unit Price : ' + ntr.unitprice.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14)),
                      SizedBox(height: 5),
                      Text('Quote No : ' + ntr.quoteno.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14)),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    qtys = qtys - 1;
                                    print('$qtys');
                                  });
                                },
                                icon: const Icon(Icons.remove),
                                color: Colors.black,
                              ),
                              Text(qtys.toString()),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    qtys = qtys + 1;
                                    print('$qtys');
                                  });
                                },
                                icon: const Icon(Icons.add),
                                color: Colors.black,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
