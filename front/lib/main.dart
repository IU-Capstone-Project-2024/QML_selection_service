import 'package:flutter/material.dart';
import 'app/view/app.dart';
import 'core/di/locator.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  configureDependencies();
  runApp(const App());
}
