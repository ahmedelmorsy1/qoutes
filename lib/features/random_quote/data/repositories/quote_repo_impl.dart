import 'package:dartz/dartz.dart';
import 'package:qoutes/barell_file.dart';

class QuoteRepoImplement implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDS randomQuoteRemoteDS;
  final RandomQuoteLocalDS randomQuoteLocalDS;

  QuoteRepoImplement({
    required this.networkInfo,
    required this.randomQuoteRemoteDS,
    required this.randomQuoteLocalDS,
  });
  @override
  Future<Either<Failure, Quote>> getRandomQuote ()async {
    // if(await networkInfo.isConnected){
      try{
        final remoteRndQuote = await randomQuoteLocalDS.getLastRandomQuote();
        //to make caching to load if it's offline
        randomQuoteLocalDS.cacheQuote(remoteRndQuote);

        return Right(remoteRndQuote);
        }
        on ServerException{
          return Left(ServerFailure());
        }
    }
    // else{
    //   try{
    //     final cacheRndQuote = await randomQuoteRemoteDS.getRandomQuote();
    //     return Right(cacheRndQuote);
    //     }
    //     on CacheException{
    //       return Left(CacheFailure());
    //     }
    // }
    // }
}