// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:v_pharmashing/res/sizing_const.dart';
// import 'package:v_pharmashing/utils/utils.dart';
// import 'package:v_pharmashing/view_model/contact_us_view_model.dart';
// import '../l10n/app_localizations.dart';
// import '../res/const_color.dart';
//
// class ContactScreen extends StatefulWidget {
//   const ContactScreen({super.key});
//
//   @override
//   State<ContactScreen> createState() => _ContactScreenState();
// }
//
// class _ContactScreenState extends State<ContactScreen> {
//
//   String? selectedCategory;
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _subjectController = TextEditingController();
//   final TextEditingController _messageController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final List<String> categories = [
//       AppLocalizations.of(context)!.generalInquiry,
//       AppLocalizations.of(context)!.orderIssue,
//       AppLocalizations.of(context)!.technicalSupport,
//       AppLocalizations.of(context)!.feedback,
//     ];
//     final screen = MediaQuery.of(context).size;
//
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             color: const Color(0xFFe8f2ff),
//             padding: EdgeInsets.symmetric(
//               horizontal: Sizes.screenWidth * 0.03,
//               vertical: 20,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min, // <-- content ke hisaab se height
//               children: [
//                 Text(
//                   AppLocalizations.of(context)!.getInTouch,
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   AppLocalizations.of(context)!
//                       .weHereToHelpReachOutToUsAnytimeForSupport,
//                   style: TextStyle(fontSize: 14, color: Colors.black54),
//                   textAlign: TextAlign.center,
//                 ),
//                 Text(
//                   AppLocalizations.of(context)!.medicineOrdersAndVerification,
//                   style: TextStyle(fontSize: 14, color: Colors.black54),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//
//           // ===== Contact Methods =====
//           Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: Sizes.screenWidth * 0.03, vertical: 20),
//             child: Column(
//               children: [
//                 Text(
//                   AppLocalizations.of(context)!.contactMethods,
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   AppLocalizations.of(context)!.chooseYourPreferredWayToReachUs,
//                   style: TextStyle(fontSize: 14, color: Colors.black54),
//                 ),
//                 SizedBox(height: 20),
//
//                 // ✅ Responsive Layout (Row → Column)
//                 LayoutBuilder(
//                   builder: (context, constraints) {
//                     if (constraints.maxWidth < 700) {
//                       // 📱 Mobile View
//                       return Column(
//                         children: [
//                           _contactCard(
//                             icon: Icons.whatshot_outlined,
//                             title:  AppLocalizations.of(context)!.whatsAppSupport,
//                             subtitle:  AppLocalizations.of(context)!.getInstantHelpViaWhatsApp,
//                             info: "+1-234-567-8900",
//                             buttonText:   AppLocalizations.of(context)!.chatNow,
//                             buttonColor: Colors.green,
//                           ),
//                           SizedBox(height: 20),
//                           _contactCard(
//                             icon: Icons.call,
//                             title:  AppLocalizations.of(context)!.phoneSupport,
//                             subtitle:  AppLocalizations.of(context)!.talkToOurSupportTeam,
//                             info: "+1-234-567-8900",
//                             buttonText:  AppLocalizations.of(context)!.callNow,
//                             buttonColor: Colors.blue,
//                           ),
//                           SizedBox(height: 20),
//                           _contactCard(
//                             icon: Icons.email,
//                             title:  AppLocalizations.of(context)!.emailSupport,
//                             subtitle:   AppLocalizations.of(context)!.sendUsYourQueries,
//                             info: "support@medicare.com",
//                             buttonText:   AppLocalizations.of(context)!.sendEmail,
//                             buttonColor: Colors.purple,
//                           ),
//                         ],
//                       );
//                     } else {
//                       // 💻 Desktop View
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           _contactCard(
//                             icon: Icons.whatshot_outlined,
//                             title:   AppLocalizations.of(context)!.whatsAppSupport,
//                             subtitle:   AppLocalizations.of(context)!.getInstantHelpViaWhatsApp,
//                             info: "+1-234-567-8900",
//                             buttonText:   AppLocalizations.of(context)!.chatNow,
//                             buttonColor: Colors.green,
//                           ),
//                           _contactCard(
//                             icon: Icons.call,
//                             title:  AppLocalizations.of(context)!.phoneSupport,
//                             subtitle:   AppLocalizations.of(context)!.talkToOurSupportTeam,
//                             info: "+1-234-567-8900",
//                             buttonText:   AppLocalizations.of(context)!.callNow,
//                             buttonColor: Colors.blue,
//                           ),
//                           _contactCard(
//                             icon: Icons.email,
//                             title:   AppLocalizations.of(context)!.emailSupport,
//                             subtitle:   AppLocalizations.of(context)!.sendUsYourQueries,
//                             info: "support@medicare.com",
//                             buttonText:   AppLocalizations.of(context)!.sendEmail,
//                             buttonColor: Colors.purple,
//                           ),
//                         ],
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//
//           // ===== Contact Form Section =====
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//             child: Column(
//               children: [
//                 Text(
//                   AppLocalizations.of(context)!.sendUsAMessage,
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   AppLocalizations.of(context)!.fillOutTheFormBelowAndWeGetBackToYouWithin24Hours,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.black54, fontSize: 14),
//                 ),
//                 SizedBox(height: 40),
//
//                 // ===== Form Card =====
//                 Container(
//                   width: screen.width < 700 ? double.infinity : 900,
//                   padding: const EdgeInsets.all(30),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 10,
//                         spreadRadius: 3,
//                         offset: Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Row 1 - Full Name & Email
//                       screen.width < 700
//                           ? Column(
//                         children: [
//                           _buildTextField(
//                               label: "${  AppLocalizations.of(context)!.fullName} *",
//                               hint:   AppLocalizations.of(context)!.enterYourFullName,
//                             controller: _nameController
//                           ),
//                           SizedBox(height: 20),
//                           _buildTextField(
//                               label: "${  AppLocalizations.of(context)!.emailAddress}*",
//                               hint: "your.email@example.com",
//                             controller: _emailController
//                           ),
//                         ],
//                       )
//                           : Row(
//                         children: [
//                           Expanded(
//                             child: _buildTextField(
//                               label: "${  AppLocalizations.of(context)!.fullName} *",
//                               hint:   AppLocalizations.of(context)!.enterYourFullName,
//                               controller: _nameController
//                             ),
//                           ),
//                           SizedBox(width: 20),
//                           Expanded(
//                             child: _buildTextField(
//                                 label: "${AppLocalizations.of(context)!.emailAddress}*",
//                                 hint: "your.email@example.com",
//                               controller: _emailController
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//
//                       // Row 2 - Phone & Category
//                       screen.width < 700
//                           ? Column(
//                         children: [
//                           _buildTextField(
//                               label: AppLocalizations.of(context)!.phoneNumber,
//                               hint: "+1-234-567-8900",
//                             controller: _phoneController
//                           ),
//                           SizedBox(height: 20),
//                           DropdownButtonFormField<String>(
//                             decoration: InputDecoration(
//                               labelText: "${AppLocalizations.of(context)!.category} *",
//                               border: OutlineInputBorder(
//                                   borderRadius:
//                                   BorderRadius.circular(8)),
//                             ),
//                             value: selectedCategory,
//                             items: categories
//                                 .map((cat) => DropdownMenuItem(
//                               value: cat,
//                               child: Text(cat),
//                             ))
//                                 .toList(),
//                             onChanged: (val) {
//                               setState(() {
//                                 selectedCategory = val;
//                               });
//                             },
//                           ),
//                         ],
//                       )
//                           : Row(
//                         children: [
//                           Expanded(
//                             child: _buildTextField(
//                                 label: AppLocalizations.of(context)!.phoneNumber,
//                                 hint: "+1-234-567-8900",
//                               controller: _phoneController
//                             ),
//                           ),
//                           SizedBox(width: 20),
//                           Expanded(
//                             child: DropdownButtonFormField<String>(
//                               decoration: InputDecoration(
//                                 labelText: "${AppLocalizations.of(context)!.category} *",
//                                 border: OutlineInputBorder(
//                                     borderRadius:
//                                     BorderRadius.circular(8)),
//                               ),
//                               value: selectedCategory,
//                               items: categories
//                                   .map((cat) => DropdownMenuItem(
//                                 value: cat,
//                                 child: Text(cat),
//                               ))
//                                   .toList(),
//                               onChanged: (val) {
//                                 setState(() {
//                                   selectedCategory = val;
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//
//                       _buildTextField(
//                           label: "${AppLocalizations.of(context)!.subject} *",
//                           hint:AppLocalizations.of(context)!.briefDescriptionOfYourInquiry,
//                         controller: _subjectController
//                       ),
//                       SizedBox(height: 20),
//
//                       TextFormField(
//                         controller: _messageController,
//                         maxLines: 4,
//                         decoration: InputDecoration(
//                           labelText: AppLocalizations.of(context)!.description,
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                         ),
//                       ),
//                       SizedBox(height: 25),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 48,
//                         child: ElevatedButton(
//                             onPressed: () {
//                               // ✅ Validation
//                               String name = _nameController.text.trim();
//                               String email = _emailController.text.trim();
//                               String phone = _phoneController.text.trim();
//                               String subject = _subjectController.text.trim();
//                               String message = _messageController.text.trim();
//
//                               final emailRegex =
//                               RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//
//                               if (name.isEmpty ||
//                                   phone.isEmpty ||
//                                   subject.isEmpty ||
//                                   message.isEmpty ||
//                                   selectedCategory == null ||
//                                   selectedCategory!.isEmpty) {
//                                    Utils.show('Please fill all required fields',context);
//
//                                 return;
//                               }
//
//                               if (email.isNotEmpty && !emailRegex.hasMatch(email)) {
//                                 Utils.show("Please enter a valid email address", context);
//
//                                 return;
//                               }
//
//                               if (phone.length != 10) {
//                                 Utils.show("Please enter a valid 10-digit phone number", context);
//
//                                 return;
//                               }
//
//                               // 🔹 API call
//                               final contactUsViewModel =
//                               Provider.of<ContactUsViewModel>(context, listen: false);
//
//                               contactUsViewModel.contactUsApi(
//                                 name,
//                                 email,
//                                 phone,
//                                 selectedCategory!,
//                                 subject,
//                                 message,
//                                 context,
//                               );
//                             },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8)),
//                           ),
//                           child: Text(
//                             AppLocalizations.of(context)!.submitMessage,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           Container(
//             width: double.infinity,
//             color: AppColor.blueColor,
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
//             child: Column(
//               children: [
//                 Text(
//                   AppLocalizations.of(context)!.ourSupportHours,
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 LayoutBuilder(
//                   builder: (context, constraints) {
//                     if (constraints.maxWidth < 700) {
//                       return Column(
//                         children: [
//                           _supportHourCard(
//                             icon: Icons.access_time,
//                             title: AppLocalizations.of(context)!.whatsAppSupport,
//                             timing: "${AppLocalizations.of(context)!.available} 24/7",
//                           ),
//                           SizedBox(height: 40),
//                           _supportHourCard(
//                             icon: Icons.headset_mic,
//                             title: AppLocalizations.of(context)!.phoneSupport,
//                             timing: "24/7 ${AppLocalizations.of(context)!.emergency}",
//                           ),
//                           SizedBox(height: 40),
//                           _supportHourCard(
//                             icon: Icons.people,
//                             title: AppLocalizations.of(context)!.liveChat,
//                             timing: "9 AM - 9 PM ${AppLocalizations.of(context)!.daily}",
//                           ),
//                         ],
//                       );
//                     } else {
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           _supportHourCard(
//                             icon: Icons.access_time,
//                             title: AppLocalizations.of(context)!.whatsAppSupport,
//                             timing: "${AppLocalizations.of(context)!.available} 24/7",
//                           ),
//                           _supportHourCard(
//                             icon: Icons.headset_mic,
//                             title: AppLocalizations.of(context)!.phoneSupport,
//                             timing: "24/7 ${AppLocalizations.of(context)!.emergency}",
//                           ),
//                           _supportHourCard(
//                             icon: Icons.people,
//                             title: AppLocalizations.of(context)!.liveChat,
//                             timing: "9 AM - 9 PM ${AppLocalizations.of(context)!.daily}",
//                           ),
//                         ],
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 50),
//           LayoutBuilder(
//             builder: (context, constraints) {
//               bool isMobile = constraints.maxWidth < 700; // adjust breakpoint if needed
//
//               return Container(
//                 width: isMobile ? double.infinity : 900,
//                 padding: const EdgeInsets.all(40),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(color: Colors.grey.shade200),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.08),
//                       blurRadius: 10,
//                       spreadRadius: 2,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: isMobile
//                     ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Left Side (Address & Hours)
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Address
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: Colors.blue.shade50,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(Icons.location_on,
//                                   color: Colors.blue, size: 24),
//                             ),
//                             const SizedBox(width: 15),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children:  [
//                                 Text(AppLocalizations.of(context)!.address,
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold)),
//                                 SizedBox(height: 8),
//                                 Text("123 ${AppLocalizations.of(context)!.healthcareAvenue}",
//                                     style: TextStyle(
//                                         fontSize: 14, color: Colors.black87)),
//                                 Text(AppLocalizations.of(context)!.medicalDistrict,
//                                     style: TextStyle(
//                                         fontSize: 14, color: Colors.black87)),
//                                 Text("${AppLocalizations.of(context)!.newYork} 10001",
//                                     style: TextStyle(
//                                         fontSize: 14, color: Colors.black87)),
//                                 Text(AppLocalizations.of(context)!.unitedStates,
//                                     style: TextStyle(
//                                         fontSize: 14, color: Colors.black87)),
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 30),
//                         // Office Hours
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: Colors.blue.shade50,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(Icons.access_time,
//                                   color: Colors.blue, size: 24),
//                             ),
//                             const SizedBox(width: 15),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children:  [
//                                 Text(AppLocalizations.of(context)!.officeHours,
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold)),
//                                 SizedBox(height: 8),
//                                 Text("${AppLocalizations.of(context)!.mondayFriday}: 9:00 AM - 6:00 PM",
//                                     style: TextStyle(
//                                         fontSize: 14, color: Colors.black87)),
//                                 Text("${AppLocalizations.of(context)!.saturday}: 10:00 AM - 4:00 PM",
//                                     style: TextStyle(
//                                         fontSize: 14, color: Colors.black87)),
//                                 Text(AppLocalizations.of(context)!.sundayClosed,
//                                     style: TextStyle(
//                                         fontSize: 14, color: Colors.black87)),
//                                 SizedBox(height: 8),
//                                 Text("${AppLocalizations.of(context)!.emergency}: 24/7",
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.blue,
//                                         fontWeight: FontWeight.bold)),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 30),
//                     // Map below in mobile
//                     Container(
//                       width: double.infinity,
//                       height: 300,
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade100,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.location_on,
//                               size: 80, color: Colors.grey.shade400),
//                           const SizedBox(height: 10),
//                            Text(
//                                AppLocalizations.of(context)!.interactiveMap,
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black54),
//                           ),
//                           const SizedBox(height: 5),
//                            Text(
//                                AppLocalizations.of(context)!.clickToViewLocation,
//                             style:
//                             TextStyle(fontSize: 12, color: Colors.black45),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )
//                     : Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Left
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Address
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   color: Colors.blue.shade50,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const Icon(Icons.location_on,
//                                     color: Colors.blue, size: 24),
//                               ),
//                               const SizedBox(width: 15),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children:  [
//                                   Text(AppLocalizations.of(context)!.address,
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold)),
//                                   SizedBox(height: 8),
//                                   Text("123 ${AppLocalizations.of(context)!.healthcareAvenue}",
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87)),
//                                   Text(AppLocalizations.of(context)!.medicalDistrict,
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87)),
//                                   Text("${AppLocalizations.of(context)!.newYork} 10001",
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87)),
//                                   Text(AppLocalizations.of(context)!.unitedStates,
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87)),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 30),
//                           // Office Hours
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   color: Colors.blue.shade50,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const Icon(Icons.access_time,
//                                     color: Colors.blue, size: 24),
//                               ),
//                               const SizedBox(width: 15),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(AppLocalizations.of(context)!.officeHours,
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold)),
//                                   SizedBox(height: 8),
//                                   Text("${AppLocalizations.of(context)!.mondayFriday}: 9:00 AM - 6:00 PM",
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87)),
//                                   Text("${AppLocalizations.of(context)!.saturday}: 10:00 AM - 4:00 PM",
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87)),
//                                   Text(AppLocalizations.of(context)!.sundayClosed,
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87)),
//                                   SizedBox(height: 8),
//                                   Text("${AppLocalizations.of(context)!.emergency}: 24/7",
//                                       style: TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.blue,
//                                           fontWeight: FontWeight.bold)),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 40),
//                     // Map on Right
//                     Container(
//                       width: 350,
//                       height: 300,
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade100,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.location_on,
//                               size: 80, color: Colors.grey.shade400),
//                           const SizedBox(height: 10),
//                            Text(
//                              AppLocalizations.of(context)!.interactiveMap,
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black54),
//                           ),
//                           const SizedBox(height: 5),
//                            Text(
//                              AppLocalizations.of(context)!.clickToViewLocation,
//                             style:
//                             TextStyle(fontSize: 12, color: Colors.black45),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//
//           SizedBox(height: 30),
//         ],
//       ),
//     );
//   }
//
//   // ====== Reusable TextField ======
//   Widget _buildTextField({required String label, required String hint, TextEditingController? controller}) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: label,
//         hintText: hint,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//     );
//   }
//
//   Widget _contactCard({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required String info,
//     required String buttonText,
//     required Color buttonColor,
//   }) {
//     return Container(
//       width: 260,
//       height: 270,
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.blue.shade100),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundColor: Colors.blue.shade100,
//             child: Icon(icon, color: Colors.blue),
//           ),
//           Text(title,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//           Text(subtitle,
//               textAlign: TextAlign.center,
//               style: const TextStyle(color: Colors.black54, fontSize: 12)),
//           Text(info,
//               textAlign: TextAlign.center,
//               style: const TextStyle(color: Colors.blue)),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.03),
//             child: Builder(
//               builder: (context) {
//                 return ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: buttonColor,
//                     minimumSize: const Size(double.infinity, 50),
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   onPressed: () {
//                     // ✅ Validation
//                     //   String name = _nameController.text.trim();
//                     //   String email = _emailController.text.trim();
//                     //   String phone = _phoneController.text.trim();
//                     //   String subject = _subjectController.text.trim();
//                     //   String message = _messageController.text.trim();
//                     //
//                     //   final emailRegex =
//                     //   RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//                     //
//                     //   if (name.isEmpty ||
//                     //       phone.isEmpty ||
//                     //       subject.isEmpty ||
//                     //       message.isEmpty ||
//                     //       selectedCategory == null ||
//                     //       selectedCategory!.isEmpty) {
//                     //     ScaffoldMessenger.of(context).showSnackBar(
//                     //       const SnackBar(
//                     //         content: Text('Please fill all required fields'),
//                     //         duration: Duration(seconds: 2),
//                     //       ),
//                     //     );
//                     //     return;
//                     //   }
//                     //
//                     //   if (email.isNotEmpty && !emailRegex.hasMatch(email)) {
//                     //     ScaffoldMessenger.of(context).showSnackBar(
//                     //       const SnackBar(
//                     //         content: Text('Please enter a valid email address'),
//                     //         duration: Duration(seconds: 2),
//                     //       ),
//                     //     );
//                     //     return;
//                     //   }
//                     //
//                     //   if (phone.length != 10) {
//                     //     ScaffoldMessenger.of(context).showSnackBar(
//                     //       const SnackBar(
//                     //         content:
//                     //         Text('Please enter a valid 10-digit phone number'),
//                     //         duration: Duration(seconds: 2),
//                     //       ),
//                     //     );
//                     //     return;
//                     //   }
//                     //
//                     //   // 🔹 API call
//                     //   final contactUsViewModel =
//                     //   Provider.of<ContactUsViewModel>(context, listen: false);
//                     //
//                     //   contactUsViewModel.contactUsApi(
//                     //     name,
//                     //     email,
//                     //     phone,
//                     //     selectedCategory!,
//                     //     subject,
//                     //     message,
//                     //     context,
//                     //   );
//                     // },
//                   },
//                   child: Text(
//                     buttonText,
//                     style: const TextStyle(color: Colors.white, fontSize: 14),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _supportHourCard({
//     required IconData icon,
//     required String title,
//     required String timing,
//   }) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.15),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//             icon,
//             color: Colors.white,
//             size: 50,
//           ),
//         ),
//         SizedBox(height: 20),
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           timing,
//           style: TextStyle(
//             fontSize: 15,
//             color: Colors.white.withOpacity(0.9),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v_pharmashing/res/sizing_const.dart';
import 'package:v_pharmashing/utils/utils.dart';
import 'package:v_pharmashing/view_model/contact_us_view_model.dart';
import '../l10n/app_localizations.dart';
import '../res/const_color.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  String? selectedCategory;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  // Add this state variable to track form submission status
  bool _isFormSubmitted = false;
  String _referenceId = "";

  // Method to generate random reference ID
  String _generateReferenceId() {
    final random = DateTime.now().millisecondsSinceEpoch % 10000;
    return "#MSG-$random";
  }

  // Method to handle form submission
  void _submitForm(BuildContext context) {
    // ✅ Validation
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();
    String subject = _subjectController.text.trim();
    String message = _messageController.text.trim();

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (name.isEmpty ||
        phone.isEmpty ||
        subject.isEmpty ||
        message.isEmpty ||
        selectedCategory == null ||
        selectedCategory!.isEmpty) {
      Utils.show('Please fill all required fields', context);
      return;
    }

    if (email.isNotEmpty && !emailRegex.hasMatch(email)) {
      Utils.show("Please enter a valid email address", context);
      return;
    }

    if (phone.length != 10) {
      Utils.show("Please enter a valid 10-digit phone number", context);
      return;
    }

    // 🔹 API call
    final contactUsViewModel = Provider.of<ContactUsViewModel>(context, listen: false);

    // Show loading or process the API call
    contactUsViewModel.contactUsApi(
      name,
      email,
      phone,
      selectedCategory!,
      subject,
      message,
      context,
    ).then((_) {
      // On successful API call, show success message
      setState(() {
        _isFormSubmitted = true;
        _referenceId = _generateReferenceId();
      });
    }).catchError((error) {
      // Handle API error if needed
      Utils.show("Failed to send message. Please try again.", context);
    });
  }

  // Method to reset form and show form again
  void _resetForm() {
    setState(() {
      _isFormSubmitted = false;
      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _subjectController.clear();
      _messageController.clear();
      selectedCategory = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      AppLocalizations.of(context)!.generalInquiry,
      AppLocalizations.of(context)!.orderIssue,
      AppLocalizations.of(context)!.technicalSupport,
      AppLocalizations.of(context)!.feedback,
    ];
    final screen = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: const Color(0xFFe8f2ff),
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.screenWidth * 0.03,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!.getInTouch,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context)!
                      .weHereToHelpReachOutToUsAnytimeForSupport,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                Text(
                  AppLocalizations.of(context)!.medicineOrdersAndVerification,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // ===== Contact Methods =====
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Sizes.screenWidth * 0.03, vertical: 20),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.contactMethods,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  AppLocalizations.of(context)!.chooseYourPreferredWayToReachUs,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 20),

                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 700) {
                      return Column(
                        children: [
                          _contactCard(
                            icon: Icons.whatshot_outlined,
                            title:  AppLocalizations.of(context)!.whatsAppSupport,
                            subtitle:  AppLocalizations.of(context)!.getInstantHelpViaWhatsApp,
                            info: "+1-234-567-8900",
                            buttonText:   AppLocalizations.of(context)!.chatNow,
                            buttonColor: Colors.green,
                          ),
                          SizedBox(height: 20),
                          _contactCard(
                            icon: Icons.call,
                            title:  AppLocalizations.of(context)!.phoneSupport,
                            subtitle:  AppLocalizations.of(context)!.talkToOurSupportTeam,
                            info: "+1-234-567-8900",
                            buttonText:  AppLocalizations.of(context)!.callNow,
                            buttonColor: Colors.blue,
                          ),
                          SizedBox(height: 20),
                          _contactCard(
                            icon: Icons.email,
                            title:  AppLocalizations.of(context)!.emailSupport,
                            subtitle:   AppLocalizations.of(context)!.sendUsYourQueries,
                            info: "support@medicare.com",
                            buttonText:   AppLocalizations.of(context)!.sendEmail,
                            buttonColor: Colors.purple,
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _contactCard(
                            icon: Icons.whatshot_outlined,
                            title:   AppLocalizations.of(context)!.whatsAppSupport,
                            subtitle:   AppLocalizations.of(context)!.getInstantHelpViaWhatsApp,
                            info: "+1-234-567-8900",
                            buttonText:   AppLocalizations.of(context)!.chatNow,
                            buttonColor: Colors.green,
                          ),
                          _contactCard(
                            icon: Icons.call,
                            title:  AppLocalizations.of(context)!.phoneSupport,
                            subtitle:   AppLocalizations.of(context)!.talkToOurSupportTeam,
                            info: "+1-234-567-8900",
                            buttonText:   AppLocalizations.of(context)!.callNow,
                            buttonColor: Colors.blue,
                          ),
                          _contactCard(
                            icon: Icons.email,
                            title:   AppLocalizations.of(context)!.emailSupport,
                            subtitle:   AppLocalizations.of(context)!.sendUsYourQueries,
                            info: "support@medicare.com",
                            buttonText:   AppLocalizations.of(context)!.sendEmail,
                            buttonColor: Colors.purple,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),

          // ===== Contact Form OR Success Message =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Text(
                  _isFormSubmitted
                      ? "Thankyou"
                      : AppLocalizations.of(context)!.sendUsAMessage,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  _isFormSubmitted
                      ? "Message SEnt Successfully"
                      : AppLocalizations.of(context)!.fillOutTheFormBelowAndWeGetBackToYouWithin24Hours,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                SizedBox(height: 40),

                // ===== Show Form OR Success Message =====
                Container(
                  width: screen.width < 700 ? double.infinity : 900,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 3,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: _isFormSubmitted
                      ? _buildSuccessMessage(context)
                      : _buildContactForm(context, categories, screen),
                ),
              ],
            ),
          ),

          // Rest of your existing code for support hours, address, etc.
          Container(
            width: double.infinity,
            color: AppColor.blueColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.ourSupportHours,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 700) {
                      return Column(
                        children: [
                          _supportHourCard(
                            icon: Icons.access_time,
                            title: AppLocalizations.of(context)!.whatsAppSupport,
                            timing: "${AppLocalizations.of(context)!.available} 24/7",
                          ),
                          SizedBox(height: 40),
                          _supportHourCard(
                            icon: Icons.headset_mic,
                            title: AppLocalizations.of(context)!.phoneSupport,
                            timing: "24/7 ${AppLocalizations.of(context)!.emergency}",
                          ),
                          SizedBox(height: 40),
                          _supportHourCard(
                            icon: Icons.people,
                            title: AppLocalizations.of(context)!.liveChat,
                            timing: "9 AM - 9 PM ${AppLocalizations.of(context)!.daily}",
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _supportHourCard(
                            icon: Icons.access_time,
                            title: AppLocalizations.of(context)!.whatsAppSupport,
                            timing: "${AppLocalizations.of(context)!.available} 24/7",
                          ),
                          _supportHourCard(
                            icon: Icons.headset_mic,
                            title: AppLocalizations.of(context)!.phoneSupport,
                            timing: "24/7 ${AppLocalizations.of(context)!.emergency}",
                          ),
                          _supportHourCard(
                            icon: Icons.people,
                            title: AppLocalizations.of(context)!.liveChat,
                            timing: "9 AM - 9 PM ${AppLocalizations.of(context)!.daily}",
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),

          // ... (rest of your existing code for address section)
          // Include all the remaining code for address section, map, etc.
          SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 700;

              return Container(
                width: isMobile ? double.infinity : 900,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: isMobile
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.location_on,
                                  color: Colors.blue, size: 24),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(AppLocalizations.of(context)!.address,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Text("123 ${AppLocalizations.of(context)!.healthcareAvenue}",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text(AppLocalizations.of(context)!.medicalDistrict,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text("${AppLocalizations.of(context)!.newYork} 10001",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text(AppLocalizations.of(context)!.unitedStates,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.access_time,
                                  color: Colors.blue, size: 24),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(AppLocalizations.of(context)!.officeHours,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Text("${AppLocalizations.of(context)!.mondayFriday}: 9:00 AM - 6:00 PM",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text("${AppLocalizations.of(context)!.saturday}: 10:00 AM - 4:00 PM",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text(AppLocalizations.of(context)!.sundayClosed,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                SizedBox(height: 8),
                                Text("${AppLocalizations.of(context)!.emergency}: 24/7",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on,
                              size: 80, color: Colors.grey.shade400),
                          const SizedBox(height: 10),
                          Text(
                            AppLocalizations.of(context)!.interactiveMap,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            AppLocalizations.of(context)!.clickToViewLocation,
                            style:
                            TextStyle(fontSize: 12, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                    : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.location_on,
                                    color: Colors.blue, size: 24),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(AppLocalizations.of(context)!.address,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 8),
                                  Text("123 ${AppLocalizations.of(context)!.healthcareAvenue}",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text(AppLocalizations.of(context)!.medicalDistrict,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text("${AppLocalizations.of(context)!.newYork} 10001",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text(AppLocalizations.of(context)!.unitedStates,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.access_time,
                                    color: Colors.blue, size: 24),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLocalizations.of(context)!.officeHours,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 8),
                                  Text("${AppLocalizations.of(context)!.mondayFriday}: 9:00 AM - 6:00 PM",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text("${AppLocalizations.of(context)!.saturday}: 10:00 AM - 4:00 PM",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text(AppLocalizations.of(context)!.sundayClosed,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  SizedBox(height: 8),
                                  Text("${AppLocalizations.of(context)!.emergency}: 24/7",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Container(
                      width: 350,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on,
                              size: 80, color: Colors.grey.shade400),
                          const SizedBox(height: 10),
                          Text(
                            AppLocalizations.of(context)!.interactiveMap,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            AppLocalizations.of(context)!.clickToViewLocation,
                            style:
                            TextStyle(fontSize: 12, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }

  // ===== Success Message Widget =====
  Widget _buildSuccessMessage(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 80,
        ),
        SizedBox(height: 20),
        Text(
          "Message Sent Successfully!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          "Thank you for contacting us. We have received your message and will respond within 24 hours.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),

        // Response details
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSuccessDetail("Response time:", "Within 24 hours"),
              SizedBox(height: 10),
              _buildSuccessDetail("For urgent matters, please call or WhatsApp us", ""),
              SizedBox(height: 10),
              _buildSuccessDetail("Reference ID:", _referenceId),
            ],
          ),
        ),
        SizedBox(height: 30),

        // Send Another Message Button
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: _resetForm,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Send Another Message",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuccessDetail(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• ",
          style: TextStyle(fontSize: 16),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (value.isNotEmpty)
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // ===== Contact Form Widget =====
  Widget _buildContactForm(BuildContext context, List<String> categories, Size screen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row 1 - Full Name & Email
        screen.width < 700
            ? Column(
          children: [
            _buildTextField(
                label: "${AppLocalizations.of(context)!.fullName} *",
                hint: AppLocalizations.of(context)!.enterYourFullName,
                controller: _nameController),
            SizedBox(height: 20),
            _buildTextField(
                label: "${AppLocalizations.of(context)!.emailAddress}*",
                hint: "your.email@example.com",
                controller: _emailController),
          ],
        )
            : Row(
          children: [
            Expanded(
              child: _buildTextField(
                  label: "${AppLocalizations.of(context)!.fullName} *",
                  hint: AppLocalizations.of(context)!.enterYourFullName,
                  controller: _nameController),
            ),
            SizedBox(width: 20),
            Expanded(
              child: _buildTextField(
                  label: "${AppLocalizations.of(context)!.emailAddress}*",
                  hint: "your.email@example.com",
                  controller: _emailController),
            ),
          ],
        ),
        SizedBox(height: 20),

        // Row 2 - Phone & Category
        screen.width < 700
            ? Column(
          children: [
            _buildTextField(
                label: AppLocalizations.of(context)!.phoneNumber,
                hint: "+1-234-567-8900",
                controller: _phoneController),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "${AppLocalizations.of(context)!.category} *",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              value: selectedCategory,
              items: categories
                  .map((cat) => DropdownMenuItem(
                value: cat,
                child: Text(cat),
              ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  selectedCategory = val;
                });
              },
            ),
          ],
        )
            : Row(
          children: [
            Expanded(
              child: _buildTextField(
                  label: AppLocalizations.of(context)!.phoneNumber,
                  hint: "+1-234-567-8900",
                  controller: _phoneController),
            ),
            SizedBox(width: 20),
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "${AppLocalizations.of(context)!.category} *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                value: selectedCategory,
                items: categories
                    .map((cat) => DropdownMenuItem(
                  value: cat,
                  child: Text(cat),
                ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedCategory = val;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 20),

        _buildTextField(
            label: "${AppLocalizations.of(context)!.subject} *",
            hint: AppLocalizations.of(context)!.briefDescriptionOfYourInquiry,
            controller: _subjectController),
        SizedBox(height: 20),

        TextFormField(
          controller: _messageController,
          maxLines: 4,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.description,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        SizedBox(height: 25),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () => _submitForm(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(
              AppLocalizations.of(context)!.submitMessage,
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }

  // ====== Reusable TextField ======
  Widget _buildTextField({required String label, required String hint, TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // ... (rest of your existing _contactCard and _supportHourCard methods)
  Widget _contactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String info,
    required String buttonText,
    required Color buttonColor,
  }) {
    return Container(
      width: 260,
      height: 270,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.shade100,
            child: Icon(icon, color: Colors.blue),
          ),
          Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black54, fontSize: 12)),
          Text(info,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.blue)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.03),
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    minimumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Add functionality for contact buttons if needed
                  },
                  child: Text(
                    buttonText,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _supportHourCard({
    required IconData icon,
    required String title,
    required String timing,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 50,
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          timing,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}