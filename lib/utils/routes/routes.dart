import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:v_pharmashing/utils/routes/routes_name.dart';
import 'package:v_pharmashing/view/contact_screen.dart';
import 'package:v_pharmashing/view/dashboard_screen.dart';

import '../../view/about_us_screen.dart';
import '../../view/services_screen.dart';


class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,

    initialLocation: RoutesName.dashboardScreen,
    routes: [
      // GoRoute(
      //   path: RoutesName.splash,
      //   name: RoutesName.splash,
      //   builder: (context, state) => const SplashScreen(),
      // ),
      GoRoute(
        path: RoutesName.dashboardScreen,
        name: RoutesName.dashboardScreen,
        builder: (context, state) =>  DashboardScreen(),
      ),
      GoRoute(
        path: RoutesName.aboutUsScreen,
        name: RoutesName.aboutUsScreen,
        builder: (context, state) =>  AboutUsScreen(),
      ),
      GoRoute(
        path: RoutesName.contactScreen,
        name: RoutesName.contactScreen,
        builder: (context, state) =>  ContactScreen(),
      ),
       GoRoute(
        path: RoutesName.servicesScreen,
        name: RoutesName.servicesScreen,
        builder: (context, state) =>  ServicesScreen(),
      ),



    ],
  );
}
