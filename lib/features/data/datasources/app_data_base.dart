import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:quotesummeryapp/features/data/datasources/quote_main_local_datasource.dart';
import '../models/quote_main_model.dart';
part 'app_data_base.g.dart';

@DriftDatabase(tables: [
  QuoteMainLocalDatasourceImpl,
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
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db5.sqlite'));
    return NativeDatabase(file);
  });
}
