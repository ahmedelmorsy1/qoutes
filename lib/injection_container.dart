import 'package:qoutes/barell_file.dart';
import 'package:qoutes/features/splash/data/datasources/lang_local_ds.dart';

//singleton
final sl = GetIt.instance;

Future<void> init() async {
  //! features
  //BLocs
  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl.call()));
  sl.registerFactory(
      () => LocaleCubit(changeLangUseCase: sl(), getSavedLangUseCase: sl()));

  //Use cases
  sl.registerLazySingleton<GetRandomQuote>(
      () => GetRandomQuote(quoteRepository: sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(langRepo: sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(
      () => ChangeLangUseCase(langRepo: sl()));
  // repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepoImplement(
      networkInfo: sl(), randomQuoteRemoteDS: sl(), randomQuoteLocalDS: sl()));
  sl.registerLazySingleton<LangRepo>(() => LangRepoImpl(langLocalDS: sl()));
  //Data source
  sl.registerLazySingleton<RandomQuoteLocalDS>(
      () => RandomQuoteLocalDSImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RandomQuoteRemoteDS>(
      () => RandomQuoteRemoteDSImpl(apiConsumer: sl()));
    sl.registerLazySingleton<LangLocalDS>(
      () => LangLocalDSImpl(sharedPreferences: sl()));

  //! core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio);
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ));
}
