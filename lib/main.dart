import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_pharmashing/res/sizing_const.dart';
import 'package:v_pharmashing/utils/routes/routes.dart';
import 'package:v_pharmashing/view_model/language_view_model.dart';

import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set Path URL strategy for Flutter Web
  setUrlStrategy(PathUrlStrategy());

  final sp = await SharedPreferences.getInstance();
  final String languageCode = sp.getString('language_code') ?? "en";

  runApp(MyApp(initialLanguageCode: languageCode));
}

class MyApp extends StatelessWidget {
  final String initialLanguageCode;

  const MyApp({super.key, required this.initialLanguageCode});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LanguageViewModel(initialLanguageCode),
        ),
      ],
      child: Consumer<LanguageViewModel>(
        builder: (context, languageVM, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'V PharmaShing',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerConfig: AppRouter.router,
            locale: Locale(languageVM.languageCode),
            supportedLocales: const [
              Locale('en'),
              Locale('hi'),
            ],
            localizationsDelegates:  [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) {
              Sizes.init(context);
              return child!;
            },
          );
        },
      ),
    );
  }
}
