import 'package:dartz/dartz.dart';
import 'package:qoutes/barell_file.dart';

abstract class QuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}