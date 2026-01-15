// // import 'package:flutter/material.dart';
// // import '../../l10n/app_localizations.dart';
// // import '../../res/top_bar.dart';
// // import '../../view/dashboard_screen.dart';
// // class PrivacyPolicyScreen extends StatefulWidget {
// //   const PrivacyPolicyScreen({super.key});
// //
// //   @override
// //   State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
// // }
// //
// // class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
// //   int selectedIndex = 0;
// //   String activeSection = "home";
// //
// //   void _changeSection(String section) {
// //     setState(() {
// //       activeSection = section;
// //       if (section == "home") selectedIndex = 0;
// //       if (section == "services") selectedIndex = 1;
// //       if (section == "about") selectedIndex = 2;
// //       if (section == "contact") selectedIndex = 3;
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final lang = AppLocalizations.of(context)!;
// //
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: GestureDetector(
// //         onTap: (){
// //           Navigator.pop(context);
// //         },
// //         child: Column(
// //           children: [
// //             TopBar(
// //               selectedIndex: selectedIndex,
// //               onHomeTap: () {
// //                 Navigator.pushReplacement(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => const DashboardScreen(initialSection: "home"),
// //                   ),
// //                 );
// //               },
// //               onServicesTap: () {
// //                 Navigator.pushReplacement(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => const DashboardScreen(initialSection: "services"),
// //                   ),
// //                 );
// //               },
// //               onAboutTap: () {
// //                 Navigator.pushReplacement(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => const DashboardScreen(initialSection: "about"),
// //                   ),
// //                 );
// //               },
// //               onContactTap: () {
// //                 Navigator.pushReplacement(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => const DashboardScreen(initialSection: "contact"),
// //                   ),
// //                 );
// //               },
// //             ),
// //             Expanded(
// //               child: SingleChildScrollView(
// //                 child: Column(
// //                   children: [
// //                     // TopBar(
// //                     //   selectedIndex: selectedIndex,
// //                     //   onHomeTap: () => _changeSection("home"),
// //                     //   onServicesTap: () => _changeSection("services"),
// //                     //   onAboutTap: () => _changeSection("about"),
// //                     //   onContactTap: () => _changeSection("contact"),
// //                     // ),
// //
// //
// //
// //
// //                     Padding(
// //                       padding: const EdgeInsets.all(16),
// //                       child: Container(
// //                         width: double.infinity,
// //                         padding: const EdgeInsets.all(20),
// //                         decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           borderRadius: BorderRadius.circular(12),
// //                           boxShadow: [
// //                             BoxShadow(
// //                               color: Colors.grey.shade300.withOpacity(0.6),
// //                               blurRadius: 10,
// //                               spreadRadius: 2,
// //                               offset: const Offset(0, 4),
// //                             ),
// //                             BoxShadow(
// //                               color: Colors.white.withOpacity(0.9),
// //                               blurRadius: 4,
// //                               offset: const Offset(-2, -2),
// //                             ),
// //                           ],
// //                         ),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               lang.privacyPolicyHeading,
// //                               style: const TextStyle(
// //                                 fontSize: 20,
// //                                 fontWeight: FontWeight.bold,
// //                                 color: Colors.black87,
// //                               ),
// //                             ),
// //                             const SizedBox(height: 10),
// //                             Text(
// //                               lang.privacyPolicyIntro,
// //                               style: const TextStyle(
// //                                 fontSize: 15,
// //                                 color: Colors.black54,
// //                                 height: 1.5,
// //                               ),
// //                             ),
// //                             const SizedBox(height: 20),
// //
// //                             buildSection(lang.informationWeCollectTitle, lang.informationWeCollect),
// //                             buildSection(lang.howWeUseInfoTitle, lang.howWeUseInfo),
// //                             buildSection(lang.cookiesTitle, lang.cookiesDetails),
// //                             buildSection(lang.dataSharingTitle, lang.dataSharingDetails),
// //                             buildSection(lang.dataSecurityTitle, lang.dataSecurityDetails),
// //                             buildSection(lang.userRightsTitle, lang.userRights),
// //                             buildSection(lang.consentTitle, lang.consentDetails),
// //                             buildSection(lang.contactTitle, lang.contactDetails),
// //                             buildSection(lang.changesTitle, lang.changesDetails),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget buildSection(String title, String details) {
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
// //             details,
// //             style: const TextStyle(fontSize: 14.5, color: Colors.black54, height: 1.5),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import '../../l10n/app_localizations.dart';
// import '../../res/top_bar.dart';
// import '../../view/dashboard_screen.dart';
//
// class PrivacyPolicyScreen extends StatefulWidget {
//   const PrivacyPolicyScreen({super.key});
//
//   @override
//   State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
// }
//
// class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
//   int selectedIndex = 0;
//   String activeSection = "home";
//
//   void _changeSection(String section) {
//     setState(() {
//       activeSection = section;
//       if (section == "home") selectedIndex = 0;
//       if (section == "services") selectedIndex = 1;
//       if (section == "about") selectedIndex = 2;
//       if (section == "contact") selectedIndex = 3;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final lang = AppLocalizations.of(context)!;
//
//     final String htmlContent = """
// <h2>${lang.privacyPolicyHeading}</h2>
// <p>${lang.privacyPolicyIntro}</p>
//
// <h3>${lang.informationWeCollectTitle}</h3>
// <p>${lang.informationWeCollect.replaceAll("\\n", "<br>")}</p>
//
// <h3>${lang.howWeUseInfoTitle}</h3>
// <p>${lang.howWeUseInfo.replaceAll("\\n", "<br>")}</p>
//
// <h3>${lang.cookiesTitle}</h3>
// <p>${lang.cookiesDetails.replaceAll("\\n", "<br>")}</p>
//
// <h3>${lang.dataSharingTitle}</h3>
// <p>${lang.dataSharingDetails.replaceAll("\\n", "<br>")}</p>
//
// <h3>${lang.dataSecurityTitle}</h3>
// <p>${lang.dataSecurityDetails.replaceAll("\\n", "<br>")}</p>
//
// <h3>${lang.userRightsTitle}</h3>
// <p>${lang.userRights.replaceAll("\\n", "<br>")}</p>
//
// <h3>${lang.consentTitle}</h3>
// <p>${lang.consentDetails}</p>
//
// <h3>${lang.contactTitle}</h3>
// <p>${lang.contactDetails.replaceAll("\\n", "<br>")}</p>
//
// <h3>${lang.changesTitle}</h3>
// <p>${lang.changesDetails}</p>
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
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Container(
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
//                     height: 1.5,
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
import '../../l10n/app_localizations.dart';
import '../../res/footer_section.dart';
import '../../res/top_bar.dart';
import '../../view/dashboard_screen.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  int selectedIndex = 0;
  String activeSection = "home";

  void _changeSection(String section) {
    setState(() {
      activeSection = section;
      if (section == "home") selectedIndex = 0;
      if (section == "services") selectedIndex = 1;
      if (section == "about") selectedIndex = 2;
      if (section == "contact") selectedIndex = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    // 📜 Compact HTML with reduced spacing between sections
    final String htmlContent = """
<h2 style="margin-bottom:8px; font-size:18px;">${lang.privacyPolicyHeading}</h2>
<p style="margin-bottom:10px;">${lang.privacyPolicyIntro}</p>

<h3 style="margin-top:8px; margin-bottom:6px; font-size:16px;">${lang.informationWeCollectTitle}</h3>
<p style="margin-bottom:8px;">${lang.informationWeCollect.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:8px; margin-bottom:6px; font-size:16px;">${lang.howWeUseInfoTitle}</h3>
<p style="margin-bottom:8px;">${lang.howWeUseInfo.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:8px; margin-bottom:6px; font-size:16px;">${lang.cookiesTitle}</h3>
<p style="margin-bottom:8px;">${lang.cookiesDetails.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:8px; margin-bottom:6px; font-size:16px;">${lang.dataSharingTitle}</h3>
<p style="margin-bottom:8px;">${lang.dataSharingDetails.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:8px; margin-bottom:6px; font-size:16px;">${lang.dataSecurityTitle}</h3>
<p style="margin-bottom:8px;">${lang.dataSecurityDetails.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:8px; margin-bottom:6px; font-size:16px;">${lang.userRightsTitle}</h3>
<p style="margin-bottom:8px;">${lang.userRights.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:8px; margin-bottom:6px; font-size:16px;">${lang.consentTitle}</h3>
<p style="margin-bottom:8px;">${lang.consentDetails}</p>

<h3 style="margin-top:8px; margin-bottom:6px; font-size:16px;">${lang.contactTitle}</h3>
<p style="margin-bottom:8px;">${lang.contactDetails.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:8px; margin-bottom:6px; font-size:16px;">${lang.changesTitle}</h3>
<p style="margin-bottom:8px;">${lang.changesDetails}</p>
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
                    padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    child: Column(
                      children: [
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 14, vertical: 14), // 🔹 Compact inner padding
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
