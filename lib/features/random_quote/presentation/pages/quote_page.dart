import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qoutes/barell_file.dart';
import 'package:qoutes/core/widgets/error_widget.dart' as err;

class QuotePage extends StatefulWidget {
  const QuotePage({Key? key}) : super(key: key);

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  // @override
  // void initState() {
  //   _getRandomQuote();
  //   super.initState();
  // }
  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
        builder: ((context, state) {
      if (state is RandomQuoteIsLoading) {
        return Center(
          child: SpinKitFadingCircle(
            color: AppColors.primary,
          ),
        );
      } else if (state is RandomQuoteError) {
        return err.ErrorWidget(
          onPress: () => _getRandomQuote(),
        );
      } else if (state is RandomQuoteLoaded) {
        return Column(children: [
          QuoteContent(
            quote: state.quote,
          ),
          InkWell(
            onTap: () => _getRandomQuote(),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: const Icon(
                Icons.refresh,
                size: 28,
                color: Colors.white,
              ),
            ),
          )
        ]);
      }
      //TODO:boilerplate code
      else {
        return Center(
          child: SpinKitFadingCircle(
            color: AppColors.primary,
          ),
        );
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: IconButton(
        icon: const Icon(Icons.translate_outlined),
        color: AppColors.primary,
        onPressed: (){
          if(AppLocalizations.of(context)!.isEnLocale){
            BlocProvider.of<LocaleCubit>(context).toArabic();
          }else{
            BlocProvider.of<LocaleCubit>(context).toEnglish();
          }
        },
      ),
      title: Text(AppLocalizations.of(context)!.translate('app_name')!),
    );
    return RefreshIndicator(
      child: Scaffold(
        appBar: appBar,
        body: _buildBodyContent(),
      ),
      onRefresh: () => _getRandomQuote(),
    );
  }
}
