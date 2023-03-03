import 'package:dartz/dartz.dart';
import 'package:qoutes/barell_file.dart';

class ChangeLangUseCase implements UseCase<bool ,String >{
  final LangRepo langRepo;

  ChangeLangUseCase({required this.langRepo});
  @override
  Future<Either<Failure, bool>> call(String langCode) async =>
  await langRepo.changeLang(langCode: langCode);
}