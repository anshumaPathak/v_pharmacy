// // // import 'package:flutter/material.dart';
// // // import 'package:v_pharmashing/res/sizing_const.dart';
// // // import 'package:v_pharmashing/view/services_order_widget.dart';
// // // import '../l10n/app_localizations.dart';
// // // import '../res/const_color.dart';
// // // import 'about_widget/order_track_screen_services.dart';
// // // import 'about_widget/service_order_process.dart';
// // // import 'about_widget/service_verified_order_screen.dart';
// // //
// // // class ServicesScreen extends StatefulWidget {
// // //   final String? subSection;
// // //   const ServicesScreen({super.key, this.subSection});
// // //
// // //   @override
// // //   State<ServicesScreen> createState() => _ServicesScreenState();
// // // }
// // //
// // // class _ServicesScreenState extends State<ServicesScreen> {
// // //   int _selectedIndex = 0;
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final List<Map<String, dynamic>> serviceDetails = [
// // //       {
// // //         "title": AppLocalizations.of(context)!.orderMedicine,
// // //         "desc": AppLocalizations.of(context)!
// // //             .uploadPrescriptionAndOrderVerifiedMedicines,
// // //         "features": [
// // //           AppLocalizations.of(context)!.featureCategorySelection,
// // //           AppLocalizations.of(context)!.featurePrescriptionUpload,
// // //           AppLocalizations.of(context)!.featureWhatsAppUpdates,
// // //           AppLocalizations.of(context)!.featureSecurePayment,
// // //         ],
// // //       },
// // //       {
// // //         "title": AppLocalizations.of(context)!.trackOrder,
// // //         "desc": AppLocalizations.of(context)!
// // //             .realTimeOrderTrackingAndStatusUpdates,
// // //         "features": [
// // //           AppLocalizations.of(context)!.featureRealTimeOrder,
// // //           AppLocalizations.of(context)!.featureAdminVerification,
// // //           AppLocalizations.of(context)!.featurePriceConfirmation,
// // //           AppLocalizations.of(context)!.featureDeliveryTracking,
// // //         ],
// // //       },
// // //       {
// // //         "title": AppLocalizations.of(context)!.verifyMedicine,
// // //         "desc": AppLocalizations.of(context)!
// // //             .checkMedicineAuthenticityAndGenuineness,
// // //         "features": [
// // //           AppLocalizations.of(context)!.featureBarcodeScanning,
// // //           AppLocalizations.of(context)!.featureMedicineDetails,
// // //           AppLocalizations.of(context)!.featureAuthenticityConfirmation,
// // //           AppLocalizations.of(context)!.featureCounterfeitDetection,
// // //         ],
// // //       },
// // //     ];
// // //
// // //     final isMobile = MediaQuery.of(context).size.width < 700;
// // //
// // //     return SingleChildScrollView(
// // //       child: Column(
// // //         children: [
// // //           Container(
// // //             padding: EdgeInsets.symmetric(
// // //               horizontal: isMobile ? 16 : 80,
// // //               vertical: isMobile ? 30 : 60,
// // //             ),
// // //             decoration: BoxDecoration(
// // //               gradient: LinearGradient(
// // //                 colors: [
// // //                   AppColor.lightBlueColor,
// // //                   AppColor.lightBlueColor.withOpacity(0.8),
// // //                 ],
// // //                 begin: Alignment.topCenter,
// // //                 end: Alignment.bottomCenter,
// // //               ),
// // //             ),
// // //             child: Column(
// // //               children: [
// // //                 SizedBox(height: Sizes.screenHeight * 0.02),
// // //                 TweenAnimationBuilder(
// // //                   duration: const Duration(milliseconds: 800),
// // //                   tween: Tween<double>(begin: 0, end: 1),
// // //                   builder: (context, value, child) {
// // //                     return Opacity(
// // //                       opacity: value,
// // //                       child: Transform.translate(
// // //                         offset: Offset(0, 20 * (1 - value)),
// // //                         child: child,
// // //                       ),
// // //                     );
// // //                   },
// // //                   child: RichText(
// // //                     textAlign: TextAlign.center,
// // //                     text: TextSpan(
// // //                       style: TextStyle(
// // //                         fontSize: 42,
// // //                         fontWeight: FontWeight.w700,
// // //                         height: 1.2,
// // //                       ),
// // //                       children: [
// // //                         TextSpan(
// // //                           text: AppLocalizations.of(context)!.our,
// // //                           style: TextStyle(color: Colors.black),
// // //                         ),
// // //                         const WidgetSpan(
// // //                           child: SizedBox(width: 10),
// // //                         ),
// // //                         TextSpan(
// // //                           text: AppLocalizations.of(context)!.services,
// // //                           style: TextStyle(color: Color(0xFF2563EB)),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 20),
// // //                 Padding(
// // //                   padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
// // //                   child: Text(
// // //                     AppLocalizations.of(context)!.comprehensiveHealthcareServicesDesignedTo,
// // //                     textAlign: TextAlign.center,
// // //                     style: TextStyle(
// // //                       fontSize: isMobile ? 16 : 18,
// // //                       color: Colors.grey[700],
// // //                       height: 1.6,
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 50),
// // //                 LayoutBuilder(
// // //                   builder: (context, constraints) {
// // //                     final isMobile = constraints.maxWidth < 700;
// // //                     final double cardHeight = 260; // Sab cards ka same height
// // //
// // //                     final serviceCards = [
// // //                       GestureDetector(
// // //                         onTap: () => setState(() => _selectedIndex = 0),
// // //                         child: _ServiceCard(
// // //                           icon: Icons.shopping_cart_rounded,
// // //                           iconColor: const Color(0xFF2563EB),
// // //                           iconBgColor: const Color(0xFFDCE7FF),
// // //                           title: AppLocalizations.of(context)!.orderMedicine,
// // //                           description: AppLocalizations.of(context)!.uploadPrescriptionAndOrderVerifiedMedicines,
// // //                           isSelected: _selectedIndex == 0,
// // //                           delay: 0,
// // //                         ),
// // //                       ),
// // //                       GestureDetector(
// // //                         onTap: () => setState(() => _selectedIndex = 1),
// // //                         child: _ServiceCard(
// // //                           icon: Icons.local_shipping_rounded,
// // //                           iconColor: const Color(0xFF2563EB),
// // //                           iconBgColor: const Color(0xFFDCE7FF),
// // //                           title: AppLocalizations.of(context)!.trackOrder,
// // //                           description: AppLocalizations.of(context)!.realTimeOrderTrackingAndStatusUpdates,
// // //                           isSelected: _selectedIndex == 1,
// // //                           delay: 200,
// // //                         ),
// // //                       ),
// // //                       GestureDetector(
// // //                         onTap: () => setState(() => _selectedIndex = 2),
// // //                         child: _ServiceCard(
// // //                           icon: Icons.verified_rounded,
// // //                           iconColor: const Color(0xFF2563EB),
// // //                           iconBgColor: const Color(0xFFDCE7FF),
// // //                           title: AppLocalizations.of(context)!.verifyMedicine,
// // //                           description: AppLocalizations.of(context)!.checkMedicineAuthenticityAndGenuineness,
// // //                           isSelected: _selectedIndex == 2,
// // //                           delay: 400,
// // //                         ),
// // //                       ),
// // //                     ];
// // //
// // //                     if (isMobile) {
// // //                       return Column(
// // //                         children: serviceCards
// // //                             .map((card) => Padding(
// // //                           padding: const EdgeInsets.only(bottom: 24.0),
// // //                           child: SizedBox(
// // //                             height: cardHeight,
// // //                             child: card,
// // //                           ),
// // //                         ))
// // //                             .toList(),
// // //                       );
// // //                     } else {
// // //                       return Row(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           Expanded(
// // //                             child: SizedBox(
// // //                               height: cardHeight,
// // //                               child: serviceCards[0],
// // //                             ),
// // //                           ),
// // //                           const SizedBox(width: 24),
// // //                           Expanded(
// // //                             child: SizedBox(
// // //                               height: cardHeight,
// // //                               child: serviceCards[1],
// // //                             ),
// // //                           ),
// // //                           const SizedBox(width: 24),
// // //                           Expanded(
// // //                             child: SizedBox(
// // //                               height: cardHeight,
// // //                               child: serviceCards[2],
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       );
// // //                     }
// // //                   },
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //
// // //           const SizedBox(height: 50),
// // //           AnimatedSwitcher(
// // //             duration: const Duration(milliseconds: 400),
// // //             child: _selectedIndex == 0
// // //                 ? OrderMedicineScreen()
// // //                 : _selectedIndex == 1
// // //                 ? YourOrdersScreen()
// // //             :_selectedIndex ==2?
// // //             ServiceVerifiedOrderScreen()
// // //                 : Container(
// // //               key: const ValueKey("details"),
// // //               width: isMobile ? double.infinity : 900,
// // //               margin:
// // //               EdgeInsets.symmetric(horizontal: isMobile ? 16 : 0),
// // //               padding: const EdgeInsets.all(30),
// // //               decoration: BoxDecoration(
// // //                 color: Colors.white,
// // //                 borderRadius: BorderRadius.circular(20),
// // //                 boxShadow: [
// // //                   BoxShadow(
// // //                     color: const Color(0xFF2563EB).withOpacity(0.1),
// // //                     blurRadius: 30,
// // //                     offset: const Offset(0, 10),
// // //                   ),
// // //                 ],
// // //               ),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   Text(
// // //                     serviceDetails[_selectedIndex]["title"],
// // //                     style: const TextStyle(
// // //                         fontSize: 24,
// // //                         fontWeight: FontWeight.bold,
// // //                         color: Color(0xFF2563EB)),
// // //                   ),
// // //                   const SizedBox(height: 10),
// // //                   Text(
// // //                     serviceDetails[_selectedIndex]["desc"],
// // //                     style: TextStyle(
// // //                         fontSize: 16,
// // //                         color: Colors.grey[700],
// // //                         height: 1.6),
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //                   Text(
// // //                     AppLocalizations.of(context)!.keyFeatures,
// // //                     style: const TextStyle(
// // //                         fontSize: 18,
// // //                         fontWeight: FontWeight.w600),
// // //                   ),
// // //                   const SizedBox(height: 10),
// // //                   ...List.generate(
// // //                     serviceDetails[_selectedIndex]["features"].length,
// // //                         (index) => Padding(
// // //                       padding:
// // //                       const EdgeInsets.symmetric(vertical: 6),
// // //                       child: Row(
// // //                         children: [
// // //                           const Icon(Icons.check_circle,
// // //                               color: Colors.green, size: 18),
// // //                           const SizedBox(width: 10),
// // //                           Expanded(
// // //                             child: Text(
// // //                               serviceDetails[_selectedIndex]
// // //                               ["features"][index],
// // //                               style: TextStyle(
// // //                                   fontSize: 15,
// // //                                   color: Colors.grey[700]),
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //
// // //           const SizedBox(height: 40),
// // //           ServiceOrderProcess(),
// // //           // const SizedBox(height: 40),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // import 'package:flutter/material.dart';
// // import 'package:v_pharmashing/res/sizing_const.dart';
// // import 'package:v_pharmashing/view/services_order_widget.dart';
// // import '../l10n/app_localizations.dart';
// // import '../res/const_color.dart';
// // import 'about_widget/order_track_screen_services.dart';
// // import 'about_widget/service_order_process.dart';
// // import 'about_widget/service_verified_order_screen.dart';
// //
// // class ServicesScreen extends StatefulWidget {
// //   final String? subSection; // 👈 ye already theek hai
// //   const ServicesScreen({super.key, this.subSection});
// //
// //   @override
// //   State<ServicesScreen> createState() => _ServicesScreenState();
// // }
// //
// // class _ServicesScreenState extends State<ServicesScreen> {
// //   int _selectedIndex = 0;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     // 👇 subSection ke hisaab se default section set kar do
// //     if (widget.subSection == "track") {
// //       _selectedIndex = 1;
// //     } else if (widget.subSection == "verify") {
// //       _selectedIndex = 2;
// //     } else {
// //       _selectedIndex = 0;
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final List<Map<String, dynamic>> serviceDetails = [
// //       {
// //         "title": AppLocalizations.of(context)!.orderMedicine,
// //         "desc": AppLocalizations.of(context)!
// //             .uploadPrescriptionAndOrderVerifiedMedicines,
// //         "features": [
// //           AppLocalizations.of(context)!.featureCategorySelection,
// //           AppLocalizations.of(context)!.featurePrescriptionUpload,
// //           AppLocalizations.of(context)!.featureWhatsAppUpdates,
// //           AppLocalizations.of(context)!.featureSecurePayment,
// //         ],
// //       },
// //       {
// //         "title": AppLocalizations.of(context)!.trackOrder,
// //         "desc": AppLocalizations.of(context)!
// //             .realTimeOrderTrackingAndStatusUpdates,
// //         "features": [
// //           AppLocalizations.of(context)!.featureRealTimeOrder,
// //           AppLocalizations.of(context)!.featureAdminVerification,
// //           AppLocalizations.of(context)!.featurePriceConfirmation,
// //           AppLocalizations.of(context)!.featureDeliveryTracking,
// //         ],
// //       },
// //       {
// //         "title": AppLocalizations.of(context)!.verifyMedicine,
// //         "desc": AppLocalizations.of(context)!
// //             .checkMedicineAuthenticityAndGenuineness,
// //         "features": [
// //           AppLocalizations.of(context)!.featureBarcodeScanning,
// //           AppLocalizations.of(context)!.featureMedicineDetails,
// //           AppLocalizations.of(context)!.featureAuthenticityConfirmation,
// //           AppLocalizations.of(context)!.featureCounterfeitDetection,
// //         ],
// //       },
// //     ];
// //
// //     final isMobile = MediaQuery.of(context).size.width < 700;
// //
// //     return SingleChildScrollView(
// //       child: Column(
// //         children: [
// //           Container(
// //             padding: EdgeInsets.symmetric(
// //               horizontal: isMobile ? 16 : 80,
// //               vertical: isMobile ? 30 : 60,
// //             ),
// //             decoration: BoxDecoration(
// //               gradient: LinearGradient(
// //                 colors: [
// //                   AppColor.lightBlueColor,
// //                   AppColor.lightBlueColor.withOpacity(0.8),
// //                 ],
// //                 begin: Alignment.topCenter,
// //                 end: Alignment.bottomCenter,
// //               ),
// //             ),
// //             child: Column(
// //               children: [
// //                 SizedBox(height: Sizes.screenHeight * 0.02),
// //                 TweenAnimationBuilder(
// //                   duration: const Duration(milliseconds: 800),
// //                   tween: Tween<double>(begin: 0, end: 1),
// //                   builder: (context, value, child) {
// //                     return Opacity(
// //                       opacity: value,
// //                       child: Transform.translate(
// //                         offset: Offset(0, 20 * (1 - value)),
// //                         child: child,
// //                       ),
// //                     );
// //                   },
// //                   child: RichText(
// //                     textAlign: TextAlign.center,
// //                     text: TextSpan(
// //                       style: const TextStyle(
// //                         fontSize: 42,
// //                         fontWeight: FontWeight.w700,
// //                         height: 1.2,
// //                       ),
// //                       children: [
// //                         TextSpan(
// //                           text: AppLocalizations.of(context)!.our,
// //                           style: const TextStyle(color: Colors.black),
// //                         ),
// //                         const WidgetSpan(
// //                           child: SizedBox(width: 10),
// //                         ),
// //                         TextSpan(
// //                           text: AppLocalizations.of(context)!.services,
// //                           style: const TextStyle(color: Color(0xFF2563EB)),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),
// //                 Padding(
// //                   padding:
// //                   EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
// //                   child: Text(
// //                     AppLocalizations.of(context)!
// //                         .comprehensiveHealthcareServicesDesignedTo,
// //                     textAlign: TextAlign.center,
// //                     style: TextStyle(
// //                       fontSize: isMobile ? 16 : 18,
// //                       color: Colors.grey[700],
// //                       height: 1.6,
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 50),
// //                 LayoutBuilder(
// //                   builder: (context, constraints) {
// //                     final isMobile = constraints.maxWidth < 700;
// //                     const double cardHeight = 260;
// //
// //                     final serviceCards = [
// //                       GestureDetector(
// //                         onTap: () => setState(() => _selectedIndex = 0),
// //                         child: _ServiceCard(
// //                           icon: Icons.shopping_cart_rounded,
// //                           iconColor: const Color(0xFF2563EB),
// //                           iconBgColor: const Color(0xFFDCE7FF),
// //                           title: AppLocalizations.of(context)!.orderMedicine,
// //                           description: AppLocalizations.of(context)!
// //                               .uploadPrescriptionAndOrderVerifiedMedicines,
// //                           isSelected: _selectedIndex == 0,
// //                           delay: 0,
// //                         ),
// //                       ),
// //                       GestureDetector(
// //                         onTap: () => setState(() => _selectedIndex = 1),
// //                         child: _ServiceCard(
// //                           icon: Icons.local_shipping_rounded,
// //                           iconColor: const Color(0xFF2563EB),
// //                           iconBgColor: const Color(0xFFDCE7FF),
// //                           title: AppLocalizations.of(context)!.trackOrder,
// //                           description: AppLocalizations.of(context)!
// //                               .realTimeOrderTrackingAndStatusUpdates,
// //                           isSelected: _selectedIndex == 1,
// //                           delay: 200,
// //                         ),
// //                       ),
// //                       GestureDetector(
// //                         onTap: () => setState(() => _selectedIndex = 2),
// //                         child: _ServiceCard(
// //                           icon: Icons.verified_rounded,
// //                           iconColor: const Color(0xFF2563EB),
// //                           iconBgColor: const Color(0xFFDCE7FF),
// //                           title: AppLocalizations.of(context)!.verifyMedicine,
// //                           description: AppLocalizations.of(context)!
// //                               .checkMedicineAuthenticityAndGenuineness,
// //                           isSelected: _selectedIndex == 2,
// //                           delay: 400,
// //                         ),
// //                       ),
// //                     ];
// //
// //                     if (isMobile) {
// //                       return Column(
// //                         children: serviceCards
// //                             .map((card) => Padding(
// //                           padding: const EdgeInsets.only(bottom: 24.0),
// //                           child: SizedBox(
// //                             height: cardHeight,
// //                             child: card,
// //                           ),
// //                         ))
// //                             .toList(),
// //                       );
// //                     } else {
// //                       return Row(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Expanded(
// //                               child: SizedBox(
// //                                   height: cardHeight, child: serviceCards[0])),
// //                           const SizedBox(width: 24),
// //                           Expanded(
// //                               child: SizedBox(
// //                                   height: cardHeight, child: serviceCards[1])),
// //                           const SizedBox(width: 24),
// //                           Expanded(
// //                               child: SizedBox(
// //                                   height: cardHeight, child: serviceCards[2])),
// //                         ],
// //                       );
// //                     }
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //
// //           const SizedBox(height: 50),
// //           AnimatedSwitcher(
// //             duration: const Duration(milliseconds: 400),
// //             child: _selectedIndex == 0
// //                 ? OrderMedicineScreen()
// //                 : _selectedIndex == 1
// //                 ? YourOrdersScreen()
// //                 : _selectedIndex == 2
// //                 ? ServiceVerifiedOrderScreen()
// //                 : Container(),
// //           ),
// //
// //           const SizedBox(height: 40),
// //           ServiceOrderProcess(),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class _ServiceCard extends StatefulWidget {
// //   final IconData icon;
// //   final Color iconColor;
// //   final Color iconBgColor;
// //   final String title;
// //   final String description;
// //   final bool isSelected;
// //   final int delay;
// //
// //   const _ServiceCard({
// //     required this.icon,
// //     required this.iconColor,
// //     required this.iconBgColor,
// //     required this.title,
// //     required this.description,
// //     required this.isSelected,
// //     required this.delay,
// //   });
// //
// //   @override
// //   State<_ServiceCard> createState() => _ServiceCardState();
// // }
// //
// // class _ServiceCardState extends State<_ServiceCard> {
// //   bool _isHovered = false;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return TweenAnimationBuilder(
// //       duration: Duration(milliseconds: 600 + widget.delay),
// //       tween: Tween<double>(begin: 0, end: 1),
// //       curve: Curves.easeOutCubic,
// //       builder: (context, value, child) {
// //         return Transform.scale(
// //           scale: 0.8 + (0.2 * value),
// //           child: Opacity(opacity: value, child: child),
// //         );
// //       },
// //       child: MouseRegion(
// //         onEnter: (_) => setState(() => _isHovered = true),
// //         onExit: (_) => setState(() => _isHovered = false),
// //         child: AnimatedContainer(
// //           duration: const Duration(milliseconds: 300),
// //           transform:
// //           Matrix4.translationValues(0, _isHovered ? -8.0 : 0.0, 0.0),
// //           decoration: BoxDecoration(
// //             color: Colors.white,
// //             borderRadius: BorderRadius.circular(20),
// //             border: Border.all(
// //               color: widget.isSelected
// //                   ? const Color(0xFF2563EB)
// //                   : Colors.grey.withOpacity(0.2),
// //               width: widget.isSelected ? 3 : 2,
// //             ),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: Colors.black.withOpacity(0.08),
// //                 blurRadius: 12,
// //                 offset: const Offset(0, 4),
// //               ),
// //             ],
// //           ),
// //           child: Padding(
// //             padding: const EdgeInsets.all(32),
// //             child: Column(
// //               children: [
// //                 Container(
// //                   width: 80,
// //                   height: 80,
// //                   decoration: BoxDecoration(
// //                     color: widget.isSelected
// //                         ? const Color(0xFF2563EB)
// //                         : widget.iconBgColor,
// //                     shape: BoxShape.circle,
// //                   ),
// //                   child: Icon(
// //                     widget.icon,
// //                     size: 38,
// //                     color: widget.isSelected
// //                         ? Colors.white
// //                         : widget.iconColor,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),
// //                 Text(
// //                   widget.title,
// //                   style: TextStyle(
// //                     fontSize: 20,
// //                     fontWeight: FontWeight.bold,
// //                     color:
// //                     widget.isSelected ? const Color(0xFF2563EB) : Colors.black,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 Text(
// //                   widget.description,
// //                   textAlign: TextAlign.center,
// //                   style: TextStyle(
// //                     fontSize: 15,
// //                     color: Colors.grey[600],
// //                     height: 1.5,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:v_pharmashing/res/sizing_const.dart';
// import 'package:v_pharmashing/view/services_order_widget.dart';
// import '../l10n/app_localizations.dart';
// import '../res/const_color.dart';
// import 'about_widget/order_track_screen_services.dart';
// import 'about_widget/service_order_process.dart';
// import 'about_widget/service_verified_order_screen.dart';
//
// class ServicesScreen extends StatefulWidget {
//   final String? initialSubSection;
//   const ServicesScreen({super.key, this.initialSubSection, });
//
//   @override
//   State<ServicesScreen> createState() => _ServicesScreenState();
// }
//
// class _ServicesScreenState extends State<ServicesScreen> {
//   int _selectedIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     // 👇 Default tab set according to subsection
//     if (widget.initialSubSection == "track") {
//       _selectedIndex = 1;
//     } else if (widget.initialSubSection == "verify") {
//       _selectedIndex = 2;
//     } else {
//       _selectedIndex = 0;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 700;
//
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: isMobile ? 16 : 80,
//               vertical: isMobile ? 30 : 60,
//             ),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   AppColor.lightBlueColor,
//                   AppColor.lightBlueColor.withOpacity(0.8),
//                 ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//             child: Column(
//               children: [
//                 SizedBox(height: Sizes.screenHeight * 0.02),
//                 TweenAnimationBuilder(
//                   duration: const Duration(milliseconds: 800),
//                   tween: Tween<double>(begin: 0, end: 1),
//                   builder: (context, value, child) {
//                     return Opacity(
//                       opacity: value,
//                       child: Transform.translate(
//                         offset: Offset(0, 20 * (1 - value)),
//                         child: child,
//                       ),
//                     );
//                   },
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       style: const TextStyle(
//                         fontSize: 42,
//                         fontWeight: FontWeight.w700,
//                         height: 1.2,
//                       ),
//                       children: [
//                         TextSpan(
//                           text: AppLocalizations.of(context)!.our,
//                           style: const TextStyle(color: Colors.black),
//                         ),
//                         const WidgetSpan(child: SizedBox(width: 10)),
//                         TextSpan(
//                           text: AppLocalizations.of(context)!.services,
//                           style:
//                           const TextStyle(color: Color(0xFF2563EB)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding:
//                   EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
//                   child: Text(
//                     AppLocalizations.of(context)!
//                         .comprehensiveHealthcareServicesDesignedTo,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: isMobile ? 16 : 18,
//                       color: Colors.grey[700],
//                       height: 1.6,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 LayoutBuilder(
//                   builder: (context, constraints) {
//                     final isMobile = constraints.maxWidth < 700;
//                     const double cardHeight = 260;
//
//                     final serviceCards = [
//                       GestureDetector(
//                         onTap: () => setState(() => _selectedIndex = 0),
//                         child: _ServiceCard(
//                           icon: Icons.shopping_cart_rounded,
//                           iconColor: const Color(0xFF2563EB),
//                           iconBgColor: const Color(0xFFDCE7FF),
//                           title: AppLocalizations.of(context)!.orderMedicine,
//                           description: AppLocalizations.of(context)!
//                               .uploadPrescriptionAndOrderVerifiedMedicines,
//                           isSelected: _selectedIndex == 0,
//                           delay: 0,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () => setState(() => _selectedIndex = 1),
//                         child: _ServiceCard(
//                           icon: Icons.local_shipping_rounded,
//                           iconColor: const Color(0xFF2563EB),
//                           iconBgColor: const Color(0xFFDCE7FF),
//                           title: AppLocalizations.of(context)!.trackOrder,
//                           description: AppLocalizations.of(context)!
//                               .realTimeOrderTrackingAndStatusUpdates,
//                           isSelected: _selectedIndex == 1,
//                           delay: 200,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () => setState(() => _selectedIndex = 2),
//                         child: _ServiceCard(
//                           icon: Icons.verified_rounded,
//                           iconColor: const Color(0xFF2563EB),
//                           iconBgColor: const Color(0xFFDCE7FF),
//                           title: AppLocalizations.of(context)!.verifyMedicine,
//                           description: AppLocalizations.of(context)!
//                               .checkMedicineAuthenticityAndGenuineness,
//                           isSelected: _selectedIndex == 2,
//                           delay: 400,
//                         ),
//                       ),
//                     ];
//
//                     if (isMobile) {
//                       return Column(
//                         children: serviceCards
//                             .map((card) => Padding(
//                           padding:
//                           const EdgeInsets.only(bottom: 24.0),
//                           child: SizedBox(
//                             height: cardHeight,
//                             child: card,
//                           ),
//                         ))
//                             .toList(),
//                       );
//                     } else {
//                       return Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                               child: SizedBox(
//                                   height: cardHeight, child: serviceCards[0])),
//                           const SizedBox(width: 24),
//                           Expanded(
//                               child: SizedBox(
//                                   height: cardHeight, child: serviceCards[1])),
//                           const SizedBox(width: 24),
//                           Expanded(
//                               child: SizedBox(
//                                   height: cardHeight, child: serviceCards[2])),
//                         ],
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 50),
//
//           // 👇 Switch between sections dynamically
//           AnimatedSwitcher(
//             duration: const Duration(milliseconds: 400),
//             child: _selectedIndex == 0
//                 ? OrderMedicineScreen()
//                 : _selectedIndex == 1
//                 ? YourOrdersScreen()
//                 : _selectedIndex == 2
//                 ? ServiceVerifiedOrderScreen()
//                 : Container(),
//           ),
//
//           const SizedBox(height: 40),
//           ServiceOrderProcess(),
//         ],
//       ),
//     );
//   }
// }
//
// class _ServiceCard extends StatefulWidget {
//   final IconData icon;
//   final Color iconColor;
//   final Color iconBgColor;
//   final String title;
//   final String description;
//   final bool isSelected;
//   final int delay;
//
//   const _ServiceCard({
//     required this.icon,
//     required this.iconColor,
//     required this.iconBgColor,
//     required this.title,
//     required this.description,
//     required this.isSelected,
//     required this.delay,
//   });
//
//   @override
//   State<_ServiceCard> createState() => _ServiceCardState();
// }
//
// class _ServiceCardState extends State<_ServiceCard> {
//   bool _isHovered = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder(
//       duration: Duration(milliseconds: 600 + widget.delay),
//       tween: Tween<double>(begin: 0, end: 1),
//       curve: Curves.easeOutCubic,
//       builder: (context, value, child) {
//         return Transform.scale(
//           scale: 0.8 + (0.2 * value),
//           child: Opacity(opacity: value, child: child),
//         );
//       },
//       child: MouseRegion(
//         onEnter: (_) => setState(() => _isHovered = true),
//         onExit: (_) => setState(() => _isHovered = false),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           transform:
//           Matrix4.translationValues(0, _isHovered ? -8.0 : 0.0, 0.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(
//               color: widget.isSelected
//                   ? const Color(0xFF2563EB)
//                   : Colors.grey.withOpacity(0.2),
//               width: widget.isSelected ? 3 : 2,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.08),
//                 blurRadius: 12,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(32),
//             child: Column(
//               children: [
//                 Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     color: widget.isSelected
//                         ? const Color(0xFF2563EB)
//                         : widget.iconBgColor,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     widget.icon,
//                     size: 38,
//                     color: widget.isSelected
//                         ? Colors.white
//                         : widget.iconColor,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   widget.title,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: widget.isSelected
//                         ? const Color(0xFF2563EB)
//                         : Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   widget.description,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.grey[600],
//                     height: 1.5,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:v_pharmashing/view/services_order_widget.dart';
import '../l10n/app_localizations.dart';
import '../res/const_color.dart';
import '../res/sizing_const.dart';
import 'about_widget/order_track_screen_services.dart';
import 'about_widget/service_order_process.dart';
import 'about_widget/service_verified_order_screen.dart';

