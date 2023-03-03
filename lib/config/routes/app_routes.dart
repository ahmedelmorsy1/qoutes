import 'package:qoutes/barell_file.dart';
import 'package:qoutes/injection_container.dart' as di;

class Routes{
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';
}

class AppRoutes{
  static Route? onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.initialRoute:
      return MaterialPageRoute(builder: (context)=>const SplashScreen(),);
      case Routes.randomQuoteRoute:
      return MaterialPageRoute(builder: (context)=>BlocProvider(
        create: ((context) =>di.sl<RandomQuoteCubit>()),
        child: const QuotePage(),));
      // case Routes.favQuoteRoute:
      // return MaterialPageRoute(builder: (context)=>const FavQuoteScreen());
      default:
      return undefinedRoute();
    }
  }
  static Route<dynamic> undefinedRoute(){
    return MaterialPageRoute(builder: (context)=>const Scaffold(
      body:Center(child: Text(AppStrings.noRoute),)
    ));
  }
}