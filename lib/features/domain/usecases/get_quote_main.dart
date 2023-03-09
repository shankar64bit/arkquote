import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:quotesummeryapp/features/domain/entities/quote_main.dart';
import 'package:quotesummeryapp/features/domain/repositories/quote_main_repository.dart';

import '../../../../core/error/failures.dart';

class GetQuoteMain {
  final QuoteMainRepository repository;

  GetQuoteMain(this.repository);

  Future<Either<Failure, QuoteMain>> call({
    @required int trNo,
  }) async {
    return await repository.getQuoteMain(trNo);
  }
}
