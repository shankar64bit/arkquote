import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'app_data_base.g.dart';

@DriftDatabase(tables: [
  // TestReportLocalDatasourceImpl,
])
//---------------------------------------------------------------------------------------------------------------//

// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Future<UserLocalData> getUserLocalDataWithId(int empNo) async {
  //   return await (select(userLocalDatasourceImpl)
  //         ..where((u) => u.empNo.equals(empNo)))
  //       .getSingle();
  // }

  // Future<UserLocalData> getUserLocalDataWithDBID(int databaseID) {
  //   return (select(userLocalDatasourceImpl)
  //         ..where((u) => u.databaseID.equals(databaseID)))
  //       .getSingle();
  // }

  // Future<List<UserLocalData>> getUserLocalDataList() async {
  //   return await select(userLocalDatasourceImpl).get();
  // }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'dbno1.sqlite'));
    return NativeDatabase(file);
  });
}
