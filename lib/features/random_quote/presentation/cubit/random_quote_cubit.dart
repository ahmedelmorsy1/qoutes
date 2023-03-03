import 'package:dartz/dartz.dart';
import '../../../../barell_file.dart';
part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;
  RandomQuoteCubit({required this.getRandomQuoteUseCase}) : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async{
    emit(RandomQuoteIsLoading());
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());

    emit(response.fold((failure) => RandomQuoteError(msg: _mapFailureToMsg(failure)),
     (quote) => RandomQuoteLoaded(quote: quote))); 
  }

  String _mapFailureToMsg(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;

      default:
        return AppStrings.unexpectedError;
    }
  }
}