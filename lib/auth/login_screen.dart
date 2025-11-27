// // // // import 'package:flutter/gestures.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter/services.dart';
// // // // import 'package:go_router/go_router.dart';
// // // // import 'package:v_pharmashing/res/const_color.dart';
// // // // import 'package:v_pharmashing/utils/routes/routes_name.dart';
// // // // import 'package:v_pharmashing/utils/utils.dart';
// // // // import 'package:v_pharmashing/utils/widget/terms_condition_screen.dart';
// // // // import '../l10n/app_localizations.dart';
// // // // import 'otp_screen.dart';
// // // // class LoginDialog extends StatefulWidget {
// // // //   const LoginDialog({super.key});
// // // //
// // // //   @override
// // // //   State<LoginDialog> createState() => _LoginDialogState();
// // // // }
// // // //
// // // // class _LoginDialogState extends State<LoginDialog> {
// // // //   final TextEditingController _phoneController = TextEditingController();
// // // //   bool _isWhatsApp = true;
// // // //
// // // //   @override
// // // //   void dispose() {
// // // //     _phoneController.dispose();
// // // //     super.dispose();
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final screenWidth = MediaQuery.of(context).size.width;
// // // //     final dialogWidth = screenWidth < 500 ? screenWidth * 0.9 : 400;
// // // //
// // // //     return Dialog(
// // // //       backgroundColor: AppColor.whiteColor,
// // // //       insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
// // // //       shape: RoundedRectangleBorder(
// // // //         borderRadius: BorderRadius.circular(16),
// // // //       ),
// // // //       child: SingleChildScrollView(
// // // //         padding: EdgeInsets.only(
// // // //           bottom: MediaQuery.of(context).viewInsets.bottom + 20, // ✅ Avoids cut
// // // //         ),
// // // //         child: Container(
// // // //           width: 500,
// // // //           padding: EdgeInsets.symmetric(
// // // //             horizontal: screenWidth < 400 ? 20 : 32,
// // // //             vertical: 24,
// // // //           ),
// // // //           child: Column(
// // // //             mainAxisSize: MainAxisSize.min,
// // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // //             children: [
// // // //               Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                 children: [
// // // //                   Text(
// // // //                     AppLocalizations.of(context)!.login,
// // // //                     style: const TextStyle(
// // // //                       fontSize: 22,
// // // //                       fontWeight: FontWeight.bold,
// // // //                       color: Colors.black87,
// // // //                     ),
// // // //                   ),
// // // //                   IconButton(
// // // //                     icon: const Icon(Icons.close, color: Colors.black54),
// // // //                     onPressed: () => Navigator.of(context).pop(),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //               const SizedBox(height: 8),
// // // //               Text(
// // // //                 AppLocalizations.of(context)!.enterPhoneNumberTo,
// // // //                 style: const TextStyle(fontSize: 14, color: Colors.black54),
// // // //               ),
// // // //               const SizedBox(height: 24),
// // // //               Text(
// // // //                 AppLocalizations.of(context)!.phoneNumber,
// // // //                 style: const TextStyle(
// // // //                   fontSize: 14,
// // // //                   fontWeight: FontWeight.w500,
// // // //                   color: Colors.black87,
// // // //                 ),
// // // //               ),
// // // //               const SizedBox(height: 8),
// // // //               TextField(
// // // //                 controller: _phoneController,
// // // //                 keyboardType: TextInputType.phone,
// // // //                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// // // //                 maxLength: 10,
// // // //                 decoration: InputDecoration(
// // // //                   counterText: "",
// // // //                   hintText: 'Enter your phone number',
// // // //                   prefixIcon:
// // // //                   const Icon(Icons.phone, color: Colors.black54, size: 20),
// // // //                   border: OutlineInputBorder(
// // // //                     borderRadius: BorderRadius.circular(8),
// // // //                     borderSide:
// // // //                     const BorderSide(color: Colors.blue, width: 1.5),
// // // //                   ),
// // // //                   enabledBorder: OutlineInputBorder(
// // // //                     borderRadius: BorderRadius.circular(8),
// // // //                     borderSide:
// // // //                     const BorderSide(color: Colors.blue, width: 1.5),
// // // //                   ),
// // // //                   focusedBorder: OutlineInputBorder(
// // // //                     borderRadius: BorderRadius.circular(8),
// // // //                     borderSide:
// // // //                     const BorderSide(color: Colors.blue, width: 1.5),
// // // //                   ),
// // // //                   contentPadding: const EdgeInsets.symmetric(
// // // //                     horizontal: 16,
// // // //                     vertical: 10,
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //               const SizedBox(height: 8),
// // // //               const Text(
// // // //                 "We'll send you an OTP to verify your number",
// // // //                 style: TextStyle(fontSize: 12, color: Colors.black54),
// // // //               ),
// // // //               const SizedBox(height: 20),
// // // //
// // // //               // Send OTP Button
// // // //               SizedBox(
// // // //                 width: double.infinity,
// // // //                 child: ElevatedButton(
// // // //                   onPressed: () async {
// // // //                     String phone = _phoneController.text.trim();
// // // //                     if (phone.length != 10) {
// // // //                       Utils.show(
// // // //                           "Please enter a valid 10-digit phone number", context);
// // // //                       return;
// // // //                     }
// // // //                     showDialog(
// // // //                       context: context,
// // // //                       barrierDismissible: false,
// // // //                       builder: (context) => OTPVerificationDialog(
// // // //                         phoneNumber: phone,
// // // //                         userId: "",
// // // //                         isRegistered: false,
// // // //                       ),
// // // //                     );
// // // //                   },
// // // //                   style: ElevatedButton.styleFrom(
// // // //                     backgroundColor: const Color(0xFF6B9EFF),
// // // //                     padding: const EdgeInsets.symmetric(vertical: 14),
// // // //                     shape: RoundedRectangleBorder(
// // // //                       borderRadius: BorderRadius.circular(8),
// // // //                     ),
// // // //                   ),
// // // //                   child: const Text(
// // // //                     'Send OTP',
// // // //                     style: TextStyle(
// // // //                       fontSize: 16,
// // // //                       fontWeight: FontWeight.w600,
// // // //                       color: Colors.white,
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //               const SizedBox(height: 16),
// // // //
// // // //               // Terms & Policy
// // // //               Center(
// // // //                 child: RichText(
// // // //                   textAlign: TextAlign.center,
// // // //                   text: TextSpan(
// // // //                     style:
// // // //                     const TextStyle(fontSize: 12, color: Colors.black54),
// // // //                     children: [
// // // //                       const TextSpan(text: 'By continuing, you agree to our '),
// // // //                       TextSpan(
// // // //                         text: 'Terms of Service',
// // // //                         style: const TextStyle(
// // // //                           color: Colors.blue,
// // // //                           decoration: TextDecoration.underline,
// // // //                         ),
// // // //                         recognizer: TapGestureRecognizer()
// // // //                           ..onTap = () {
// // // //                             Navigator.push(
// // // //                               context,
// // // //                               MaterialPageRoute(
// // // //                                 builder: (context) =>
// // // //                                 const TermsConditionScreen(),
// // // //                               ),
// // // //                             );
// // // //                           },
// // // //                       ),
// // // //                       const TextSpan(text: ' and '),
// // // //                       TextSpan(
// // // //                         text: 'Privacy Policy',
// // // //                         style: const TextStyle(
// // // //                           color: Colors.blue,
// // // //                           decoration: TextDecoration.underline,
// // // //                         ),
// // // //                         recognizer: TapGestureRecognizer()
// // // //                           ..onTap = () {
// // // //                             context.push(RoutesName.privacyPolicy);
// // // //                           },
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // import 'package:flutter/foundation.dart';
// // // import 'package:flutter/gestures.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/services.dart';
// // // import 'package:go_router/go_router.dart';
// // // import 'package:v_pharmashing/res/const_color.dart';
// // // import 'package:v_pharmashing/utils/routes/routes_name.dart';
// // // import 'package:v_pharmashing/utils/utils.dart';
// // // import 'package:v_pharmashing/utils/widget/terms_condition_screen.dart';
// // // import '../l10n/app_localizations.dart';
// // // import 'otp_screen.dart';
// // // import 'dart:html' as html; // ✅ for web key handling
// // //
// // // class LoginDialog extends StatefulWidget {
// // //   const LoginDialog({super.key});
// // //
// // //   @override
// // //   State<LoginDialog> createState() => _LoginDialogState();
// // // }
// // //
// // // class _LoginDialogState extends State<LoginDialog> {
// // //   final TextEditingController _phoneController = TextEditingController();
// // //   final FocusNode _phoneFocus = FocusNode();
// // //
// // //   @override
// // //   void dispose() {
// // //     _phoneController.dispose();
// // //     _phoneFocus.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   void _submitForm() {
// // //     String phone = _phoneController.text.trim();
// // //     if (phone.length != 10) {
// // //       Utils.show("Please enter a valid 10-digit phone number", context);
// // //       return;
// // //     }
// // //     showDialog(
// // //       context: context,
// // //       barrierDismissible: false,
// // //       builder: (context) => OTPVerificationDialog(
// // //         phoneNumber: phone,
// // //         userId: "",
// // //         isRegistered: false,
// // //       ),
// // //     );
// // //   }
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //
// // //     // ✅ Listen for Enter key on web to submit form
// // //     if (kIsWeb) {
// // //       html.window.onKeyDown.listen((event) {
// // //         if (event.key == 'Enter') {
// // //           _submitForm();
// // //         }
// // //       });
// // //     }
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final screenWidth = MediaQuery.of(context).size.width;
// // //     final dialogWidth = screenWidth < 500 ? screenWidth * 0.9 : 400;
// // //
// // //     return Dialog(
// // //       backgroundColor: AppColor.whiteColor,
// // //       insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
// // //       shape: RoundedRectangleBorder(
// // //         borderRadius: BorderRadius.circular(16),
// // //       ),
// // //       child: SingleChildScrollView(
// // //         padding: EdgeInsets.only(
// // //           bottom: MediaQuery.of(context).viewInsets.bottom + 20,
// // //         ),
// // //         child: Container(
// // //           width: 500,
// // //           padding: EdgeInsets.symmetric(
// // //             horizontal: screenWidth < 400 ? 20 : 32,
// // //             vertical: 24,
// // //           ),
// // //           child: Column(
// // //             mainAxisSize: MainAxisSize.min,
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               // Header Row
// // //               Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                 children: [
// // //                   Text(
// // //                     AppLocalizations.of(context)!.login,
// // //                     style: const TextStyle(
// // //                       fontSize: 22,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: Colors.black87,
// // //                     ),
// // //                   ),
// // //                   IconButton(
// // //                     icon: const Icon(Icons.close, color: Colors.black54),
// // //                     onPressed: () => Navigator.of(context).pop(),
// // //                   ),
// // //                 ],
// // //               ),
// // //               const SizedBox(height: 8),
// // //               Text(
// // //                 AppLocalizations.of(context)!.enterPhoneNumberTo,
// // //                 style: const TextStyle(fontSize: 14, color: Colors.black54),
// // //               ),
// // //               const SizedBox(height: 24),
// // //               Text(
// // //                 AppLocalizations.of(context)!.phoneNumber,
// // //                 style: const TextStyle(
// // //                   fontSize: 14,
// // //                   fontWeight: FontWeight.w500,
// // //                   color: Colors.black87,
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 8),
// // //
// // //               // ✅ TextField (Enter key submit bhi kaam karega)
// // //               TextField(
// // //                 controller: _phoneController,
// // //                 focusNode: _phoneFocus,
// // //                 keyboardType: TextInputType.phone,
// // //                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// // //                 maxLength: 10,
// // //                 onSubmitted: (_) => _submitForm(), // ✅ Mobile Enter key support
// // //                 decoration: InputDecoration(
// // //                   counterText: "",
// // //                   hintText: 'Enter your phone number',
// // //                   prefixIcon:
// // //                   const Icon(Icons.phone, color: Colors.black54, size: 20),
// // //                   border: OutlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(8),
// // //                     borderSide:
// // //                     const BorderSide(color: Colors.blue, width: 1.5),
// // //                   ),
// // //                   enabledBorder: OutlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(8),
// // //                     borderSide:
// // //                     const BorderSide(color: Colors.blue, width: 1.5),
// // //                   ),
// // //                   focusedBorder: OutlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(8),
// // //                     borderSide:
// // //                     const BorderSide(color: Colors.blue, width: 1.5),
// // //                   ),
// // //                   contentPadding: const EdgeInsets.symmetric(
// // //                     horizontal: 16,
// // //                     vertical: 10,
// // //                   ),
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 8),
// // //               const Text(
// // //                 "We'll send you an OTP to verify your number",
// // //                 style: TextStyle(fontSize: 12, color: Colors.black54),
// // //               ),
// // //               const SizedBox(height: 20),
// // //
// // //               // ✅ Send OTP Button
// // //               SizedBox(
// // //                 width: double.infinity,
// // //                 child: ElevatedButton(
// // //                   onPressed: _submitForm,
// // //                   style: ElevatedButton.styleFrom(
// // //                     backgroundColor: const Color(0xFF6B9EFF),
// // //                     padding: const EdgeInsets.symmetric(vertical: 14),
// // //                     shape: RoundedRectangleBorder(
// // //                       borderRadius: BorderRadius.circular(8),
// // //                     ),
// // //                   ),
// // //                   child:  Text(
// // //                     'Send OTP',
// // //                     style: TextStyle(
// // //                       fontSize: 16,
// // //                       fontWeight: FontWeight.w600,
// // //                       color: Colors.white,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 16),
// // //
// // //               // ✅ Terms & Conditions
// // //               Center(
// // //                 child: RichText(
// // //                   textAlign: TextAlign.center,
// // //                   text: TextSpan(
// // //                     style:
// // //                     const TextStyle(fontSize: 12, color: Colors.black54),
// // //                     children: [
// // //                       const TextSpan(text: 'By continuing, you agree to our '),
// // //                       TextSpan(
// // //                         text: 'Terms of Service',
// // //                         style: const TextStyle(
// // //                           color: Colors.blue,
// // //                           decoration: TextDecoration.underline,
// // //                         ),
// // //                         recognizer: TapGestureRecognizer()
// // //                           ..onTap = () {
// // //                             Navigator.push(
// // //                               context,
// // //                               MaterialPageRoute(
// // //                                 builder: (context) =>
// // //                                 const TermsConditionScreen(),
// // //                               ),
// // //                             );
// // //                           },
// // //                       ),
// // //                       const TextSpan(text: ' and '),
// // //                       TextSpan(
// // //                         text: 'Privacy Policy',
// // //                         style: const TextStyle(
// // //                           color: Colors.blue,
// // //                           decoration: TextDecoration.underline,
// // //                         ),
// // //                         recognizer: TapGestureRecognizer()
// // //                           ..onTap = () {
// // //                             context.push(RoutesName.privacyPolicy);
// // //                           },
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/gestures.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:go_router/go_router.dart';
// // import 'package:v_pharmashing/res/const_color.dart';
// // import 'package:v_pharmashing/utils/routes/routes_name.dart';
// // import 'package:v_pharmashing/utils/utils.dart';
// // import 'package:v_pharmashing/utils/widget/terms_condition_screen.dart';
// // import '../l10n/app_localizations.dart';
// // import 'otp_screen.dart';
// // import 'dart:html' as html;
// //
// // class LoginDialog extends StatefulWidget {
// //   const LoginDialog({super.key});
// //
// //   @override
// //   State<LoginDialog> createState() => _LoginDialogState();
// // }
// //
// // class _LoginDialogState extends State<LoginDialog> {
// //   final TextEditingController _phoneController = TextEditingController();
// //   final FocusNode _phoneFocus = FocusNode();
// //
// //   bool _isLoading = false; // ✅ Loader flag
// //
// //   @override
// //   void dispose() {
// //     _phoneController.dispose();
// //     _phoneFocus.dispose();
// //     super.dispose();
// //   }
// //
// //   // void _submitForm() async {
// //   //   String phone = _phoneController.text.trim();
// //   //
// //   //   if (phone.length != 10) {
// //   //     Utils.show("Please enter a valid 10-digit phone number", context);
// //   //     return;
// //   //   }
// //   //
// //   //   // ✅ Loader start
// //   //   setState(() {
// //   //     _isLoading = true;
// //   //   });
// //   //
// //   //   // Simulate API call / OTP send delay
// //   //   await Future.delayed(const Duration(seconds: 2));
// //   //
// //   //   // ✅ Loader stop
// //   //   setState(() {
// //   //     _isLoading = false;
// //   //   });
// //   //
// //   //   showDialog(
// //   //     context: context,
// //   //     barrierDismissible: false,
// //   //     builder: (context) => OTPVerificationDialog(
// //   //       phoneNumber: phone,
// //   //       userId: "",
// //   //       isRegistered: false,
// //   //     ),
// //   //   );
// //   // }
// //   void _submitForm() async {
// //     String phone = _phoneController.text.trim();
// //
// //     if (phone.length != 10) {
// //       Utils.show("Please enter a valid 10-digit phone number", context);
// //       return;
// //     }
// //
// //     // ✅ Start loader
// //     if (mounted) {
// //       setState(() {
// //         _isLoading = true;
// //       });
// //     }
// //
// //     // Simulate API call / OTP send delay
// //     await Future.delayed(const Duration(seconds: 2));
// //
// //     // ✅ Stop loader safely
// //     if (mounted) {
// //       setState(() {
// //         _isLoading = false;
// //       });
// //     }
// //
// //     if (!mounted) return; // prevent dialog from showing if disposed
// //
// //     showDialog(
// //       context: context,
// //       barrierDismissible: false,
// //       builder: (context) => OTPVerificationDialog(
// //         phoneNumber: phone,
// //         userId: "",
// //         isRegistered: false,
// //       ),
// //     );
// //   }
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     if (kIsWeb) {
// //       html.window.onKeyDown.listen((event) {
// //         if (event.key == 'Enter') {
// //           _submitForm();
// //         }
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final screenWidth = MediaQuery.of(context).size.width;
// //     final dialogWidth = screenWidth < 500 ? screenWidth * 0.9 : 400;
// //
// //     return Dialog(
// //       backgroundColor: AppColor.whiteColor,
// //       insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(16),
// //       ),
// //       child: SingleChildScrollView(
// //         padding: EdgeInsets.only(
// //           bottom: MediaQuery.of(context).viewInsets.bottom + 20,
// //         ),
// //         child: Container(
// //           width: 500,
// //           padding: EdgeInsets.symmetric(
// //             horizontal: screenWidth < 400 ? 20 : 32,
// //             vertical: 24,
// //           ),
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Text(
// //                     AppLocalizations.of(context)!.login,
// //                     style: const TextStyle(
// //                       fontSize: 22,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black87,
// //                     ),
// //                   ),
// //                   IconButton(
// //                     icon: const Icon(Icons.close, color: Colors.black54),
// //                     onPressed: () => Navigator.of(context).pop(),
// //                   ),
// //                 ],
// //               ),
// //               const SizedBox(height: 8),
// //               Text(
// //                 AppLocalizations.of(context)!.enterPhoneNumberTo,
// //                 style: const TextStyle(fontSize: 14, color: Colors.black54),
// //               ),
// //               const SizedBox(height: 24),
// //               Text(
// //                 AppLocalizations.of(context)!.phoneNumber,
// //                 style: const TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.w500,
// //                   color: Colors.black87,
// //                 ),
// //               ),
// //               const SizedBox(height: 8),
// //               TextField(
// //                 controller: _phoneController,
// //                 focusNode: _phoneFocus,
// //                 keyboardType: TextInputType.phone,
// //                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// //                 maxLength: 10,
// //                 onSubmitted: (_) => _submitForm(),
// //                 decoration: InputDecoration(
// //                   counterText: "",
// //                   hintText: 'Enter your phone number',
// //                   prefixIcon:
// //                   const Icon(Icons.phone, color: Colors.black54, size: 20),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                     borderSide:
// //                     const BorderSide(color: Colors.blue, width: 1.5),
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                     borderSide:
// //                     const BorderSide(color: Colors.blue, width: 1.5),
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                     borderSide:
// //                     const BorderSide(color: Colors.blue, width: 1.5),
// //                   ),
// //                   contentPadding: const EdgeInsets.symmetric(
// //                     horizontal: 16,
// //                     vertical: 10,
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 8),
// //               const Text(
// //                 "We'll send you an OTP to verify your number",
// //                 style: TextStyle(fontSize: 12, color: Colors.black54),
// //               ),
// //               const SizedBox(height: 20),
// //               SizedBox(
// //                 width: double.infinity,
// //                 child: ElevatedButton(
// //                   onPressed: _isLoading ? null : _submitForm,
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: const Color(0xFF6B9EFF),
// //                     padding: const EdgeInsets.symmetric(vertical: 14),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                     ),
// //                   ),
// //                   child: _isLoading
// //                       ? const SizedBox(
// //                     height: 22,
// //                     width: 22,
// //                     child: CircularProgressIndicator(
// //                       strokeWidth: 2.5,
// //                       color: Colors.white,
// //                     ),
// //                   )
// //                       : const Text(
// //                     'Send OTP',
// //                     style: TextStyle(
// //                       fontSize: 16,
// //                       fontWeight: FontWeight.w600,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //
// //               const SizedBox(height: 16),
// //
// //               Center(
// //                 child: RichText(
// //                   textAlign: TextAlign.center,
// //                   text: TextSpan(
// //                     style:
// //                     const TextStyle(fontSize: 12, color: Colors.black54),
// //                     children: [
// //                       const TextSpan(text: 'By continuing, you agree to our '),
// //                       TextSpan(
// //                         text: 'Terms of Service',
// //                         style: const TextStyle(
// //                           color: Colors.blue,
// //                           decoration: TextDecoration.underline,
// //                         ),
// //                         recognizer: TapGestureRecognizer()
// //                           ..onTap = () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                 builder: (context) =>
// //                                 const TermsConditionScreen(),
// //                               ),
// //                             );
// //                           },
// //                       ),
// //                       const TextSpan(text: ' and '),
// //                       TextSpan(
// //                         text: 'Privacy Policy',
// //                         style: const TextStyle(
// //                           color: Colors.blue,
// //                           decoration: TextDecoration.underline,
// //                         ),
// //                         recognizer: TapGestureRecognizer()
// //                           ..onTap = () {
// //                             context.push(RoutesName.privacyPolicy);
// //                           },
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:go_router/go_router.dart';
// import 'package:v_pharmashing/res/const_color.dart';
// import 'package:v_pharmashing/utils/routes/routes_name.dart';
// import 'package:v_pharmashing/utils/utils.dart';
// import 'package:v_pharmashing/utils/widget/terms_condition_screen.dart';
// import '../l10n/app_localizations.dart';
// import 'otp_screen.dart';
// import 'dart:html' as html;
//
// class LoginDialog extends StatefulWidget {
//   const LoginDialog({super.key});
//
//   @override
//   State<LoginDialog> createState() => _LoginDialogState();
// }
//
// class _LoginDialogState extends State<LoginDialog> {
//   final TextEditingController _phoneController = TextEditingController();
//   final FocusNode _phoneFocus = FocusNode();
//
//   bool _isLoading = false;
//
//   @override
//   void dispose() {
//     _phoneController.dispose();
//     _phoneFocus.dispose();
//     super.dispose();
//   }
//
//   void _submitForm() async {
//     String phone = _phoneController.text.trim();
//
//     if (phone.length != 10) {
//       Utils.show("Please enter a valid 10-digit phone number", context);
//       return;
//     }
//
//     if (mounted) {
//       setState(() {
//         _isLoading = true;
//       });
//     }
//
//     // Simulate API delay
//     await Future.delayed(const Duration(seconds: 2));
//
//     if (mounted) {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//
//     if (!mounted) return;
//
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => OTPVerificationDialog(
//         phoneNumber: phone,
//         userId: "",
//         isRegistered: false,
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     // ✅ Handle Enter press globally only once (not duplicating onSubmitted)
//     if (kIsWeb) {
//       html.window.onKeyDown.listen((event) {
//         if (event.key == 'Enter') {
//           // Only trigger when focus is on phone input
//           if (_phoneFocus.hasFocus && !_isLoading) {
//             _submitForm();
//           }
//         }
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final dialogWidth = screenWidth < 500 ? screenWidth * 0.9 : 400;
//
//     return Dialog(
//       backgroundColor: AppColor.whiteColor,
//       insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: SingleChildScrollView(
//         padding: EdgeInsets.only(
//           bottom: MediaQuery.of(context).viewInsets.bottom + 20,
//         ),
//         child: Container(
//           width: 500,
//           padding: EdgeInsets.symmetric(
//             horizontal: screenWidth < 400 ? 20 : 32,
//             vertical: 24,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     AppLocalizations.of(context)!.login,
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.close, color: Colors.black54),
//                     onPressed: () => Navigator.of(context).pop(),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 AppLocalizations.of(context)!.enterPhoneNumberTo,
//                 style: const TextStyle(fontSize: 14, color: Colors.black54),
//               ),
//               const SizedBox(height: 24),
//               Text(
//                 AppLocalizations.of(context)!.phoneNumber,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextField(
//                 controller: _phoneController,
//                 focusNode: _phoneFocus,
//                 keyboardType: TextInputType.phone,
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                 maxLength: 10,
//                 onSubmitted: (_) {
//                   if (!_isLoading) _submitForm();
//                 },
//                 decoration: InputDecoration(
//                   counterText: "",
//                   hintText: 'Enter your phone number',
//                   prefixIcon:
//                   const Icon(Icons.phone, color: Colors.black54, size: 20),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide:
//                     const BorderSide(color: Colors.blue, width: 1.5),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide:
//                     const BorderSide(color: Colors.blue, width: 1.5),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide:
//                     const BorderSide(color: Colors.blue, width: 1.5),
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 10,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 "We'll send you an OTP to verify your number",
//                 style: TextStyle(fontSize: 12, color: Colors.black54),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: _isLoading ? null : _submitForm,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF6B9EFF),
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: _isLoading
//                       ? const SizedBox(
//                     height: 22,
//                     width: 22,
//                     child: CircularProgressIndicator(
//                       strokeWidth: 2.5,
//                       color: Colors.white,
//                     ),
//                   )
//                       : const Text(
//                     'Send OTP',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Center(
//                 child: RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     style:
//                     const TextStyle(fontSize: 12, color: Colors.black54),
//                     children: [
//                       const TextSpan(text: 'By continuing, you agree to our '),
//                       TextSpan(
//                         text: 'Terms of Service',
//                         style: const TextStyle(
//                           color: Colors.blue,
//                           decoration: TextDecoration.underline,
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                 const TermsConditionScreen(),
//                               ),
//                             );
//                           },
//                       ),
//                       const TextSpan(text: ' and '),
//                       TextSpan(
//                         text: 'Privacy Policy',
//                         style: const TextStyle(
//                           color: Colors.blue,
//                           decoration: TextDecoration.underline,
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             context.push(RoutesName.privacyPolicy);
//                           },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:v_pharmashing/res/const_color.dart';
import 'package:v_pharmashing/utils/routes/routes_name.dart';
import 'package:v_pharmashing/utils/utils.dart';
import 'package:v_pharmashing/utils/widget/terms_condition_screen.dart';
import '../l10n/app_localizations.dart';
import 'otp_screen.dart';
import 'dart:html' as html;

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key});

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();

  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  bool _isValidIndianNumber(String phone) {
    final validPattern = RegExp(r'^[6-9]\d{9}$');
    final sameDigitPattern = RegExp(r'^(\d)\1{9}$');
    return validPattern.hasMatch(phone) && !sameDigitPattern.hasMatch(phone);
  }

  void _submitForm() async {
    String phone = _phoneController.text.trim();

    if (!_isValidIndianNumber(phone)) {
      Utils.show("Please enter a valid Indian mobile number", context);
      return;
    }

    if (mounted) {
      setState(() => _isLoading = true);
    }

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isLoading = false);
    }

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => OTPVerificationDialog(
        phoneNumber: phone,
        userId: "",
        isRegistered: false,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      html.window.onKeyDown.listen((event) {
        if (event.key == 'Enter') {
          if (_phoneFocus.hasFocus && !_isLoading) {
            _submitForm();
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: AppColor.whiteColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Container(
          width: 500,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth < 400 ? 20 : 32,
            vertical: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.login,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.black54),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.enterPhoneNumberTo,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              Text(
                AppLocalizations.of(context)!.phoneNumber,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _phoneController,
                focusNode: _phoneFocus,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                // inputFormatters: [
                //   FilteringTextInputFormatter.digitsOnly,
                //   LengthLimitingTextInputFormatter(10),
                //   TextInputFormatter.withFunction((oldValue, newValue) {
                //     final text = newValue.text;
                //     final sameDigitPattern = RegExp(r'^(\d)\1{0,9}$');
                //     final validStart = RegExp(r'^[6-9]');
                //     if (text.isEmpty) return newValue;
                //     if (!validStart.hasMatch(text[0])) return oldValue;
                //     return newValue;
                //   }),
                // ],
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    final text = newValue.text;
                    if (text.isEmpty) return newValue;

                    // Must start with 6-9
                    if (!RegExp(r'^[6-9]').hasMatch(text[0])) return oldValue;

                    // Allow double numbers anywhere after the first digit
                    // (i.e., no restriction, so just return newValue)
                    return newValue;
                  }),
                ],

                onSubmitted: (_) {
                  if (!_isLoading) _submitForm();
                },
                decoration: InputDecoration(
                  counterText: "",
                  hintText: 'Enter your phone number',
                  prefixIcon:
                  const Icon(Icons.phone, color: Colors.black54, size: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                    const BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                    const BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                    const BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "We'll send you an OTP to verify your number",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B9EFF),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white,
                    ),
                  )
                      : const Text(
                    'Send OTP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style:
                    const TextStyle(fontSize: 12, color: Colors.black54),
                    children: [
                      const TextSpan(text: 'By continuing, you agree to our '),
                      TextSpan(
                        text: 'Terms of Service',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const TermsConditionScreen(),
                              ),
                            );
                          },
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.push(RoutesName.privacyPolicy);
                          },
                      ),
                    ],
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
