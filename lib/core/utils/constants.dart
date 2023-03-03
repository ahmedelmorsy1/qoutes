import 'package:flutter/cupertino.dart';
import 'package:qoutes/barell_file.dart';

class Constants {
  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(msg,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context),
                     style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      )
                     ),
                     child: const Text('OK'))
                  ],
            ));
  }

  // static void showToast({ required String msg,
  //  Color? color , ToastGravity? gravity}){
  //   Fluttertoast.showToast(
  //     toastLength: Toast.LENGTH_LONG,
  //     msg: msg,
  //     backgroundColor: color?? AppColors.primary,
  //     gravity: gravity ?? ToastGravity.BOTTOM,
  //     );
  // }
}
