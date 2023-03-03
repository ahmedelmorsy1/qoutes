import 'barell_file.dart';
import 'package:qoutes/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  BlocOverrides.runZoned(
    () {
      runApp(const Quotes());
    },
    blocObserver: AppBlocObserver(),
  );
  runApp(const Quotes());
}
