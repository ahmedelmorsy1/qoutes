import 'package:dartz/dartz.dart';
import 'package:qoutes/barell_file.dart';

abstract class LangRepo{
  Future<Either<Failure,bool>> changeLang({required String langCode});
  Future<Either<Failure,String>> getSavedLang();
}