import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/view/app.dart';
import 'core/di/locator.dart';
import 'core/routing/app_router.dart';
import 'firebase_options.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(const App());
}
