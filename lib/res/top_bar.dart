import 'dart:async';
import 'dart:ui';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:v_pharmashing/generated/assets.dart';
import 'package:v_pharmashing/res/const_color.dart';
import 'package:v_pharmashing/res/sizing_const.dart';
import '../auth/login_screen.dart';
import '../l10n/app_localizations.dart';
import '../view_model/admin_contact_view_model.dart';
import '../view_model/language_view_model.dart';
import '../view_model/profile_view_model.dart';
import '../view_model/user_view_model.dart';

class TopBar extends StatefulWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onContactTap;
  final VoidCallback? onBlogTap;
  final int selectedIndex;

  const TopBar({
    this.onHomeTap,
    this.onServicesTap,
    this.onAboutTap,
    this.onContactTap,
    this.onBlogTap,
    super.key,
    required this.selectedIndex,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int selectedIndex = 0;
  String currentLang = "en";
  bool _isRefreshing = false;
  // late int selectedIndex;

  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshProfile();
      final adminContactViewModel = Provider.of<AdminContactViewModel>(
        context,
        listen: false,
      );
      adminContactViewModel.adminContactApi();
    });
  }

  @override
  void didUpdateWidget(TopBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      setState(() {
        selectedIndex = widget.selectedIndex;
      });
    }
  }

  void _refreshProfile() async {
    if (_isRefreshing) return;
    if (!mounted) return;
    setState(() => _isRefreshing = true);

    await Provider.of<ProfileViewModel>(
      context,
      listen: false,
    ).profileApi(context);
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;
    setState(() => _isRefreshing = false);
  }

  void _loadSavedLanguage() async {
    final sp = await SharedPreferences.getInstance();

    // ✅ Default fallback: English ("en")
    String savedLang = sp.getString('language_code') ?? "en";

    if (!mounted) return; // ✅ Prevents setState after dispose

    setState(() => currentLang = savedLang);

    // ✅ Update provider as well
    final languageVM = Provider.of<LanguageViewModel>(context, listen: false);
    languageVM.setLanguage(savedLang);
  }

  Widget buildButton(String text, int index, VoidCallback? onTap) {
    final bool isSelected =
        widget.selectedIndex == index; // <-- ye lo from parent
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileVM = Provider.of<ProfileViewModel>(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.screenWidth * 0.01,
        vertical: 8,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LogoSection(
                onHomeTap: () {
                  setState(() => selectedIndex = 0);
                  widget.onHomeTap?.call();
                },
              ),

              // const LogoSection(),
              if (!isMobile)
                Row(
                  children: [
                    buildButton(
                      AppLocalizations.of(context)!.home,
                      0,
                      widget.onHomeTap,
                    ),
                    buildButton(
                      AppLocalizations.of(context)!.services,
                      1,
                      widget.onServicesTap,
                    ),
                    buildButton(
                      AppLocalizations.of(context)!.about,
                      2,
                      widget.onAboutTap,
                    ),
                    buildButton(
                      AppLocalizations.of(context)!.contact,
                      3,
                      widget.onContactTap,
                    ),
                    buildButton(
                      AppLocalizations.of(context)!.blog,
                      4,
                      widget.onBlogTap,
                    ),
                    const SizedBox(width: 10),
                    contactInfo(),
                    const SizedBox(width: 10),
                    loginOrUserButton(profileVM, isMobile),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      profileVM.isLoggedIn
                          ? "Hi, ${profileVM.userName!.split(' ').first}"
                          : "",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(width: Sizes.screenWidth * 0.01),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColor.lightBlueColor,
                      child: PopupMenuButton<String>(
                        onSelected: (value) async {
                          final sp = await SharedPreferences.getInstance();
                          await sp.setString('language_code', value);

                          final languageVM = Provider.of<LanguageViewModel>(
                            context,
                            listen: false,
                          );
                          languageVM.setLanguage(value);

                          setState(() => currentLang = value);
                        },
                        itemBuilder: (context) => [
                          CheckedPopupMenuItem(
                            value: "en",
                            checked: currentLang == "en",
                            child: const Text("English"), // ✅ Label for clarity
                          ),
                          CheckedPopupMenuItem(
                            value: "hi",
                            checked: currentLang == "hi",
                            child: const Text("हिंदी"), // ✅ Label for clarity
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

                    SizedBox(width: Sizes.screenWidth * 0.01),
                    if (!profileVM.isLoggedIn)
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const LoginDialog(),
                          ).then((_) {
                            _refreshProfile();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.blueColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),

                    // Menu Button
                    PopupMenuButton<int>(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.black87,
                        size: 26,
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
                            widget.onBlogTap?.call();
                            break;
                          case 5:
                            if (profileVM.isLoggedIn) {
                              bool? confirm = await _showLogoutDialog();
                              if (confirm == true) {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.clear();
                                await UserViewModel().remove();
                                await profileVM.logout();

                                // ✅ Home Tab par wapas jao
                                widget.onHomeTap?.call();
                                setState(() {
                                  selectedIndex = 0;
                                });
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => const LoginDialog(),
                              ).then((_) {
                                _refreshProfile();
                              });
                            }
                            break;
                        }
                      },
                      itemBuilder: (context) => [
                        buildMenuItem(
                          Icons.home,
                          AppLocalizations.of(context)!.home,
                          0,
                        ),
                        buildMenuItem(
                          Icons.build,
                          AppLocalizations.of(context)!.services,
                          1,
                        ),
                        buildMenuItem(
                          Icons.info,
                          AppLocalizations.of(context)!.about,
                          2,
                        ),
                        buildMenuItem(
                          Icons.contact_mail,
                          AppLocalizations.of(context)!.contact,
                          3,
                        ),
                        buildMenuItem(
                          Icons.article,
                          AppLocalizations.of(context)!.blog,
                          4,
                        ),
                        buildMenuItem(
                          profileVM.isLoggedIn ? Icons.logout : Icons.login,
                          profileVM.isLoggedIn
                              ? "Logout"
                              : AppLocalizations.of(context)!.login,
                          5,
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }

  Future<bool?> _showLogoutDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.confirmLogout),
        content: Text(
          "${AppLocalizations.of(context)!.areYouSureYouWantToLogout}?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(AppLocalizations.of(context)!.oK),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<int> buildMenuItem(IconData icon, String text, int value) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  Widget loginOrUserButton(ProfileViewModel profileVM, bool isMobile) {
    if (profileVM.loading) return const SizedBox();

    // 🔹 If logged in
    if (profileVM.isLoggedIn && profileVM.userName != null) {
      return Row(
        children: [
          Text(
            profileVM.isLoggedIn
                ? "Hi, ${profileVM.userName!.split(' ').first}"
                : "",
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () async {
              bool? confirm = await _showLogoutDialog();
              if (confirm == true) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Stack(
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                          child: Container(
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        const Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircularProgressIndicator(color: Colors.white),
                              SizedBox(height: 12),
                              Text(
                                "Logging out...",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );

                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                await UserViewModel().remove();
                await Provider.of<ProfileViewModel>(
                  context,
                  listen: false,
                ).logout();

                await Future.delayed(const Duration(seconds: 1));

                if (mounted) {
                  Navigator.of(context).pop(); // close blur
                  widget.onHomeTap?.call(); // 👈 go to Home tab
                  setState(() {
                    selectedIndex = 0;
                  });
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            child: const Text("Logout", style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    }
    // 🔹 If not logged in
    else {
      return ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const LoginDialog(),
          ).then((_) async {
            await _softRefreshProfile(); // refresh profile after login

            if (!mounted)
              return; // ✅ widget dispose hone ke baad context access se bachao

            // 👇 If login successful, go to Home
            final profileVM = Provider.of<ProfileViewModel>(
              context,
              listen: false,
            );
            if (profileVM.isLoggedIn) {
              widget.onHomeTap?.call(); // go to Home tab
              setState(() {
                selectedIndex = 0;
              });
            }
          });
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
  }

  Widget contactInfo() {
    final adminVM = Provider.of<AdminContactViewModel>(context);
    final contact = adminVM.adminContactModel?.data;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () async {
            if (contact?.alternateNumber != null) {
              final callUrl = Uri.parse("tel:${contact!.alternateNumber}");
              await launchUrl(callUrl, mode: LaunchMode.externalApplication);
            }
          },
          child: Row(
            children: [
              const Icon(Icons.phone, size: 20, color: Colors.black54),
              const SizedBox(width: 4),
              Text(
                contact?.alternateNumber != null
                    ? "+91 ${contact!.alternateNumber}"
                    : "+91 0000000000",
                style: const TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () async {
            if (contact?.whatsappNumber != null) {
              final whatsappUrl = Uri.parse(
                "https://wa.me/91${contact!.whatsappNumber}",
              );
              await launchUrl(
                whatsappUrl,
                mode: LaunchMode.externalApplication,
              );
            }
          },
          child: Row(
            children: [
              const Icon(
                Icons.chat_bubble_outline,
                size: 20,
                color: Colors.black87,
              ),
              const SizedBox(width: 4),
              Text(
                AppLocalizations.of(context)!.whatsApp,
                style: const TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        // CircleAvatar(
        //   radius: 20,
        //   backgroundColor: AppColor.lightBlueColor,
        //   child: PopupMenuButton<String>(
        //     onSelected: (value) async {
        //       final sp = await SharedPreferences.getInstance();
        //       await sp.setString('language_code', value);
        //       final languageVM =
        //       Provider.of<LanguageViewModel>(context, listen: false);
        //       languageVM.setLanguage(value);
        //       setState(() => currentLang = value);
        //     },
        //     itemBuilder: (context) => [
        //       CheckedPopupMenuItem(
        //           value: "en",
        //           checked: currentLang == "en",
        //           child: const Text("English")),
        //       CheckedPopupMenuItem(
        //           value: "hi",
        //           checked: currentLang == "hi",
        //           child: const Text("हिंदी")),
        //     ],
        //     child: Text(
        //       currentLang.toUpperCase(),
        //       style: const TextStyle(
        //           color: Colors.black87,
        //           fontWeight: FontWeight.bold,
        //           fontSize: 14),
        //     ),
        //   ),
        // ),
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColor.lightBlueColor,
          child: PopupMenuButton<String>(
            tooltip: '',
            onSelected: (value) async {
              final sp = await SharedPreferences.getInstance();
              await sp.setString('language_code', value);
              final languageVM = Provider.of<LanguageViewModel>(
                context,
                listen: false,
              );
              languageVM.setLanguage(value);
              setState(() => currentLang = value);
            },
            itemBuilder: (context) => [
              CheckedPopupMenuItem(
                value: "en",
                checked: currentLang == "en",
                child: const Text("English"),
              ),
              CheckedPopupMenuItem(
                value: "hi",
                checked: currentLang == "hi",
                child: const Text("हिंदी"),
              ),
            ],
            icon: null,
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

  Future<void> _softRefreshProfile() async {
    if (_isRefreshing) return;
    setState(() => _isRefreshing = true);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(color: Colors.black.withOpacity(0.2)),
            ),
            const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: Colors.white),
                  SizedBox(height: 16),
                  Text(
                    "Refreshing...",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );

    await Provider.of<ProfileViewModel>(
      context,
      listen: false,
    ).profileApi(context);
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      Navigator.of(context).pop();
      setState(() => _isRefreshing = false);
    }
  }
}

class LogoSection extends StatelessWidget {
  final VoidCallback? onHomeTap;
  const LogoSection({super.key, this.onHomeTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onHomeTap,
      child: Row(
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
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
