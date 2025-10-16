//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:v_pharmashing/generated/assets.dart';
// import 'package:v_pharmashing/res/const_color.dart';
// import 'package:v_pharmashing/res/sizing_const.dart';
// import '../auth/login_screen.dart';
// import '../l10n/app_localizations.dart';
// import '../view_model/language_view_model.dart';
// import '../view_model/profile_view_model.dart';
// import '../view_model/user_view_model.dart';
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
//     super.key,
//     required this.selectedIndex,
//   });
//
//   @override
//   State<TopBar> createState() => _TopBarState();
// }
//
// class _TopBarState extends State<TopBar> {
//   int selectedIndex = 0;
//   String currentLang = "en";
//
//   @override
//   void initState() {
//     super.initState();
//     _loadSavedLanguage();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<ProfileViewModel>(context, listen: false).profileApi(context);
//     });
//   }
//
//   void _loadSavedLanguage() async {
//     final sp = await SharedPreferences.getInstance();
//     String? savedLang = sp.getString('language_code');
//     if (savedLang != null) {
//       setState(() => currentLang = savedLang);
//       final languageVM = Provider.of<LanguageViewModel>(context, listen: false);
//       languageVM.setLanguage(savedLang);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final profileVM = Provider.of<ProfileViewModel>(context);
//
//     Widget buildButton(String text, int index, VoidCallback? onTap) {
//       return TextButton(
//         onPressed: () {
//           setState(() => selectedIndex = index);
//           if (onTap != null) onTap();
//         },
//         child: Text(
//           text,
//           style: TextStyle(
//             color: selectedIndex == index ? Colors.blue : Colors.black87,
//             fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
//             fontSize: 16,
//           ),
//         ),
//       );
//     }
//
//     Widget contactInfo() {
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Icon(Icons.phone, size: 20, color: Colors.black54),
//           const SizedBox(width: 4),
//           const Text("+91 9876543210", style: TextStyle(color: Colors.black87)),
//           const SizedBox(width: 16),
//           const Icon(Icons.chat_bubble_outline, size: 20, color: Colors.black87),
//           const SizedBox(width: 4),
//           Text(AppLocalizations.of(context)!.whatsApp, style: const TextStyle(color: Colors.black87)),
//           const SizedBox(width: 16),
//           CircleAvatar(
//             radius: 20,
//             backgroundColor: AppColor.lightBlueColor,
//             child: PopupMenuButton<String>(
//               onSelected: (value) async {
//                 final sp = await SharedPreferences.getInstance();
//                 await sp.setString('language_code', value);
//                 final languageVM = Provider.of<LanguageViewModel>(context, listen: false);
//                 languageVM.setLanguage(value);
//                 setState(() => currentLang = value);
//               },
//               itemBuilder: (context) => [
//                 CheckedPopupMenuItem(value: "en", checked: currentLang == "en", child: const Text("English")),
//                 CheckedPopupMenuItem(value: "hi", checked: currentLang == "hi", child: const Text("हिंदी")),
//               ],
//               child: Text(
//                 currentLang.toUpperCase(),
//                 style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
//               ),
//             ),
//           ),
//         ],
//       );
//     }
//
//     Widget loginOrUserButton() {
//       final profileVM = Provider.of<ProfileViewModel>(context);
//
//       if (profileVM.loading) {
//         return const SizedBox();
//       }
//
//       if (profileVM.isLoggedIn && profileVM.userName != null) {
//         return Row(
//           children: [
//             Text(
//               "Hi, ${profileVM.userName}",
//               style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(width: 8),
//             ElevatedButton(
//               onPressed: () async {
//                 // Logout confirmation dialog
//                 bool? confirm = await showDialog<bool>(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: const Text("Confirm Logout"),
//                     content: const Text("Are you sure you want to logout?"),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.of(context).pop(false),
//                         child: const Text("Cancel"),
//                       ),
//                       TextButton(
//                         onPressed: () => Navigator.of(context).pop(true),
//                         child: const Text("OK"),
//                       ),
//                     ],
//                   ),
//                 );
//
//                 if (confirm == true) {
//                   // ✅ Clear user ID and logout
//                   await UserViewModel().remove();
//                   await profileVM.logout();
//
//                   // ✅ Force UI refresh to show login button
//                   setState(() {});
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               ),
//               child: const Text("Logout", style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         );
//       } else {
//         return ElevatedButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (context) => const LoginDialog(),
//             ).then((_) {
//               Provider.of<ProfileViewModel>(context, listen: false).profileApi(context);
//             });
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: AppColor.blueColor,
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           ),
//           child: Text(AppLocalizations.of(context)!.login, style: const TextStyle(color: Colors.white)),
//         );
//       }
//     }
//
//
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.03, vertical: 8),
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           bool isMobile = constraints.maxWidth < 600;
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const LogoSection(),
//               if (!isMobile)
//                 Row(
//                   children: [
//                     buildButton(AppLocalizations.of(context)!.home, 0, widget.onHomeTap),
//                     buildButton(AppLocalizations.of(context)!.services, 1, widget.onServicesTap),
//                     buildButton(AppLocalizations.of(context)!.about, 2, widget.onAboutTap),
//                     buildButton(AppLocalizations.of(context)!.contact, 3, widget.onContactTap),
//                     const SizedBox(width: 30),
//                     contactInfo(),
//                     const SizedBox(width: 16),
//                     loginOrUserButton(),
//                   ],
//                 )
//               else
//                 PopupMenuButton<int>(
//                   icon: Container(
//                     padding: const EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade200,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 4,
//                           offset: Offset(2, 2),
//                         ),
//                       ],
//                     ),
//                     child: const Icon(Icons.menu, color: Colors.black87),
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   color: Colors.white,
//                   elevation: 6,
//                   onSelected: (index) {
//                     switch (index) {
//                       case 0:
//                         widget.onHomeTap?.call();
//                         break;
//                       case 1:
//                         widget.onServicesTap?.call();
//                         break;
//                       case 2:
//                         widget.onAboutTap?.call();
//                         break;
//                       case 3:
//                         widget.onContactTap?.call();
//                         break;
//                       case 4:
//                         profileVM.isLoggedIn
//                             ? profileVM.logout()
//                             : showDialog(
//                           context: context,
//                           builder: (context) => const LoginDialog(),
//                         ).then((_) {
//                           Provider.of<ProfileViewModel>(context, listen: false)
//                               .profileApi(context);
//                         });
//                         break;
//                     }
//                   },
//                   itemBuilder: (context) => [
//                     PopupMenuItem(
//                       value: 0,
//                       child: Row(
//                         children: [
//                           const Icon(Icons.home, color: Colors.blueAccent),
//                           const SizedBox(width: 10),
//                           Text(AppLocalizations.of(context)!.home),
//                         ],
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: 1,
//                       child: Row(
//                         children: [
//                           const Icon(Icons.build, color: Colors.orangeAccent),
//                           const SizedBox(width: 10),
//                           Text(AppLocalizations.of(context)!.services),
//                         ],
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: 2,
//                       child: Row(
//                         children: [
//                           const Icon(Icons.info, color: Colors.green),
//                           const SizedBox(width: 10),
//                           Text(AppLocalizations.of(context)!.about),
//                         ],
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: 3,
//                       child: Row(
//                         children: [
//                           const Icon(Icons.contact_mail, color: Colors.purple),
//                           const SizedBox(width: 10),
//                           Text(AppLocalizations.of(context)!.contact),
//                         ],
//                       ),
//                     ),
//                     PopupMenuItem(
//                       value: 4,
//                       child: Row(
//                         children: [
//                           Icon(
//                             profileVM.isLoggedIn ? Icons.logout : Icons.login,
//                             color: Colors.redAccent,
//                           ),
//                           const SizedBox(width: 10),
//                           Text(profileVM.isLoggedIn
//                               ? "Logout"
//                               : AppLocalizations.of(context)!.login),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
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
//           child: Image.asset(Assets.assetsLogo, fit: BoxFit.cover),
//         ),
//         const SizedBox(width: 8),
//         Text(
//           AppLocalizations.of(context)!.vPharmacy,
//           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87),
//         ),
//       ],
//     );
//   }
// }
//
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
import '../view_model/profile_view_model.dart';
import '../view_model/user_view_model.dart';

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
  String currentLang = "en";

  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileViewModel>(context, listen: false).profileApi(context);
    });
  }

  void _loadSavedLanguage() async {
    final sp = await SharedPreferences.getInstance();
    String? savedLang = sp.getString('language_code');
    if (savedLang != null) {
      setState(() => currentLang = savedLang);
      final languageVM = Provider.of<LanguageViewModel>(context, listen: false);
      languageVM.setLanguage(savedLang);
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileVM = Provider.of<ProfileViewModel>(context);

    Widget buildButton(String text, int index, VoidCallback? onTap) {
      return TextButton(
        onPressed: () {
          setState(() => selectedIndex = index);
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
          const Icon(Icons.phone, size: 20, color: Colors.black54),
          const SizedBox(width: 4),
          const Text("+91 9876543210", style: TextStyle(color: Colors.black87)),
          const SizedBox(width: 16),
          const Icon(Icons.chat_bubble_outline, size: 20, color: Colors.black87),
          const SizedBox(width: 4),
          Text(AppLocalizations.of(context)!.whatsApp, style: const TextStyle(color: Colors.black87)),
          const SizedBox(width: 16),
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColor.lightBlueColor,
            child: PopupMenuButton<String>(
              onSelected: (value) async {
                final sp = await SharedPreferences.getInstance();
                await sp.setString('language_code', value);
                final languageVM = Provider.of<LanguageViewModel>(context, listen: false);
                languageVM.setLanguage(value);
                setState(() => currentLang = value);
              },
              itemBuilder: (context) => [
                CheckedPopupMenuItem(value: "en", checked: currentLang == "en", child: const Text("English")),
                CheckedPopupMenuItem(value: "hi", checked: currentLang == "hi", child: const Text("हिंदी")),
              ],
              child: Text(
                currentLang.toUpperCase(),
                style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ],
      );
    }

    Widget loginOrUserButton() {
      final profileVM = Provider.of<ProfileViewModel>(context);

      if (profileVM.loading) {
        return const SizedBox();
      }

      if (profileVM.isLoggedIn && profileVM.userName != null) {
        return Row(
          children: [
            Text(
              "Hi, ${profileVM.userName}",
              style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () async {
                bool? confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Confirm Logout"),
                    content: const Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );

                if (confirm == true) {
                  await UserViewModel().remove();
                  await profileVM.logout();
                  setState(() {});
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Text("Logout", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      } else {
        return ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const LoginDialog(),
            ).then((_) {
              Provider.of<ProfileViewModel>(context, listen: false).profileApi(context);
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.blueColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: Text(AppLocalizations.of(context)!.login, style: const TextStyle(color: Colors.white)),
        );
      }
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.03, vertical: 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LogoSection(),
              if (!isMobile)
                Row(
                  children: [
                    buildButton(AppLocalizations.of(context)!.home, 0, widget.onHomeTap),
                    buildButton(AppLocalizations.of(context)!.services, 1, widget.onServicesTap),
                    buildButton(AppLocalizations.of(context)!.about, 2, widget.onAboutTap),
                    buildButton(AppLocalizations.of(context)!.contact, 3, widget.onContactTap),
                    const SizedBox(width: 30),
                    contactInfo(),
                    const SizedBox(width: 16),
                    loginOrUserButton(),
                  ],
                )
              else
                PopupMenuButton<int>(
                  icon: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.menu, color: Colors.black87),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  elevation: 6,
                  onSelected: (index) async {
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
                        if (profileVM.isLoggedIn) {
                          bool? confirm = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Confirm Logout"),
                              content: const Text("Are you sure you want to logout?"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(false),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(true),
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );

                          if (confirm == true) {
                            await UserViewModel().remove();
                            await profileVM.logout();
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => const LoginDialog(),
                          ).then((_) {
                            Provider.of<ProfileViewModel>(context, listen: false).profileApi(context);
                          });
                        }
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 0,
                      child: Row(
                        children: [
                          const Icon(Icons.home, color: Colors.blueAccent),
                          const SizedBox(width: 10),
                          Text(AppLocalizations.of(context)!.home),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          const Icon(Icons.build, color: Colors.orangeAccent),
                          const SizedBox(width: 10),
                          Text(AppLocalizations.of(context)!.services),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Row(
                        children: [
                          const Icon(Icons.info, color: Colors.green),
                          const SizedBox(width: 10),
                          Text(AppLocalizations.of(context)!.about),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Row(
                        children: [
                          const Icon(Icons.contact_mail, color: Colors.purple),
                          const SizedBox(width: 10),
                          Text(AppLocalizations.of(context)!.contact),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 4,
                      child: Row(
                        children: [
                          Icon(
                            profileVM.isLoggedIn ? Icons.logout : Icons.login,
                            color: Colors.redAccent,
                          ),
                          const SizedBox(width: 10),
                          Text(profileVM.isLoggedIn
                              ? "Logout"
                              : AppLocalizations.of(context)!.login),
                        ],
                      ),
                    ),
                  ],
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
          child: Image.asset(Assets.assetsLogo, fit: BoxFit.cover),
        ),
        const SizedBox(width: 8),
        Text(
          AppLocalizations.of(context)!.vPharmacy,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87),
        ),
      ],
    );
  }
}
