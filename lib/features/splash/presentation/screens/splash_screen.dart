import 'dart:async';
import 'package:qoutes/barell_file.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() =>Navigator.pushReplacementNamed(context,Routes.randomQuoteRoute);
  _startDelay(){
    _timer = Timer(const Duration(microseconds: 20),()=>_goNext);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Center(
      child: Image.asset(ImgAssets.img),
    ),
   ); 
  }
}