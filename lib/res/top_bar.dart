// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:v_pharmashing/generated/assets.dart';
// import 'package:v_pharmashing/res/const_color.dart';
// import 'package:v_pharmashing/res/sizing_const.dart';
//
// import '../auth/login_screen.dart';
// import '../l10n/app_localizations.dart';
// import '../view_model/language_view_model.dart';
//
// class TopBar extends StatefulWidget {
//   final VoidCallback? onHomeTap;
//   final VoidCallback? onServicesTap;
//   final VoidCallback? onAboutTap;
//   final VoidCallback? onContactTap;
//   final int selectedIndex;
//
//   const TopBar({
//     this.onHomeTap,
//     this.onServicesTap,
//     this.onAboutTap,
//     this.onContactTap,
//     super.key, required this.selectedIndex,
//   });
//
//   @override
//   State<TopBar> createState() => _TopBarState();
// }
//
// class _TopBarState extends State<TopBar> {
//   int selectedIndex = 0;
//   String currentLang = "en"; // default language
//
//   @override
//   void initState() {
//     super.initState();
//     _loadSavedLanguage();
//   }
//
//   void _loadSavedLanguage() async {
//     final sp = await SharedPreferences.getInstance();
//     String? savedLang = sp.getString('language_code');
//     if (savedLang != null) {
//       setState(() {
//         currentLang = savedLang;
//       });
//       final languageVM = Provider.of<LanguageViewModel>(context, listen: false);
//       languageVM.setLanguage(savedLang);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.03, vertical: 8),
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           bool isMobile = constraints.maxWidth < 600;
//
//           Widget buildButton(String text, int index, VoidCallback? onTap) {
//             return TextButton(
//               onPressed: () {
//                 setState(() {
//                   selectedIndex = index;
//                 });
//                 if (onTap != null) onTap();
//               },
//               child: Text(
//                 text,
//                 style: TextStyle(
//                   color: selectedIndex == index ? Colors.blue : Colors.black87,
//                   fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
//                   fontSize: 16,
//                 ),
//               ),
//             );
//           }
//
//           Widget contactInfo() {
//             return Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.phone, size: 20, color: Colors.black54),
//                 SizedBox(width: 4),
//                 Text("+91 9876543210", style: TextStyle(color: Colors.black87)),
//                 SizedBox(width: 16),
//                 Icon(Icons.chat_bubble_outline, size: 20, color: Colors.black87),
//                 SizedBox(width: 4),
//                 Text(AppLocalizations.of(context)!.whatsApp, style: TextStyle(color: Colors.black87)),
//                 SizedBox(width: 16),
//                 CircleAvatar(
//                   radius: 20,
//                   backgroundColor: AppColor.lightBlueColor,
//                   child: PopupMenuButton<String>(
//                     // Remove icon, use child to show currentLang
//                     onSelected: (value) async {
//                       final sp = await SharedPreferences.getInstance();
//                       await sp.setString('language_code', value);
//
//                       final languageVM = Provider.of<LanguageViewModel>(context, listen: false);
//                       languageVM.setLanguage(value);
//
//                       setState(() {
//                         currentLang = value;
//                       });
//                     },
//                     itemBuilder: (context) => [
//                       CheckedPopupMenuItem(
//                         value: "en",
//                         checked: currentLang == "en",
//                         child: Text("English"),
//                       ),
//                       CheckedPopupMenuItem(
//                         value: "hi",
//                         checked: currentLang == "hi",
//                         child: Text("हिंदी"),
//                       ),
//                     ],
//                     child: Text(
//                       currentLang.toUpperCase(),
//                       style: const TextStyle(
//                         color: Colors.black87,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//
//               ],
//             );
//           }
//
//           Widget loginButton() {
//             return ElevatedButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => const LoginDialog(),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColor.blueColor,
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               ),
//               child: Text(
//                 AppLocalizations.of(context)!.login,
//                 style: const TextStyle(color: Colors.white),
//               ),
//             );
//           }
//
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: isMobile ? null : 60,
//                 child: isMobile
//                     ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const LogoSection(),
//                         loginButton(),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Wrap(
//                       spacing: 12,
//                       runSpacing: 8,
//                       children: [
//                         buildButton(AppLocalizations.of(context)!.home, 0, widget.onHomeTap),
//                         buildButton(AppLocalizations.of(context)!.services, 1, widget.onServicesTap),
//                         buildButton(AppLocalizations.of(context)!.about, 2, widget.onAboutTap),
//                         buildButton(AppLocalizations.of(context)!.contact, 3, widget.onContactTap),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     contactInfo(),
//                   ],
//                 )
//                     : Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const LogoSection(),
//                     Row(
//                       children: [
//                         buildButton(AppLocalizations.of(context)!.home, 0, widget.onHomeTap),
//                         buildButton(AppLocalizations.of(context)!.services, 1, widget.onServicesTap),
//                         buildButton(AppLocalizations.of(context)!.about, 2, widget.onAboutTap),
//                         buildButton(AppLocalizations.of(context)!.contact, 3, widget.onContactTap),
//                         const SizedBox(width: 30),
//                         contactInfo(),
//                         const SizedBox(width: 16),
//                         loginButton(),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class LogoSection extends StatelessWidget {
//   const LogoSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 70,
//           height: 45,
//           decoration: const BoxDecoration(shape: BoxShape.circle),
//           child: Image.asset(
//             Assets.assetsLogo,
//             fit: BoxFit.cover,
//           ),
//         ),
//         const SizedBox(width: 8),
//         Text(
//           AppLocalizations.of(context)!.vPharmacy,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//             color: Colors.black87,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_pharmashing/generated/assets.dart';
import 'package:v_pharmashing/res/const_color.dart';
import 'package:v_pharmashing/res/sizing_const.dart';

