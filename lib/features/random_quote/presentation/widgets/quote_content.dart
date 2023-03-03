import '../../../../barell_file.dart';

class QuoteContent extends StatelessWidget {
  final Quote quote;
  const QuoteContent({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child:  Text(
          '${quote.content} \n  ${quote.author}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ));
  }
}
