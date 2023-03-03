import 'package:dartz/dartz.dart';
import 'package:qoutes/barell_file.dart';
class GetRandomQuote implements UseCase<Quote,NoParams>{
  final QuoteRepository quoteRepository;

  GetRandomQuote({required this.quoteRepository});
  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
    quoteRepository.getRandomQuote();
}

// class LoginParams extends Equatable{
//   final String userName , password;
//   const LoginParams({ required this.userName,required this.password});
//   @override
//   List<Object?> get props => [];
// }