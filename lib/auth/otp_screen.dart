// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/services.dart';
// // // import 'package:provider/provider.dart';
// // // import 'package:v_pharmashing/view_model/auth_view_model/send_otp_view_model.dart';
// // // import '../../view_model/auth_view_model/verify_otp_view_model.dart';
// // // import '../res/const_color.dart';
// // // import '../utils/utils.dart';
// // // import 'register_screen.dart';
// // //
// // // class OTPVerificationDialog extends StatefulWidget {
// // //   final String phoneNumber;
// // //   final String userId;
// // //   final bool isRegistered;
// // //
// // //   const OTPVerificationDialog({
// // //     super.key,
// // //     required this.phoneNumber,
// // //     this.userId = '',
// // //     this.isRegistered = false,
// // //   });
// // //
// // //   @override
// // //   State<OTPVerificationDialog> createState() => _OTPVerificationDialogState();
// // // }
// // //
// // // class _OTPVerificationDialogState extends State<OTPVerificationDialog> {
// // //   final TextEditingController _otpController = TextEditingController();
// // //
// // //   @override
// // //   void dispose() {
// // //     _otpController.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   void _verifyOTP() {
// // //     String otp = _otpController.text.trim();
// // //     if (otp.length != 4) {
// // //       Utils.show("Please enter a valid 4-digit OTP", context);
// // //       return;
// // //     }
// // //
// // //     final verifyOtpViewModel = Provider.of<VerifyOtpViewModel>(
// // //       context,
// // //       listen: false,
// // //     );
// // //
// // //     verifyOtpViewModel.verifyOtpApi(
// // //       widget.phoneNumber,
// // //       otp,
// // //       // widget.userId,
// // //       // widget.isRegistered,
// // //       context,
// // //     );
// // //   }
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // //       Provider.of<SendOtpViewModel>(
// // //         context,
// // //         listen: false,
// // //       ).sendOtpApi(widget.phoneNumber, context);
// // //     });
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final verifyOtpViewModel = Provider.of<VerifyOtpViewModel>(
// // //       context,
// // //       listen: false,
// // //     );
// // //     return MediaQuery.removeViewInsets(
// // //       context: context,
// // //       removeBottom: true,
// // //       child: Dialog(
// // //         backgroundColor: AppColor.whiteColor,
// // //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// // //         child: SingleChildScrollView(
// // //           child: Container(
// // //             width: 500,
// // //             padding: const EdgeInsets.all(32),
// // //             child: Column(
// // //               mainAxisSize: MainAxisSize.min,
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     const Text(
// // //                       'Verify OTP',
// // //                       style: TextStyle(
// // //                         fontSize: 24,
// // //                         fontWeight: FontWeight.bold,
// // //                       ),
// // //                     ),
// // //                     IconButton(
// // //                       icon: const Icon(Icons.close),
// // //                       onPressed: () => Navigator.of(context).pop(),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 16),
// // //                 Text('OTP sent to ${widget.phoneNumber}'),
// // //                 const SizedBox(height: 16),
// // //                 TextField(
// // //                   controller: _otpController,
// // //                   keyboardType: TextInputType.number,
// // //                   maxLength: 4,
// // //                   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// // //                   decoration: InputDecoration(
// // //                     hintText: 'Enter 4-digit OTP',
// // //                     counterText: '',
// // //                     border: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(8),
// // //                       borderSide: const BorderSide(
// // //                         color: Colors.grey,
// // //                         width: 2,
// // //                       ),
// // //                     ),
// // //                     enabledBorder: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(8),
// // //                       borderSide: const BorderSide(
// // //                         color: Colors.grey,
// // //                         width: 2,
// // //                       ),
// // //                     ),
// // //                     focusedBorder: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(8),
// // //                       borderSide: const BorderSide(
// // //                         color: Colors.blue,
// // //                         width: 2,
// // //                       ),
// // //                     ),
// // //                     contentPadding: const EdgeInsets.symmetric(
// // //                       horizontal: 16,
// // //                       vertical: 12,
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 20),
// // //                 SizedBox(
// // //                   width: double.infinity,
// // //                   child: ElevatedButton(
// // //                     onPressed: _verifyOTP,
// // //                     style: ElevatedButton.styleFrom(
// // //                       backgroundColor: const Color(0xFF6B9EFF),
// // //                       padding: const EdgeInsets.symmetric(vertical: 14),
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(8),
// // //                       ),
// // //                     ),
// // //                     child: verifyOtpViewModel.loading
// // //                         ? CircularProgressIndicator(color: Colors.white)
// // //                         : Text(
// // //                             'Verify OTP',
// // //                             style: TextStyle(
// // //                               fontSize: 16,
// // //                               fontWeight: FontWeight.w600,
// // //                               color: Colors.white,
// // //                             ),
// // //                           ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// //
// //
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:provider/provider.dart';
// // import 'package:v_pharmashing/view_model/auth_view_model/send_otp_view_model.dart';
// // import '../../view_model/auth_view_model/verify_otp_view_model.dart';
// // import '../res/const_color.dart';
// // import '../utils/utils.dart';
// // import 'dart:html' as html;
// //
// // class OTPVerificationDialog extends StatefulWidget {
// //   final String phoneNumber;
// //   final String userId;
// //   final bool isRegistered;
// //
// //   const OTPVerificationDialog({
// //     super.key,
// //     required this.phoneNumber,
// //     this.userId = '',
// //     this.isRegistered = false,
// //   });
// //
// //   @override
// //   State<OTPVerificationDialog> createState() => _OTPVerificationDialogState();
// // }
// //
// // class _OTPVerificationDialogState extends State<OTPVerificationDialog> {
// //   final TextEditingController _otpController = TextEditingController();
// //   final FocusNode _otpFocus = FocusNode();
// //
// //   @override
// //   void dispose() {
// //     _otpController.dispose();
// //     _otpFocus.dispose();
// //     super.dispose();
// //   }
// //
// //   void _verifyOTP() async {
// //     String otp = _otpController.text.trim();
// //
// //     if (otp.length != 4) {
// //       if (mounted) Utils.show("Please enter a valid 4-digit OTP", context);
// //       return;
// //     }
// //
// //     final verifyOtpViewModel =
// //     Provider.of<VerifyOtpViewModel>(context, listen: false);
// //
// //     // ✅ OTP Verify API call
// //     await verifyOtpViewModel.verifyOtpApi(widget.phoneNumber, otp, context);
// //   }
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       if (mounted) {
// //         Provider.of<SendOtpViewModel>(context, listen: false)
// //             .sendOtpApi(widget.phoneNumber, context);
// //       }
// //     });
// //
// //     // ✅ ENTER key handle for web
// //     if (kIsWeb) {
// //       html.window.onKeyDown.listen((event) {
// //         if (event.key == 'Enter') {
// //           _verifyOTP();
// //         }
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final verifyOtpViewModel = Provider.of<VerifyOtpViewModel>(context);
// //     return MediaQuery.removeViewInsets(
// //       context: context,
// //       removeBottom: true,
// //       child: Dialog(
// //         backgroundColor: AppColor.whiteColor,
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //         child: SingleChildScrollView(
// //           child: Container(
// //             width: 500,
// //             padding: const EdgeInsets.all(32),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     const Text(
// //                       'Verify OTP',
// //                       style: TextStyle(
// //                         fontSize: 24,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     IconButton(
// //                       icon: const Icon(Icons.close),
// //                       onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 16),
// //                 Text(
// //                   'OTP sent to ${widget.phoneNumber}',
// //                   style: const TextStyle(color: Colors.black54),
// //                 ),
// //                 const SizedBox(height: 16),
// //
// //                 // OTP Input
// //                 TextField(
// //                   controller: _otpController,
// //                   focusNode: _otpFocus,
// //                   keyboardType: TextInputType.number,
// //                   maxLength: 4,
// //                   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// //                   textInputAction: TextInputAction.done,
// //                   onSubmitted: (_) => _verifyOTP(),
// //                   decoration: InputDecoration(
// //                     hintText: 'Enter 4-digit OTP',
// //                     counterText: '',
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                     ),
// //                     focusedBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                       borderSide: const BorderSide(color: Colors.blue, width: 2),
// //                     ),
// //                     contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),
// //
// //                 // Verify Button
// //                 SizedBox(
// //                   width: double.infinity,
// //                   child: ElevatedButton(
// //                     onPressed: _verifyOTP,
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: const Color(0xFF6B9EFF),
// //                       padding: const EdgeInsets.symmetric(vertical: 14),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(8),
// //                       ),
// //                     ),
// //                     child: verifyOtpViewModel.loading
// //                         ? const CircularProgressIndicator(color: Colors.white)
// //                         : const Text(
// //                       'Verify OTP',
// //                       style: TextStyle(
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.w600,
// //                         color: Colors.white,
// //                       ),
// //                     ),
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
// //
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:v_pharmashing/view_model/auth_view_model/send_otp_view_model.dart';
// import '../../view_model/auth_view_model/verify_otp_view_model.dart';
// import '../res/const_color.dart';
// import '../utils/utils.dart';
// import 'dart:html' as html;
//
// class OTPVerificationDialog extends StatefulWidget {
//   final String phoneNumber;
//   final String userId;
//   final bool isRegistered;
//
//   const OTPVerificationDialog({
//     super.key,
//     required this.phoneNumber,
//     this.userId = '',
//     this.isRegistered = false,
//   });
//
//   @override
//   State<OTPVerificationDialog> createState() => _OTPVerificationDialogState();
// }
//
// class _OTPVerificationDialogState extends State<OTPVerificationDialog> {
//   final TextEditingController _otpController = TextEditingController();
//   final FocusNode _otpFocus = FocusNode();
//
//   @override
//   void dispose() {
//     _otpController.dispose();
//     _otpFocus.dispose();
//     super.dispose();
//   }
//
//   void _verifyOTP() async {
//     String otp = _otpController.text.trim();
//
//     if (otp.length != 4) {
//       if (mounted) Utils.show("Please enter a valid 4-digit OTP", context);
//       return;
//     }
//
//     final verifyOtpViewModel =
//     Provider.of<VerifyOtpViewModel>(context, listen: false);
//
//     await verifyOtpViewModel.verifyOtpApi(widget.phoneNumber, otp, context);
//
//     // ✅ After success, check if context is still active and close popups
//     if (mounted && !verifyOtpViewModel.loading) {
//       Future.delayed(const Duration(milliseconds: 300), () {
//         if (mounted) {
//           Navigator.of(context, rootNavigator: true).pop(); // Close OTP dialog
//           Navigator.of(context, rootNavigator: true).pop(); // Close Login dialog
//         }
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Send OTP after widget builds
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (mounted) {
//         Provider.of<SendOtpViewModel>(context, listen: false)
//             .sendOtpApi(widget.phoneNumber, context);
//       }
//     });
//
//     // ✅ Handle Enter key for web
//     if (kIsWeb) {
//       html.window.onKeyDown.listen((event) {
//         if (event.key == 'Enter' && !_otpController.text.trim().isEmpty) {
//           _verifyOTP();
//         }
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final verifyOtpViewModel = Provider.of<VerifyOtpViewModel>(context);
//     return MediaQuery.removeViewInsets(
//       context: context,
//       removeBottom: true,
//       child: Dialog(
//         backgroundColor: AppColor.whiteColor,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: SingleChildScrollView(
//           child: Container(
//             width: 500,
//             padding: const EdgeInsets.all(32),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Verify OTP',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.close),
//                       onPressed: () =>
//                           Navigator.of(context, rootNavigator: true).pop(),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   'OTP sent to ${widget.phoneNumber}',
//                   style: const TextStyle(color: Colors.black54),
//                 ),
//                 const SizedBox(height: 16),
//
//                 // OTP Input
//                 TextField(
//                   controller: _otpController,
//                   focusNode: _otpFocus,
//                   keyboardType: TextInputType.number,
//                   maxLength: 4,
//                   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                   textInputAction: TextInputAction.done,
//                   onSubmitted: (_) => _verifyOTP(),
//                   decoration: InputDecoration(
//                     hintText: 'Enter 4-digit OTP',
//                     counterText: '',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide:
//                       const BorderSide(color: Colors.blue, width: 2),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 12),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 // ✅ Verify Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: verifyOtpViewModel.loading ? null : _verifyOTP,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF6B9EFF),
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: verifyOtpViewModel.loading
//                         ? const SizedBox(
//                       height: 22,
//                       width: 22,
//                       child: CircularProgressIndicator(
//                         color: Colors.white,
//                         strokeWidth: 2,
//                       ),
//                     )
//                         : const Text(
//                       'Verify OTP',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:v_pharmashing/view_model/auth_view_model/send_otp_view_model.dart';
import '../../view_model/auth_view_model/verify_otp_view_model.dart';
import '../res/const_color.dart';
import '../utils/utils.dart';

class OTPVerificationDialog extends StatefulWidget {
  final String phoneNumber;
  final String userId;
  final bool isRegistered;

  const OTPVerificationDialog({
    super.key,
    required this.phoneNumber,
    this.userId = '',
    this.isRegistered = false,
  });

  @override
  State<OTPVerificationDialog> createState() => _OTPVerificationDialogState();
}

class _OTPVerificationDialogState extends State<OTPVerificationDialog> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocus = FocusNode();

  @override
  void dispose() {
    _otpController.dispose();
    _otpFocus.dispose();
    super.dispose();
  }

  void _verifyOTP() async {
    String otp = _otpController.text.trim();

    if (otp.length != 4) {
      if (mounted) Utils.show("Please enter a valid 4-digit OTP", context);
      return;
    }

    final verifyOtpViewModel = Provider.of<VerifyOtpViewModel>(context, listen: false);
    await verifyOtpViewModel.verifyOtpApi(widget.phoneNumber, otp, context);
  }

  @override
  void initState() {
    super.initState();

    // Automatically send OTP when dialog opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Provider.of<SendOtpViewModel>(context, listen: false)
            .sendOtpApi(widget.phoneNumber, context);
      }
    });

    // ❌ Removed HTML Enter listener to avoid double triggering
  }

  @override
  Widget build(BuildContext context) {
    final verifyOtpViewModel = Provider.of<VerifyOtpViewModel>(context);

    return MediaQuery.removeViewInsets(
      context: context,
      removeBottom: true,
      child: Dialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SingleChildScrollView(
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Verify OTP',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () =>
                          Navigator.of(context, rootNavigator: true).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'OTP sent to ${widget.phoneNumber}',
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 16),

                // OTP Input
                TextField(
                  controller: _otpController,
                  focusNode: _otpFocus,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _verifyOTP(), // ✅ Handles Enter key safely
                  decoration: InputDecoration(
                    hintText: 'Enter 4-digit OTP',
                    counterText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                ),
                const SizedBox(height: 20),

                // Verify Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: verifyOtpViewModel.loading ? null : _verifyOTP,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6B9EFF),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: verifyOtpViewModel.loading
                        ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                        : const Text(
                      'Verify OTP',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
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
