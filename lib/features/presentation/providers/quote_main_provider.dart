// ignore_for_file: missing_return
import 'package:flutter/foundation.dart';
import '../../../injection_container.dart';
import '../../data/datasources/quote_main_local_datasource.dart';
import '../../data/models/quote_main_model.dart';

class QuoteMainProvider extends ChangeNotifier {
  List<QuoteMainModel> _quotemainlocaldataList = [];
  List<QuoteMainModel> get quotemainlocaldataList => _quotemainlocaldataList;
  List<QuoteMainModel> _quotemainQnoNoList = [];
  List<QuoteMainModel> get quotemainQnoNoList => _quotemainQnoNoList;
  QuoteMainModel _quotemainModel;
  QuoteMainModel get quotemainModel => _quotemainModel;

  String _error = 'ErroR';
  String get error => _error;

  void getQuoteMainByQno(String sn) async {
    _quotemainQnoNoList = await sl<QuoteMainLocalDatasourceImpl>()
        .getQuoteMainByQno(sn)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getQuoteMainByID(int id) async {
    _quotemainModel = await sl<QuoteMainLocalDatasourceImpl>()
        .getQuoteMainById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addQuoteMain(QuoteMainModel quotemaintolocal) async {
    await sl<QuoteMainLocalDatasourceImpl>()
        .localQuoteMain(quotemaintolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteQuoteMain(int id) async {
    await sl<QuoteMainLocalDatasourceImpl>()
        .deleteQuoteMainById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateQuoteMain(QuoteMainModel quotemaintoupdate, int id) async {
    await sl<QuoteMainLocalDatasourceImpl>()
        .updateQuoteMain(quotemaintoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getQuoteMainLocalData() async {
    _quotemainlocaldataList = await sl<QuoteMainLocalDatasourceImpl>()
        .getQuoteMainLocalDataList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
