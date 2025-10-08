import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:v_pharmashing/res/const_color.dart';
import 'package:v_pharmashing/res/sizing_const.dart';
import 'package:v_pharmashing/utils/routes/routes_name.dart';
import 'package:v_pharmashing/view/services_screen.dart';
import '../res/top_bar.dart';
import '../utils/widget/dash_board_data.dart';
import '../utils/widget/featured_card.dart';
import '../utils/widget/footer_section.dart';
import 'package:flutter/material.dart';
import 'package:v_pharmashing/res/const_color.dart';
import 'package:v_pharmashing/res/sizing_const.dart';
import '../res/top_bar.dart';
import '../utils/widget/dash_board_data.dart';
import '../utils/widget/featured_card.dart';
import 'about_us_screen.dart';
import 'contact_screen.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   String activeSection = "home"; // Track current section
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.whiteColor,
//       body: Column(
//         children: [
//           TopBar(
//             onHomeTap: () => setState(() => activeSection = "home"),
//             onServicesTap: () => setState(() => activeSection = "services"),
//             onAboutTap: () => setState(() => activeSection = "about"),
//             // onContactTap: () => setState(() => activeSection = "contact"),
//           ),
//           Expanded(
//             child: ListView(
//               children: [
//                 if (activeSection == "home") ...[
//                   SizedBox(height: 650, child: DashboardBody()),
//                   _homeSection(),
//                   _servicesSection()
//                 ],
//                 if (activeSection == "services") ...[
//                   _servicesSection(),
//                 ],
//                 if (activeSection == "about") ...[
//                   AboutUsScreen(),
//                 ],
//                 if (activeSection == "contact") ...[
//                   _contactSection(),
//                 ],
//               ],
//
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _homeSection() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: const [
//           Text(
//             "Welcome to MediCare+",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           Text(
//             "Experience seamless healthcare services with our comprehensive platform",
//             style: TextStyle(fontSize: 16, color: Colors.black54),
//           ),
//
//         ],
//       ),
//     );
//   }
//
//   Widget _servicesSection() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           const Text("Our Services",
//               style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 10),
//           const Text(
//               "Experience seamless healthcare services with our comprehensive platform",
//               style: TextStyle(fontSize: 18, color: Colors.black45)),
//           const SizedBox(height: 20),
//           LayoutBuilder(
//             builder: (context, constraints) {
//               bool isMobile = constraints.maxWidth < 600;
//               return isMobile
//                   ? Column(
//                 children: const [
//                   CategoryCard(
//                     icon: Icons.monitor_heart,
//                     title: "Order Medicine",
//                     subtitle: "Upload prescription and order with ease",
//                     bgColor: Colors.lightBlueAccent,
//                   ),
//                   CategoryCard(
//                     icon: Icons.thermostat,
//                     title: "Track Order",
//                     subtitle:
//                     "Real-time tracking with WhatsApp and call updates",
//                     bgColor: Colors.lightBlueAccent,
//                   ),
//                   CategoryCard(
//                     icon: Icons.favorite_border,
//                     title: "Verify Medicine",
//                     subtitle: "Check authenticity verification system",
//                     bgColor: Colors.lightBlueAccent,
//                   ),
//                 ],
//               )
//                   : Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: const [
//                   CategoryCard(
//                     icon: Icons.monitor_heart,
//                     title: "Order Medicine",
//                     subtitle: "Upload prescription and order with ease",
//                     bgColor: Colors.lightBlueAccent,
//                   ),
//                   CategoryCard(
//                     icon: Icons.thermostat,
//                     title: "Track Order",
//                     subtitle:
//                     "Real-time tracking with WhatsApp and call updates",
//                     bgColor: Colors.lightBlueAccent,
//                   ),
//                   CategoryCard(
//                     icon: Icons.favorite_border,
//                     title: "Verify Medicine",
//                     subtitle: "Check authenticity verification system",
//                     bgColor: Colors.lightBlueAccent,
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _aboutSection() {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text("About MediCare+",
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//           SizedBox(height: 16),
//           Text(
//             "MediCare+ is your trusted medicine partner providing verified medicines, "
//                 "real-time delivery tracking, and 24/7 support to ensure your health and safety.",
//             style: TextStyle(fontSize: 16, color: Colors.black54),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _contactSection() {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text("Contact Us",
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//           SizedBox(height: 16),
//           Text("Email: support@medicareplus.com", style: TextStyle(fontSize: 16)),
//           SizedBox(height: 8),
//           Text("Phone: +91 1234567890", style: TextStyle(fontSize: 16)),
//           SizedBox(height: 8),
//           Text("Address: 123 Health Street, City, India",
//               style: TextStyle(fontSize: 16)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatItem(String value, String label) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 48,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 18,
//             color: Colors.white,
//             fontWeight: FontWeight.w300,
//           ),
//         ),
//       ],
//     );
//   }
// }

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String activeSection = "home";
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        children: [
          TopBar(
            onHomeTap: () {
              setState(() => activeSection = "home");
            },
            onServicesTap: () {
              setState(() => activeSection = "services");
            },
            onAboutTap: () {
              setState(() => activeSection = "about");
            },
            onContactTap: () {
              setState(() => activeSection = "contact");
            },
          ),
          // TopBar(
          //   onHomeTap: () {
          //     // Scroll to top or implement home action
          //   },
          //   onServicesTap: () {
          //     // Scroll to services section
          //   },
          //   onAboutTap: () {
          //   context.push(RoutesName.aboutUsScreen);
          //   },
          // ),
          Expanded(
            child: ListView(
              children: [
                // HOME SECTION
                if (activeSection == "home") ...[
                  SizedBox(height: 650, child: DashboardBody()),
                  Sizes.spaceHeight30,
                  Center(
                    child: Text(
                      "Our Services",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                  ),
                  Sizes.spaceHeight10,
                  Center(
                    child: Text(
                      "Experience seamless healthcare services with our comprehensive platform",
                      style: TextStyle(fontSize: 18, color: Colors.black45),
                    ),
                  ),
                  Sizes.spaceHeight10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        bool isMobile = constraints.maxWidth < 600;
                        return isMobile
                            ? Column(
                          children: [
                            CategoryCard(
                              icon: Icons.monitor_heart,
                              title: "Order Medicine",
                              subtitle: "Upload prescription and order with ease",
                              bgColor: Colors.lightBlue.shade50,
                            ),
                            CategoryCard(
                              icon: Icons.thermostat,
                              title: "Track Order",
                              subtitle: "Real-time tracking with WhatsApp and call updates",
                              bgColor: Colors.lightBlue.shade50,
                            ),
                            CategoryCard(
                              icon: Icons.favorite_border,
                              title: "Verify Medicine",
                              subtitle: "Check authenticity verification system",
                              bgColor: Colors.lightBlue.shade50,
                            ),
                          ],
                        )
                            : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CategoryCard(
                              icon: Icons.monitor_heart,
                              title: "Order Medicine",
                              subtitle: "Upload prescription and order with ease",
                              bgColor: Colors.lightBlue.shade50,
                            ),
                            CategoryCard(
                              icon: Icons.thermostat,
                              title: "Track Order",
                              subtitle: "Real-time tracking with WhatsApp and call updates",
                              bgColor: Colors.lightBlue.shade50,
                            ),
                            CategoryCard(
                              icon: Icons.favorite_border,
                              title: "Verify Medicine",
                              subtitle: "Check authenticity verification system",
                              bgColor: Colors.lightBlue.shade50,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Sizes.spaceHeight35,
                  Center(
                    child: Text(
                      "Why Choose MediCare?",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                  ),
                  Sizes.spaceHeight10,
                  Center(
                    child: Text(
                      "We prioritize your health and safety with our trusted and reliable services",
                      style: TextStyle(fontSize: 18, color: Colors.black45),
                    ),
                  ),
                  Sizes.spaceHeight35,
                  FeaturesSection(),
                  Sizes.spaceHeight10,
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                    decoration: BoxDecoration(color: AppColor.blueColor),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        bool isMobile = constraints.maxWidth < 600;
                        return isMobile
                            ? Column(
                          children: [
                            _buildStatItem("50,000+", "Happy Customers"),
                            const SizedBox(height: 30),
                            _buildStatItem("99.9%", "Delivery Success"),
                            const SizedBox(height: 30),
                            _buildStatItem("24/7", "Support Available"),
                            const SizedBox(height: 30),
                            _buildStatItem("100%", "Verified Medicines"),
                          ],
                        )
                            : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatItem("50,000+", "Happy Customers"),
                            _buildStatItem("99.9%", "Delivery Success"),
                            _buildStatItem("24/7", "Support Available"),
                            _buildStatItem("100%", "Verified Medicines"),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Text(
                          "Ready to Get Started?",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Join thousands of satisfied customers who trust MediCare for their healthcare needs",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              height: Sizes.screenHeight * 0.075,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.blueColor,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.add_shopping_cart_sharp, color: AppColor.whiteColor),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Order Medicine",
                                    style: TextStyle(
                                      color: AppColor.whiteColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: Sizes.screenWidth * 0.03),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              height: Sizes.screenHeight * 0.075,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.whiteColor,
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.add_shopping_cart_sharp, color: AppColor.whiteColor),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Order Medicine",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],

                // ABOUT SECTION
                if (activeSection == "about") ...[
                  AboutUsScreen(),
                ],

                // SERVICES SECTION
                if (activeSection == "services") ...[
                  ServicesScreen()
                  // Add services content here
                ],

                // CONTACT SECTION
                if (activeSection == "contact") ...[
                  ContactScreen()
                ],
              ],
            ),
          )

          // Expanded(
          //   child: ListView(
          //     children: [
          //       if (activeSection == "home") ...[
          //         SizedBox(height: 650, child: DashboardBody()),
          //         // _homeSection(),
          //       ],
          //       if (activeSection == "services") ...[
          //         // _servicesSection(),
          //       ],
          //       if (activeSection == "about") ...[
          //         AboutUsScreen()
          //       ],
          //       if (activeSection == "contact") ...[
          //         // _contactSection(),
          //       ],
          //       // SizedBox(height: 650, child: DashboardBody()),
          //       Sizes.spaceHeight30,
          //       Center(
          //         child: Text(
          //           "Our Services",
          //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          //         ),
          //       ),
          //       Sizes.spaceHeight10,
          //       Center(
          //         child: Text(
          //           "Experience seamless healthcare services with our comprehensive platform",
          //           style: TextStyle(fontSize: 18, color: Colors.black45),
          //         ),
          //       ),
          //       Sizes.spaceHeight10,
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //         child: LayoutBuilder(
          //           builder: (context, constraints) {
          //             bool isMobile = constraints.maxWidth < 600;
          //
          //             return isMobile
          //                 ? Column(
          //               children: [
          //                 CategoryCard(
          //                   icon: Icons.monitor_heart,
          //                   title: "Order Medicine",
          //                   subtitle:
          //                   "Upload prescription and order with ease",
          //                   bgColor: Colors.lightBlue.shade50,
          //                 ),
          //                 CategoryCard(
          //                   icon: Icons.thermostat,
          //                   title: "Track Order",
          //                   subtitle:
          //                   "Real-time tracking with WhatsApp and call updates",
          //                   bgColor: Colors.lightBlue.shade50,
          //                 ),
          //                 CategoryCard(
          //                   icon: Icons.favorite_border,
          //                   title: "Verify Medicine",
          //                   subtitle: "Check authenticity verification system",
          //                   bgColor: Colors.lightBlue.shade50,
          //                 ),
          //               ],
          //             )
          //                 : Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 CategoryCard(
          //                   icon: Icons.monitor_heart,
          //                   title: "Order Medicine",
          //                   subtitle:
          //                   "Upload prescription and order  with ease",
          //                   bgColor: Colors.lightBlue.shade50,
          //                 ),
          //                 CategoryCard(
          //                   icon: Icons.thermostat,
          //                   title: "Track Order",
          //                   subtitle:
          //                   "Real-time tracking with WhatsApp and call updates",
          //                   bgColor: Colors.lightBlue.shade50,
          //                 ),
          //                 CategoryCard(
          //                   icon: Icons.favorite_border,
          //                   title: "Verify Medicine",
          //                   subtitle: "Check authenticity verification system",
          //                   bgColor: Colors.lightBlue.shade50,
          //                 ),
          //               ],
          //             );
          //           },
          //         ),
          //       ),
          //
          //       Sizes.spaceHeight35,
          //       Center(
          //         child: Text(
          //           "Why Choose MediCare?",
          //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          //         ),
          //       ),
          //       Sizes.spaceHeight10,
          //       Center(
          //         child: Text(
          //           "We prioritize your health and safety with our trusted and reliable services",
          //           style: TextStyle(fontSize: 18, color: Colors.black45),
          //         ),
          //       ),
          //       Sizes.spaceHeight35,
          //       FeaturesSection(),
          //       Sizes.spaceHeight10,
          //       // CTASection()
          //       Container(
          //         width: double.infinity,
          //         padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          //         decoration: BoxDecoration(
          //           color: AppColor.blueColor,
          //           // gradient: LinearGradient(
          //           //   colors: [Colors.blue.shade600, Colors.blue.shade400],
          //           //   begin: Alignment.topLeft,
          //           //   end: Alignment.bottomRight,
          //           // ),
          //         ),
          //         child: LayoutBuilder(
          //           builder: (context, constraints) {
          //             bool isMobile = constraints.maxWidth < 600;
          //
          //             return isMobile
          //                 ? Column(
          //               children: [
          //                 _buildStatItem("50,000+", "Happy Customers"),
          //                 const SizedBox(height: 30),
          //                 _buildStatItem("99.9%", "Delivery Success"),
          //                 const SizedBox(height: 30),
          //                 _buildStatItem("24/7", "Support Available"),
          //                 const SizedBox(height: 30),
          //                 _buildStatItem("100%", "Verified Medicines"),
          //               ],
          //             )
          //                 : Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 _buildStatItem("50,000+", "Happy Customers"),
          //                 _buildStatItem("99.9%", "Delivery Success"),
          //                 _buildStatItem("24/7", "Support Available"),
          //                 _buildStatItem("100%", "Verified Medicines"),
          //               ],
          //             );
          //           },
          //         ),
          //       ),
          //       Container(
          //         width: double.infinity,
          //         padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          //         color: Colors.white,
          //         child: Column(
          //           children: [
          //             const Text(
          //               "Ready to Get Started?",
          //               style: TextStyle(
          //                 fontSize: 36,
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.black87,
          //               ),
          //               textAlign: TextAlign.center,
          //             ),
          //             const SizedBox(height: 16),
          //             const Text(
          //               "Join thousands of satisfied customers who trust MediCare for their healthcare needs",
          //               style: TextStyle(
          //                 fontSize: 18,
          //                 color: Colors.black54,
          //               ),
          //               textAlign: TextAlign.center,
          //             ),
          //             const SizedBox(height: 20),
          //             Center(
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Container(
          //                     alignment: Alignment.center,
          //                     padding:
          //                     const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          //                     height: Sizes.screenHeight * 0.075,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(10),
          //                       color: AppColor.blueColor,
          //                     ),
          //                     child: Row(
          //                       mainAxisSize: MainAxisSize.min,
          //                       children: [
          //                         Icon(Icons.add_shopping_cart_sharp,
          //                             color: AppColor.whiteColor),
          //                         const SizedBox(width: 6),
          //                         Text(
          //                           "Order Medicine",
          //                           style: TextStyle(
          //                             color: AppColor.whiteColor,
          //                             fontWeight: FontWeight.w500,
          //                             // fontSize: isMobile ? 14 : 16,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   SizedBox(width: Sizes.screenWidth*0.03,),
          //                   Container(
          //                     alignment: Alignment.center,
          //                     padding:
          //                     const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          //                     height: Sizes.screenHeight * 0.075,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(10),
          //                       color: AppColor.whiteColor,
          //                       border: Border.all(color: Colors.grey.shade200)
          //                     ),
          //                     child: Row(
          //                       mainAxisSize: MainAxisSize.min,
          //                       children: [
          //                         Icon(Icons.add_shopping_cart_sharp,
          //                             color: AppColor.whiteColor),
          //                         const SizedBox(width: 6),
          //                         Text(
          //                           "Order Medicine",
          //                           style: TextStyle(
          //                             color: Colors.black,
          //                             fontWeight: FontWeight.bold,
          //                             // fontSize: isMobile ? 14 : 16,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color bgColor;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.bgColor,
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
                    fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                widget.subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.3, // line spacing thoda balanced lagega
                ),
                textAlign: TextAlign.center, // 👈 horizontally center
                maxLines: 2, // 👈 2 line tak allow karega
                softWrap: true, // 👈 text ko wrap hone dega
                overflow: TextOverflow.visible, // 👈 pura text dikhaye (ellipsis nahi)
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                height: Sizes.screenHeight * 0.06,
                width: MediaQuery.of(context).size.width < 600
                    ? double.infinity
                    : Sizes.screenWidth * 0.1, // mobile me full width
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