import '../auth/login_screen.dart';
import '../l10n/app_localizations.dart';
import '../view_model/language_view_model.dart';

class TopBar extends StatefulWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onContactTap;
  final int selectedIndex;

  const TopBar({
    this.onHomeTap,
    this.onServicesTap,
    this.onAboutTap,
    this.onContactTap,
    super.key,
    required this.selectedIndex,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int selectedIndex = 0;
  String currentLang = "en"; // default language

  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
  }

  void _loadSavedLanguage() async {
    final sp = await SharedPreferences.getInstance();
    String? savedLang = sp.getString('language_code');
    if (savedLang != null) {
      setState(() {
        currentLang = savedLang;
      });
      final languageVM = Provider.of<LanguageViewModel>(context, listen: false);
      languageVM.setLanguage(savedLang);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.03, vertical: 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;

          Widget buildButton(String text, int index, VoidCallback? onTap) {
            return TextButton(
              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });
                if (onTap != null) onTap();
              },
              child: Text(
                text,
                style: TextStyle(
                  color: selectedIndex == index ? Colors.blue : Colors.black87,
                  fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            );
          }

          Widget contactInfo() {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.phone, size: 20, color: Colors.black54),
                SizedBox(width: 4),
                Text("+91 9876543210", style: TextStyle(color: Colors.black87)),
                SizedBox(width: 16),
                Icon(Icons.chat_bubble_outline, size: 20, color: Colors.black87),
                SizedBox(width: 4),
                Text(AppLocalizations.of(context)!.whatsApp, style: TextStyle(color: Colors.black87)),
                SizedBox(width: 16),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColor.lightBlueColor,
                  child: PopupMenuButton<String>(
                    onSelected: (value) async {
                      final sp = await SharedPreferences.getInstance();
                      await sp.setString('language_code', value);

                      final languageVM = Provider.of<LanguageViewModel>(context, listen: false);
                      languageVM.setLanguage(value);

                      setState(() {
                        currentLang = value;
                      });
                    },
                    itemBuilder: (context) => [
                      CheckedPopupMenuItem(
                        value: "en",
                        checked: currentLang == "en",
                        child: Text("English"),
                      ),
                      CheckedPopupMenuItem(
                        value: "hi",
                        checked: currentLang == "hi",
                        child: Text("हिंदी"),
                      ),
                    ],
                    child: Text(
                      currentLang.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          Widget loginButton() {
            return ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const LoginDialog(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.blueColor,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: Text(
                AppLocalizations.of(context)!.login,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: isMobile ? null : 60,
                child: isMobile
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LogoSection(),
                    Row(
                      children: [
                        // Language selector
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColor.lightBlueColor,
                          child: PopupMenuButton<String>(
                            onSelected: (value) async {
                              final sp = await SharedPreferences.getInstance();
                              await sp.setString('language_code', value);

                              final languageVM = Provider.of<LanguageViewModel>(context, listen: false);
                              languageVM.setLanguage(value);

                              setState(() {
                                currentLang = value;
                              });
                            },
                            itemBuilder: (context) => [
                              CheckedPopupMenuItem(
                                value: "en",
                                checked: currentLang == "en",
                                child: Text("English"),
                              ),
                              CheckedPopupMenuItem(
                                value: "hi",
                                checked: currentLang == "hi",
                                child: Text("हिंदी"),
                              ),
                            ],
                            child: Text(
                              currentLang.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Mobile menu icon
                        PopupMenuButton<int>(
                          icon: const Icon(Icons.menu, color: Colors.black87),
                          onSelected: (index) {
                            switch (index) {
                              case 0:
                                widget.onHomeTap?.call();
                                break;
                              case 1:
                                widget.onServicesTap?.call();
                                break;
                              case 2:
                                widget.onAboutTap?.call();
                                break;
                              case 3:
                                widget.onContactTap?.call();
                                break;
                              case 4:
                                showDialog(
                                  context: context,
                                  builder: (context) => const LoginDialog(),
                                );
                                break;
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(value: 0, child: Text(AppLocalizations.of(context)!.home)),
                            PopupMenuItem(value: 1, child: Text(AppLocalizations.of(context)!.services)),
                            PopupMenuItem(value: 2, child: Text(AppLocalizations.of(context)!.about)),
                            PopupMenuItem(value: 3, child: Text(AppLocalizations.of(context)!.contact)),
                            PopupMenuItem(value: 4, child: Text(AppLocalizations.of(context)!.login)),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LogoSection(),
                    Row(
                      children: [
                        buildButton(AppLocalizations.of(context)!.home, 0, widget.onHomeTap),
                        buildButton(AppLocalizations.of(context)!.services, 1, widget.onServicesTap),
                        buildButton(AppLocalizations.of(context)!.about, 2, widget.onAboutTap),
                        buildButton(AppLocalizations.of(context)!.contact, 3, widget.onContactTap),
                        const SizedBox(width: 30),
                        contactInfo(),
                        const SizedBox(width: 16),
                        loginButton(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 45,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Image.asset(
            Assets.assetsLogo,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          AppLocalizations.of(context)!.vPharmacy,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
