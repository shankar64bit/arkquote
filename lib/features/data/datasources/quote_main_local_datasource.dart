import 'package:drift/drift.dart';
import '../../../injection_container.dart';
import '../models/quote_main_model.dart';
import 'app_data_base.dart';

abstract class QuoteMainLocalDatasource {
  Future<List<QuoteMainModel>> getQuoteMainByQno(String sn);
  Future<QuoteMainModel> getQuoteMainById(int id);
  Future<int> localQuoteMain(QuoteMainModel quotemaintolocal);
  Future<void> updateQuoteMain(QuoteMainModel quotemaintoupdate, int id);
  Future<int> deleteQuoteMainById(int id);
  Future<List<QuoteMainModel>> getQuoteMainLocalDataList();
}

@DataClassName('QuoteMainLocalData')
class QuoteMainLocalDatasourceImpl extends Table
    implements QuoteMainLocalDatasource {
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  TextColumn get client => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get address => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get quotename => text().withLength(min: 1, max: 50)();
  @required
  DateTimeColumn get quotedate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  Future<int> deleteQuoteMainById(int id) {
    return (sl<AppDatabase>().deleteQuoteMainById(id));
  }

  @override
  Future<QuoteMainModel> getQuoteMainById(int id) async {
    QuoteMainLocalData tQuoteMainData =
        await sl<AppDatabase>().getQuoteMainLocalDataWithId(id);

    QuoteMainModel tQuoteMainModel = QuoteMainModel(
      id: tQuoteMainData.id,
      address: tQuoteMainData.address,
      client: tQuoteMainData.client,
      quotedate: tQuoteMainData.quotedate,
      quotename: tQuoteMainData.quotename,
    );

    return tQuoteMainModel;
  }

  @override
  Future<List<QuoteMainModel>> getQuoteMainByQno(String sn) async {
    final tQuoteMainData =
        await sl<AppDatabase>().getQuoteMainLocalDataWithQno(sn);

    List<QuoteMainModel> tquotemainModel =
        List<QuoteMainModel>.empty(growable: true);
    for (var element in tQuoteMainData) {
      tquotemainModel.add(QuoteMainModel(
        id: element.id,
        address: element.address,
        client: element.client,
        quotedate: element.quotedate,
        quotename: element.quotename,
      ));
    }
    return tquotemainModel;
  }

  @override
  Future<List<QuoteMainModel>> getQuoteMainLocalDataList() async {
    final tquotemainDataList =
        await sl<AppDatabase>().getQuoteMainLocalDatadourceImpleList();
    List<QuoteMainModel> tquotemainDataModel =
        List<QuoteMainModel>.empty(growable: true);

    for (var listEle in tquotemainDataList) {
      tquotemainDataModel.add(QuoteMainModel(
        id: listEle.id,
        address: listEle.address,
        client: listEle.client,
        quotedate: listEle.quotedate,
        quotename: listEle.quotename,
      ));
    }
    return tquotemainDataModel;
  }

  @override
  Future<int> localQuoteMain(QuoteMainModel quotemaintolocal) {
    return (sl<AppDatabase>().createQuoteMain(quotemaintolocal));
  }

  @override
  Future<void> updateQuoteMain(QuoteMainModel quotemaintoupdate, int id) {
    return (sl<AppDatabase>().updateQuoteMain(quotemaintoupdate, id));
  }
}
