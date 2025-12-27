
import 'package:flutter/material.dart';
import 'package:foody/shared/widgets/buttons/buttons.dart';
import 'package:foody/shared/widgets/text/app_text.dart';

ValueNotifier<bool> isSessionExpired = ValueNotifier(false);

class SessionExpireUtils {

  static void showAlertDialog(BuildContext context,VoidCallback onPressed) {
    isSessionExpired.value = false;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          title: const Text('Session Expired'),
          content: const Text('Please sign in again to continue.'),
          actions: [
            PrimaryButton(
              onPressed: () {
                onPressed();
              },
              child: const AppText('Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  //# Check if need to login again depends on status code from error
  static Future<bool> handleByCode(String code) async {
    if (checkSessionExpired(code)) {
      print('handleNeedLoginAgain');
      isSessionExpired.value = true;
      return true;
    }
    return false;
  }

  //todo: set codes
  static bool checkSessionExpired(String code) => code == "ACCESS_TOKEN_NOT_EXIST";
}
