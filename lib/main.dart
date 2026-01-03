import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foody/common_imports.dart';
import 'package:foody/core/config/config.dart';
import 'package:foody/core/data/local/hive/hive_init.dart';
import 'package:foody/core/di/di.dart';
import 'package:foody/core/routing/app_router.dart';
import 'package:foody/core/routing/navigator_key.dart';
import 'package:foody/presentation/cart/cart_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foody/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and register adapters
  await initAndRegisterHiveAdapters();

  // Initialize language from storage
  await AppConfig().initLanguage();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );

  // Orientation: Portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Use Custom Error Widget for Unhandled Exception to be nice screen not a Red screen
  ErrorWidget.builder = (FlutterErrorDetails details) =>
      Center(child: Text(details.toString()));


  registerSingleton();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartViewModel(),
      child: ListenableBuilder(
        listenable: AppConfig(),
        builder: (context, _) {
          return MaterialApp(
            key: ValueKey(AppConfig().currentLanguageCode), // Force rebuild on language change
            title: 'Foody',
            theme: defaultThemeData,
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            initialRoute: AppRouter.getInitialRoute(),
            onGenerateRoute: AppRouter.generateRoute,
            locale: AppConfig().currentLocale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}
