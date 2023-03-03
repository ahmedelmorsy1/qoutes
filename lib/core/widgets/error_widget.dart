import '../../barell_file.dart';

class ErrorWidget extends StatelessWidget {
  final VoidCallback? onPress;
  const ErrorWidget({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.warning_amber_rounded,
          color: AppColors.primary,
          size: 150,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child:  Text(AppLocalizations.of(context)!.translate('something_went_wrong')!,
              style: const TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,fontSize: 20)),
        ),
        Text(
          AppLocalizations.of(context)!.translate('try_again')!,
          style: TextStyle(
            color: AppColors.hint,
            fontSize: 18,fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          height: 55,
          width: context.width * 0.55,
          child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColors.primary,
            onPrimary: Theme.of(context).primaryColor,
            elevation: 500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )
          ),
          child: Text(AppLocalizations.of(context)!.translate('reload_screen')! ,
           style: const TextStyle(
            color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold,
          ),),
          onPressed: (){
            if(onPress !=null){
              onPress!();
            }
          },),
        )
      ],
    );
  }
}
