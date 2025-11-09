import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart' show GoRouterState, GoRouter;
import 'package:provider/provider.dart';
import 'package:v_pharmashing/res/const_color.dart';
import 'package:v_pharmashing/res/sizing_const.dart';
import 'package:v_pharmashing/view/blog_screen.dart';
import '../l10n/app_localizations.dart';
import '../res/footer_section.dart';
import '../res/top_bar.dart';
import '../utils/routes/routes.dart';
import '../utils/widget/dash_board_data.dart';
import '../utils/widget/featured_card.dart';
import '../view_model/admin_contact_view_model.dart';
import '../view_model/profile_view_model.dart';
import 'about_us_screen.dart';
import 'contact_screen.dart';
import 'services_screen.dart';
import 'dart:html' as html;
class DashboardScreen extends StatefulWidget {
  // final String initialSection;
  final String? initialSection;
  final String? initialSubSection;
  const DashboardScreen({super.key, this.initialSection = "home", this.initialSubSection});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;
  String activeSection = "home";
  String? activeSubSection;

  // void _changeSection(String section, {String? subSection}) {
  //   setState(() {
  //     activeSection = section;
  //     activeSubSection = subSection; // 👈 store inner section
  //     if (section == "services") selectedIndex = 1;
  //     else if (section == "about") selectedIndex = 2;
  //     else if (section == "contact") selectedIndex = 3;
  //     else if (section == "blog") selectedIndex = 4;
  //     else selectedIndex = 0;
  //   });
  // }

  void _changeSection(String section, {String? subSection}) {
    setState(() {
      activeSection = section;
      activeSubSection = subSection;

      if (section == "home") selectedIndex = 0;
      else if (section == "services") selectedIndex = 1;
      else if (section == "about") selectedIndex = 2;
      else if (section == "contact") selectedIndex = 3;
      else if (section == "blog") selectedIndex = 4;
    });

    // ✅ Build clean route path
    String path = "/$section";

    // If sub-section exists, append it
    if (subSection != null && subSection.isNotEmpty) {
      path += "/$subSection";
    }

    // ✅ Navigate without query parameters
    GoRouter.of(context).go(path);
  }


  // void _changeSection(String section, {String? subSection}) {
  //   setState(() {
  //     activeSection = section;
  //     activeSubSection = subSection;
  //
  //     if (section == "home") selectedIndex = 0;
  //     else if (section == "services") selectedIndex = 1;
  //     else if (section == "about") selectedIndex = 2;
  //     else if (section == "contact") selectedIndex = 3;
  //     else if (section == "blog") selectedIndex = 4;
  //   });
  //
  //   // ✅ Only include query param if it's not null
  //   final queryParams = <String, String>{};
  //   if (section.isNotEmpty) queryParams['section'] = section;
  //   if (subSection != null) queryParams['subSection'] = subSection;
  //
  //   final uri = Uri(
  //     path: RoutesName.dashboardScreen,
  //     queryParameters: queryParams.isNotEmpty ? queryParams : null,
  //   );
  //
  //   GoRouter.of(context).go(uri.toString());
  // }

