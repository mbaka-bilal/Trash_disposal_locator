import 'core/constants/constants.dart';
import 'core/enums/enums.dart';

class AppConfig {
  static late AppFlavours flavor;

  static final AppConfig instance = AppConfig._internal();

  AppConfig._internal();

  factory AppConfig.init({required AppFlavours selectedFlavor}) {
    flavor = selectedFlavor;
    return instance;
  }

  // static String get appName => flavor.when(
  //     production: () => AppStrings.appName,
  //     staging: () => AppStrings.appName,
  //     development: () => AppStrings.appName);

  // static String get packageName => flavor.when(
  //     production: () => AppConstants.packageName,
  //     staging: () => AppConstants.packageName,
  //     development: () => AppConstants.packageName);

  static String get url => flavor.when(
    production: () => AppConstants.productionBaseUrl,
    staging: () => AppConstants.stagingBaseUrl,
    development: () => AppConstants.devBaseUrl,
  );

  // static Future<void> initState() async {
  //   final seen = await SharedPrefsHelper()
  //           .getBool(AppConstants.kHasSeenOnboardingScreenKey) ??
  //       false;
  //   seenOnBoardingScreen.value = seen;

  //   final loggedIn =
  //       await SecureStorage().read(AppConstants.kUserTokenKey) != null;
  //   isLoggedIn.value = loggedIn;
  // }
}
