import 'package:qoutes/barell_file.dart';

abstract class LangLocalDS {
  Future<bool> changeLang({required String langCode});
  Future<String?> getSavedLang();
}

class LangLocalDSImpl implements LangLocalDS {
  final SharedPreferences sharedPreferences;

  LangLocalDSImpl({required this.sharedPreferences});
  @override
  Future<bool> changeLang({required String langCode}) async =>
      await sharedPreferences.setString(AppStrings.locale, langCode);

  @override
  Future<String?> getSavedLang() async =>
      sharedPreferences.containsKey(AppStrings.locale)
          ? sharedPreferences.getString(AppStrings.locale)
          : AppStrings.englishCode;
}
