import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:quotesummeryapp/core/platform/network_info.dart';
import 'package:quotesummeryapp/core/util/input_converter.dart';
import 'package:quotesummeryapp/features/data/datasources/app_data_base.dart';
import 'package:quotesummeryapp/features/data/datasources/quote_main_local_datasource.dart';
import 'package:quotesummeryapp/features/data/repositories/quote_main_repository_impl.dart';
import 'package:quotesummeryapp/features/domain/repositories/quote_main_repository.dart';
import 'package:quotesummeryapp/features/domain/usecases/get_quote_main.dart';
import 'package:quotesummeryapp/features/presentation/providers/quote_main_provider.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //StateManagement
  sl.registerLazySingleton<QuoteMainProvider>(() => QuoteMainProvider());

  //Usecases
  sl.registerLazySingleton(() => GetQuoteMain(sl()));
  //Repository
  sl.registerLazySingleton<QuoteMainRepository>(
    () => QuoteMainRepositoryImpl(
      // remoteDatasource: sl(),
      localDatasource: sl(),
      networkInfo: sl(),
    ),
  );

  //Local-Datasources
  sl.registerLazySingleton(() => QuoteMainLocalDatasourceImpl());

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //!External
  sl.registerLazySingleton(() => AppDatabase());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
