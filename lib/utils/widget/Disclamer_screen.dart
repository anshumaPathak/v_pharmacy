// // // import 'package:flutter/material.dart';
// // // import 'package:v_pharmashing/res/const_color.dart';
// // //
// // // import '../../l10n/app_localizations.dart';
// // //
// // // class DisclaimerScreen extends StatefulWidget {
// // //   const DisclaimerScreen({super.key});
// // //
// // //   @override
// // //   State<DisclaimerScreen> createState() => _DisclaimerScreenState();
// // // }
// // //
// // // class _DisclaimerScreenState extends State<DisclaimerScreen> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: AppColor.whiteColor,
// // //       appBar: AppBar(
// // //         backgroundColor: AppColor.whiteColor,
// // //         title: Text(
// // //           AppLocalizations.of(context)!.disclaimerTitle,
// // //           style: const TextStyle(fontWeight: FontWeight.bold),
// // //         ),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16),
// // //         child: SingleChildScrollView(
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               Text(
// // //                 AppLocalizations.of(context)!.disclaimerIntro,
// // //                 style: const TextStyle(fontSize: 16, height: 1.6),
// // //               ),
// // //               const SizedBox(height: 12),
// // //               Text(
// // //                 AppLocalizations.of(context)!.medicalInfoHeading,
// // //                 style: const TextStyle(
// // //                     fontSize: 17, fontWeight: FontWeight.bold),
// // //               ),
// // //               const SizedBox(height: 8),
// // //               Text(
// // //                 AppLocalizations.of(context)!.medicalInfoContent,
// // //                 style: const TextStyle(fontSize: 16, height: 1.6),
// // //               ),
// // //               const SizedBox(height: 12),
// // //               Text(
// // //                 AppLocalizations.of(context)!.accuracyHeading,
// // //                 style: const TextStyle(
// // //                     fontSize: 17, fontWeight: FontWeight.bold),
// // //               ),
// // //               const SizedBox(height: 8),
// // //               Text(
// // //                 AppLocalizations.of(context)!.accuracyContent,
// // //                 style: const TextStyle(fontSize: 16, height: 1.6),
// // //               ),
// // //               const SizedBox(height: 12),
// // //               Text(
// // //                 AppLocalizations.of(context)!.externalLinksHeading,
// // //                 style: const TextStyle(
// // //                     fontSize: 17, fontWeight: FontWeight.bold),
// // //               ),
// // //               const SizedBox(height: 8),
// // //               Text(
// // //                 AppLocalizations.of(context)!.externalLinksContent,
// // //                 style: const TextStyle(fontSize: 16, height: 1.6),
// // //               ),
// // //               const SizedBox(height: 12),
// // //               Text(
// // //                 AppLocalizations.of(context)!.liabilityHeading,
// // //                 style: const TextStyle(
// // //                     fontSize: 17, fontWeight: FontWeight.bold),
// // //               ),
// // //               const SizedBox(height: 8),
// // //               Text(
// // //                 AppLocalizations.of(context)!.liabilityContent,
// // //                 style: const TextStyle(fontSize: 16, height: 1.6),
// // //               ),
// // //               const SizedBox(height: 12),
// // //               Text(
// // //                 AppLocalizations.of(context)!.endUserHeading,
// // //                 style: const TextStyle(
// // //                     fontSize: 17, fontWeight: FontWeight.bold),
// // //               ),
// // //               const SizedBox(height: 8),
// // //               Text(
// // //                 AppLocalizations.of(context)!.endUserContent,
// // //                 style: const TextStyle(fontSize: 16, height: 1.6),
// // //               ),
// // //               const SizedBox(height: 16),
// // //               Text(
// // //                 AppLocalizations.of(context)!.contactHeading,
// // //                 style: const TextStyle(
// // //                     fontSize: 17, fontWeight: FontWeight.bold),
// // //               ),
// // //               const SizedBox(height: 8),
// // //               Text(
// // //                 AppLocalizations.of(context)!.contactContent,
// // //                 style: const TextStyle(fontSize: 16, height: 1.6),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:v_pharmashing/res/const_color.dart';
// // import '../../l10n/app_localizations.dart';
// // import '../../res/top_bar.dart';
// // import '../../view/dashboard_screen.dart';
// //
// // class DisclaimerScreen extends StatefulWidget {
// //   const DisclaimerScreen({super.key});
// //
// //   @override
// //   State<DisclaimerScreen> createState() => _DisclaimerScreenState();
// // }
// //
// // class _DisclaimerScreenState extends State<DisclaimerScreen> {
// //   int selectedIndex = 0;
// //   String activeSection = "home";
// //   @override
// //   Widget build(BuildContext context) {
// //     final lang = AppLocalizations.of(context)!;
// //
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       // appBar: AppBar(
// //       //   backgroundColor: AppColor.whiteColor,
// //       //   elevation: 0.5,
// //       //   title: Text(
// //       //     lang.disclaimerTitle,
// //       //     style: const TextStyle(
// //       //       fontWeight: FontWeight.bold,
// //       //       color: Colors.black87,
// //       //     ),
// //       //   ),
// //       // ),
// //       body: Column(
// //         children: [
// //           TopBar(
// //             selectedIndex: selectedIndex,
// //             onHomeTap: () {
// //               Navigator.pushReplacement(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => const DashboardScreen(initialSection: "home"),
// //                 ),
// //               );
// //             },
// //             onServicesTap: () {
// //               Navigator.pushReplacement(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => const DashboardScreen(initialSection: "services"),
// //                 ),
// //               );
// //             },
// //             onAboutTap: () {
// //               Navigator.pushReplacement(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => const DashboardScreen(initialSection: "about"),
// //                 ),
// //               );
// //             },
// //             onContactTap: () {
// //               Navigator.pushReplacement(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => const DashboardScreen(initialSection: "contact"),
// //                 ),
// //               );
// //             },
// //           ),
// //           Expanded(
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 children: [
// //
// //                   Padding(
// //                     padding: const EdgeInsets.all(16),
// //                     child: Container(
// //                       width: double.infinity,
// //                       padding: const EdgeInsets.all(20),
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         borderRadius: BorderRadius.circular(12),
// //                         boxShadow: [
// //                           BoxShadow(
// //                             color: Colors.grey.shade300.withOpacity(0.6),
// //                             blurRadius: 10,
// //                             spreadRadius: 2,
// //                             offset: const Offset(0, 4),
// //                           ),
// //                           BoxShadow(
// //                             color: Colors.white.withOpacity(0.9),
// //                             blurRadius: 4,
// //                             offset: const Offset(-2, -2),
// //                           ),
// //                         ],
// //                       ),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             lang.disclaimerIntro,
// //                             style: const TextStyle(
// //                               fontSize: 15,
// //                               height: 1.6,
// //                               color: Colors.black54,
// //                             ),
// //                           ),
// //                           const SizedBox(height: 20),
// //
// //                           buildSection(lang.medicalInfoHeading, lang.medicalInfoContent),
// //                           buildSection(lang.accuracyHeading, lang.accuracyContent),
// //                           buildSection(lang.externalLinksHeading, lang.externalLinksContent),
// //                           buildSection(lang.liabilityHeading, lang.liabilityContent),
// //                           buildSection(lang.endUserHeading, lang.endUserContent),
// //                           buildSection(lang.contactHeading, lang.contactContent),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget buildSection(String title, String content) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 16),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             title,
// //             style: const TextStyle(
// //               fontWeight: FontWeight.w600,
// //               fontSize: 16,
// //               color: Colors.black87,
// //             ),
// //           ),
// //           const SizedBox(height: 6),
// //           Text(
// //             content,
// //             style: const TextStyle(
// //               fontSize: 14.5,
// //               color: Colors.black54,
// //               height: 1.5,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:v_pharmashing/res/const_color.dart';
// import '../../l10n/app_localizations.dart';
// import '../../res/top_bar.dart';
// import '../../view/dashboard_screen.dart';
//
// class DisclaimerScreen extends StatefulWidget {
//   const DisclaimerScreen({super.key});
//
//   @override
//   State<DisclaimerScreen> createState() => _DisclaimerScreenState();
// }
//
// class _DisclaimerScreenState extends State<DisclaimerScreen> {
//   int selectedIndex = 0;
//   String activeSection = "home";
//
//   @override
//   Widget build(BuildContext context) {
//     final lang = AppLocalizations.of(context)!;
//
//     // 🧾 HTML content for Disclaimer (localized)
//     final String htmlContent = """
// <h2>${lang.disclaimerTitle}</h2>
// <p>${lang.disclaimerIntro}</p>
//
// <h3>${lang.medicalInfoHeading}</h3>
// <p>${lang.medicalInfoContent.replaceAll("\\n", "<br>")}</p>
//
// <h3>${lang.accuracyHeading}</h3>
// <p>${lang.accuracyContent.replaceAll("\\n", "<br>")}</p>
//
// <h3>${lang.externalLinksHeading}</h3>
// <p>${lang.externalLinksContent.replaceAll("\\n", "<br>")}</p>
//
// <h3>${lang.liabilityHeading}</h3>
// <p>${lang.liabilityContent.replaceAll("\\n", "<br>")}</p>
//
// <h3>${lang.endUserHeading}</h3>
// <p>${lang.endUserContent.replaceAll("\\n", "<br>")}</p>
//
// <h3>${lang.contactHeading}</h3>
// <p>${lang.contactContent.replaceAll("\\n", "<br>")}</p>
// """;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           TopBar(
//             selectedIndex: selectedIndex,
//             onHomeTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                   const DashboardScreen(initialSection: "home"),
//                 ),
//               );
//             },
//             onServicesTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                   const DashboardScreen(initialSection: "services"),
//                 ),
//               );
//             },
//             onAboutTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                   const DashboardScreen(initialSection: "about"),
//                 ),
//               );
//             },
//             onContactTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                   const DashboardScreen(initialSection: "contact"),
//                 ),
//               );
//             },
//           ),
//
//           // ✅ Scrollable HTML viewer container
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.shade300.withOpacity(0.6),
//                       blurRadius: 10,
//                       spreadRadius: 2,
//                       offset: const Offset(0, 4),
//                     ),
//                     BoxShadow(
//                       color: Colors.white.withOpacity(0.9),
//                       blurRadius: 4,
//                       offset: const Offset(-2, -2),
//                     ),
//                   ],
//                 ),
//                 child: HtmlWidget(
//                   htmlContent,
//                   textStyle: const TextStyle(
//                     fontSize: 15,
//                     color: Colors.black87,
//                     height: 1.6,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:v_pharmashing/res/const_color.dart';
import 'package:v_pharmashing/res/footer_section.dart';
import '../../l10n/app_localizations.dart';
import '../../res/top_bar.dart';
import '../../view/dashboard_screen.dart';

class DisclaimerScreen extends StatefulWidget {
  const DisclaimerScreen({super.key});

  @override
  State<DisclaimerScreen> createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    final String htmlContent = """
<h2 style="margin-bottom:8px; font-size:18px;">${lang.disclaimerTitle}</h2>
<p style="margin-bottom:10px;">${lang.disclaimerIntro}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.medicalInfoHeading}</h3>
<p style="margin-bottom:8px;">${lang.medicalInfoContent.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.accuracyHeading}</h3>
<p style="margin-bottom:8px;">${lang.accuracyContent.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.externalLinksHeading}</h3>
<p style="margin-bottom:8px;">${lang.externalLinksContent.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.liabilityHeading}</h3>
<p style="margin-bottom:8px;">${lang.liabilityContent.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.endUserHeading}</h3>
<p style="margin-bottom:8px;">${lang.endUserContent.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.contactHeading}</h3>
<p style="margin-bottom:8px;">${lang.contactContent.replaceAll("\\n", "<br>")}</p>
""";

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TopBar(
            selectedIndex: selectedIndex,
            onHomeTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const DashboardScreen(initialSection: "home"),
                ),
              );
            },
            onServicesTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const DashboardScreen(initialSection: "services"),
                ),
              );
            },
            onAboutTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const DashboardScreen(initialSection: "about"),
                ),
              );
            },
            onContactTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const DashboardScreen(initialSection: "contact"),
                ),
              );
            },
            onBlogTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const DashboardScreen(initialSection: "blog"),
                ),
              );
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: HtmlWidget(
                            htmlContent,
                            textStyle: const TextStyle(
                              fontSize: 14.5,
                              color: Colors.black87,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FooterSection()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
