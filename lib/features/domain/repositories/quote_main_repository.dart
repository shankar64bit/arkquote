import 'package:dartz/dartz.dart';
import 'package:quotesummeryapp/features/domain/entities/quote_main.dart';
import '../../../../core/error/failures.dart';

abstract class QuoteMainRepository {
  Future<Either<Failure, QuoteMain>> getQuoteMain(int trNo);
}
