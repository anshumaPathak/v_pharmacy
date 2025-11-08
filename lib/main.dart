import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_pharmashing/res/sizing_const.dart';
import 'package:v_pharmashing/utils/routes/routes.dart';
import 'package:v_pharmashing/view_model/admin_contact_view_model.dart';
import 'package:v_pharmashing/view_model/auth_view_model/create_order_view_model.dart';
import 'package:v_pharmashing/view_model/auth_view_model/login_view_model.dart';
import 'package:v_pharmashing/view_model/auth_view_model/register_view_model.dart';
import 'package:v_pharmashing/view_model/auth_view_model/send_otp_view_model.dart';
import 'package:v_pharmashing/view_model/auth_view_model/verify_otp_view_model.dart';
import 'package:v_pharmashing/view_model/blog_view_model.dart';
import 'package:v_pharmashing/view_model/confirm_order_view_model.dart';
import 'package:v_pharmashing/view_model/contact_us_view_model.dart';
import 'package:v_pharmashing/view_model/diases_category_view_model.dart';
import 'package:v_pharmashing/view_model/language_view_model.dart';
import 'package:v_pharmashing/view_model/order_history_view_model.dart';
import 'package:v_pharmashing/view_model/pharmacist_rating_view_model.dart';
import 'package:v_pharmashing/view_model/privacy_policy_view_model.dart';
import 'package:v_pharmashing/view_model/profile_view_model.dart';
import 'package:v_pharmashing/view_model/rating_view_model.dart';
import 'package:v_pharmashing/view_model/seo_rank_view_model.dart';
import 'package:v_pharmashing/view_model/user_view_model.dart';

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
        ChangeNotifierProvider(create: (_) => LoginViewModel(),),
        ChangeNotifierProvider(create: (_) => SendOtpViewModel(),),
        ChangeNotifierProvider(create: (_) => VerifyOtpViewModel(),),
        ChangeNotifierProvider(create: (_) => UserViewModel(),),
        ChangeNotifierProvider(create: (_) => RegisterViewModel(),),
        ChangeNotifierProvider(create: (_) => CreateOrderViewModel(),),
        ChangeNotifierProvider(create: (_) => ProfileViewModel(),),
        ChangeNotifierProvider(create: (_) => OrderHistoryViewModel(),),
        ChangeNotifierProvider(create: (_) => ConfirmOrderViewModel(),),
        ChangeNotifierProvider(create: (_) => ContactUsViewModel(),),
        ChangeNotifierProvider(create: (_) => PrivacyPolicyViewModel(),),
        ChangeNotifierProvider(create: (_) => RatingViewModel(),),
        ChangeNotifierProvider(create: (_) => PharmacistRatingViewModel(),),
        ChangeNotifierProvider(create: (_) => DisasesCategoryViewModel(),),
        ChangeNotifierProvider(create: (_) => AdminContactViewModel(),),
        ChangeNotifierProvider(create: (_) => BlogViewModel(),),
        ChangeNotifierProvider(create: (_) => SeoRankViewModel(),),
      ],
      child: Consumer<LanguageViewModel>(
        builder: (context, languageVM, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'V Pharmacy',
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
