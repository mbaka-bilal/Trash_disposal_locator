import '../constants/strings.dart';
import 'exceptions.dart';

class AppExceptionHandler {
  static String handleException(Object e, {StackTrace? stackTrace}) {
    if (e is ApiException) {
      return e.message;
    }

    return AppStrings.somethingWentWrong;
  }
}
