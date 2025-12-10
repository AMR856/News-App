import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/config/shared_pref_manager.dart';
import 'package:news_app/config/theme_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/di/di.dart';
import 'package:news_app/core/route_manager/route_manager.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:news_app/providers/language_provider.dart';
import 'package:news_app/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  configureDependencies();
  await SharedPrefManager.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        final langProvider = Provider.of<LanguageProvider>(context);
        return MaterialApp(
          supportedLocales: const [Locale('en'), Locale('ar')],

          locale: langProvider.currentLang,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          title: 'News App',
          theme: ThemeManager.lightTheme,
          darkTheme: ThemeManager.darkTheme,
          themeMode: themeProvider.currentTheme,
          routes: RouteManager.routes,
          initialRoute: RouteManager.splashScreen,
        );
      },
    );
  }
}