class ServicesScreen extends StatefulWidget {
  final String? initialSubSection; // 👈 Add this parameter

  const ServicesScreen({super.key, this.initialSubSection});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // 👇 Default tab based on subSection value
    if (widget.initialSubSection == "track") {
      _selectedIndex = 1;
    } else if (widget.initialSubSection == "verify") {
      _selectedIndex = 2;
    } else {
      _selectedIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 80,
              vertical: isMobile ? 30 : 60,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.lightBlueColor,
                  AppColor.lightBlueColor.withOpacity(0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: Sizes.screenHeight * 0.02),
                TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 800),
                  tween: Tween<double>(begin: 0, end: 1),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, 20 * (1 - value)),
                        child: child,
                      ),
                    );
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.our,
                          style: const TextStyle(color: Colors.black),
                        ),
                        const WidgetSpan(child: SizedBox(width: 10)),
                        TextSpan(
                          text: AppLocalizations.of(context)!.services,
                          style: const TextStyle(color: Color(0xFF2563EB)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
                  child: Text(
                    AppLocalizations.of(context)!
                        .comprehensiveHealthcareServicesDesignedTo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 18,
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = constraints.maxWidth < 700;
                    const double cardHeight = 260;

                    final serviceCards = [
                      GestureDetector(
                        onTap: () => setState(() => _selectedIndex = 0),
                        child: _ServiceCard(
                          icon: Icons.shopping_cart_rounded,
                          iconColor: const Color(0xFF2563EB),
                          iconBgColor: const Color(0xFFDCE7FF),
                          title: AppLocalizations.of(context)!.orderMedicine,
                          description: AppLocalizations.of(context)!
                              .uploadPrescriptionAndOrderVerifiedMedicines,
                          isSelected: _selectedIndex == 0,
                          delay: 0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _selectedIndex = 1),
                        child: _ServiceCard(
                          icon: Icons.local_shipping_rounded,
                          iconColor: const Color(0xFF2563EB),
                          iconBgColor: const Color(0xFFDCE7FF),
                          title: AppLocalizations.of(context)!.trackOrder,
                          description: AppLocalizations.of(context)!
                              .realTimeOrderTrackingAndStatusUpdates,
                          isSelected: _selectedIndex == 1,
                          delay: 200,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _selectedIndex = 2),
                        child: _ServiceCard(
                          icon: Icons.verified_rounded,
                          iconColor: const Color(0xFF2563EB),
                          iconBgColor: const Color(0xFFDCE7FF),
                          title: AppLocalizations.of(context)!.verifyMedicine,
                          description: AppLocalizations.of(context)!
                              .checkMedicineAuthenticityAndGenuineness,
                          isSelected: _selectedIndex == 2,
                          delay: 400,
                        ),
                      ),
                    ];

                    if (isMobile) {
                      return Column(
                        children: serviceCards
                            .map((card) => Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: SizedBox(
                            height: cardHeight,
                            child: card,
                          ),
                        ))
                            .toList(),
                      );
                    } else {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: SizedBox(
                                  height: cardHeight, child: serviceCards[0])),
                          const SizedBox(width: 24),
                          Expanded(
                              child: SizedBox(
                                  height: cardHeight, child: serviceCards[1])),
                          const SizedBox(width: 24),
                          Expanded(
                              child: SizedBox(
                                  height: cardHeight, child: serviceCards[2])),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),

          // 👇 Dynamic content switch
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: _selectedIndex == 0
                ? const OrderMedicineScreen()
                : _selectedIndex == 1
                ? const YourOrdersScreen()
                : _selectedIndex == 2
                ? const ServiceVerifiedOrderScreen()
                : Container(),
          ),

          const SizedBox(height: 40),
          const ServiceOrderProcess(),
        ],
      ),
    );
  }
}

