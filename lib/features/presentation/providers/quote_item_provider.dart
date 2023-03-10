// ignore_for_file: missing_return
import 'package:flutter/foundation.dart';
import '../../../injection_container.dart';
import '../../data/datasources/quote_item_local_datasource.dart';
import '../../data/models/quote_item_model.dart';

class QuoteItemProvider extends ChangeNotifier {
  List<QuoteItemModel> _quoteItemlocaldataList = [];
  List<QuoteItemModel> get quoteItemlocaldataList => _quoteItemlocaldataList;
  List<QuoteItemModel> _quoteItemQnoNoList = [];
  List<QuoteItemModel> get quoteItemQnoNoList => _quoteItemQnoNoList;
  QuoteItemModel _quoteItemModel;
  QuoteItemModel get quoteItemModel => _quoteItemModel;

  String _error = 'ErroR';
  String get error => _error;

  void getQuoteItemByQno(String sn) async {
    _quoteItemQnoNoList = await sl<QuoteItemLocalDatasourceImpl>()
        .getQuoteItemByQno(sn)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getQuoteItemByID(int id) async {
    _quoteItemModel = await sl<QuoteItemLocalDatasourceImpl>()
        .getQuoteItemById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addQuoteItem(QuoteItemModel quoteItemtolocal) async {
    await sl<QuoteItemLocalDatasourceImpl>()
        .localQuoteItem(quoteItemtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteQuoteItem(int id) async {
    await sl<QuoteItemLocalDatasourceImpl>()
        .deleteQuoteItemById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateQuoteItem(QuoteItemModel quoteItemtoupdate, int id) async {
    await sl<QuoteItemLocalDatasourceImpl>()
        .updateQuoteItem(quoteItemtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getQuoteItemLocalData() async {
    _quoteItemlocaldataList = await sl<QuoteItemLocalDatasourceImpl>()
        .getQuoteItemLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
