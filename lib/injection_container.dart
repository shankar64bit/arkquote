import 'package:data_connection_checker/data_connection_checker.dart';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //! Features - TestReport
  //StateManagement
  // sl.registerSingleton<GoogleSignInController>(
  //     GoogleSignInController()); //login-page-getitmixin-added
  // sl.registerLazySingleton<TestReportsProvider>(() => TestReportsProvider());
  // sl.registerLazySingleton<AcbProvider>(() => AcbProvider());
  // sl.registerLazySingleton<AcbIrProvider>(() => AcbIrProvider());
  // sl.registerLazySingleton<AcbCrmProvider>(() => AcbCrmProvider());

//   ////////////////////////////////////////////////////////////////////////////////////////
//   //Usecases
//   sl.registerLazySingleton(() => GetTestReport(sl()));

//   ////////////////////////////////////////////////////////////////////////////////////////
//   //Repository
//   sl.registerLazySingleton<TestReportRepository>(
//     () => TestReportRepositoryImpl(
//       remoteDatasource: sl(),
//       localDatasource: sl(),
//       networkInfo: sl(),
//     ),
//   );

//   ////////////////////////////////////////////////////////////////////////////////////////
//   //Remote-Datasources

//   sl.registerLazySingleton<TestReportRemoteDatasourceImpl>(
//       () => TestReportRemoteDatasourceImpl(client: sl()));

//   sl.registerLazySingleton<UserRemoteDatasourceImpl>(
//       () => UserRemoteDatasourceImpl(client: sl()));

//   sl.registerLazySingleton<InventoryRemoteDatasourceImpl>(
//       () => InventoryRemoteDatasourceImpl(client: sl()));

//   ////////////////////////////////////////////////////////////////////////////////////////
//   //Local-Datasources

//   sl.registerLazySingleton<TestReportLocalDatasourceImpl>(
//       () => TestReportLocalDatasourceImpl());

//   sl.registerLazySingleton<AcbLocalDatasourceImpl>(
//       () => AcbLocalDatasourceImpl());
//   sl.registerLazySingleton<EnergyMeterLocalDatasourceImpl>(
//       () => EnergyMeterLocalDatasourceImpl());

//   sl.registerLazySingleton(() => AcbIrLocalDatasourceImpl());
//   sl.registerLazySingleton(() => AcbCrmLocalDatasourceImpl());
//   sl.registerLazySingleton(() => VcbTimingLocalDatasourceImpl());

//   /////////////////////////////////////////////////////////////////////////////////////////////
//   //! Core
//   sl.registerLazySingleton(() => InputConverter());
//   sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//   /////////////////////////////////////////////////////////////////////////////////////////////
//   //!External
//   sl.registerLazySingleton(() => AppDatabase());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());

  /////////////////////////////////////////////////////////////////////////////////////////////
}
