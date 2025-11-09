// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:v_pharmashing/generated/assets.dart';
// import 'package:v_pharmashing/utils/widget/Disclamer_screen.dart';
// import 'package:v_pharmashing/utils/widget/privacy_policy_screen.dart';
// import 'package:v_pharmashing/utils/widget/terms_condition_screen.dart';
// import 'package:v_pharmashing/view/dashboard_screen.dart';
// import '../l10n/app_localizations.dart';
// import '../view_model/admin_contact_view_model.dart';
// class FooterSection extends StatefulWidget {
//   const FooterSection({super.key});
//
//   @override
//   State<FooterSection> createState() => _FooterSectionState();
// }
//
// class _FooterSectionState extends State<FooterSection> {
//   String? hoveredText;
//   int hoveredIndex = -1;
//   int selectedIndex = 0;
//   bool isEmailHovered = false;
//   bool isPhoneHovered = false;
//
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() async {
//       if (!mounted) return;
//       context.read<AdminContactViewModel>().adminContactApi();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final adminVM = Provider.of<AdminContactViewModel>(context);
//     final contact = adminVM.adminContactModel?.data;
//
//     return Container(
//       width: double.infinity,
//       color: const Color(0XFF007ACC),
//       padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(Assets.assetsVPharmacy, height: 80, width: 80),
//             const SizedBox(height: 20),
//
//             LayoutBuilder(
//               builder: (context, constraints) {
//                 bool isMobile = constraints.maxWidth < 600;
//                 return isMobile
//                     ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: _buildFooterColumns(contact, context),
//                 )
//                     : Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: _buildFooterColumns(contact, context),
//                 );
//               },
//             ),
//
//             const SizedBox(height: 25),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildSocialIcon(
//                     Icons.facebook, 'https://www.facebook.com/yourpage', 0),
//                 const SizedBox(width: 12),
//                 _buildSocialIcon(
//                     Icons.email, 'mailto:${contact?.email ?? ''}', 1),
//                 const SizedBox(width: 12),
//                 _buildSocialIcon(
//                     Icons.whatshot_outlined,
//                     'https://wa.me/${contact?.whatsappNumber ?? ''}',
//                     2),
//               ],
//             ),
//
//             const SizedBox(height: 25),
//             const Divider(color: Colors.white30, thickness: 1),
//             const SizedBox(height: 10),
//             const Center(
//               child: Text(
//                 '© 2025 MyApp. All rights reserved.',
//                 style: TextStyle(color: Colors.white, fontSize: 13),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   List<Widget> _buildFooterColumns(contact, BuildContext context) {
//     return [
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _hoverableText(label: AppLocalizations.of(context)!.about,onTap: (){
//             setState(() => selectedIndex = 2);
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (_) =>
//                   const DashboardScreen(initialSection: "about")),
//             );
//           }),
//           const SizedBox(height: 8),
//           _hoverableText(
//             label: AppLocalizations.of(context)!.privacyPolicyTitle,
//             onTap: () => Navigator.push(context,
//                 MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen())),
//           ),
//           const SizedBox(height: 6),
//           _hoverableText(
//             label: AppLocalizations.of(context)!.termsTitle,
//             onTap: () => Navigator.push(context,
//                 MaterialPageRoute(builder: (_) => const TermsConditionScreen())),
//           ),
//           const SizedBox(height: 6),
//           _hoverableText(
//             label:AppLocalizations.of(context)!.disclaimerTitle,
//             onTap: () => Navigator.push(context,
//                 MaterialPageRoute(builder: (_) => const DisclaimerScreen())),
//           ),
//         ],
//       ),
//
//       const SizedBox(height: 20, width: 20),
//
//       // Blog Section
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _hoverableText(
//             label: AppLocalizations.of(context)!.blog,
//             onTap: () {
//               setState(() => selectedIndex = 4);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (_) =>
//                     const DashboardScreen(initialSection: "blog")),
//               );
//             },
//           ),
//           const SizedBox(height: 8),
//           _hoverableText(label:  AppLocalizations.of(context)!.latestArticles, onTap: () {
//             setState(() => selectedIndex = 4);
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (_) =>
//                   const DashboardScreen(initialSection: "blog")),
//             );
//           },),
//           const SizedBox(height: 6),
//           _hoverableText(label:  AppLocalizations.of(context)!.techUpdates, onTap: () {
//             setState(() => selectedIndex = 4);
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (_) =>
//                   const DashboardScreen(initialSection: "blog")),
//             );
//           },),
//           const SizedBox(height: 6),
//           _hoverableText(label:  AppLocalizations.of(context)!.lifestyleTips, onTap: () {
//             setState(() => selectedIndex = 4);
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (_) =>
//                   const DashboardScreen(initialSection: "blog")),
//             );
//           },),
//         ],
//       ),
//
//       const SizedBox(height: 20, width: 20),
//
//       // Column(
//       //   crossAxisAlignment: CrossAxisAlignment.start,
//       //   children: [
//       //     _hoverableText(label: AppLocalizations.of(context)!.contact,),
//       //     const SizedBox(height: 8),
//       //     _hoverableText(
//       //       label: contact?.email ?? "N/A",
//       //       onTap: () async {
//       //         final Uri emailUri = Uri(
//       //           scheme: 'mailto',
//       //           path: contact?.email ?? '',
//       //           query: 'subject=Support Inquiry',
//       //         );
//       //         if (await canLaunchUrl(emailUri)) {
//       //           await launchUrl(emailUri);
//       //         }
//       //       },
//       //     ),
//       //     const SizedBox(height: 6),
//       //     _hoverableText(
//       //       label: contact?.whatsappNumber?.toString() ?? "",
//       //       onTap: () async {
//       //         if (contact?.whatsappNumber != null) {
//       //           final whatsappUrl =
//       //           Uri.parse("https://wa.me/91${contact!.whatsappNumber}");
//       //           await launchUrl(whatsappUrl,
//       //               mode: LaunchMode.externalApplication);
//       //         }
//       //       },
//       //     ),
//       //     const SizedBox(height: 6),
//       //     Text(
//       //       contact?.address?.replaceAll("  ", "\n") ?? "",
//       //       softWrap: true,
//       //       style: const TextStyle(fontSize: 14, height: 1.4, color: Colors.white),
//       //     ),
//       //   ],
//       // ),
//       // Contact Section
//       // Contact Section
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _hoverableText(label: AppLocalizations.of(context)!.contact,onTap: (){
//             setState(() => selectedIndex = 3);
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (_) =>
//                   const DashboardScreen(initialSection: "contact")),
//             );
//           }),
//           const SizedBox(height: 8),
//
//           // Email Row
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Icon(Icons.email, color: Colors.white, size: 18),
//               const SizedBox(width: 6),
//               const Text(
//                 "Email: ",
//                 style: TextStyle(fontSize: 14, color: Colors.white),
//               ),
//               MouseRegion(
//                 cursor: SystemMouseCursors.click,
//                 onEnter: (_) => setState(() => isEmailHovered = true),
//                 onExit: (_) => setState(() => isEmailHovered = false),
//                 child: GestureDetector(
//                   onTap: () async {
//                     final Uri emailUri = Uri(
//                       scheme: 'mailto',
//                       path: contact?.email ?? '',
//                       query: 'subject=Support Inquiry',
//                     );
//                     if (await canLaunchUrl(emailUri)) {
//                       await launchUrl(emailUri);
//                     }
//                   },
//                   child: Text(
//                     contact?.email ?? "N/A",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: isEmailHovered ? Colors.yellow : Colors.white,
//                       decoration: isEmailHovered
//                           ? TextDecoration.underline
//                           : TextDecoration.none,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 6),
//
//           // Phone / WhatsApp Row
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Icon(Icons.phone, color: Colors.white, size: 18),
//               const SizedBox(width: 6),
//               const Text(
//                 "Call: ",
//                 style: TextStyle(fontSize: 14, color: Colors.white),
//               ),
//               MouseRegion(
//                 cursor: SystemMouseCursors.click,
//                 onEnter: (_) => setState(() => isPhoneHovered = true),
//                 onExit: (_) => setState(() => isPhoneHovered = false),
//                 child: GestureDetector(
//                   onTap: () async {
//                     if (contact?.whatsappNumber != null) {
//                       final whatsappUrl =
//                       Uri.parse("https://wa.me/91${contact!.whatsappNumber}");
//                       await launchUrl(whatsappUrl,
//                           mode: LaunchMode.externalApplication);
//                     }
//                   },
//                   child: Text(
//                     contact?.whatsappNumber?.toString() ?? "N/A",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: isPhoneHovered ? Colors.yellow : Colors.white,
//                       decoration: isPhoneHovered
//                           ? TextDecoration.underline
//                           : TextDecoration.none,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 6),
//
//           // Address (no hover)
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Icon(Icons.location_on, color: Colors.white, size: 18),
//               const SizedBox(width: 6),
//               Flexible(
//                 child: Text(
//                   "Address: ${contact?.address?.replaceAll("  ", "\n") ?? "N/A"}",
//                   softWrap: true,
//                   style: const TextStyle(fontSize: 14, height: 1.4, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       )
//
//
//
//     ];
//   }
//
//   Widget _hoverableText({required String label, VoidCallback? onTap}) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => hoveredText = label),
//       onExit: (_) => setState(() => hoveredText = null),
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: onTap,
//         child: AnimatedDefaultTextStyle(
//           duration: const Duration(milliseconds: 200),
//           style: TextStyle(
//             color: hoveredText == label ? Colors.yellow : Colors.white,
//             fontSize: (label == 'About' || label == 'Blog' || label == 'Contact')
//                 ? 17
//                 : 14,
//             fontWeight: (label == 'About' || label == 'Blog' || label == 'Contact')
//                 ? FontWeight.bold
//                 : FontWeight.normal,
//             decoration: hoveredText == label
//                 ? TextDecoration.underline
//                 : TextDecoration.none,
//           ),
//           child: Text(label),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSocialIcon(IconData icon, String url, int index) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => hoveredIndex = index),
//       onExit: (_) => setState(() => hoveredIndex = -1),
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: () async {
//           final Uri uri = Uri.parse(url);
//           if (await canLaunchUrl(uri)) {
//             await launchUrl(uri, mode: LaunchMode.externalApplication);
//           }
//         },
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           decoration: BoxDecoration(
//             color: hoveredIndex == index ? Colors.white38 : Colors.white24,
//             shape: BoxShape.circle,
//             boxShadow: hoveredIndex == index
//                 ? [
//               BoxShadow(
//                 color: Colors.white.withOpacity(0.6),
//                 blurRadius: 8,
//                 spreadRadius: 2,
//               ),
//             ]
//                 : [],
//           ),
//           padding: const EdgeInsets.all(8),
//           child: Icon(
//             icon,
//             color: Colors.white,
//             size: hoveredIndex == index ? 22 : 20,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:v_pharmashing/generated/assets.dart';
import 'package:v_pharmashing/utils/widget/Disclamer_screen.dart';
import 'package:v_pharmashing/utils/widget/privacy_policy_screen.dart';
import 'package:v_pharmashing/utils/widget/terms_condition_screen.dart';
import 'package:v_pharmashing/view/dashboard_screen.dart';
import '../l10n/app_localizations.dart';
import '../view_model/admin_contact_view_model.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  String? hoveredText;
  int hoveredIndex = -1;
  int selectedIndex = 0;
  bool isEmailHovered = false;
  bool isPhoneHovered = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      if (!mounted) return;
      context.read<AdminContactViewModel>().adminContactApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final adminVM = Provider.of<AdminContactViewModel>(context);
    final contact = adminVM.adminContactModel?.data;

    return Container(
      width: double.infinity,
      color: const Color(0XFF007ACC),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Assets.assetsVPharmacy, height: 80, width: 80),
            const SizedBox(height: 20),

            LayoutBuilder(
              builder: (context, constraints) {
                bool isMobile = constraints.maxWidth < 600;
                return isMobile
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildFooterColumns(contact, context),
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildFooterColumns(contact, context),
                );
              },
            ),

            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(
                    Icons.facebook, 'https://www.facebook.com/yourpage', 0),
                const SizedBox(width: 12),
                _buildSocialIcon(
                    Icons.email, 'mailto:${contact?.email ?? ''}', 1),
                const SizedBox(width: 12),
                _buildSocialIcon(
                    Icons.whatshot_outlined,
                    'https://wa.me/${contact?.whatsappNumber ?? ''}',
                    2),
              ],
            ),

            const SizedBox(height: 25),
            const Divider(color: Colors.white30, thickness: 1),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                '© 2025 Vpharmacy. All rights reserved.',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFooterColumns(contact, BuildContext context) {
    return [
      // About Section
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _hoverableText(
            label: AppLocalizations.of(context)!.about,
            onTap: () {
              setState(() => selectedIndex = 2);
              context.go('/about'); // ✅ GoRouter navigation
            },
          ),

          // _hoverableText(
          //     label: AppLocalizations.of(context)!.about,
          //     onTap: () {
          //       setState(() => selectedIndex = 2);
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (_) =>
          //             const DashboardScreen(initialSection: "about")),
          //       );
          //     }),
          const SizedBox(height: 8),
          _hoverableText(
            label: AppLocalizations.of(context)!.privacyPolicyTitle,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const PrivacyPolicyScreen())),
          ),
          const SizedBox(height: 6),
          _hoverableText(
            label: AppLocalizations.of(context)!.termsTitle,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const TermsConditionScreen())),
          ),
          const SizedBox(height: 6),
          _hoverableText(
            label: AppLocalizations.of(context)!.disclaimerTitle,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const DisclaimerScreen())),
          ),
        ],
      ),

      const SizedBox(height: 20, width: 20),

      // Blog Section (with blur loader)
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _hoverableText(
            label: AppLocalizations.of(context)!.blog,
            onTap: () async {
              setState(() => selectedIndex = 4);

              // Blur + Loader दिखाओ
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return Stack(
                    children: [
                      // Background blur
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(color: Colors.black.withOpacity(0.3)),
                      ),

                      // Loader box
                      const Center(
                        child: Dialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(12))),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(
                                    color: Color(0XFF007ACC)),
                                SizedBox(height: 15),
                                Text(
                                  "Loading Blog...",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0XFF007ACC),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );

              // 2 सेकंड तक loader दिखाओ
              await Future.delayed(const Duration(seconds: 2));

              // Loader बंद करो
              Navigator.pop(context);

              // अब blog page पर जाओ
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                  const DashboardScreen(initialSection: "blog"),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          _hoverableText(
            label: AppLocalizations.of(context)!.latestArticles,
            onTap: () async {
              setState(() => selectedIndex = 4);
              await _showBlurLoader(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                    const DashboardScreen(initialSection: "blog")),
              );
            },
          ),
          const SizedBox(height: 6),
          _hoverableText(
            label: AppLocalizations.of(context)!.techUpdates,
            onTap: () async {
              setState(() => selectedIndex = 4);
              await _showBlurLoader(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                    const DashboardScreen(initialSection: "blog")),
              );
            },
          ),
          const SizedBox(height: 6),
          _hoverableText(
            label: AppLocalizations.of(context)!.lifestyleTips,
            onTap: () async {
              setState(() => selectedIndex = 4);
              await _showBlurLoader(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                    const DashboardScreen(initialSection: "blog")),
              );
            },
          ),
        ],
      ),

      const SizedBox(height: 20, width: 20),

      // Contact Section
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _hoverableText(
              label: AppLocalizations.of(context)!.contact,
              onTap: () {
                setState(() => selectedIndex = 3);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                      const DashboardScreen(initialSection: "contact")),
                );
              }),
          const SizedBox(height: 8),

          // Email Row
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.email, color: Colors.white, size: 18),
              const SizedBox(width: 6),
              const Text("Email: ",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() => isEmailHovered = true),
                onExit: (_) => setState(() => isEmailHovered = false),
                child: GestureDetector(
                  onTap: () async {
                    final Uri emailUri = Uri(
                      scheme: 'mailto',
                      path: contact?.email ?? '',
                      query: 'subject=Support Inquiry',
                    );
                    if (await canLaunchUrl(emailUri)) {
                      await launchUrl(emailUri);
                    }
                  },
                  child: Text(
                    contact?.email ?? "N/A",
                    style: TextStyle(
                        fontSize: 14,
                        color:
                        isEmailHovered ? Colors.yellow : Colors.white,
                        decoration: isEmailHovered
                            ? TextDecoration.underline
                            : TextDecoration.none),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Phone Row
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.phone, color: Colors.white, size: 18),
              const SizedBox(width: 6),
              const Text("Call: ",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() => isPhoneHovered = true),
                onExit: (_) => setState(() => isPhoneHovered = false),
                child: GestureDetector(
                  onTap: () async {
                    if (contact?.whatsappNumber != null) {
                      final whatsappUrl = Uri.parse(
                          "https://wa.me/91${contact!.whatsappNumber}");
                      await launchUrl(whatsappUrl,
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  child: Text(
                    contact?.whatsappNumber?.toString() ?? "N/A",
                    style: TextStyle(
                        fontSize: 14,
                        color:
                        isPhoneHovered ? Colors.yellow : Colors.white,
                        decoration: isPhoneHovered
                            ? TextDecoration.underline
                            : TextDecoration.none),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Address Row
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 18),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  "Address: ${contact?.address?.replaceAll("  ", "\n") ?? "N/A"}",
                  softWrap: true,
                  style: const TextStyle(
                      fontSize: 14, height: 1.4, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      )
    ];
  }

  Future<void> _showBlurLoader(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
            const Center(
              child: Dialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(color: Color(0XFF007ACC)),
                      SizedBox(height: 15),
                      Text(
                        "Loading Blog...",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0XFF007ACC),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
  }

  Widget _hoverableText({required String label, VoidCallback? onTap}) {
    return MouseRegion(
      onEnter: (_) => setState(() => hoveredText = label),
      onExit: (_) => setState(() => hoveredText = null),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: hoveredText == label ? Colors.yellow : Colors.white,
            fontSize:
            (label == 'About' || label == 'Blog' || label == 'Contact')
                ? 17
                : 14,
            fontWeight:
            (label == 'About' || label == 'Blog' || label == 'Contact')
                ? FontWeight.bold
                : FontWeight.normal,
            decoration: hoveredText == label
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
          child: Text(label),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url, int index) {
    return MouseRegion(
      onEnter: (_) => setState(() => hoveredIndex = index),
      onExit: (_) => setState(() => hoveredIndex = -1),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: hoveredIndex == index ? Colors.white38 : Colors.white24,
            shape: BoxShape.circle,
            boxShadow: hoveredIndex == index
                ? [
              BoxShadow(
                color: Colors.white.withOpacity(0.6),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ]
                : [],
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            color: Colors.white,
            size: hoveredIndex == index ? 22 : 20,
          ),
        ),
      ),
    );
  }
}
