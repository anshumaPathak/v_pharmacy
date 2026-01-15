// // import 'package:flutter/material.dart';
// // import 'package:go_router/go_router.dart';
// // import 'package:v_pharmashing/utils/routes/routes_name.dart';
// // import 'package:v_pharmashing/utils/widget/privacy_policy_screen.dart';
// // import 'package:v_pharmashing/view/blog_screen.dart';
// // import 'package:v_pharmashing/view/contact_screen.dart';
// // import 'package:v_pharmashing/view/dashboard_screen.dart';
// // import '../../view/about_us_screen.dart';
// // import '../../view/services_screen.dart';
// //
// // class AppRouter {
// //   static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// //   static final GoRouter router = GoRouter(
// //     navigatorKey: navigatorKey,
// //
// //     initialLocation: RoutesName.dashboardScreen,
// //     routes: [
// //       GoRoute(
// //         path: RoutesName.dashboardScreen,
// //         name: RoutesName.dashboardScreen,
// //         builder: (context, state) =>  DashboardScreen(),
// //       ),
// //       GoRoute(
// //         path: RoutesName.aboutUsScreen,
// //         name: RoutesName.aboutUsScreen,
// //         builder: (context, state) =>  AboutUsScreen(),
// //       ),
// //       GoRoute(
// //         path: RoutesName.contactScreen,
// //         name: RoutesName.contactScreen,
// //         builder: (context, state) =>  ContactScreen(),
// //       ),
// //        GoRoute(
// //         path: RoutesName.servicesScreen,
// //         name: RoutesName.servicesScreen,
// //         builder: (context, state) =>  ServicesScreen(),
// //       ),
// //       GoRoute(
// //         path: RoutesName.privacyPolicy,
// //         name: RoutesName.privacyPolicy,
// //         builder: (context, state) =>  PrivacyPolicyScreen(),
// //       ),
// //       GoRoute(
// //         path: RoutesName.blogScreen,
// //         name: RoutesName.blogScreen,
// //         builder: (context, state) =>  BlogScreen(),
// //       ),
// //
// //
// //
// //     ],
// //   );
// // }
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:v_pharmashing/utils/widget/Disclamer_screen.dart';
// import 'package:v_pharmashing/utils/widget/terms_condition_screen.dart';
// import 'package:v_pharmashing/view/about_us_screen.dart';
// import 'package:v_pharmashing/view/blog_detail_screen.dart';
// import 'package:v_pharmashing/view/blog_screen.dart';
// import 'package:v_pharmashing/view/contact_screen.dart';
// import 'package:v_pharmashing/view/dashboard_screen.dart';
// import 'package:v_pharmashing/view/services_screen.dart';
// import 'package:v_pharmashing/utils/widget/privacy_policy_screen.dart';
// import 'package:v_pharmashing/utils/routes/routes_name.dart';
// class AppRouter {
//   static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//   static final GoRouter router = GoRouter(
//     navigatorKey: navigatorKey,
//     initialLocation: RoutesName.dashboardScreen,
//     routes: [
//       // Dashboard / Home
//       GoRoute(
//         path: RoutesName.dashboardScreen,
//         name: RoutesName.dashboardScreen,
//         builder: (context, state) => DashboardScreen(initialSection: "home"),
//       ),
//
//       // About Us
//       GoRoute(
//         path: RoutesName.aboutUsScreen,
//         name: RoutesName.aboutUsScreen,
//         builder: (context, state) => DashboardScreen(initialSection: "about"),
//       ),
//
//       // Contact
//       GoRoute(
//         path: RoutesName.contactScreen,
//         name: RoutesName.contactScreen,
//         builder: (context, state) => DashboardScreen(initialSection: "contact"),
//       ),
//
//       // Blog (Parent route)
//       GoRoute(
//         path: RoutesName.blogScreen, // '/blog'
//         name: RoutesName.blogScreen,
//         builder: (context, state) => DashboardScreen(initialSection: "blog"),
//         routes: [
//           // 👇 Nested route: /blog/blogDetail
//           GoRoute(
//             path: 'blogDetail',
//             name: 'blogDetail',
//             builder: (context, state) {
//               final data = state.extra as Map<String, dynamic>? ?? {};
//               return BlogDetailPage(
//                 title: data['title'] ?? '',
//                 image: data['image'] ?? '',
//                 description: data['description'] ?? '',
//               );
//             },
//           ),
//         ],
//       ),
//
//       // Services (with sub-sections)
//       GoRoute(
//         path: RoutesName.servicesScreen,
//         name: RoutesName.servicesScreen,
//         builder: (context, state) =>
//             DashboardScreen(initialSection: "services"),
//         routes: [
//           GoRoute(
//             path: 'track', // URL: /services/track
//             builder: (context, state) => DashboardScreen(
//               initialSection: "services",
//               initialSubSection: "track",
//             ),
//           ),
//           GoRoute(
//             path: 'verify', // URL: /services/verify
//             builder: (context, state) => DashboardScreen(
//               initialSection: "services",
//               initialSubSection: "verify",
//             ),
//           ),
//         ],
//       ),
//
//       // Privacy Policy
//       GoRoute(
//         path: RoutesName.privacyPolicy,
//         name: RoutesName.privacyPolicy,
//         builder: (context, state) => PrivacyPolicyScreen(),
//       ),
//       GoRoute(
//         path: RoutesName.termsCondition,
//         name: RoutesName.termsCondition,
//         builder: (context, state) => TermsConditionScreen(),
//       ),
//       GoRoute(
//         path: RoutesName.disclaimer,
//         name: RoutesName.disclaimer,
//         builder: (context, state) => DisclaimerScreen(),
//       ),
//     ],
//   );
// }
//
// // class AppRouter {
// //   static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// //
// //   static final GoRouter router = GoRouter(
// //     navigatorKey: navigatorKey,
// //     initialLocation: RoutesName.dashboardScreen,
// //     routes: [
// //       // Dashboard / Home
// //       GoRoute(
// //         path: RoutesName.dashboardScreen,
// //         name: RoutesName.dashboardScreen,
// //         builder: (context, state) => DashboardScreen(initialSection: "home"),
// //       ),
// //
// //       // About Us
// //       GoRoute(
// //         path: RoutesName.aboutUsScreen,
// //         name: RoutesName.aboutUsScreen,
// //         builder: (context, state) => DashboardScreen(initialSection: "about"),
// //       ),
// //
// //       // Contact
// //       GoRoute(
// //         path: RoutesName.contactScreen,
// //         name: RoutesName.contactScreen,
// //         builder: (context, state) => DashboardScreen(initialSection: "contact"),
// //       ),
// //
// //       // Blog
// //       GoRoute(
// //         path: RoutesName.blogScreen,
// //         name: RoutesName.blogScreen,
// //         builder: (context, state) => DashboardScreen(initialSection: "blog"),
// //       ),
// //
// //       // Services (with sub-sections)
// //       GoRoute(
// //         path: RoutesName.servicesScreen,
// //         name: RoutesName.servicesScreen,
// //         builder: (context, state) => DashboardScreen(initialSection: "services"),
// //         routes: [
// //           GoRoute(
// //             path: 'track', // URL: /services/track
// //             builder: (context, state) =>
// //                 DashboardScreen(initialSection: "services", initialSubSection: "track"),
// //           ),
// //           GoRoute(
// //             path: 'verify', // URL: /services/verify
// //             builder: (context, state) =>
// //                 DashboardScreen(initialSection: "services", initialSubSection: "verify"),
// //           ),
// //         ],
// //       ),
// //
// //       // Privacy Policy
// //       GoRoute(
// //         path: RoutesName.privacyPolicy,
// //         name: RoutesName.privacyPolicy,
// //         builder: (context, state) => PrivacyPolicyScreen(),
// //       ),
// //       GoRoute(
// //         path: '/blogDetail',
// //         name: 'blogDetail',
// //         builder: (context, state) {
// //           final title = state.extra != null ? (state.extra as Map)['title'] as String : '';
// //           final image = state.extra != null ? (state.extra as Map)['image'] as String : '';
// //           final description = state.extra != null ? (state.extra as Map)['description'] as String : '';
// //           return BlogDetailPage(
// //             title: title,
// //             image: image,
// //             description: description,
// //           );
// //         },
// //       ),
// //
// //     ],
// //   );
// // }
//
// class RoutesName {
//   static const dashboardScreen = '/home';
//   static const aboutUsScreen = '/about';
//   static const contactScreen = '/contact';
//   static const servicesScreen = '/services';
//   static const privacyPolicy = '/privacyPolicy';
//   static const blogScreen = '/blog';
//   static const termsCondition = '/termsCondition';
//   static const disclaimer = '/disclaimer';
// }
//
// // class RoutesName {
// //   static const dashboardScreen = '/';
// //   static const aboutUsScreen = '/aboutUsScreen';
// //   static const contactScreen = '/contactScreen';
// //   static const servicesScreen = '/servicesScreen';
// //   static const privacyPolicy = '/privacyPolicy';
// //   static const blogScreen = '/blogScreen';
// // }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../view/blog_detail_screen.dart';
import '../../view/dashboard_screen.dart';
import '../widget/Disclamer_screen.dart';
import '../widget/privacy_policy_screen.dart';
import '../widget/terms_condition_screen.dart';
// class AppRouter {
//   static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//   static final GoRouter router = GoRouter(
//     navigatorKey: navigatorKey,
//     initialLocation: RoutesName.dashboardScreen,
//     routes: [
//       // 🏠 Dashboard / Home
//       GoRoute(
//         path: RoutesName.dashboardScreen,
//         name: RoutesName.dashboardScreen,
//         builder: (context, state) => DashboardScreen(initialSection: "home"),
//       ),
//
//       // ℹ️ About Us
//       GoRoute(
//         path: RoutesName.aboutUsScreen,
//         name: RoutesName.aboutUsScreen,
//         builder: (context, state) => DashboardScreen(initialSection: "about"),
//       ),
//
//       // ☎️ Contact
//       GoRoute(
//         path: RoutesName.contactScreen,
//         name: RoutesName.contactScreen,
//         builder: (context, state) => DashboardScreen(initialSection: "contact"),
//       ),
//
//       // 📰 Blog with nested detail route
//       GoRoute(
//         path: RoutesName.blogScreen, // '/blog'
//         name: RoutesName.blogScreen,
//         builder: (context, state) => DashboardScreen(initialSection: "blog"),
//         routes: [
//           // 👇 Nested route with slug: /blog/blogDetail/:slug
//           GoRoute(
//             path: 'blogDetail/:slug',
//             name: 'blogDetail',
//             builder: (context, state) {
//               final data = state.extra as Map<String, dynamic>? ?? {};
//               final slug = state.pathParameters['slug'] ?? '';
//               return BlogDetailPage(
//                 title: data['title'] ?? '',
//                 image: data['image'] ?? '',
//                 description: data['description'] ?? '',
//                 slug: slug,
//               );
//             },
//           ),
//         ],
//       ),
//
//       // 🧰 Services (with sub-sections)
//       GoRoute(
//         path: RoutesName.servicesScreen, // '/services'
//         name: RoutesName.servicesScreen,
//         builder: (context, state) => DashboardScreen(initialSection: "services"),
//         routes: [
//           GoRoute(
//             path: 'track', // '/services/track'
//             builder: (context, state) => DashboardScreen(
//               initialSection: "services",
//               initialSubSection: "track",
//             ),
//           ),
//           GoRoute(
//             path: 'verify', // '/services/verify'
//             builder: (context, state) => DashboardScreen(
//               initialSection: "services",
//               initialSubSection: "verify",
//             ),
//           ),
//         ],
//       ),
//
//       // 📜 Privacy Policy
//       GoRoute(
//         path: RoutesName.privacyPolicy,
//         name: RoutesName.privacyPolicy,
//         builder: (context, state) => PrivacyPolicyScreen(),
//       ),
//
//       // 📄 Terms & Conditions
//       GoRoute(
//         path: RoutesName.termsCondition,
//         name: RoutesName.termsCondition,
//         builder: (context, state) => TermsConditionScreen(),
//       ),
//
//       // ⚠️ Disclaimer
//       GoRoute(
//         path: RoutesName.disclaimer,
//         name: RoutesName.disclaimer,
//         builder: (context, state) => DisclaimerScreen(),
//       ),
//     ],
//   );
// }
class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: RoutesName.dashboardScreen,
    routes: [
      // 🏠 Dashboard
      GoRoute(
        path: RoutesName.dashboardScreen,
        name: RoutesName.dashboardScreen,
        builder: (context, state) => DashboardScreen(initialSection: "home"),
      ),

      // ℹ️ About Us
      GoRoute(
        path: RoutesName.aboutUsScreen,
        name: RoutesName.aboutUsScreen,
        builder: (context, state) => DashboardScreen(initialSection: "about"),
      ),

      // ☎️ Contact
      GoRoute(
        path: RoutesName.contactScreen,
        name: RoutesName.contactScreen,
        builder: (context, state) => DashboardScreen(initialSection: "contact"),
      ),

      // 📰 Blog and Detail Page
      // GoRoute(
      //   path: RoutesName.blogScreen, // '/blog'
      //   name: RoutesName.blogScreen,
      //   builder: (context, state) => DashboardScreen(initialSection: "blog"),
      //   routes: [
      //     // 👇 Nested route with dynamic slug: /blog/:slug
      //     GoRoute(
      //       path: ':slug',
      //       name: 'blogDetail',
      //       builder: (context, state) {
      //         final slug = state.pathParameters['slug'] ?? '';
      //         final data = state.extra as Map<String, dynamic>? ?? {};
      //         return BlogDetailPage(
      //           slug: slug,
      //           title: data['title'] ?? '',
      //           image: data['image'] ?? '',
      //           description: data['description'] ?? '',
      //         );
      //       },
      //     ),
      //   ],
      // ),
      GoRoute(
        path: RoutesName.blogScreen,
        name: RoutesName.blogScreen,
        builder: (context, state) => DashboardScreen(initialSection: "blog"),
      ),

      GoRoute(
        path: '/blog/:slug',
        name: 'blogDetail',
        builder: (context, state) {
          print("kffffjk");
          final slug = state.pathParameters['slug'] ?? '';
          print("slug: $slug");
          final data = state.extra as Map<String, dynamic>? ?? {};
          return BlogDetailPage(
            slug: slug,
            title: data['title'] ?? '',
            image: data['image'] ?? '',
            description: data['description'] ?? '',
          );
        },
      ),

      // 🧰 Services Section
      GoRoute(
        path: RoutesName.servicesScreen,
        name: RoutesName.servicesScreen,
        builder: (context, state) => DashboardScreen(initialSection: "services"),
        routes: [
          GoRoute(
            path: 'track',
            builder: (context, state) => DashboardScreen(
              initialSection: "services",
              initialSubSection: "track",
            ),
          ),
          GoRoute(
            path: 'verify',
            builder: (context, state) => DashboardScreen(
              initialSection: "services",
              initialSubSection: "verify",
            ),
          ),
        ],
      ),

      // 📜 Privacy Policy
      GoRoute(
        path: RoutesName.privacyPolicy,
        name: RoutesName.privacyPolicy,
        builder: (context, state) => PrivacyPolicyScreen(),
      ),

      // 📄 Terms & Conditions
      GoRoute(
        path: RoutesName.termsCondition,
        name: RoutesName.termsCondition,
        builder: (context, state) => TermsConditionScreen(),
      ),

      // ⚠️ Disclaimer
      GoRoute(
        path: RoutesName.disclaimer,
        name: RoutesName.disclaimer,
        builder: (context, state) => DisclaimerScreen(),
      ),
    ],
  );
}

