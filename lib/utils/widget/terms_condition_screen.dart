// // import 'package:flutter/material.dart';
// // import 'package:v_pharmashing/res/const_color.dart';
// // import 'package:v_pharmashing/res/sizing_const.dart';
// //
// // import '../../l10n/app_localizations.dart';
// //
// // class TermsConditionScreen extends StatefulWidget {
// //   const TermsConditionScreen({super.key});
// //
// //   @override
// //   State<TermsConditionScreen> createState() => _TermsConditionScreenState();
// // }
// //
// // class _TermsConditionScreenState extends State<TermsConditionScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final lang = AppLocalizations.of(context)!;
// //
// //     return Scaffold(
// //       backgroundColor: AppColor.whiteColor,
// //       appBar: AppBar(
// //         backgroundColor: AppColor.whiteColor,
// //         title: Text(
// //           lang.termsTitle,
// //           style: const TextStyle(fontWeight: FontWeight.bold),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16),
// //         child: Container(
// //           width: Sizes.screenWidth,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 lang.termsHeading,
// //                 style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //               const SizedBox(height: 10),
// //               Text(lang.termsIntro),
// //               const SizedBox(height: 16),
// //               Text(lang.acceptanceTitle,
// //                   style: const TextStyle(fontWeight: FontWeight.bold)),
// //               Text(lang.acceptanceDetails),
// //               const SizedBox(height: 16),
// //               Text(lang.servicesTitle,
// //                   style: const TextStyle(fontWeight: FontWeight.bold)),
// //               Text(lang.servicesDetails),
// //               const SizedBox(height: 16),
// //               Text(lang.userObligationsTitle,
// //                   style: const TextStyle(fontWeight: FontWeight.bold)),
// //               Text(lang.userObligationsDetails),
// //               const SizedBox(height: 16),
// //               Text(lang.intellectualTitle,
// //                   style: const TextStyle(fontWeight: FontWeight.bold)),
// //               Text(lang.intellectualDetails),
// //               const SizedBox(height: 16),
// //               Text(lang.liabilityTitle,
// //                   style: const TextStyle(fontWeight: FontWeight.bold)),
// //               Text(lang.liabilityDetails),
// //               const SizedBox(height: 16),
// //               Text(lang.linksTitle,
// //                   style: const TextStyle(fontWeight: FontWeight.bold)),
// //               Text(lang.linksDetails),
// //               const SizedBox(height: 16),
// //               Text(lang.contactTitle,
// //                   style: const TextStyle(fontWeight: FontWeight.bold)),
// //               Text(lang.termsContactDetails),
// //               const SizedBox(height: 16),
// //               Text(lang.modificationsTitle,
// //                   style: const TextStyle(fontWeight: FontWeight.bold)),
// //               Text(lang.modificationsDetails),
// //               const SizedBox(height: 16),
// //               Text(lang.governingLawTitle,
// //                   style: const TextStyle(fontWeight: FontWeight.bold)),
// //               Text(lang.governingLawDetails),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:v_pharmashing/res/const_color.dart';
// import 'package:v_pharmashing/res/sizing_const.dart';
// import '../../l10n/app_localizations.dart';
// import '../../res/top_bar.dart';
// import '../../view/dashboard_screen.dart';
//
// class TermsConditionScreen extends StatefulWidget {
//   const TermsConditionScreen({super.key});
//
//   @override
//   State<TermsConditionScreen> createState() => _TermsConditionScreenState();
// }
//
// class _TermsConditionScreenState extends State<TermsConditionScreen> {
//   int selectedIndex = 0;
//   String activeSection = "home";
//   @override
//   Widget build(BuildContext context) {
//     final lang = AppLocalizations.of(context)!;
//     return Scaffold(
//       backgroundColor: AppColor.whiteColor,
//       // appBar: AppBar(
//       //   backgroundColor: AppColor.whiteColor,
//       //   // elevation: 1,
//       //   title: Text(
//       //     lang.termsTitle,
//       //     style: const TextStyle(
//       //       fontWeight: FontWeight.bold,
//       //       color: Colors.black87,
//       //     ),
//       //   ),
//       // ),
//       body: Column(
//         children: [
//           TopBar(
//             selectedIndex: selectedIndex,
//             onHomeTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const DashboardScreen(initialSection: "home"),
//                 ),
//               );
//             },
//             onServicesTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const DashboardScreen(initialSection: "services"),
//                 ),
//               );
//             },
//             onAboutTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const DashboardScreen(initialSection: "about"),
//                 ),
//               );
//             },
//             onContactTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const DashboardScreen(initialSection: "contact"),
//                 ),
//               );
//             },
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//
//                 children: [
//
//                   Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Container(
//                       width: Sizes.screenWidth,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.shade300.withOpacity(0.6),
//                             blurRadius: 10,
//                             spreadRadius: 2,
//                             offset: const Offset(0, 4),
//                           ),
//                           BoxShadow(
//                             color: Colors.white.withOpacity(0.9),
//                             blurRadius: 4,
//                             offset: const Offset(-2, -2),
//                           ),
//                         ],
//
//                       ),
//                       padding: const EdgeInsets.all(18),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             lang.termsHeading,
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF1A1A1A),
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           Text(
//                             lang.termsIntro,
//                             style: const TextStyle(
//                               height: 1.5,
//                               fontSize: 14.5,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//
//                           _buildSection(lang.acceptanceTitle, lang.acceptanceDetails),
//                           _buildSection(lang.servicesTitle, lang.servicesDetails),
//                           _buildSection(lang.userObligationsTitle, lang.userObligationsDetails),
//                           _buildSection(lang.intellectualTitle, lang.intellectualDetails),
//                           _buildSection(lang.liabilityTitle, lang.liabilityDetails),
//                           _buildSection(lang.linksTitle, lang.linksDetails),
//                           _buildSection(lang.contactTitle, lang.termsContactDetails),
//                           _buildSection(lang.modificationsTitle, lang.modificationsDetails),
//                           _buildSection(lang.governingLawTitle, lang.governingLawDetails),
//
//                           const SizedBox(height: 10),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSection(String title, String details) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 18),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 16,
//               color: Colors.black, // nice blue accent
//             ),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             details,
//             style: const TextStyle(
//               height: 1.5,
//               fontSize: 14.5,
//               color: Colors.black87,
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
import 'package:v_pharmashing/res/sizing_const.dart';
import '../../l10n/app_localizations.dart';
import '../../res/top_bar.dart';
import '../../view/dashboard_screen.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  int selectedIndex = 0;
  String activeSection = "home";

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    // 🧾 Optimized HTML content with reduced gaps
    final String htmlContent = """
<h2 style="margin-bottom:8px; font-size:18px;">${lang.termsHeading}</h2>
<p style="margin-bottom:10px;">${lang.termsIntro}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.acceptanceTitle}</h3>
<p style="margin-bottom:8px;">${lang.acceptanceDetails.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.servicesTitle}</h3>
<p style="margin-bottom:8px;">${lang.servicesDetails.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.userObligationsTitle}</h3>
<p style="margin-bottom:8px;">${lang.userObligationsDetails.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.intellectualTitle}</h3>
<p style="margin-bottom:8px;">${lang.intellectualDetails.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.liabilityTitle}</h3>
<p style="margin-bottom:8px;">${lang.liabilityDetails.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.linksTitle}</h3>
<p style="margin-bottom:8px;">${lang.linksDetails.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.contactTitle}</h3>
<p style="margin-bottom:8px;">${lang.termsContactDetails.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.modificationsTitle}</h3>
<p style="margin-bottom:8px;">${lang.modificationsDetails.replaceAll("\\n", "<br>")}</p>

<h3 style="margin-top:10px; margin-bottom:6px; font-size:16px;">${lang.governingLawTitle}</h3>
<p style="margin-bottom:8px;">${lang.governingLawDetails.replaceAll("\\n", "<br>")}</p>
""";

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
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
                          width: Sizes.screenWidth,
                          padding:
                          const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
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

