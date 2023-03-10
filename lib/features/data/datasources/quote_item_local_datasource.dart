import 'package:drift/drift.dart';
import '../../../injection_container.dart';
import '../models/quote_item_model.dart';
import 'app_data_base.dart';

abstract class QuoteItemLocalDatasource {
  Future<List<QuoteItemModel>> getQuoteItemByQno(String sn);
  Future<QuoteItemModel> getQuoteItemById(int id);
  Future<int> localQuoteItem(QuoteItemModel quoteItemtolocal);
  Future<void> updateQuoteItem(QuoteItemModel quoteItemtoupdate, int id);
  Future<int> deleteQuoteItemById(int id);
  Future<List<QuoteItemModel>> getQuoteItemLocalDataList();
}

@DataClassName('QuoteItemLocalData')
class QuoteItemLocalDatasourceImpl extends Table
    implements QuoteItemLocalDatasource {
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  TextColumn get quoteno => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get itemname => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get qty => integer()();
  @required
  RealColumn get unitprice => real()();

  @override
  Future<int> deleteQuoteItemById(int id) {
    return (sl<AppDatabase>().deleteQuoteItemById(id));
  }

  @override
  Future<QuoteItemModel> getQuoteItemById(int id) async {
    QuoteItemLocalData tQuoteItemData =
        await sl<AppDatabase>().getQuoteItemLocalDataWithId(id);

    QuoteItemModel tQuoteItemModel = QuoteItemModel(
      id: tQuoteItemData.id,
      quoteno: tQuoteItemData.quoteno,
      itemname: tQuoteItemData.itemname,
      qty: tQuoteItemData.qty,
      unitprice: tQuoteItemData.unitprice,
    );
    return tQuoteItemModel;
  }

  @override
  Future<List<QuoteItemModel>> getQuoteItemByQno(String sn) async {
    final tQuoteItemData =
        await sl<AppDatabase>().getQuoteItemLocalDataWithQno(sn);

    List<QuoteItemModel> tquoteItemModel =
        List<QuoteItemModel>.empty(growable: true);
    for (var element in tQuoteItemData) {
      tquoteItemModel.add(QuoteItemModel(
        id: element.id,
        quoteno: element.quoteno,
        itemname: element.itemname,
        qty: element.qty,
        unitprice: element.unitprice,
      ));
    }
    return tquoteItemModel;
  }

  @override
  Future<List<QuoteItemModel>> getQuoteItemLocalDataList() async {
    final tquoteItemDataList =
        await sl<AppDatabase>().getQuoteItemLocalDatadourceImpleList();
    List<QuoteItemModel> tquoteItemDataModel =
        List<QuoteItemModel>.empty(growable: true);

    for (var listEle in tquoteItemDataList) {
      tquoteItemDataModel.add(QuoteItemModel(
        id: listEle.id,
        quoteno: listEle.quoteno,
        itemname: listEle.itemname,
        qty: listEle.qty,
        unitprice: listEle.unitprice,
      ));
    }
    return tquoteItemDataModel;
  }

  @override
  Future<int> localQuoteItem(QuoteItemModel quoteItemtolocal) {
    return (sl<AppDatabase>().createQuoteItem(quoteItemtolocal));
  }

  @override
  Future<void> updateQuoteItem(QuoteItemModel quoteItemtoupdate, int id) {
    return (sl<AppDatabase>().updateQuoteItem(quoteItemtoupdate, id));
  }
}