/// 👇 Service card widget (can stay inside same file)
// class _ServiceCard extends StatelessWidget {
//   final IconData icon;
//   final Color iconColor;
//   final Color iconBgColor;
//   final String title;
//   final String description;
//   final bool isSelected;
//   final int delay;
//
//   const _ServiceCard({
//     required this.icon,
//     required this.iconColor,
//     required this.iconBgColor,
//     required this.title,
//     required this.description,
//     required this.isSelected,
//     required this.delay,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeOut,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.white : Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: isSelected
//             ? [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 12,
//             offset: const Offset(0, 4),
//           )
//         ]
//             : [],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: iconBgColor,
//               shape: BoxShape.circle,
//             ),
//             child: Icon(icon, color: iconColor, size: 36),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 18,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             description,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               color: Colors.grey,
//               fontSize: 14,
//               height: 1.4,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String description;
  final bool isSelected;
  final int delay;

  const _ServiceCard({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.delay,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 600 + widget.delay),
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform:
          Matrix4.translationValues(0, _isHovered ? -8.0 : 0.0, 0.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.isSelected
                  ? const Color(0xFF2563EB)
                  : Colors.grey.withOpacity(0.2),
              width: widget.isSelected ? 3 : 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: widget.isSelected
                        ? const Color(0xFF2563EB)
                        : widget.iconBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    widget.icon,
                    size: 38,
                    color: widget.isSelected
                        ? Colors.white
                        : widget.iconColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: widget.isSelected
                        ? const Color(0xFF2563EB)
                        : Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}