  @override
  void initState() {
    super.initState();

    // 🔹 Default initial section
    activeSection = widget.initialSection ?? "home";
    if (activeSection == "home") selectedIndex = 0;
    else if (activeSection == "services") selectedIndex = 1;
    else if (activeSection == "about") selectedIndex = 2;
    else if (activeSection == "contact") selectedIndex = 3;
    else if (activeSection == "blog") selectedIndex = 4;

    // 🔹 Web back button + GoRouter query parameters safely
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ✅ Read GoRouter query parameters safely
      final params = GoRouterState.of(context).uri.queryParameters;
      setState(() {
        activeSection = params['section'] ?? activeSection;
        activeSubSection = params['subSection'];
        if (activeSection == "home") selectedIndex = 0;
        else if (activeSection == "services") selectedIndex = 1;
        else if (activeSection == "about") selectedIndex = 2;
        else if (activeSection == "contact") selectedIndex = 3;
        else if (activeSection == "blog") selectedIndex = 4;
      });

      // 🔹 Web back button handling
      if (kIsWeb) {
        html.window.onPopState.listen((event) {
          final params = Uri.parse(html.window.location.href).queryParameters;
          setState(() {
            activeSection = params['section'] ?? 'home';
            activeSubSection = params['subSection'];
            if (activeSection == "home") selectedIndex = 0;
            else if (activeSection == "services") selectedIndex = 1;
            else if (activeSection == "about") selectedIndex = 2;
            else if (activeSection == "contact") selectedIndex = 3;
            else if (activeSection == "blog") selectedIndex = 4;
          });
        });
      }

      // 🔹 Call APIs safely
      final adminContactViewModel =
      Provider.of<AdminContactViewModel>(context, listen: false);
      adminContactViewModel.adminContactApi();

      final profileVM = Provider.of<ProfileViewModel>(context, listen: false);
      profileVM.profileApi(context);
    });
  }

  // void initState() {
  //   super.initState();
  //
  //   // 🔹 Initial section setup
  //   activeSection = widget.initialSection ?? "home";
  //   if (widget.initialSection == "home") selectedIndex = 0;
  //   else if (widget.initialSection == "services") selectedIndex = 1;
  //   else if (widget.initialSection == "about") selectedIndex = 2;
  //   else if (widget.initialSection == "contact") selectedIndex = 3;
  //   else if (widget.initialSection == "blog") selectedIndex = 4;
  //   final params = GoRouterState.of(context).uri.queryParameters;
  //   activeSection = params['section'] ?? "home";
  //   activeSubSection = params['subSection'];
  //   // 🔹 Web back button handling
  //   // if (kIsWeb) {
  //   //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //   //     html.window.onPopState.listen((event) async {
  //   //       if (!mounted) return;
  //   //
  //   //       // 👇 agar home ke alawa kisi aur page par ho
  //   //       if (selectedIndex != 0) {
  //   //         setState(() {
  //   //           selectedIndex = 0;
  //   //           activeSection = "home";
  //   //         });
  //   //         // push state to prevent browser back loop
  //   //         html.window.history.pushState(null, '', html.window.location.href);
  //   //         return;
  //   //       }
  //   //
  //   //       // 👇 agar already home par ho — show exit dialog
  //   //       bool? shouldExit = await showDialog(
  //   //         context: context,
  //   //         builder: (context) => AlertDialog(
  //   //           shape: RoundedRectangleBorder(
  //   //             borderRadius: BorderRadius.circular(12),
  //   //           ),
  //   //           title: const Text("Exit Website"),
  //   //           content: const Text("Are you sure you want to leave this website?"),
  //   //           actions: [
  //   //             TextButton(
  //   //               onPressed: () => Navigator.of(context).pop(false),
  //   //               child: const Text("No", style: TextStyle(color: Colors.grey)),
  //   //             ),
  //   //             TextButton(
  //   //               onPressed: () => Navigator.of(context).pop(true),
  //   //               child: const Text("Yes", style: TextStyle(color: Colors.red)),
  //   //             ),
  //   //           ],
  //   //         ),
  //   //       );
  //   //
  //   //       if (shouldExit == true) {
  //   //         html.window.history.back(); // exit from website
  //   //       } else {
  //   //         // stay on same page
  //   //         html.window.history.pushState(null, '', html.window.location.href);
  //   //       }
  //   //     });
  //   //
  //   //     // prevent initial trigger
  //   //     html.window.history.pushState(null, '', html.window.location.href);
  //   //   });
  //   // }
  //   if (kIsWeb) {
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //       html.window.onPopState.listen((event) {
  //         final params = Uri.parse(html.window.location.href).queryParameters;
  //         setState(() {
  //           activeSection = params['section'] ?? 'home';
  //           activeSubSection = params['subSection'];
  //           if (activeSection == "home") selectedIndex = 0;
  //           else if (activeSection == "services") selectedIndex = 1;
  //           else if (activeSection == "about") selectedIndex = 2;
  //           else if (activeSection == "contact") selectedIndex = 3;
  //           else if (activeSection == "blog") selectedIndex = 4;
  //         });
  //       });
  //     });
  //   }
  //   // 🔹 Call API after first frame render
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     if (mounted) {
  //       final adminContactViewModel =
  //       Provider.of<AdminContactViewModel>(context, listen: false);
  //       adminContactViewModel.adminContactApi();
  //       Provider.of<ProfileViewModel>(context, listen: false).profileApi(context);
  //     }
  //   });
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        children: [
          TopBar(
            selectedIndex: selectedIndex,
            onHomeTap: () => _changeSection("home"),
            onServicesTap: () => _changeSection("services"),
            onAboutTap: () => _changeSection("about"),
            onContactTap: () => _changeSection("contact"),
            onBlogTap: () => _changeSection("blog"),
          ),
          Expanded(
            child: ListView(
              children: [
                if (activeSection == "home") ...[
                  SizedBox(
                    height: 700,
                    child:  DashboardBody(

                      onSectionChange: (section) {
                        activeSection = section;
                        setState(() {
                          if (section == "services") selectedIndex = 1;
                          else if (section == "about") selectedIndex = 2;
                          else if (section == "contact") selectedIndex = 3;
                          else if (section == "blog") selectedIndex = 4;
                          else selectedIndex = 0;
                        });
                      },
                    ),

                    // DashboardBody(
                    //   onSectionChange: (section) {
                    //     setState(() {
                    //       if (section == "services") selectedIndex = 1;
                    //       else if (section == "about") selectedIndex = 2;
                    //       else if (section == "contact") selectedIndex = 3;
                    //       else selectedIndex = 0;
                    //     });
                    //   },
                    // ),
                    // DashboardBody(
                    //   onSectionChange: (section) {
                    //     setState(() {
                    //       activeSection = section;
                    //     });
                    //   },
                    // ),
                  ),

                  Sizes.spaceHeight30,
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.ourServices,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  Sizes.spaceHeight10,
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        AppLocalizations.of(context)!.experienceSeamlessHealthcareServices,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                  Sizes.spaceHeight10,

                  /// 🔹 Category Cards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        bool isMobile = constraints.maxWidth < 600;
                        final cards = [
                          CategoryCard(
                            icon: Icons.monitor_heart,
                            title: AppLocalizations.of(context)!.orderMedicine,
                            subtitle: AppLocalizations.of(context)!.uploadPrescriptionAndOrderWithEase,
                            bgColor: Colors.lightBlue.shade50,
                            onTap: () => _changeSection("services"), // ✅ fixed
                          ),
                          // CategoryCard(
                          //   icon: Icons.thermostat,
                          //   title: AppLocalizations.of(context)!.trackOrder,
                          //   subtitle: AppLocalizations.of(context)!.realTimeTrackingWithWhatsAppAndCallUpdates,
                          //   bgColor: Colors.lightBlue.shade50,
                          //   onTap: () => _changeSection("services"), // ✅ fixed
                          // ),
                          CategoryCard(
                            icon: Icons.thermostat,
                            title: AppLocalizations.of(context)!.trackOrder,
                            subtitle: AppLocalizations.of(context)!.realTimeTrackingWithWhatsAppAndCallUpdates,
                            bgColor: Colors.lightBlue.shade50,
                            onTap: () => _changeSection("services", subSection: "track"), // ✅ This will show orders
                          ),
                          CategoryCard(
                            icon: Icons.favorite_border,
                            title: AppLocalizations.of(context)!.verifyMedicine,
                            subtitle: AppLocalizations.of(context)!.checkAuthenticityVerificationSystem,
                            bgColor: Colors.lightBlue.shade50,
                            onTap: () => _changeSection("services", subSection: "verify"),
                          ),
                        ];
                        return isMobile
                            ? Column(children: cards)
                            : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: cards,
                        );
                      },
                    ),
                  ),
                  Sizes.spaceHeight35,
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.whyChooseVPharmacy,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  Sizes.spaceHeight10,
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppLocalizations.of(context)!.wePrioritizeYourHealthAndSafetyWithOurTrustedAndReliableServices,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                  Sizes.spaceHeight35,
                  FeaturesSection(),
                  Sizes.spaceHeight10,

                  GestureDetector(
                    onTap: () => _changeSection("services"), // ✅ fixed
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 60,
                        horizontal: 20,
                      ),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.readyToGetStarted,
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            AppLocalizations.of(context)!.joinThousandsOfSatisfiedCustomersWhoTrustMediCareForTheirHealthcareNeeds,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => _changeSection("services"), // ✅ fixed
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.blueColor,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.add_shopping_cart_sharp, color: Colors.white),
                                      const SizedBox(width: 6),
                                      Text(
                                        AppLocalizations.of(context)!.orderNow,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.03),
                              GestureDetector(
                                onTap: () => _changeSection("contact"), // ✅ fixed
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.whiteColor,
                                    border: Border.all(color: Colors.grey.shade200),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.call, color: Colors.black),
                                      const SizedBox(width: 6),
                                      Text(
                                        AppLocalizations.of(context)!.contact,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Sizes.spaceHeight35,
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     GestureDetector(
                          //       onTap: () {
                          //         Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (context) => const PrivacyPolicyScreen(),
                          //           ),
                          //         );
                          //       },
                          //       //privacyPolicyTitle
                          //       child: Text(
                          //         AppLocalizations.of(context)!.privacyPolicyTitle,
                          //         style: TextStyle(
                          //           fontSize: 14,
                          //           color: Colors.blue.shade700,
                          //           decoration: TextDecoration.underline,
                          //         ),
                          //       ),
                          //     ),
                          //     const SizedBox(width: 10),
                          //
                          //     GestureDetector(
                          //       onTap: () {
                          //         Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (context) => const TermsConditionScreen(),
                          //           ),
                          //         );
                          //       },
                          //       child: Text(
                          //         AppLocalizations.of(context)!.termsTitle,
                          //         style: TextStyle(
                          //           fontSize: 14,
                          //           color: Colors.blue.shade700,
                          //           decoration: TextDecoration.underline,
                          //         ),
                          //       ),
                          //     ),
                          //     const SizedBox(width: 10),
                          //     GestureDetector(
                          //       onTap: () {
                          //         Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (context) => const DisclaimerScreen(),
                          //           ),
                          //         );
                          //       },
                          //       child: Text(
                          //         AppLocalizations.of(context)!.disclaimerTitle,
                          //         style: TextStyle(
                          //           fontSize: 14,
                          //           color: Colors.blue.shade700,
                          //           decoration: TextDecoration.underline,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
                if (activeSection == "services")
                  ServicesScreen(initialSubSection: activeSubSection),
                // if (activeSection == "services") ...[ServicesScreen()],
                if (activeSection == "about") ...[AboutUsScreen()],
                if (activeSection == "contact") ...[ContactScreen()],
                if (activeSection == "blog") ...[BlogScreen()],
                FooterSection()
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color bgColor;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.bgColor,
    required this.onTap,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedScale(
        scale: isHover ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isHover ? Colors.blue : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: isHover ? 12 : 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          height: 270,
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: widget.bgColor,
                child: Icon(widget.icon, size: 40, color: Colors.blue),
              ),
              const SizedBox(height: 10),
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                widget.subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  width: MediaQuery.of(context).size.width < 600
                      ? double.infinity
                      : Sizes.screenWidth * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.getStarted,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
