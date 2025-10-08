import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_pharmashing/generated/assets.dart';
import 'package:v_pharmashing/res/const_color.dart';
import 'package:v_pharmashing/res/sizing_const.dart';

import '../l10n/app_localizations.dart';
import '../view_model/language_view_model.dart';

class TopBar extends StatefulWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onContactTap;

  const TopBar({
    this.onHomeTap,
    this.onServicesTap,
    this.onAboutTap,
    super.key,
    this.onContactTap,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int selectedIndex = 0;

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
              children:  [
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
                    icon: Icon(Icons.language, color: Colors.black87),
                    onSelected: (value) async {
                      // Update SharedPreferences
                      final sp = await SharedPreferences.getInstance();
                      await sp.setString('language_code', value);

                      // Update provider
                      final languageVM = Provider.of<LanguageViewModel>(context, listen: false);
                      languageVM.setLanguage(value);
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: "en",
                        child: Text("English"),
                      ),
                      const PopupMenuItem(
                        value: "hi",
                        child: Text("हिंदी"),
                      ),
                    ],
                  ),
                )

              ],
            );
          }

          Widget loginButton() {
            return ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.blueColor,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child:  Text(AppLocalizations.of(context)!.login, style: TextStyle(color: Colors.white)),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: isMobile ? null : 60,
                child: isMobile
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LogoSection(),
                        loginButton(), // Login top right
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        buildButton(AppLocalizations.of(context)!.home, 0, widget.onHomeTap),
                        buildButton(AppLocalizations.of(context)!.services, 1, widget.onServicesTap),
                        buildButton(AppLocalizations.of(context)!.about, 2, widget.onAboutTap),
                        buildButton(AppLocalizations.of(context)!.contact, 3, widget.onContactTap),
                      ],
                    ),
                    const SizedBox(height: 8),
                    contactInfo(),
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
