import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app.dart';
import 'app_config.dart';
import 'core/enums/enums.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.init(selectedFlavor: AppFlavours.development);
  setUrlStrategy(PathUrlStrategy());

  runApp(const MyApp());
}
