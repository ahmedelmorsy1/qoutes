import 'package:qoutes/barell_file.dart';

abstract class RandomQuoteRemoteDS{
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDSImpl implements RandomQuoteRemoteDS{
  final ApiConsumer apiConsumer;
  RandomQuoteRemoteDSImpl({required this.apiConsumer});

  @override
  Future<QuoteModel> getRandomQuote() async {
    // final rndQuoteUrl =Uri.parse(EndPoints.randomQuote);
    final response =await apiConsumer.get(EndPoints.randomQuote,);
    return QuoteModel.fromJson(response);

    // if(response.statusCode ==200){
    //   return QuoteModel.fromJson(json.decode(response.body));
    // }else{
    //   throw ServerException();
    // }
    }
}