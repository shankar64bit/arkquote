import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:quotesummeryapp/features/data/datasources/quote_item_local_datasource.dart';
import 'package:quotesummeryapp/features/data/datasources/quote_main_local_datasource.dart';
import '../models/quote_item_model.dart';
import '../models/quote_main_model.dart';
part 'app_data_base.g.dart';

@DriftDatabase(tables: [
  QuoteMainLocalDatasourceImpl,
  QuoteItemLocalDatasourceImpl,
])
//---------------------------------------------------------------------------------------------------------------//

// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createQuoteMain(QuoteMainModel quotemaintolocal) {
    return into(quoteMainLocalDatasourceImpl)
        .insert(QuoteMainLocalDatasourceImplCompanion.insert(
      address: quotemaintolocal.address,
      client: quotemaintolocal.client,
      quotename: quotemaintolocal.quotename,
      // quotedate: quotemaintolocal.quotedate,
    ));
  }

  Future<bool> updateQuoteMain(QuoteMainModel quotemaintoupdate, int id) {
    String address = quotemaintoupdate.address;
    String client = quotemaintoupdate.client;
    DateTime quotedate = quotemaintoupdate.quotedate;
    String quotename = quotemaintoupdate.quotename;
    return update(quoteMainLocalDatasourceImpl).replace(QuoteMainLocalData(
      id: id,
      address: address,
      client: client,
      quotedate: quotedate,
      quotename: quotename,
    ));
  }

  Future<int> deleteQuoteMainById(int id) {
    return (delete(quoteMainLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<QuoteMainLocalData>>
      getQuoteMainLocalDatadourceImpleList() async {
    return await select(quoteMainLocalDatasourceImpl).get();
  }

  Future<List<QuoteMainLocalData>> getQuoteMainLocalDataWithQno(String sn) {
    return (select(quoteMainLocalDatasourceImpl)
          ..where((u) => u.client.equals(sn)))
        .get();
  }

  Future<QuoteMainLocalData> getQuoteMainLocalDataWithId(int id) {
    return (select(quoteMainLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }

  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Future<int> createQuoteItem(QuoteItemModel quoteItemtolocal) {
    return into(quoteItemLocalDatasourceImpl)
        .insert(QuoteItemLocalDatasourceImplCompanion.insert(
      quoteno: quoteItemtolocal.quoteno,
      itemname: quoteItemtolocal.itemname,
      qty: quoteItemtolocal.qty,
      unitprice: quoteItemtolocal.unitprice,
    ));
  }

  Future<bool> updateQuoteItem(QuoteItemModel quoteItemtoupdate, int id) {
    String quoteno = quoteItemtoupdate.quoteno;
    String itemname = quoteItemtoupdate.itemname;
    int qty = quoteItemtoupdate.qty;
    double unitprice = quoteItemtoupdate.unitprice;
    return update(quoteItemLocalDatasourceImpl).replace(QuoteItemLocalData(
      id: id,
      quoteno: quoteno,
      itemname: itemname,
      qty: qty,
      unitprice: unitprice,
    ));
  }

  Future<int> deleteQuoteItemById(int id) {
    return (delete(quoteItemLocalDatasourceImpl)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<QuoteItemLocalData>>
      getQuoteItemLocalDatadourceImpleList() async {
    return await select(quoteItemLocalDatasourceImpl).get();
  }

  Future<List<QuoteItemLocalData>> getQuoteItemLocalDataWithQno(String sn) {
    return (select(quoteItemLocalDatasourceImpl)
          ..where((u) => u.quoteno.equals(sn)))
        .get();
  }

  Future<QuoteItemLocalData> getQuoteItemLocalDataWithId(int id) {
    return (select(quoteItemLocalDatasourceImpl)..where((u) => u.id.equals(id)))
        .getSingle();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db12.sqlite'));
    return NativeDatabase(file);
  });
}
