import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/entities/quote_main.dart';
import '../../domain/repositories/quote_main_repository.dart';
import '../datasources/quote_main_local_datasource.dart';

class QuoteMainRepositoryImpl implements QuoteMainRepository {
  // final QuoteMainRemoteDatasource remoteDatasource;
  final QuoteMainLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  QuoteMainRepositoryImpl({
    // @required this.remoteDatasource,
    @required this.localDatasource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, QuoteMain>> getQuoteMain(int trNo) async {
    if (await networkInfo.isConnected) {
      // try {
      //   final remoteQuoteMain = await remoteDatasource.getQuoteMain(trNo);
      //   localDatasource.localQuoteMain(remoteQuoteMain);
      //   return Right(remoteQuoteMain);
      // } on ServerException {
      //   return Left(ServerFailure());
      // }
    } else {
      try {
        final localQuoteMain = await localDatasource.getQuoteMainById(trNo);
        return Right(localQuoteMain);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