// class AppRouter {
//   static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//   static final GoRouter router = GoRouter(
//     navigatorKey: navigatorKey,
//     initialLocation: RoutesName.dashboardScreen,
//     routes: [
//       // 🏠 Dashboard / Home
//       GoRoute(
//         path: RoutesName.dashboardScreen,
//         name: RoutesName.dashboardScreen,
//         builder: (context, state) => DashboardScreen(initialSection: "home"),
//       ),
//
//       // ℹ️ About Us
//       GoRoute(
//         path: RoutesName.aboutUsScreen,
//         name: RoutesName.aboutUsScreen,
//         builder: (context, state) => DashboardScreen(initialSection: "about"),
//       ),
//
//       // ☎️ Contact
//       GoRoute(
//         path: RoutesName.contactScreen,
//         name: RoutesName.contactScreen,
//         builder: (context, state) => DashboardScreen(initialSection: "contact"),
//       ),
//
//       // 📰 Blog with nested detail route
//       GoRoute(
//         path: RoutesName.blogScreen, // '/blog'
//         name: RoutesName.blogScreen,
//         builder: (context, state) => DashboardScreen(initialSection: "blog"),
//         routes: [
//           // 👇 Nested route: /blog/blogDetail
//           GoRoute(
//             path: 'blogDetail',
//             name: 'blogDetail',
//             builder: (context, state) {
//               final data = state.extra as Map<String, dynamic>? ?? {};
//               return BlogDetailPage(
//                 title: data['title'] ?? '',
//                 image: data['image'] ?? '',
//                 description: data['description'] ?? '',
//               );
//             },
//           ),
//         ],
//       ),
//
//       // 🧰 Services (with sub-sections)
//       GoRoute(
//         path: RoutesName.servicesScreen, // '/services'
//         name: RoutesName.servicesScreen,
//         builder: (context, state) => DashboardScreen(initialSection: "services"),
//         routes: [
//           GoRoute(
//             path: 'track', // '/services/track'
//             builder: (context, state) => DashboardScreen(
//               initialSection: "services",
//               initialSubSection: "track",
//             ),
//           ),
//           GoRoute(
//             path: 'verify', // '/services/verify'
//             builder: (context, state) => DashboardScreen(
//               initialSection: "services",
//               initialSubSection: "verify",
//             ),
//           ),
//         ],
//       ),
//
//       // 📜 Privacy Policy
//       GoRoute(
//         path: RoutesName.privacyPolicy,
//         name: RoutesName.privacyPolicy,
//         builder: (context, state) => PrivacyPolicyScreen(),
//       ),
//
//       // 📄 Terms & Conditions
//       GoRoute(
//         path: RoutesName.termsCondition,
//         name: RoutesName.termsCondition,
//         builder: (context, state) => TermsConditionScreen(),
//       ),
//
//       // ⚠️ Disclaimer
//       GoRoute(
//         path: RoutesName.disclaimer,
//         name: RoutesName.disclaimer,
//         builder: (context, state) => DisclaimerScreen(),
//       ),
//     ],
//   );
// }

class RoutesName {
  static const dashboardScreen = '/';
  static const aboutUsScreen = '/about';
  static const contactScreen = '/contact';
  static const servicesScreen = '/services';
  static const privacyPolicy = '/privacyPolicy';
  static const blogScreen = '/blog';
  static const termsCondition = '/termsCondition';
  static const disclaimer = '/disclaimer';
}
