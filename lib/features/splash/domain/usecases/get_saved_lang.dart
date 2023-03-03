import 'package:dartz/dartz.dart';
import 'package:qoutes/barell_file.dart';

class GetSavedLangUseCase implements UseCase<String , NoParams>{
    final LangRepo langRepo;

  GetSavedLangUseCase({required this.langRepo});

  @override
  Future<Either<Failure, String>> call(NoParams params) async =>
  await langRepo.getSavedLang();

}