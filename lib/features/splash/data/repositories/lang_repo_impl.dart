import 'package:dartz/dartz.dart';
import 'package:qoutes/barell_file.dart';
import 'package:qoutes/features/splash/data/datasources/lang_local_ds.dart';

class LangRepoImpl implements LangRepo{
  final LangLocalDS langLocalDS;

  LangRepoImpl({required this.langLocalDS});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async{
   try {
      final langIsChanged =
          await langLocalDS.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await langLocalDS.getSavedLang();
      return Right(langCode!);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
  
}