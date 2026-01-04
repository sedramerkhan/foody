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

  // Initialize language and theme mode from storage
  await AppConfig().initLanguage();
  await AppConfig().initThemeMode();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // System UI overlay style will be set dynamically based on theme

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
      create: (_) {
        final cartViewModel = CartViewModel();
        // Initialize cart from storage asynchronously
        cartViewModel.init();
        return cartViewModel;
      },
      child: ListenableBuilder(
        listenable: AppConfig(),
        builder: (context, _) {
          final appConfig = AppConfig();
          final isDarkMode = appConfig.isDark(context);
          
          // Update system UI overlay style based on theme
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              systemNavigationBarColor: isDarkMode ? AppColors.bgSurface : Colors.white,
              systemNavigationBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
              statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
              statusBarColor: Colors.transparent,
            ),
          );
          
          return MaterialApp(
            key: ValueKey('${appConfig.currentLanguageCode}_${appConfig.themeModeString}'), // Force rebuild on language/theme change
            title: 'Foody',
            theme: defaultThemeData,
            darkTheme: darkThemeData,
            themeMode: appConfig.themeMode,
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            initialRoute: AppRouter.getInitialRoute(),
            onGenerateRoute: AppRouter.generateRoute,
            locale: appConfig.currentLocale,
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
