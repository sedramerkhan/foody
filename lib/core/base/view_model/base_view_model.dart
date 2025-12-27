import 'package:flutter/foundation.dart';
import 'package:foody/shared/utils/session_expired_util.dart';

class BaseViewModel extends ChangeNotifier {


  //# Check if need to login again depends on status code from error
  Future<void> handleNeedLoginAgain(String code) async {
    SessionExpireUtils.handleByCode(code);
  }

}
